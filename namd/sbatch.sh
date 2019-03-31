#!/bin/bash

# #SBATCH -N 4
# #SBATCH -n 32
# #SBATCH -p asinghargpu1
# #SBATCH -q asinghargpu1
# #SBATCH --gres=gpu:GTX1080:1

#SBATCH -n 128
#SBATCH -q aggressive




module load namd/2.13-mpi

charmrun +p64 namd2 +replicas 16 remdff.namd +stdout output/%d/job0.%d.log > Master.log
