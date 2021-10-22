#!/bin/bash
#SBATCH -p gpu20
#SBATCH -t 15:00:00
#SBATCH -o til_asc_kim_derpp_4-%j.out
#SBATCH --gres gpu:1

for id in 0 1 2 3 4
do
     python  run.py \
    --note random$id,6200 \
    --task femnist \
    --scenario dil_classification \
    --idrandom $id \
    --approach mlp_ewc_ncl \
    --eval_batch_size 128 \
    --train_batch_size 128 \
    --save_each_step \
    --lamb=500\
    --model_path "./models/fp32/dil_classification/femnist/mlp_ewc_$id" \
    --save_model
done
#--nepochs 1


#nepochs=100,lr=0.05,lr_min=1e-4,lr_factor=3,lr_patience=3,clipgrad=10000,lamb=5000