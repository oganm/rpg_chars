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
char$maxHealth
# 7d10/11 1d8/1
r(r1d10) + char$abilityMods['Con']

# second wind 
# d10+figter level
r(r1d10) + as.integer(str_extract(char$ClassField,'[0-9]+'))
AC()

# initiative --------------
init()

char$resources
# action surge-----
# 

# superiority ------
# 1d8 /5
# Trip: extra damage. prone on failed strength save. limit to large size
# Precise: roll first, add dice to attack roll later
# Menacing: extra damage, frightened on failed wis save
# Reposition: extra damage, half speed ally move
# Evade: Dice to AC when moving
# Disarm: Str save or drop weapon.
8 + char$abilityMods[2] + char$proficiencyBonus # save
r(r1d8)

# attack --------------
w = char$weapons
char$adaBolt = 10
char$bolt = 275
char$arrow = 12
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


# longbow
weaponAttack(w$Longbow,ammo = 'arrow')
weaponAttack(w$Longbow,1,ammo = 'arrow')
weaponAttack(w$Longbow,-1,ammo = 'arrow')

weaponAttack(w$Longbow,sharpShoot = TRUE,ammo = 'arrow')
weaponAttack(w$Longbow,1,sharpShoot = TRUE,ammo = 'arrow')
weaponAttack(w$Longbow,-1,sharpShoot = TRUE,ammo = 'arrow')


r(r1d20)