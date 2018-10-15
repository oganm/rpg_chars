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
    20 + 6 - .01 -.02 +200 - 
    40 -50 + 1 - 25 - 50 + 500 -
    200 - 50 + 650 - 100 -550 - 15*5 -
    3*20 + 
    100 + 2/5 + 10000/5 - 120 + 400 + 200 - 200 -
    400 - 60 - 15 - 30 + 1800/5 -200 - 600 -10 -35 -
    40 -25 + 400/3 +300/3 -8 + 500/4 +100 - 75+ 76/3
    

# 127/4 silver shrubles


"
CLOAK OF ARACHNIDA

Wondrous Item, Very Rare (requires attunement)

This fine garment is made of black silk interwoven with faint silvery threads. While wearing it, you gain the following benefits:

You have resistance to poison damage.
You have a climbing speed equal to your walking speed.
You can move up, down, and across vertical surfaces and upside down along ceilings, while leaving your hands free.
You can't be caught in webs of any sort and can move through webs as if they were difficult terrain.
You can use an action to cast the web spell (save DC 13). The web created by the spell fills twice its normal area. Once used, this property of the cloak can't be used again until the next dawn.
clibming speed equal to waling. move up down accro



tarantula venom muscle spasms 
giant jumping spider venom hallucinagenic
phase spider poison 
distractaton

CLOCKWORK AMULET


cloak of elvenkind								


1 unit of ointment 2d8+ 2 HP
ceases to be poisoned, and is cured of any disease. 

rod of immovabiliy
instrument of scribing
Helm of comprehending languages (200 GP)
Stone of true strike 

Gloves of Swimming and Climbing
 climbing and swimming don't cost you extra Movement, and you gain a +5 bonus to Strength (Athletics) checks made to climb or swim.

longbow of flying

5  all weather flares

gems of cold, lightning or acid 1 each


giant scorpion venom 4d10 DC 12 * 2 


rod of water finding thingy

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



leather armor								
dark common clothes								
hood								
playing card set								
vials								
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
