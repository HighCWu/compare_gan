#!/bin/bash
set -ex
export TPU_HOST="${TPU_HOST:-10.255.128.3}"
export TPU_NAME="${TPU_NAME:-tpu-v2-128-euw4a-7}"
export MODEL_DIR="${MODEL_DIR:-gs://darnbooru-euw4a/runs/bigrun45/}"
export GIN_CONFIG="${GIN_CONFIG:-example_configs/bigrun45.gin}"
export LOGDIR="${LOGDIR:-logs45.txt}"
while true; do
  python3 wrapper.py compare_gan/main.py --use_tpu --tfds_data_dir 'gs://danbooru-euw4a/tensorflow_datasets/' --model_dir "${MODEL_DIR}" --gin_config "$GIN_CONFIG" "$@" 2>&1 | tee -a "${LOGDIR}"
  sleep 30
done
