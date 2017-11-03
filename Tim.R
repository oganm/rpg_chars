library(import5eChar)
library(diceSyntax)
library(googledrive)
library(monsteR)
library(wizaRd)
library(stringr)

# options(httr_oob_default=TRUE) 
# drive_auth() 
char = importCharacter('Tim_Fighter')
w = char$weapons

# by default the name getOption('defaultCharacter') returns 'char'.
# If another name is used use options(defaultCharacter = 'whatever') to set or manually
# specify char when running functions


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

# checks -----------
quickCheck()

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
char$maxHealth - 7 -16 + 8 -6 -7 +14
# 5d10 hit dice

# second wind 
# d10+figter level
r(r1d10) + as.integer(str_extract(char$ClassField,'[0-9]+'))
AC()

# initiative --------------
init()

char$resources
# action surge-----
# +

# superiority ------
# 1d8 ++++/5
# Trip: extra damage. prone on failed strength save. limit to large size
# Precise: roll first, add dice to attack roll later
# Menacing: extra damage, frightened on failed wis save
8 + char$abilityMods[2] + char$proficiencyBonus # save
r(r1d8)

# attack --------------
w = char$weapons
char$adaBolt = 10
char$bolt = 281
char$arrow = 20
char$sling = 20


# hand crossbow
weaponAttack(w$`Crossbow, hand`,ammo = 'adaBolt')


weaponAttack(w$`Crossbow, hand`,ammo = 'bolt')
weaponAttack(w$`Crossbow, hand`,1,ammo = 'bolt')
weaponAttack(w$`Crossbow, hand`,-1,ammo = 'bolt')

weaponAttack(w$`Crossbow, hand`,sharpShoot = TRUE,ammo = 'bolt')
weaponAttack(w$`Crossbow, hand`,sharpShoot = TRUE,1,ammo = 'bolt')
weaponAttack(w$`Crossbow, hand`,sharpShoot = TRUE,-1,ammo = 'bolt')

# sling
weaponAttack(w$Sling,ammo = 'sling')
weaponAttack(w$Sling,1,ammo = 'sling')
weaponAttack(w$Sling,-1,ammo = 'sling')

weaponAttack(w$Sling,sharpShoot = TRUE,ammo = 'sling')
weaponAttack(w$Sling,1,sharpShoot = TRUE,ammo = 'sling')
weaponAttack(w$Sling,-1,sharpShoot = TRUE,ammo = 'sling')


# dagger
weaponAttack(w$Dagger)
weaponAttack(w$Dagger,1)
weaponAttack(w$Dagger,-1)

weaponAttack(w$Dagger)
weaponAttack(w$Dagger,1)
weaponAttack(w$Dagger,-1)

weaponAttack(w$`Greatsword Of Life`)
weaponAttack(w$`Greatsword Of Life`,1)
weaponAttack(w$`Greatsword Of Life`,-1)

# longbow
weaponAttack(w$Longbow,ammo = 'arrow')
weaponAttack(w$Longbow,1,ammo = 'arrow')
weaponAttack(w$Longbow,-1,ammo = 'arrow')

weaponAttack(w$Longbow,sharpShoot = TRUE,ammo = 'arrow')
weaponAttack(w$Longbow,1,sharpShoot = TRUE,ammo = 'arrow')
weaponAttack(w$Longbow,-1,sharpShoot = TRUE,ammo = 'arrow')


r(r1d20)

# loot -----------
17 + 13.5 +32 +
    35 - 5 -2 -5 -
    10 -5 - 25 -
    0.2 -45 + 5 +
    4 -5 + 20 +
    18.33 + 20 - 
    25 - 10 -5 + 
    22.4 + 3 + 5 + 
    1.2 - 25 + 2.5 -
    5 - 0.05 - 0.05 +5 +
    1.475 +15 + 100 -60 +
    20 + 6 - .01 -.02

"
copper whale
backpack								
crowbar x 1								
hammer								
10 pitons								
10 torches								
Tinderbox								
10 days of Rations								
Waterskin								
50 feet of Hempen rope								
ball bearings								
hunting trap								
caltrops								
flask								
hooded lantern	
john's portrait
adamantine bolt * 10



leather armor								
dark common clothes								
hood								
playing card set								
vials								
cloak of elvenkind								
Belt Pouch								
manacles								
mirror steel								
lock								
grappling hook								
thieves tools								

chalk

#######
###### wand of want not need

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




# briar glen



# Fallback the sheep town

# Catrisca Giblari

wealthy district protectors
===========
hoselo,
"
