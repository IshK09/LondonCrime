library(tidyverse)
library(tidyr)

londoncrime <- read.csv("LondonBoroughLevelCrime.csv")

londonCrime <- londoncrime %>%
  gather("Year", "Crime", X200801:X201812) %>%
  mutate(Year = str_remove(Year, 'X')) %>%
  extract(Year, into = c("Year", "Month"), "(.{4})(.{2})", remove=FALSE)

write.csv(londonCrime, "London Crime 2008-18.csv", row.names = FALSE)

