#!/bin/bash
#SBATCH --job-name=parallel_test_julia
#SBATCH -- nodes 1
#SBATCH --n-tasks-per-node 40
#SBATCH --exclusive

# Load the Julia module
module load julia/1.6.2

# Run the Julia code
julia main.jl
