Katip AL logsheet
================

### Contents

  - [On creation](#on-creation)
  - [Adventures](#adventures)
  - [Downtime](#downtime)
  - [Shopping](#shopping)
  - [Level ups](#level-ups)
  - [Final State](#final-state)

### On creation

``` r
level = 1
gold = 15
downtime = 0
magic_items = c()
consumables = c()
common_items = c()
mundane_items = c()
spell_book = list();class(spell_book) = append(class(spell_book),'spellList')

add(mundane_items,
    c('dagger','arcane focus','spellbook','bottle of black ink','quill','small knife','letter','set of common clothes','belt pouch','backpack','bedroll','mess kit','tinderbox','10 torches','10 days of rations','waterskin',"50 ft hempen rope"))


# cantrips
add(spell_book,
    spells[names(spells) %in% 
               c("Mage Hand", # telekinetic
                 "Minor Illusion", # magic initiate
                 "Prestidigitation", # magic initiate
                 "Mind Sliver", # wizard starting
                 "Fire Bolt",
                 "Mold Earth")])


add(spell_book,
    spells[names(spells) %in% 
               c('Magic Missile',
                 "Absorb Elements",
                 "Fog Cloud",
                 "Feather Fall",
                 "Mage Armor",
                 "Catapult",
                 "Shield" # magic initiate
               )])
```

### Adventures

#### Adventure: DDEX2-6 Breath of the Yellow Rose (Tier 1)

``` r
level = level + 1
downtime = downtime + 10
gold = gold + 100
add(magic_items, "Ring of Mind Shielding")
add(consumables,"Scroll of Misty Step")
```

#### Steamy Shores of Danger (CCC-CIC-09)

``` r
level = level + 1
downtime = downtime + 10
gold = gold + 100
add(magic_items,'Geyser Figurine (Decanter of Endless Water)')
add(consumables,c("Potion of Healing","Scroll of Protection from Evil and Good"))
```

You have learned how to introduce yourself in a formal and impressive
way. During your future encounters with members of tribal cultures of
Big Folk Island or the village of Jarko’tu’ta you may gain advantage on
social checks if you recite your Greeting during introductions (DM
discretion). The greeting of the forefathers is simple and consists of 7
parts: - Part 1: Name of character - Part 2: Name of father - Part 3:
Name of grandfather - Part 4: Name of great grandfather - Parts 5, 6, 7:
Life accomplishments

### Downtime

#### Copy misty step

``` r
gold = gold - 100
downtime = downtime - 1
add(spell_book,
    spells[names(spells) %in% c('Misty Step')])
remove(consumables,'Scroll of Misty Step')
```

#### Copy protection from evil and good

``` r
gold = gold - 50
downtime = downtime - 1
add(spell_book,
    spells[names(spells) %in% c('Protection from Evil and Good')])
remove(consumables, "Scroll of Protection from Evil and Good")
```

#### Scribe scroll of fog cloud

``` r
gold = gold - 25
downtime = downtime - 1
add(consumables,"Scroll of Fog Cloud")
```

#### Scribe scroll of protection from good and evil

``` r
gold = gold - 25
downtime = downtime - 1
add(consumables,"Scroll of Protection From Good and Evil")
```

### Shopping

``` r
gold = gold - 
  1 - # caltrops
  1 - # ball bearings
  2 - # crowbar
  2 - # manacles
  0.5 -  # 10 pitons
  5 - # mirror
  0.05 - # signal whistle
  1 - #  oil x 5
  0.5 # lamp

add(mundane_items,
    c('caltrops','ball bearings','crowbar','manacles','10 pitons','mirror','signal whistle','5 oil','lamp'))
```

### Level ups

#### 1-\>2

``` r
add(spell_book,
    spells[names(spells) %in% 
               c('Identify',"Unseen Servant")])
```

#### 2-\>3

``` r
add(spell_book,
    spells[names(spells) %in% 
               c('Phantasmal Force',"Dragon's Breath")])
```

### Final State

``` r
c(level = level,
  gold = gold,
  downtime = downtime)
```

    ##    level     gold downtime 
    ##     3.00     1.95    16.00

``` r
magic_items %>% sort
```

    ## [1] "Geyser Figurine (Decanter of Endless Water)"
    ## [2] "Ring of Mind Shielding"

``` r
common_items %>% sort
```

    ## NULL

``` r
consumables %>% sort
```

    ## [1] "Potion of Healing"                      
    ## [2] "Scroll of Fog Cloud"                    
    ## [3] "Scroll of Protection From Good and Evil"

``` r
mundane_items %>% sort
```

    ##  [1] "10 days of rations"    "10 pitons"             "10 torches"           
    ##  [4] "50 ft hempen rope"     "5 oil"                 "arcane focus"         
    ##  [7] "backpack"              "ball bearings"         "bedroll"              
    ## [10] "belt pouch"            "bottle of black ink"   "caltrops"             
    ## [13] "crowbar"               "dagger"                "lamp"                 
    ## [16] "letter"                "manacles"              "mess kit"             
    ## [19] "mirror"                "quill"                 "set of common clothes"
    ## [22] "signal whistle"        "small knife"           "spellbook"            
    ## [25] "tinderbox"             "waterskin"

``` r
spell_book
```

    ## Cantrips
    ## ========
    ## Fire Bolt
    ## Mage Hand
    ## Minor Illusion
    ## Prestidigitation
    ## Mold Earth
    ## Mind Sliver
    ## 
    ## Level 1
    ## =======
    ## Feather Fall
    ## Fog Cloud
    ## Mage Armor
    ## Magic Missile
    ## Shield
    ## Absorb Elements
    ## Catapult
    ## Protection from Evil and Good
    ## Identify
    ## Unseen Servant
    ## 
    ## Level 2
    ## =======
    ## Misty Step
    ## Phantasmal Force
    ## Dragon's Breath
