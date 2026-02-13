# Week 1: Initial data exploration
# Emil Lagasca
# 12/2/26

# loading packages
library(tidyverse)
library(here)
library(naniar)
library(janitor)
library(skimr)

# load data
mosquito_egg_raw <- read_csv(here("data", "mosquito_egg_data.csv"),
                             name_repair = janitor::make_clean_names)

# basic overview
glimpse(mosquito_egg_raw)
summary(mosquito_egg_raw)
skim(mosquito_egg_raw)

# react table
# view interactive table of data
view(mosquito_egg_raw)

#counts by site and treatment

mosquito_egg_raw |>
group_by(site, treatment) |>
  summarise(n=n())

#observations

