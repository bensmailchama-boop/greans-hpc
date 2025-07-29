#!/bin/bash
#PBS -q core32
#PBS -l nodes=2:ppn=8
#PBS -l walltime=24:00:00
#PBS -N gaSNN_Test16
#PBS -j oe
#PBS -o $HOME/SNN_noise.log

source /etc/profile.d/modules.sh
module use /soft/Modules-Rocky9
module load openmpi-4.0.5

cd "$PBS_O_WORKDIR"
# If you rely on local libs under ~/devel, uncomment the next line:
# source "$PBS_O_WORKDIR/scripts/env.sh"

echo "[$(date '+%F %T')] Starting GAWorker on $HOSTNAME" | tee -a GAWorker.log
echo "OMP_NUM_THREADS=$OMP_NUM_THREADS, MPI procs=$PBS_NP" | tee -a GAWorker.log
module list 2>&1 >> "$HOME/SNN_noise_output.log"

export OMP_NUM_THREADS=1

mpiexec --bind-to core --map-by ppr:8:node -np 16 \
  "$HOME/devel/GM/GAWorker" \
  --autonomous "$HOME/devel/GM/Orbs.ini" \
  "$HOME/devel/GM/autostart.ga" \
  2>&1 | tee -a "$PBS_O_WORKDIR/GAWorker.log"

echo "[$(date '+%F %T')] GAWorker exited with code ${PIPESTATUS[0]}" | tee -a GAWorker.log
echo "[$(date '+%F %T')] mpiexec returned $?" >> "$HOME/SNN_noise_output.log"
