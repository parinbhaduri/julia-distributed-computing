#!/bin/bash
#SBATCH --job-name=parallel_test_julia
#SBATCH --nodes=1
#SBATCH --ntasks=40
#SBATCH --output=results/output_text.txt
#SBATCH --error=results/error_text.txt
#SBATCH --exclusive

# Print properties of job as submitted
echo "SLURM_JOB_ID = $SLURM_JOB_ID"
echo "SLURM_NTASKS = $SLURM_NTASKS"
echo "SLURM_NTASKS_PER_NODE = $SLURM_NTASKS_PER_NODE"
echo "SLURM_CPUS_PER_TASK = $SLURM_CPUS_PER_TASK"
echo "SLURM_JOB_NUM_NODES = $SLURM_JOB_NUM_NODES"

# Print properties of job as scheduled by Slurm
echo "SLURM_JOB_NODELIST = $SLURM_JOB_NODELIST"
echo "SLURM_TASKS_PER_NODE = $SLURM_TASKS_PER_NODE"
echo "SLURM_JOB_CPUS_PER_NODE = $SLURM_JOB_CPUS_PER_NODE"
echo "SLURM_CPUS_ON_NODE = $SLURM_CPUS_ON_NODE"

# Load the Julia module
module load julia/1.6.2

# Run the Julia code
julia main.jl
