Flint
================

## Monster Bits

### Lizard

``` r
lizard = 195
```

### Spider (mwindaji)

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

Shocking bow

``` r
lizard = lizard - 3 # base cost
spider = spider - 100 # level 4 refinement
```

Consumables

``` r
lizard = lizard - 16 # Chameleon Suit
lizard = lizard - 3 # owlbear claw
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

    ## [1] 35

``` r
lizard
```

    ## [1] 11

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
  - crafter’s eyepiece
  - hat of disguise
  - hand of the mage
  - owlbear claw talisman

### Gadgets

  - Impact foam chassis (lesser)
  - Chameleon Suit
  - blast boots (lesser)
  - clockwork goggles (lesser)

## Notes

Patiently waiting: racist ass oakbloom by the wind: apparently non
racist mom eye above all: old bird dude

### Codes

Repair heal = 15

Unstable damage = 6

``` r
library(diceSyntax)
roll('6d6') # explode
```

    ## [1] "Rolls: [ 5 5 5 5 4 5 ] (6d6)"

    ## [1] 29

``` r
# Unstable DC
roll("1d20") %>% 
    {ifelse(.>= 17,yes = "Success",no = ifelse(.>=7 ,yes = 'Failure',no= 'Crit Fail'))} 
```

    ## [1] "Rolls: [ 8 ] (1d20)"

    ## [1] "Failure"

``` r
# Trained healing
roll("1d20+12") %>% 
    {ifelse(.>= 15,yes = "Success",no = ifelse(.>=5 ,yes = 'Failure',no= 'Crit Fail'))}
```

    ## [1] "Rolls: [ 14 ] (1d20)"

    ## [1] "Success"

``` r
roll('2d8') # success
```

    ## [1] "Rolls: [ 3 2 ] (2d8)"

    ## [1] 5

``` r
roll('4d6') # crit success
```

    ## [1] "Rolls: [ *6* 4 *6* 3 ] (4d6)"

    ## [1] 19

``` r
# Expert healing
roll("1d20+12") %>% 
    {ifelse(.>= 20,yes = "Success",no = ifelse(.>=10 ,yes = 'Failure',no= 'Crit Fail'))}
```

    ## [1] "Rolls: [ 10 ] (1d20)"

    ## [1] "Success"

``` r
roll('2d8+10') # success
```

    ## [1] "Rolls: [ 6 *8* ] (2d8)"

    ## [1] 24

``` r
roll('4d8+10') # crit success
```

    ## [1] "Rolls: [ *1* 3 7 6 ] (4d8)"

    ## [1] 27

### travel

serpent’s head rock canyon submerged stone whirl ribbons eventual tribe
meeting, take winter supplies

ancestor stones walk carefully great horizon hanging giant tunnels in
the mountains bashkani
