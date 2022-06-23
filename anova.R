# ANOVA

library(tidyverse)
library(dplyr)
library(gapminder)


print(getwd())
setwd("D:/Projects/Statistics")
print(getwd())

View(gapminder)


attach(gapminder)

gapminder %>%
  select(country, lifeExp) %>%
  filter(country == "South Africa" | country == "Ireland") %>%
  group_by(country) %>%
  summarise(Average_life = mean(lifeExp))


df1 = gapminder %>%
  select(country, lifeExp) %>%
  filter(country == "South Africa" | country == "Ireland")

anova_res = aov(data = df1, lifeExp ~ country)

summary(anova_res)


# As per the results
# F(1, 22) = 101.3, p < 0.05
# Therefore we can reject NULL hypothesis which means there is actually a difference in the mean of lifeExp.

# 1 & 22 are Df
# 101.3 = f-value
# 1.07e-09 = Pr(>F)
