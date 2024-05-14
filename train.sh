TRAIN_FILE=data/enbm1000.src-tgt
EVAL_FILE=data/enbm.src-tgt
OUTPUT_DIR=outdir

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python run_train.py \
    --output_dir=$OUTPUT_DIR \
    --model_name_or_path=bert-base-multilingual-cased \
    --extraction 'softmax' \
    --do_train \
    --train_tlm \
    --train_so \
    --train_data_file=$TRAIN_FILE \
    --per_gpu_train_batch_size 2 \
    --gradient_accumulation_steps 4 \
    --num_train_epochs 1 \
    --learning_rate 2e-5 \
    --save_steps 4000 \
    --max_steps 20000 \
    --no_cuda \
    --do_eval \
    --eval_data_file=$EVAL_FILE