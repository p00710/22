# Install required packages
install.packages("arules")
install.packages("arulesViz")
install.packages("RColorBrewer")

# Load libraries
library(arules)
library(arulesViz)
library(RColorBrewer)

# Import the "Groceries" dataset
data("Groceries")

# Generate association rules with specified parameters
rules <- apriori(Groceries, parameter = list(supp = 0.01, conf = 0.2))
# supp - relative frequency between 2 items in the dataset, conf - relative confidence

# Use the inspect function to view the first 7 association rules
inspect(rules[1:7]) # Shows strong associations between 7 items 

# Use itemFrequencyPlot() function to visualize item frequency
arules::itemFrequencyPlot(
  Groceries,
  topN = 10,
  col = brewer.pal(8, 'Pastel2'),
  main = "Apriori",
  type = "relative",
  ylab = "Item Frequency (Relative)"
)
