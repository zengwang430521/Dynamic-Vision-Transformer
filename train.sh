srun -p pat_earth -x SH-IDC1-10-198-4-[100-103,116-119] \
srun -p pat_earth \
srun -p mm_human --quotatype=auto\
    --ntasks=8 --gres=gpu:8 --ntasks-per-node=8 --cpus-per-task=5 --kill-on-bad-exit=1 \
    --job-name=dvt \
    python -u main_mine.py /mnt/lustre/zengwang/data/imagenet \
    --model DVT_T2t_vit_12 --batch-size 128 --lr 2e-3 --weight-decay .03 --amp --img-size 224

    python -m torch.distributed.launch --nproc_per_node=8 main.py /mnt/lustre/zengwang/data/imagenet \
    --model DVT_T2t_vit_12 --batch-size 128 --lr 2e-3 --weight-decay .03 --amp --img-size 224