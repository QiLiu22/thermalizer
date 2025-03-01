#!/bin/bash

#SBATCH --job-name=train_emu
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=10
#SBATCH --gres=gpu:a100:1
#SBATCH --mem=128GB
#SBATCH --output=slurm_%j.out
#SBATCH --array=1-3

# Begin execution
module purge

singularity exec --nv \
	    --overlay /scratch/ql2221/Qi_singularity/overlay-50G-10M.ext3:ro \
	    /scratch/work/public/singularity/cuda11.1-cudnn8-devel-ubuntu18.04.sif \
	    /bin/bash -c "source /ext3/env.sh; python3 /home/ql2221/Projects/Thermalizer/thermalizer/scripts/kolmogorov/train_drnM.py"

