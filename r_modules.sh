#!/bin/bash

# Define the list of R packages to install
R_PACKAGES=(
    "anomalize"
    "beepr"
    "broom"
    "C50"
    "car"
    "caret"
    "caretEnsemble"
    "corrplot"
    "covr"
    "cowplot"
    "crayon"
    "data.table"
    "dataMaid"
    "datapasta"
    "DBI"
    "dendextend"
    "desc"
    "devtools"
    "dplyr"
    "e1071"
    "EMCluster"
    "farver"
    "flexdashboard"
    "forcats"
    "forecast"
    "formattable"
    "fs"
    "ggcorrplot"
    "ggfittext"
    "ggplot2"
    "ggpubr"
    "ggrepel"
    "ggthemes"
    "ggVennDiagram"
    "glue"
    "gridExtra"
    "Hmisc"
    "httr"
    "igraph"
    "igraphdata"
    "janitor"
    "knitr"
    "leaflet"
    "leafsync"
    "lubridate"
    "magrittr"
    "MASS"
    "Metrics"
    "MICE"
    "mlr"
    "mlr3"
    "nlme"
    "odbc"
    "openxlsx"
    "pheatmap"
    "plotly"
    "purrr"
    "quantmod"
    "randomForest"
    "ranger"
    "Rcpp"
    "readr"
    "readxl"
    "remotes"
    "reshape2"
    "reticulate"
    "rlang"
    "rmarkdown"
    "rpart"
    "RSQLite"
    "rvest"
    "scales"
    "sf"
    "sfsmisc"
    "shiny"
    "shinydashboard"
    "shinyjs"
    "stringi"
    "stringr"
    "styler"
    "survival"
    "swirl"
    "tidyr"
    "tidytext"
    "tidyverse"
    "timetk"
    "usethis"
    "viridis"
    "vroom"
    "xaringan"
    "xgboost"
    "xts"
    "yaml"
    "zoo"
)

# Check if R is installed
if ! command -v R &> /dev/null; then
    echo "R is not installed. Please install R before running this script."
    exit 1
fi

# Create an R script for installing packages
r_script=$(mktemp)
cat <<EOL > "$r_script"
install_if_missing <- function(pkg) {
    if (!require(pkg, character.only = TRUE)) {
        install.packages(pkg, dependencies = TRUE)
    }
}

# List of packages to install
packages <- c(
EOL

# Append each package to the R script
for pkg in "${R_PACKAGES[@]}"; do
    echo "    \"$pkg\"," >> "$r_script"
done

# Complete the R script
cat <<EOL >> "$r_script"
)

# Install each package
for (pkg in packages) {
    install_if_missing(pkg)
}
EOL

# Run the R script
Rscript "$r_script"

# Cleanup the temporary R script
rm "$r_script"

echo "R package installation complete."

