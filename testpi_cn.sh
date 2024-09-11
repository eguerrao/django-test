#!/bin/bash
#SBATCH --job-name=pi
#SBATCH --partition=slims
#SBATCH -n 720
##SBATCH --ntasks-per-node=20
#SBATCH --output=%j.out
#SBATCH --error=%j.err

#ml intel impi
module load intel impi

#srun --kill-on-bad-exit=1 --export=ALL ./pi_mpi.exe 1000007099910000
#export I_MPI_DEBUG=7

#hostname
#ldd ./pi_mpi.exe
export I_MPI_FABRICS=shm:ofa
export FI_PROVIDER_PATH=/home/lmod/software/intel-compilers/2022.0.1/mpi/2021.7.1/libfabric/lib/prov
export FI_PROVIDER=verbs
srun ./pi_mpi 1000007099910000
#srun ./pi_mpi.exe 40000000000
#srun ./pi_mpi.exe 400000000000



# 40000000000 (1 min en 2 nodos)

