# Animated and Interactive Graphics

## Instructions

Use the [TidyTuesday Cocktail Data](https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-05-26/readme.md) to create a shiny applet containing the following:

- A visual exploration of the cocktail data
- A way for a user to search through cocktail recipes by ingredient

Your applet should make use of reactivity in both components, but the specifics of what you do and how you do it are up to you.

Once you're satisfied with your applet, upload it to [ShinyApps.io](https://www.shinyapps.io/). You should be able to use the free hosting - you're not creating any high-traffic applications yet. 

You can find the instructions for deploying your application [here](https://docs.rstudio.com/shinyapps.io/getting-started.html#working-with-shiny-for-r).

When you've deployed your application, edit this README to contain a link to your applet.

```{r db-setup-r}

# Get the Data

cocktails <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2020/2020-05-26/cocktails.csv')
boston_cocktails <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2020/2020-05-26/boston_cocktails.csv')

#Make a visual exploration of the cocktail data
library(shiny)
library(dplyr)
library (ggplot2)

cocktails_ingredient <- group_by(boston_cocktails, ingredient) %>%
  count(ingredient) %>%
  filter(ingredient == "Agave nectar")
  
join1<- left_join (cocktails_ingredient, boston_cocktails, by = c("ingredient"))

join2 <- boston_cocktails %>%
  filter(name %in% join1$name)

```
```{r}

install.packages('rsconnect')
rsconnect::setAccountInfo(name='22lucia', token='FCD6E3D2F7066B50B01C1F49006F1D11', secret='n5MC7LQAFMtxL7W2NNnLcwRvxXhyWSbAyZ7pcY3S')
rsconnect::deployApp()
```

