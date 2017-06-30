library(reshape2)
library(ggplot2)
library(cowplot)
library(parallel)

attackTest = function(AC,...){
    a = timAttack(...)
    if((a['Attack'] > AC | a['crit'] == 1)){
        return(a['Damage'])
    } else{
        return(0)
    }
}


attackAverage = function(AC,n = 10000,...){
    sapply(1:n, function(i){
        attackTest(AC,useAmmo= FALSE,vocal = FALSE,...)
    }) %>% mean
}

regular = 5:30 %>% mclapply(attackAverage,mc.cores= 10) %>% unlist
sharpy = 5:30 %>% mclapply(attackAverage,sharpShoot = TRUE,mc.cores= 10) %>% unlist
regularAdv = 5:30 %>% mclapply(attackAverage,adv = 1,mc.cores= 10) %>% unlist
sharpyAdv = 5:30 %>% mclapply(attackAverage,sharpShoot = TRUE,adv = 1,mc.cores= 10) %>% unlist
regularDisadv = 5:30 %>% mclapply(attackAverage,adv = -1,mc.cores= 10) %>% unlist
sharpyDisadv = 5:30 %>% mclapply(attackAverage,sharpShoot = TRUE,adv = -1,mc.cores= 10) %>% unlist

data = data.frame(regular= regular,
                  sharpy = sharpy,
                  regularAdv= regularAdv,
                  sharpyAdv= sharpyAdv,
                  regularDisadv = regularDisadv,
                  sharpyDisadv = sharpyDisadv,
                  AC = 5:30)

df = data %>% reshape2::melt(id.vars = 'AC',value.name = 'damage')

dfRegular = data.frame(regular= regular,
                       sharpy = sharpy,
                       AC = 5:30) %>% reshape2::melt(id.vars = 'AC',value.name = 'damage')

dfDisadv = data.frame(regularDisadv = regularDisadv,
                      sharpyDisadv = sharpyDisadv,
                      AC = 5:30) %>% reshape2::melt(id.vars = 'AC',value.name = 'damage')

dfAdv = data.frame(regularAdv= regularAdv,
                   sharpyAdv= sharpyAdv,
                   AC = 5:30) %>% reshape2::melt(id.vars = 'AC',value.name = 'damage')

dfRegular %>% ggplot(aes(x =AC, y = damage, color = variable)) + geom_line() + ggtitle('Regular')
dfAdv %>% ggplot(aes(x =AC, y = damage, color = variable)) + geom_line() +ggtitle('Advantage')
dfDisadv %>% ggplot(aes(x =AC, y = damage, color = variable)) + geom_line() + ggtitle('Disadvantage')

data$AC[(data$sharpy - data$regular) < 0][1]
data$AC[(data$sharpyAdv - data$regularAdv) < 0][1]
data$AC[(data$sharpyDisadv - data$regularDisadv) < 0][1]


# 20, 20, 14