Katip_dndone_chrono
================

### Contents

- [On creation](#on-creation)
- [Level ups](#level-ups)
- [Timeline](#timeline)
- [Final State](#final-state)

### On creation

``` r
level = 1
proficiency = 2
downtime = 0
gold = 0
hp = 0 
prepare_limit = 0
ability_scores = c(Str=0,Dex=0,Con=0,Int=0,Wis=0,Cha=0)
feats = c()
features = c()
skills = c()
expertise = c()
tools = c()
magic_items = c()
consumables = c()
common_items = c()
mundane_items = c()
spell_book = list();class(spell_book) = append(class(spell_book),'spellList')
```

#### Class - Wizard

``` r
add(skills,c("Insight","Investigation"))
add(mundane_items, c("2 daggers","Quarterstaff","Robe","Spellbook",
                     "backpack","book","ink","ink pen","lamp","10 flasks of oil",
                     "10 sheets of parchment","tinderbox"))


# 3 cantrips can be changed at long rest
add(spell_book,
    spells[names(spells) %in% 
               c("Mind Sliver",
                 "Fire Bolt",
                 "Toll the Dead")])

# 6 level 1 spells
add(spell_book,
    spells[names(spells) %in% 
               c("Magic Missile", # scribed
                 "Absorb Elements",
                 "Fog Cloud", # scribed
                 "Feather Fall",
                 "Catapult",
                 "Shield")])


add(features,"Ritual Adept")
add(features,"Arcane Recovery: Half level")
```

#### Background - DMG custom

``` r
add(feats, "Magic Initiate(wizard)")
# magic initiate cantrips
add(spell_book,
    spells[names(spells) %in% 
               c("True Strike",
                 "Minor Illusion")])
# magic initiate lvl1 spell,
add(spell_book,
    spells[names(spells) %in% 
               "Mage Armor"])
add(features,"Daily mage armor from magic initiate")


add(skills, c("Arcana","Persuasion"))
add(tools, "Thieves' tools")
gold = gold+50
```

#### Species - Human

``` r
add(features,"Resourceful: inspiration per long rest")
# skillful
add(skills,'Perception')
# versatile
add(feats,"Skilled")
add(skills,c("Stealth","Acrobatics","Deception"))
```

#### Languages

``` r
languages = c('common','common sign language','elvish')
```

#### Ability scores

``` r
# point buy
ability_scores = c(Str = 8,
                   Dex = 14, 
                   Con = 13, 
                   Int = 15, 
                   Wis = 12, 
                   Cha = 10 
)
# 27 check
costs = ability_scores %>% sapply(ab_cost) %>% sum
assertthat::assert_that(costs == 27)
```

    ## [1] TRUE

``` r
# custom background
ability_scores['Int'] = ability_scores['Int'] + 2
ability_scores['Con'] = ability_scores['Con'] + 1

# hp
hp = 6+stat_mod(ability_scores['Con'])
```

#### Starting equipment

``` r
gold = gold -
    1 - # caltrops
    1 - # ball bearings
    2 - # crowbar
    2 - # manacles
    5 - # mirror
    0.05 - # signal whistle
    25 - # thieves' tools
    2 - # 4 days of rations
    1 - # rope
    .2 - # waterskin
    2 # 4 javelins

add(mundane_items,
    c('caltrops','ball bearings','crowbar','manacles','mirror','signal whistle',"thieves' tools","rope","waterskin","4 days of rations"))

alter_count(mundane_items,"javelin",2)
```

### Level ups

#### Level 2

``` r
hp = hp + 4+stat_mod(ability_scores['Con'])
add(expertise,"Investigation")
add(spell_book,
    spells[names(spells) %in% 
               c('Identify',"Find Familiar")])
```

#### Level 3

``` r
hp = hp + 4+stat_mod(ability_scores['Con'])
add(features,c('Wizardly Quill: quick spell copying, quick erase as a bonus action','Awakened Spellbook:replace damage type, 1 quick ritual per long rest'))
add(spell_book,
    spells[names(spells) %in% 
               c('Phantasmal Force',"Dragon's Breath")])
```

#### Level 4

``` r
hp = hp + 4+stat_mod(ability_scores['Con'])
add(feats,"Telekinetic")
add(features,"Telekinetic: bonus action shove 5 feet, str save, spell DC, +30 feet range to mage hand")
ability_scores['Int'] = ability_scores['Int'] + 1
add(spell_book,
    spells[names(spells) %in% 
               "Mage Hand"])



add(spell_book,
    spells[names(spells) %in% 
               c('Suggestion','Alter Self',"Mending")])
```

#### Level 5

``` r
hp = hp + 4+stat_mod(ability_scores['Con'])
add(features, "Memorize spell: Replace one prepared spell on short rest")
add(spell_book,
    spells[names(spells) %in% 
               c('Glyph of Warding','Fireball')])
add(magic_items,"Arcane Grimoire +1 (UC)")
```

#### Level 6

``` r
hp = hp + 4+stat_mod(ability_scores['Con'])

add(features, "Manifest mind: bonus action to manifest, 60 feet range. light in a 10-foot radius, darkvision with a range of 60 feet, free audio vis share, Prof bonus times spell casting. 300 feet max distance")

add(spell_book,
    spells[names(spells) %in% 
               c('Counterspell','Summon Undead')])
# don't think stat block elemnts count as damage types
spell_book$`Summon Undead`$text = ""

# summon undead
gold = gold - 300
add(mundane_items,"Gilded Skull 300 gp")
```

#### Level 7

``` r
hp = hp + 4+stat_mod(ability_scores['Con'])
add(spell_book,
    spells[names(spells) %in% 
               c('Elemental Bane',"Raulothim's Psychic Lance")])
```

#### Level 8

``` r
hp = hp + 4+stat_mod(ability_scores['Con'])
ability_scores['Int'] = ability_scores['Int'] + 2
add(spell_book,
    spells[names(spells) %in% 
               c('Arcane Eye',"Dimension Door")])
```

#### Level 9

``` r
hp = hp + 4+stat_mod(ability_scores['Con'])


# my list is out of date...
spells$`Songal's Elemental Suffusion` = list(text = "Acid, Cold, Fire, Lightning, or Thunder",
                               level  =5,
                               name = "Songal's Elemental Suffusion",
                               school = 'transmutation',
                               classes = c('wizard'),
                               source = "PHB",
                               range = "Self",
                               castingTime = '1 action',
                               components = c("V","S"))

add(spell_book,
    spells[names(spells) %in%
               c('Synaptic Static',"Songal's Elemental Suffusion")])
```

Artificer

``` r
# hp = hp + 5+stat_mod(ability_scores['Con'])
# spells$`Elementalism` = list(text = "",
#                                level  =0,
#                                name = "Elementalism",
#                                school = 'transmutation',
#                                classes = c('wizard'),
#                                source = "PHB",
#                                range = "Self",
#                                castingTime = '1 action',
#                                components = c("V","S"))
# add(spell_book,
#     spells[names(spells) %in%
#                c("Mending","Guidance","Elementalist")])
# 
# add(features,"Tinker's magic: create a mundane item prof times per long rest ")
```

#### Level 10

``` r
hp = hp + 4+stat_mod(ability_scores['Con'])

add(features, "Master scriviner: half price to scribe, 1 level 1 or 2 spell in a scroll, +1 to level")

add(spell_book,
    spells[names(spells) %in%
               c("Rary's Telepathic Bond","Wall of Force","Prestidigitation")])
```

### Timeline

#### Adventure: DDEX2-6 Breath of the Yellow Rose (Tier 1)

``` r
level = level + 1
downtime = downtime + 10
gold = gold + 100
add(magic_items, "Ring of Mind Shielding (UC)")
alter_count(consumables,"Scroll of Misty Step",1)
```

#### Downtime: Copy scroll of misty step

``` r
gold = gold - 100
downtime = downtime - 1
add(spell_book,
    spells[names(spells) %in% c('Misty Step')])
alter_count(consumables,'Scroll of Misty Step',-1)
```

#### Adventure: Steamy Shores of Danger (CCC-CIC-09)

``` r
level = level + 1
downtime = downtime + 10
gold = gold + 100
add(magic_items,'Geyser Figurine (Decanter of Endless Water) (UC)')
alter_count(consumables,"Potion of Healing",1)
alter_count(consumables,"Scroll of Protection from Evil and Good",1)
```

You have learned how to introduce yourself in a formal and impressive
way. During your future encounters with members of tribal cultures of
Big Folk Island or the village of Jarko’tu’ta you may gain advantage on
social checks if you recite your Greeting during introductions (DM
discretion). The greeting of the forefathers is simple and consists of 7
parts: - Part 1: Name of character - Part 2: Name of father - Part 3:
Name of grandfather - Part 4: Name of great grandfather - Parts 5, 6, 7:
Life accomplishments

#### Downtime: Copy protection from evil and good

``` r
gold = gold - 50
downtime = downtime - 1
add(spell_book,
    spells[names(spells) %in% c('Protection from Evil and Good')])
alter_count(consumables,"Scroll of Protection from Evil and Good",-1)
```

#### Downtime: Scribe scroll of fog cloud

``` r
gold = gold - 25
downtime = downtime - 1
alter_count(consumables,"Scroll of Fog Cloud",1)
```

#### Downtime: Scribe scroll of protection from evil and good

``` r
gold = gold - 25
downtime = downtime - 1
alter_count(consumables,"Scroll of Protection from Evil and Good",1)
```

#### Adventure: The Donjon (Tier 1)

``` r
gold = gold - 1
alter_count(consumables,"Scroll of Protection From Evil and Good",-1)
alter_count(mundane_items,"flasks of oil",-1)
```

``` r
level = level + 1
downtime = downtime + 10
gold = gold + 166
add(magic_items,"Goggles of the Night (UC)")
```

#### Adventure: CCC-TRI-06 Haggard Heroes

There’s a bit of a chronological silliness and a lost adventure here but
it evens out with the next adventure

``` r
downtime = downtime +10
gold = gold + 2000
alter_count(consumables, "Potion of fire breath",1)
add(magic_items, "+1 half plate (R)")
```

#### 2024 rules switch

#### Adventure DDAL04-06 The Ghost (Tier 1)

``` r
alter_count(consumables,"Potion of Healing",-1)
```

``` r
level = level +1
downtime = downtime + 10
gold = gold + 96
add(magic_items,"Boots of Elvenkind (UC)")
alter_count(mundane_items,"Antitoxin",1)
alter_count(consumables,"Potion of Greater Healing",1)
alter_count(consumables,"Potion of Cold Resistence",1)
alter_count(consumables,"Scroll of Detect Thoughts",1)
```

#### Downtime: Shopping

``` r
gold = gold - 100
alter_count(mundane_items,'pearl 100 gp',1) # identify spell component

gold = gold - 200
alter_count(consumables,'Potion of Greater Healing',1)

gold = gold -10 # find familiar casting
```

#### Downtime: Scroll buying and copying

``` r
gold = gold - 50 - 50
downtime = downtime - 1
add(spell_book,
    spells[names(spells) %in% c('Detect Magic')])

gold = gold - 300 -150
downtime = downtime -.1
add(spell_book,
    spells[names(spells) %in% c('Haste')])


gold = gold - 100
alter_count(consumables,"Scroll of Detect Thoughts",-1)
downtime = downtime -.1
add(spell_book,
    spells[names(spells) %in% c('Detect Thoughts')])


gold = gold - 300 - 150 
downtime = downtime -.1
add(spell_book,
    spells[names(spells) %in% c('Fly')])
```

#### Downtime: Scroll scribing

``` r
gold = gold - 2*50 # 25 + 25 material cost
downtime = downtime - 2
alter_count(consumables,"Scroll of Protection from Evil and Good",2)

gold = gold - 100*1
downtime = downtime -3*1
alter_count(consumables,"Scroll of Alter Self",1)

gold = gold - 150*2
downtime = downtime - 5*2
alter_count(consumables,"Scroll of Haste",2)

gold = gold - 150
downtime = downtime - 5
alter_count(consumables,"Scroll of Fly",1)

gold = gold - 150
downtime = downtime - 5
alter_count(consumables,"Scroll of Fireball",1)
```

#### Adventure: DDEP07-02 Drums of the Dead

``` r
alter_count(consumables,"Scroll of Protection From Evil and Good",-1)
alter_count(mundane_items,"flasks of oil",-1)
alter_count(consumables,"Scroll of Fireball",-1)
gold = gold -50
alter_count(consumables,"Potion of Healing",1)
```

Wand of Lightning Bolts This slender glass wand is wrapped in a tight
coil of thin copper wire. When used, the wielder’s hair stands up on
end.

Ring of Evasion This ring of dark wood drips thick, viscous oil that
soaks through even the thickest gloves.

Mantle of Spell Resistance Small, palm-sized mirrors have been sewn into
the outside of this heavy woolen cloak. Occasionally, the mirrors
reflect the image of a strange, bedraggled man in a black cloak looking
back at those who view it.

Story Award: Plague Buster. You helped an alliance of heroes concoct an
antidote for the zombie plague ravaging Chult. Your exposure to the
antidote has hardened your immune system against disease. You have
advantage on saving throws made to resist disease.

``` r
gold = gold + 700 
level = level + 1
downtime = downtime + 10
add(magic_items,"Wand of Lightning Bolts (R)")
add(magic_items,"Ring of Evasion (R)")
add(magic_items,"Mantle of Spell Resistance (R)")
add(features,"Plague Buster: Advantage on saving throws against disease")
```

#### Downtime: Trading Post

``` r
remove(magic_items,"Geyser Figurine (Decanter of Endless Water) (UC)")
add(magic_items, "Gauntlets of Ogre Power (UC)")
```

#### Downtime: Buying and copying scroll of invisibility

``` r
gold = gold - 200 - 100
dowtime = downtime -.1
add(spell_book,
    spells[names(spells) %in% c('Invisibility')])
```

#### Adventure: The Dungeon of Smelly Doom (WBW-DC-AMQ-05)

``` r
gold = gold + 1000
downtime = downtime + 10
level = level + 1
add(magic_items,"Elven Chain Shirt (R)") # TM
add(common_items,"Pole of Collapsing")
alter_count(consumables,"Potion of Greater Healing",1)
alter_count(consumables,"Scroll of Dispel Magic",1)
alter_count(consumables,"Potion of Resistance (Poison)",1)
```

#### Downtime: Copy scroll of dispell magic

``` r
dowtime = downtime -.1
gold = gold - 150
alter_count(consumables,"Scroll of Dispel Magic",-1)
add(spell_book,
    spells[names(spells) %in% c('Dispel Magic')])
```

#### Downtime: Buy copy scrolls

``` r
gold = gold - 50- 50
downtime = downtime -.1
add(spell_book,
    spells[names(spells) %in% c('Comprehend Languages')])
```

#### Adventure: CCC-GHC-BK1-05 - For the Glory of Bloutar

``` r
alter_count(consumables,"Potion of Healing",-1)
```

``` r
downtime = downtime + 10
level = level + 1
gold = gold + 1250
alter_count(consumables,"Potion of Healing",1)
alter_count(consumables,"Potion of Climbing",1)
alter_count(consumables,"Scroll of Blink",1)
alter_count(consumables,"Scroll of Fabricate",1)
alter_count(consumables,"Scroll of Major Image",1)

add(magic_items,'Stout: Longsword +2 (R)')
```

#### Downtime: Copy scrolls

``` r
downtime = downtime -.1
gold = gold - 150
alter_count(consumables,"Scroll of Blink",-1)


downtime = downtime -.1
gold = gold - 150
alter_count(consumables,"Scroll of Major Image",-1)

downtime = downtime -.1
gold = gold - 200
alter_count(consumables,"Scroll of Fabricate",-1)

add(spell_book,
    spells[names(spells) %in% c('Blink','Major Image','Fabricate')])
```

#### Downtime: Buy and copy scrolls

``` r
gold = gold - scroll_p$`2` - 50*2
downtime = downtime -.1
# my list is out of date...
spells$`Spray of Cards` = list(text = "force",
                               level  =2,
                               name = 'Spray of Cards',
                               school = 'conjuration',
                               classes = c('wizard'),
                               source = "PHB",
                               range = "Self",
                               castingTime = '1 action',
                               components = c("V","S"))
add(spell_book,
    spells[names(spells) %in% "Spray of Cards"])

gold = gold - scroll_p$`2` - 50*2
downtime = downtime -.1
add(spell_book,
    spells[names(spells) %in% "Skywrite"])


gold = gold - scroll_p$`1` - 50
downtime = downtime -.1
add(spell_book,
    spells[names(spells) %in% "Alarm"])

gold = gold - scroll_p$`1` - 50
downtime = downtime -.1
add(spell_book,
    spells[names(spells) %in% "Tenser's Floating Disk"])

gold = gold - scroll_p$`1` - 50
downtime = downtime -.1
add(spell_book,
    spells[names(spells) %in% "Unseen Servant"])

gold = gold - scroll_p$`3` - 50*3
downtime = downtime -.1
add(spell_book,
    spells[names(spells) %in% "Leomund's Tiny Hut"])

# force is used as a noun
spell_book$`Leomund's Tiny Hut`$text = ""
```

#### Adventure: Out of Time (CCC-TRI-31 TIME1-1)

Friends in Hot Places. Your actions today have earned you the gratitude
of a very powerful creature. Should you ever find yourself back on the
Elemental Plane of Fire and visiting the City of Brass, you will be
welcomed as a friend

``` r
gold = gold + 825 
downtime = downtime + 10
level = level +  1

add(magic_items,"Dimensional Shackles (R)")
add(features,"Friends in Hot Places: Friend in City of Brass")
```

#### Shopping: Artificer multiclass stuff

``` r
gold = gold - 50
add(mundane_items,"Tinker's tools")
gold = gold - 10
add(mundane_items,"Shield")
```

#### Downtime: scribe

``` r
gold = gold -scribe_p$`2`
downtime = downtime - scribe_t$`2`
alter_count(consumables,"Scroll of Invisibility",1)
```

#### Adventure: SJ-DC-Playtest “A Big Heist”

``` r
alter_count(consumables,"Scroll of Fly",-1)
alter_count(consumables,"Scroll of Fog Cloud",-1)
```

``` r
downtime = downtime + 10
level = level +1
gold = gold + 1000
add(magic_items,"Ring of Feather Falling (R)")
alter_count(consumables,"Potion of Greater Healing",1)
```

#### Downtime: scroll stuff

Master Scrivener, half price scribing

``` r
gold = gold - scribe_p$`3`/2*2
downtime = downtime - scribe_t$`2`/2*2
alter_count(consumables,"Scroll of Fly",2)

gold = gold - scribe_p$`1`/2
downtime = downtime - scribe_t$`1`/2
alter_count(consumables,"Scroll of Fog Cloud",1)
```

``` r
gold = gold - scroll_p$`2` - 50*2
add(spell_book,spells[names(spells) %in% "Earthbind"])
gold = gold - scribe_p$`2`
downtime = downtime - scribe_t$`2`
alter_count(consumables,"Scroll of Earthbind",1)
```

### Final State

``` r
assertthat::assert_that(gold>=0)
```

    ## [1] TRUE

``` r
c(level = level,
  gold = gold,
  downtime = downtime,
  hp = hp)
```

    ##    level     gold downtime   hp.Con 
    ##    10.00  1362.25    59.20    62.00

``` r
ability_scores
```

    ## Str Dex Con Int Wis Cha 
    ##   8  14  14  20  12  10

``` r
skills
```

    ## [1] "Insight"       "Investigation" "Arcana"        "Persuasion"   
    ## [5] "Perception"    "Stealth"       "Acrobatics"    "Deception"

``` r
expertise
```

    ## [1] "Investigation"

``` r
tools
```

    ## [1] "Thieves' tools"

``` r
features %>%{cat(paste("- ",.),sep='\n')}
```

- Ritual Adept
- Arcane Recovery: Half level
- Daily mage armor from magic initiate
- Resourceful: inspiration per long rest
- Wizardly Quill: quick spell copying, quick erase as a bonus action
- Awakened Spellbook:replace damage type, 1 quick ritual per long rest
- Telekinetic: bonus action shove 5 feet, str save, spell DC, +30 feet
  range to mage hand
- Memorize spell: Replace one prepared spell on short rest
- Manifest mind: bonus action to manifest, 60 feet range. light in a
  10-foot radius, darkvision with a range of 60 feet, free audio vis
  share, Prof bonus times spell casting. 300 feet max distance
- Master scriviner: half price to scribe, 1 level 1 or 2 spell in a
  scroll, +1 to level
- Plague Buster: Advantage on saving throws against disease
- Friends in Hot Places: Friend in City of Brass

``` r
# magic item limit for tier 2: 3
magic_items %>% sort  %>%{cat(paste("- ",.),sep='\n')}
```

- +1 half plate (R)
- Arcane Grimoire +1 (UC)
- Boots of Elvenkind (UC)
- Dimensional Shackles (R)
- Elven Chain Shirt (R)
- Gauntlets of Ogre Power (UC)
- Goggles of the Night (UC)
- Mantle of Spell Resistance (R)
- Ring of Evasion (R)
- Ring of Feather Falling (R)
- Ring of Mind Shielding (UC)
- Stout: Longsword +2 (R)
- Wand of Lightning Bolts (R)

``` r
# common item limit for tier 2: 5
# common_items %>% sort  %>%{cat(paste("- ",.),sep='\n')}
# consumable limit for tier 2: 10
consumables %>% sort  %>% {cat(paste("- ",.),sep='\n')}
```

- 1 Potion of Climbing
- 1 Potion of Cold Resistence
- 1 Potion of fire breath
- 1 Potion of Healing
- 1 Potion of Resistance (Poison)
- 1 Scroll of Alter Self
- 1 Scroll of Earthbind
- 1 Scroll of Fog Cloud
- 1 Scroll of Invisibility
- 1 Scroll of Protection from Evil and Good
- 2 Scroll of Fly
- 2 Scroll of Haste
- 4 Potion of Greater Healing

``` r
mundane_items %>% sort %>%{cat(paste("- ",.),sep='\n')}
```

- 1 Antitoxin
- 1 pearl 100 gp
- 10 sheets of parchment
- 2 daggers
- 2 javelin
- 4 days of rations
- 8 flasks of oil
- backpack
- ball bearings
- book
- caltrops
- crowbar
- Gilded Skull 300 gp
- ink
- ink pen
- lamp
- manacles
- mirror
- Quarterstaff
- Robe
- rope
- Shield
- signal whistle
- Spellbook
- thieves’ tools
- tinderbox
- Tinker’s tools
- waterskin

``` r
spell_book
```

    ## Cantrips
    ## ========
    ## Fire Bolt
    ## Toll the Dead
    ## Mind Sliver
    ## Minor Illusion
    ## True Strike
    ## Mage Hand
    ## Mending
    ## Prestidigitation
    ## 
    ## Level 1
    ## =======
    ## Feather Fall
    ## Fog Cloud
    ## Magic Missile
    ## Shield
    ## Absorb Elements
    ## Catapult
    ## Mage Armor
    ## Find Familiar
    ## Identify
    ## Protection from Evil and Good
    ## Detect Magic
    ## Comprehend Languages
    ## Alarm
    ## Tenser's Floating Disk
    ## Unseen Servant
    ## 
    ## Level 2
    ## =======
    ## Phantasmal Force
    ## Dragon's Breath
    ## Alter Self
    ## Suggestion
    ## Misty Step
    ## Detect Thoughts
    ## Invisibility
    ## Spray of Cards
    ## Skywrite
    ## Earthbind
    ## 
    ## Level 3
    ## =======
    ## Fireball
    ## Glyph of Warding
    ## Counterspell
    ## Summon Undead
    ## Haste
    ## Fly
    ## Dispel Magic
    ## Blink
    ## Major Image
    ## Leomund's Tiny Hut
    ## 
    ## Level 4
    ## =======
    ## Elemental Bane
    ## Raulothim's Psychic Lance
    ## Arcane Eye
    ## Dimension Door
    ## Fabricate
    ## 
    ## Level 5
    ## =======
    ## Synaptic Static
    ## Songal's Elemental Suffusion
    ## Rary's Telepathic Bond
    ## Wall of Force

``` r
available_elements(spell_book) %>% 
    {.[sapply(.,length)!=0]}
```

    ## $`1`
    ## [1] "acid"        "bludgeoning" "cold"        "fire"        "force"      
    ## [6] "lightning"   "thunder"    
    ## 
    ## $`2`
    ## [1] "acid"        "bludgeoning" "cold"        "fire"        "force"      
    ## [6] "lightning"   "poison"      "psychic"     "slashing"   
    ## 
    ## $`3`
    ## [1] "acid"      "cold"      "fire"      "lightning" "thunder"  
    ## 
    ## $`4`
    ## [1] "acid"      "cold"      "fire"      "force"     "lightning" "psychic"  
    ## [7] "thunder"  
    ## 
    ## $`5`
    ## [1] "acid"      "cold"      "fire"      "force"     "lightning" "psychic"  
    ## [7] "thunder"
