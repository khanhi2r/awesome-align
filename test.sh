DATA_FILE=data/enbm.src-tgt
OUTPUT_FILE=data/enbm.out


MODEL_NAME_OR_PATH=outdir

CUDA_VISIBLE_DEVICES=0 python run_align.py \
    --output_file=$OUTPUT_FILE \
    --model_name_or_path=$MODEL_NAME_OR_PATH \
    --data_file=$DATA_FILE \
    --extraction 'softmax' \
    --batch_size 32