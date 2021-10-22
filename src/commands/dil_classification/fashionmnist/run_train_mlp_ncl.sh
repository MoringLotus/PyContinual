#!/bin/bash
#SBATCH -p gpu20
#SBATCH -t 5:00:00
#SBATCH -o dil_nli_ncl_4-%j.out
#SBATCH --gres gpu:1


for id in 1 2 3 4
do
    CUDA_VISIBLE_DEVICES=1 python  run.py \
    --note random$id\
    --ntasks 10 \
    --nclasses 10 \
    --task fashionmnist \
    --scenario dil_classification \
    --idrandom $id \
    --approach mlp_ncl \
    --eval_batch_size 128 \
    --train_batch_size 32 \
    --data_size full \
    --image_size 28 \
    --image_channel 1 \
    --nepochs 300
done
#--nepochs 1
#    --train_data_size 500