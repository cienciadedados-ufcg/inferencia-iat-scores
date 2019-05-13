# usamos os dados de https://osf.io/nqg97/
# descompacte Datasets.zip em data/raw e o script gera o csv

library(tidyverse)

raw = read_tsv(here::here("data/raw/Tab.delimited.Cleaned.dataset.WITH.variable.labels.dat"))

data = raw %>% 
    group_by(sample) %>% 
    mutate(m = sum(expgender == "male"), 
           f = sum(expgender == "female")) %>% 
    ungroup() %>% 
    filter(m >=10, 
           f >= 10, 
           IATfilter == 1) %>% 
    select(iat = d_art, 
           sample, 
           expgender, 
           age,
           us_or_international, 
           m, 
           f) 

data %>% 
    write_csv(here::here("data/iat_scores.csv"))
