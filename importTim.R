library(RCurl)
library(XML)
library(googledrive)
library(ogbox)
library(diceSyntax)


# turns stats into modifiers
stat2mod = function(x){
    floor(x/2-5)
}

logicConvert = function(x){
    x %>%  ogbox::replaceElement(c('true'=TRUE,'false'=FALSE)) %$% newVector %>% as.logical()
}

# get character from google drive
# will list most recently modified file as the first one so new 
# exports will overwrite it
character = drive_search(pattern = 'Tim_Fighter')[1,]

# character = drive_search(pattern = 'Jum')[1,]


character %>% drive_share(role = "reader", type = "anyone")

# dl_from_GoogleD(output = "char.xml", 
#                 key = character$id,
#                 format = "txt")


char = getURL(character$files_resource[[1]]$webContentLink)
if(grepl(pattern = 'The document has moved', char)){
    newlink = stringr::str_extract(string = char,pattern = 'https://.*?download')
    char = getURL(newlink)
}

char %<>% xmlParse() %>%  (XML::xmlToList)

# make the character more computer readable
char$proficiencyBonus %<>% as.integer()

abilityScores = char$abilityScores %>% stringr::str_extract_all('[0-9]+') %>% {.[[1]][1:6]} %>% as.integer()
names(abilityScores) = c('Str','Dex','Con','Int','Wis','Chr')
abilityMods = stat2mod(abilityScores)
proficiency = char$abilityScores %>% stringr::str_extract_all('(true)|(false)') %>% {.[[1]][1:6]}
proficiency %<>% ogbox::replaceElement(c('true'=TRUE,'false'=FALSE)) %$% newVector %>% as.logical()
names(proficiency) = c('Str','Dex','Con','Int','Wis','Chr')

skillNames = c('Athletics',
               'Acrobatics',
               'Sleight of Hand',
               'Stealth',
               'Arcana',
               'History',
               'Investigation',
               'Nature',
               'Religion',
               'Animal Handling',
               'Insight',
               'Medicine',
               'Perception',
               'Survival',
               'Deception',
               'Intimidation',
               'Performance',
               'Persuasion')

skillData = char$skillInfo %>% strsplit('â\u008a.') %>% {.[[1]]} %>% trimws()
skillProf = skillData[1:18] %>% logicConvert
names(skillProf) = skillNames
skillMiscMod = skillData[20:37] %>% as.integer()
names(skillMiscMod)= skillNames
skillDoubleProf = skillData[39:56]  %>% logicConvert
names(skillDoubleProf) = skillNames

# true for everything, ignore if also proficient
skillHalfProf = skillData[58:75] %>%  logicConvert
names(skillHalfProf) = skillNames

skillHalfProfRoundUp = skillData[77:94] %>%  logicConvert
names(skillHalfProfRoundUp) = skillNames

char$skillProf = skillProf
char$skillMiscMod = skillMiscMod
char$skillDoubleProf = skillDoubleProf
char$skillHalfProf = skillHalfProf
char$skillHalfProfRoundUp = skillHalfProfRoundUp

char$initMiscMod %<>% as.integer()
char$abilityScores = abilityScores
char$abilityProf = proficiency
char$maxHealth %<>% as.integer()
char$abilityMods = abilityMods

char$weaponList %>% strsplit(',')

attack = function(adv = 0,sharpShoot = F,spendAmmo = TRUE,ammo = 'bolt'){
    
    if(spendAmmo){
        char[[ammo]] <<- char[[ammo]] - 1
        print(paste('Ammo left: ',char[[ammo]]))
        if(char[[ammo]] == 0){
            warning('No Ammo')
        }
    }
    
    if(adv == 0){
        attackRoll = r(r1d20,vocal=TRUE)
    } else if(adv == 1){
        attackRoll = r(r2d20d1,vocal = TRUE)
    } else if (adv == -1){
        attackRoll = r(r2d20dh1, vocal = TRUE)
    }
    finalRoll = unname(attackRoll + char$abilityMods['Dex']+ char$proficiencyBonus+ 2 )
    if(sharpShoot){
        finalRoll = finalRoll - 5
    }
    
    if(attackRoll == 1){
        print('CRIT MISS')
        damageRoll = 0
    } else if(attackRoll == 20){
        print('CRIT HIT')
        damageRoll = unname(r(r2d6) + char$abilityMods['Dex'])
    } else{
        damageRoll = unname(r(r1d6) + char$abilityMods['Dex'])
    }
    if(sharpShoot & attackRoll != 1){
        damageRoll = damageRoll+10
    }
    return(c('Attack'= finalRoll, 'Damage' = damageRoll))
}

# works for everyone
skillCheck = function(skill){
    skill = as.character(substitute(skill))
    skillNames = names(char$skillProf)
    skill = skillNames[grepl(pattern = tolower(skill), x = tolower(skillNames))]
    
    bonus = char$skillProf[skill]*char$proficiencyBonus + 
        char$skillDoubleProf[skill]*char$proficiencyBonus + 
        (char$skillHalfProf[skill]*!char$skillProf[skill]*char$proficiencyBonus/2)
    
    if(char$skillHalfProfRoundUp[skill]){
        bonus %<>% ceiling()
    } else{
        bonus %>% floor()
    }
    
    r(r1d20) + bonus
}

quickCheck = function(){
    rounding = function(x,ceiling){
        for(i in 1:length(x)){
            if(ceiling[i]){
                x[i] %<>% ceiling
            } else{
                x[i] %<>% floor
            }
        }
        return(x)
    }
    
    roll = r(r1d20)
    bonus = char$skillProf*char$proficiencyBonus +
        char$skillDoubleProf*char$proficiencyBonus + 
        (char$skillHalfProf*!char$skillProf*char$proficiencyBonus/2)
    
    bonus %<>% rounding(char$skillHalfProfRoundUp)
    
    roll + bonus
}

# works for everyone
save = function(stat){
    unname(r(r1d20) + char$abilityMods[stat] + char$proficiencyBonus*char$abilityProf[stat])
}


# works for everyone
init = function(){
    r(r1d20) + unname(char$abilityMods['Dex'] + char$initMiscMod)
}