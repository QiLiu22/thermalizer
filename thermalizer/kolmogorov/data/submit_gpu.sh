#!/bin/bash

#SBATCH --job-name=run_emu_sims
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=10
#SBATCH --gres=gpu:h100:1 
#SBATCH --mem=64GB
#SBATCH --output=slurm_%j.out


# Begin execution
module purge

singularity exec --nv \
	    --overlay /scratch/ql2221/Qi_singularity/overlay-50G-10M.ext3:ro \
	    /scratch/work/public/singularity/cuda12.1.1-cudnn8.9.0-devel-ubuntu22.04.2.sif \
	    /bin/bash -c "source /ext3/env.sh; python3 /home/ql2221/Projects/Thermalizer/thermalizer/thermalizer/kolmogorov/data/run_kolmogorov.py --config data_config.yml --save_path /scratch/ql2221/thermalizer_data/kolmogorov/reynolds5k/emu1.p"

