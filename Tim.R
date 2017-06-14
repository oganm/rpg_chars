source('importTim.R')

# initiative --------------
init()
# ability scores ----------
char$abilityMods
# saves -------------
save('Str')
save('Dex')
save('Con')
save('Chr')
save('Int')
save('Wis')

# checks -----------
quickCheck()

skillCheck(athletics)

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

r(r1d20) +3

r(r1d20)

# attack --------------
char$bolt = 49
char$arrow = 20

60 -1-1-1 -1-1-1 -1 -1 -1
attack()
attack(1)
attack(-1)


attack(ammo = 'arrow')
attack(1,ammo = 'arrow')
attack(-1,ammo = 'arrow')

attack(sharpShoot = TRUE)
attack(1,sharpShoot = TRUE)
attack(-1,sharpShoot = TRUE)

# second wind
# d10+figter level
r(r1d10) + 2

r(r1d20)

# loot -----------
###### wand of want not need
##### 20 gold
##### 30 gold
###### 2 gold
##### 10 silver

# warlock
###### 2 gold
# weird bone thingy

# briar glen 

10/4

# Catrisca Giblari

(20 +30 +2 +2)/4

13.5 + 0.25

