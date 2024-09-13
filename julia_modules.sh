#!/bin/bash

# Define the list of Julia packages to install
JULIA_PACKAGES=(
    "ApproxFun"
    "BenchmarkTools"
    "BioJulia"
    "BioSequences"
    "CategoricalArrays"
    "ChainRulesCore"
    "Clustering"
    "Colors"
    "CSV"
    "CSVFiles"
    "CuArrays"
    "CUDAnative"
    "Dagger"
    "DataDeps"
    "DataFrames"
    "DataFramesMeta"
    "DataInterpolations"
    "DataStructures"
    "DelimitedFiles"
    "DifferentiableProgramming"
    "DifferentialEquations"
    "DifferentialGeometry"
    "Distributions"
    "Documenter"
    "DrWatson"
    "ExcelReaders"
    "FFMPEG"
    "FFTW"
    "FiniteDiff"
    "Flux"
    "Formatting"
    "ForwardDiff"
    "Gadfly"
    "Gen"
    "GLM"
    "GLMakie"
    "GraphPlot"
    "Graphs"
    "Gtk"
    "GtkReactive"
    "Gumbo"
    "HTTP"
    "HTTPServer"
    "IJulia"
    "ImageMagick"
    "ImageProcessing"
    "Interpolations"
    "InverseDistanceWeighting"
    "JLD"
    "JSON"
    "JuAFEM"
    "JuliaWebAPI"
    "JuMP"
    "LightGraphs"
    "LinearAlgebra"
    "LoopVectorization"
    "Makie"
    "MakieLayout"
    "MathematicalStructures"
    "MCMCChains"
    "Mimi"
    "MLJ"
    "MonteCarloMeasurements"
    "NamedArrays"
    "NetCDF"
    "NLopt"
    "NNlib"
    "OpenCV"
    "OpenStreetMapX"
    "Optim"
    "Optimization"
    "OrdinaryDiffEq"
    "Parameters"
    "PkgBenchmark"
    "PkgTemplates"
    "Plots"
    "PlotsRecipes"
    "POMDPs"
    "PrettyTables"
    "Primes"
    "PyCall"
    "PyPlot"
    "QuadGK"
    "QuantEcon"
    "QuantumOptics"
    "Random"
    "RandomMatrices"
    "RDatasets"
    "Revise"
    "Roots"
    "Serialization"
    "SignalProcessing"
    "SimpleChains"
    "Soss"
    "SparseArrays"
    "StaticArrays"
    "Statistics"
    "StatsBase"
    "StatsFuns"
    "StatsPlots"
    "SymPy"
    "TensorFlow"
    "TextAnalysis"
    "TickTock"
    "Transformers"
    "Tullio"
    "Turing"
    "Unitful"
    "Weave"
    "Zygote"
)

# Check if Julia is installed
if ! command -v julia &> /dev/null; then
    echo "Julia is not installed. Please install Julia before running this script."
    exit 1
fi

# Install the packages using Julia's package manager
echo "Starting Julia package installation..."

# Create a Julia script to install packages
julia_script=$(mktemp)
cat <<EOL > "$julia_script"
import Pkg

# List of packages to install
packages = [
EOL

# Append each package individually
for pkg in "${JULIA_PACKAGES[@]}"; do
    echo "    \"$pkg\"," >> "$julia_script"
done

# Complete the Julia script
cat <<EOL >> "$julia_script"
]

for pkg in packages
    try
        println("Installing package: \$pkg")
        Pkg.add(pkg)
        println("Successfully installed \$pkg")
    catch e
        println("Failed to install \$pkg: \$e")
    end
end
Pkg.precompile()  # Precompile the installed packages
EOL

# Run the Julia script
julia "$julia_script"

# Cleanup the temporary Julia script
rm "$julia_script"

echo "Julia package installation complete."
