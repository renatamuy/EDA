# DataExplorer

# Check packages versions

devtools::session_info()

# Install packages

install.packages("DataExplorer")
install.packages("knitr")

# Check packages
library(DataExplorer)
require(knitr)
require(rmarkdown)
library(ggplot2)

# Create reports (cool!)

create_report(airquality)

create_report(diamonds)

## View distribution of all discrete variables
plot_bar(diamonds)

## View distribution of cut only

plot_bar(diamonds$cut)

## View correlation of all discrete varaibles
plot_correlation(diamonds, type = "discrete")

## View distribution of all continuous variables

plot_histogram(diamonds)

## View distribution of carat only

plot_histogram(diamonds$carat)

## View correlation of all continuous varaibles

plot_correlation(diamonds, type = "continuous")

## View overall correlation heatmap

plot_correlation(diamonds)

## View distribution of missing values for airquality data

missing_data <- plot_missing(airquality) # missing data profile will be returned
missing_data

## View iris continuous distribution based on each Species
plot_boxplot(iris, "Species")

## View iris continuous distribution based on different buckets of Sepal.Length
plot_boxplot(iris, "Sepal.Length")

## Scatterplot Ozone against all other airquality features
# Set some features to factor
for (i in c("Month", "Day")) airquality[[i]] <- as.factor(airquality[[i]])
# Plot scatterplot
# Note: discrete and continuous charts are plotted on separate pages!
plot_scatterplot(airquality, "Ozone")

## View original distribution of variable clarity
diamonds <- data.table(diamonds)
table(diamonds$clarity)

## Trial and error without updating: Group bottom 20% clarity based on frequency
group_category(diamonds, "clarity", 0.2)
## Group bottom 30% clarity and update original dataset
group_category(diamonds, "clarity", 0.3, update = TRUE)

## View distribution after updating
table(diamonds$clarity)

## Group bottom 20% cut using value of carat
table(diamonds$cut)
group_category(diamonds, "cut", 0.2, measure = "carat", update = TRUE)
table(diamonds$cut)
Note: this function works with data.table objects only. If you are working with data.frame, please add data.table class to your object and then remove it later. See example below.

## Set data.frame object to data.table
USArrests <- data.table(USArrests)
## Collapse bottom 10% UrbanPop based on frequency
group_category(USArrests, "UrbanPop", 0.1, update = TRUE)
## Set object back to data.frame
class(USArrests) <- "data.frame"]

