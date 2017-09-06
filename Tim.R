library(import5eChar)
library(diceSyntax)

options(httr_oob_default=TRUE) 
drive_auth(new_user = TRUE) 

char = importCharacter('Tim_Fighter')

# by default the name getOption('defaultCharacter') returns 'char'.
# If another name is used use options(defaultCharacter = 'whatever') to set or manually
# specify char when running functions

timAttack = function(adv = 0,
                     sharpShoot = F,
                     attackStat = 'Dex',
                     damageDice = '1d6',
                     proficient = TRUE,
                     modToHit = 2, # tim's archery
                     modToDamage = 0,
                     useAmmo = TRUE,
                     ammo = 'bolt',
                     vocal = TRUE,
                     char = getOption('defaultCharacter')){
    
    attack(adv = adv,
           sharpShoot = sharpShoot,
           attackStat = attackStat,
           damageDice = damageDice,
           proficient = proficient,
           modToHit = modToHit, # tim's archery
           modToDamage = modToDamage,
           useAmmo = useAmmo,
           ammo = ammo,
           vocal = vocal,
           char = char)
    
}


# ability scores ----------
char$abilityMods
# saves -------------
quickSave()

abilityCheck('Str')
abilityCheck('Dex')
abilityCheck('Con')
abilityCheck('Chr')
abilityCheck('Int')
abilityCheck('Wis')

quickCheck()
# checks -----------


# lockpick
skillCheck(acrobatics) 
skillCheck(sleight)
skillCheck(stealth) 

skillCheck(arcana)
skillCheck(history) 
skillCheck(investigation) 
skillCheck(nature) 
skillCheck(religion)

skillCheck(animal) 
skillCheck(insight) 
skillCheck(medicine)
skillCheck(perception)
skillCheck(survival)

skillCheck(deception)
skillCheck(intimidation)
skillCheck(persuasion) 
skillCheck(performance)



# health ------------
char$maxHealth
# 4d10 hit dice

# second wind 
# d10+figter level
r(r1d10) + 4

# initiative --------------
init()

# action surge-----
# +

# superiority ------
# 1d8 ++
# Trip: extra damage. prone on failed strength save. limit to large size
# Precise: roll first, add dice to attack roll later
# Menacing: extra damage, frightened on failed wis save
8 + char$abilityMods[2] + char$proficiencyBonus # save
r(r1d8)

# attack --------------
char$bolt = 200 
char$arrow = 20

# hand crossbow
timAttack(modToHit = 2+r(r1d4)) # bless
timAttack()
timAttack(1)
timAttack(-1)

r(r1d4)
timAttack(sharpShoot = TRUE,modToHit = 2+r(r1d4)) # bless
timAttack(1,sharpShoot = TRUE)
timAttack(-1,sharpShoot = TRUE)

# dagger
timAttack(damageDice= '1d4',useAmmo = FALSE,modToHit = 0)
timAttack(1,damageDice= '1d4',useAmmo = FALSE,modToHit = 0)
timAttack(-1,damageDice= '1d4',useAmmo = FALSE,modToHit = 0)

# longbow
timAttack(damageDice = '1d8',ammo = 'arrow')
timAttack(1,damageDice = '1d8',ammo = 'arrow')
timAttack(-1,damageDice = '1d8',ammo = 'arrow')

timAttack(damageDice = '1d8',ammo = 'arrow',sharpShoot = TRUE)
timAttack(1,damageDice = '1d8',ammo = 'arrow',sharpShoot = TRUE)
timAttack(-1,damageDice = '1d8',ammo = 'arrow',sharpShoot = TRUE)



r(r1d20)

# loot -----------




#######
###### wand of want not need
##### 20 gold
##### 30 gold
###### 2 gold
##### 10 silver


# warlock
# weird bone thingy

# 2 daggers

# 15 sp 7 cp 
# bone dice
# rat statue metal
# demonically carved stuff
# doll with one eye
# spoon
# weird mage
# demonic carved tokens
# ring W
# smoking pipe N
# keyring
# battle maps
# demon statue
# 2 keys on a keyring from the study.

# compass 
# 4 potion of retrograde memory loss
# face masks 


130/6

20

110/6



# briar glen

10/4


# Fallback the sheep town
15/5

# Catrisca Giblari

(20 +30 +2 +2)/4

13.5 + 0.25
