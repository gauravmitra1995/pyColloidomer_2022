#!/bin/bash

#!/bin/bash
#SBATCH --nodes=1
#SBATCH --tasks-per-node 1
#SBATCH --cpus-per-task 1

#SBATCH --mem 5GB

#SBATCH -t 48:00:00
#SBATCH --dependency=singleton

##SBATCH --gres=gpu:1
##SBATCH --gres=gpu:1g.10gb:1

current_dir=$(pwd)

host=$(env - hostname -s)
exe=run_simulation.py

#Modify the PATH leading upto the pyColloidomer_2022 folder, as needed
basedir=/scratch/projects/hockygroup/data-share/pyColloidomer_2022

wrapper=$basedir/dybond/run-hoomd2.9.6.bash
$wrapper python -u $basedir/dimer_trimer/simulation_setup/${exe}

