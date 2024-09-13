#!/bin/bash

# List of Python packages to install
PYTHON_PACKAGES=(
    "altair"
    "autograd"
    "blaze"
    "bokeh"
    "catboost"
    "concurrent.futures"
    "cupy"
    "cx_Oracle"
    "Cython"
    "dash"
    "dask"
    "dataset"
    "discrete_rv"
    "duckdb"
    "fredapi"
    "ggplot"
    "grip"
    "h5py"
    "holoviews"
    "ibm_db"
    "ipyparallel"
    "jax"
    "joblib"
    "jupyter"
    "lightgbm"
    "linearmodels"
    "loky"
    "lss"
    "markdown"
    "markdown2"
    "markov_chain"
    "matplotlib"
    "mistune"
    "mkdocs"
    "mpi4py"
    "multiprocessing"
    "mysql-connector-python"
    "nbconvert"
    "numba"
    "numpy"
    "pandas"
    "pandasql"
    "patsy"
    "pg8000"
    "plotly"
    "psycopg2"
    "PyDSGE"
    "pyGAM"
    "pymysql"
    "pyodbc"
    "pypandoc"
    "pytables"
    "python-markdown-math"
    "torch"
    "quantecon"
    "ray"
    "scikit-learn"
    "scipy"
    "seaborn"
    "semopy"
    "snowflake-connector-python"
    "SQLAlchemy"
    "sqlite3"
    "statsmodels"
    "tensorflow"
    "turbodbc"
    "vega"
    "xgboost"
)

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python is not installed. Please install Python before running this script."
    exit 1
fi

# Install pip if not installed
if ! command -v pip3 &> /dev/null; then
    echo "pip is not installed. Installing pip..."
    python3 -m ensurepip --upgrade
fi

# Loop through each package and install it using pip
for pkg in "${PYTHON_PACKAGES[@]}"; do
    echo "Installing $pkg..."
    pip3 install "$pkg"
    if [ $? -eq 0 ]; then
        echo "$pkg installed successfully."
    else
        echo "Failed to install $pkg."
    fi
done

echo "Python package installation complete."

