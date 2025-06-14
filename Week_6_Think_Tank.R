library(tidyverse)
library(superheat)

for_plotting = mtcars %>% 
  mutate(across(everything(), ~ (.x - mean(.x))/sd(.x)))

# Figure 1
superheat(
  for_plotting,
  left.label.text.size = 2.5,
  legend = FALSE,
  heat.pal = c("gray", "forestgreen"),
  heat.pal.values = c(0, 1),
  
  order.rows = rev(order(rownames(mtcars))),
  order.cols = order(colnames(mtcars)),
)

# Figure 2
superheat(
  for_plotting,
  left.label.text.size = 2.5,
  legend = FALSE,
  heat.pal = c("gray", "forestgreen"),
  heat.pal.values = c(0, 1),
  
  row.dendrogram = TRUE,
  pretty.order.cols = TRUE,
  pretty.order.rows = TRUE,
)
