library(import5eChar)
library(diceSyntax)
library(googledrive)

options(httr_oob_default=TRUE) 
drive_auth(new_user = TRUE) 

char = importCharacter('Tim_Fighter')

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
w = char$weapons
char$bolt = 200 
char$arrow = 20


# hand crossbow
weaponAttack(w$`Crossbow, hand`,ammo = 'bolt')
weaponAttack(w$`Crossbow, hand`,1,ammo = 'bolt')
weaponAttack(w$`Crossbow, hand`,-1,ammo = 'bolt')

weaponAttack(w$`Crossbow, hand`,sharpShoot = TRUE,ammo = 'bolt')
weaponAttack(w$`Crossbow, hand`,sharpShoot = TRUE,1,ammo = 'bolt')
weaponAttack(w$`Crossbow, hand`,sharpShoot = TRUE,-1,ammo = 'bolt')

# dagger
weaponAttack(w$Dagger)
weaponAttack(w$Dagger,1)
weaponAttack(w$Dagger,-1)

# longbow
weaponAttack(w$Longbow,useAmmo = TRUE,ammo = 'arrow')
weaponAttack(w$Longbow,1,useAmmo = TRUE,ammo = 'arrow')
weaponAttack(w$Longbow,-1,useAmmo = TRUE,ammo = 'arrow')

weaponAttack(w$Longbow,sharpShoot = TRUE,ammo = 'arrow')
weaponAttack(w$Longbow,1,sharpShoot = TRUE,ammo = 'arrow')
weaponAttack(w$Longbow,-1,sharpShoot = TRUE,ammo = 'arrow')

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




# briar glen



# Fallback the sheep town

# Catrisca Giblari

