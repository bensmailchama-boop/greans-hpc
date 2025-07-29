# GReaNs / GM (HPC quickstart)

Expected layout under your home:
$HOME/devel/
├─ wx/ boost/ bullet/ graphviz/  # optional local builds
└─ GM/                           # this repo

## Run on PBS/Torque
Submit:
    qsub cluster/pbs_gaworker.sh

The job expects:
- Binary at $HOME/devel/GM/GAWorker
- Configs: $HOME/devel/GM/Orbs.ini and $HOME/devel/GM/autostart.ga

Logs:
- GAWorker.log (in working dir)
- $HOME/SNN_noise.log (PBS stdout/err)
