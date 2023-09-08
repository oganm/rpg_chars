Flint
================

## Monster Bits

### Lizard

``` r
lizard = 195
```

### Spider (mwindaji)

  - poison damage

<!-- end list -->

``` r
spider = 135
```

### Small crocks

``` r
baby_crock = 90 
```

### Big crock

  - resistances
  - electricity damage

<!-- end list -->

``` r
big_crock = 90
```

### Spending

Lizard Leather Armor (Level 5) +2 ac, +4 dex cap, -1 check penalty

``` r
lizard = lizard - 2 # base armor
lizard = lizard - 160 # level 5 upgrade
```

Yusuf’s shield

Hardness 7 HP 34, BT 17

``` r
big_crock = big_crock - 1 # base cost
baby_crock = baby_crock - 60 # refinement level 4
baby_crock = baby_crock - 30 # level 3 sturdy imbuement
big_crock = big_crock - 5 # level 3 sturdy imbuement
```

Flint’s buckler

Hardness 4, HP 20, BT 10

``` r
big_crock = big_crock - 1 # base cost
big_crock = big_crock - 60 # level 4 refinement
big_crock = big_crock - 20 # level 2 sturdy imbuement
```

Consumables

``` r
lizard = lizard - 16 # Chameleon Suit
lizard = lizard - 3 # owlbear claw
spider = spider - 3 # shining ammunition
lizard = lizard - 6 # wind up cart
lizard = lizard - 8 # mines level 1
spider = spider - 16
```

Totals

``` r
big_crock
```

    ## [1] 3

``` r
baby_crock
```

    ## [1] 0

``` r
spider
```

    ## [1] 116

``` r
lizard
```

    ## [1] 0

## Gold Spending

``` r
# starting
gold = 450


gold = gold - 
    60 - #crafter's eyepiece
    100 - # sleeves of storage
    30 - # hand of the mage
    3 - # shortbow
    35 - # potency rune
    65 - # striking rune
    5 - # healer's tools
    2 - # repair kit
    1 - # buckler
    1 - # buckler number 2
    1 - # spare buckler
    0.4 - # winter clothes
    30 - # hat of disguise
    1 -# climbing kits 2
    3 - # impact foam chassis
    3 - # blast boots
    3 - # clockwork goggles
    20 -  # spyglass
    4  - # 10 rations
    1.5 # adventurer kit

# formulae
# all sub level 6 gadgets
gold = gold - 
     0.5*8 - # 8 level 1 items
    1*5 - # 5 level 2 items
    1.5*5 - # 5 level 3 items
    2.5*4 - # 4 level 4 items
    4*3 - # 3 level 5 items
    6.5*2 + # 2 level 6 items
    6.5*2 + 4 # 3 free formulas from gadget specialist


gold
```

    ## [1] 46.6

### Formulae

  - All, common+uncommon gadgets less than level 6

  - Shining Ammunition

  - crying angel pendant

  - owlbear claw

  - 
### Inventory

### Gear

  - buckler
  - repair kit
  - healing kit
  - sleeves of storage
  - 2 bucklers
  - winter clothes
  - 2 climbing kits
  - spyglass
  - 10 rations

### Magic items

  - \+1 striking shortbow
  - \+1 lizard skin leather armor
  - shining ammunition
  - crafter’s eyepiece
  - hat of disguise
  - hand of the mage
  - owlbear claw talisman

### Gadgets

  - Impact foam chassis (lesser)
  - Chameleon Suit
  - blast boots (lesser)
  - clockwork goggles (lesser)
  - wind up cart

\#\#\# Codes

Repair heal = 40 Repair critical heal = 60

Unstable damage = 6

``` r
library(diceSyntax)
roll('6d6') # explode
```

    ## [1] "Rolls: [ 2 5 *6* *6* 3 3 ] (6d6)"

    ## [1] 25

``` r
# Unstable DC
roll("1d20") %>% 
    {ifelse(.>= 17,yes = "Success",no = ifelse(.>=7 ,yes = 'Failure',no= 'Crit Fail'))} 
```

    ## [1] "Rolls: [ 9 ] (1d20)"

    ## [1] "Failure"

``` r
# Trained healing
roll("1d20+12") %>% 
    {ifelse(.>= 15,yes = "Success",no = ifelse(.>=5 ,yes = 'Failure',no= 'Crit Fail'))}
```

    ## [1] "Rolls: [ 15 ] (1d20)"

    ## [1] "Success"

``` r
roll('2d8') # success
```

    ## [1] "Rolls: [ *8* *1* ] (2d8)"

    ## [1] 9

``` r
roll('4d6') # crit success
```

    ## [1] "Rolls: [ 5 2 5 5 ] (4d6)"

    ## [1] 17

``` r
# Expert healing
roll("1d20+12") %>% 
    {ifelse(.>= 20,yes = "Success",no = ifelse(.>=10 ,yes = 'Failure',no= 'Crit Fail'))}
```

    ## [1] "Rolls: [ 19 ] (1d20)"

    ## [1] "Success"

``` r
roll('2d8+10') # success
```

    ## [1] "Rolls: [ 5 4 ] (2d8)"

    ## [1] 19

``` r
roll('4d8+10') # crit success
```

    ## [1] "Rolls: [ 4 5 6 4 ] (4d8)"

    ## [1] 29

## Notes

Patiently waiting: racist ass oakbloom by the wind: apparently non
racist mom eye above all: old bird dude

### travel

serpent’s head rock canyon submerged stone whirl ribbons eventual tribe
meeting, take winter supplies

ancestor stones walk carefully great horizon hanging giant tunnels in
the mountains bashkani

cousins whisper of sand flowey that blooms again

shade of the oasis hawk who pokes heavens

echetmol

14 days

180 people 5 prov per day

Provisions

``` r
25 - 5 - 5 - 5
```

    ## [1] 10
