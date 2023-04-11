#/bin/bash

export GPU_NUM_DEVICES=1
export FORCE_CUDA=1

top=$(dirname "$0")/..

for model in BERT_pytorch vgg16 resnet18 resnet50 resnext50_32x4d alexnet mobilenet_v2 mnasnet1_0 squeezenet1_1 timm_vision_transformer
do
	echo
	echo Trying pytest bench xla on model ${model}
	echo
	pytest ${top}/test_bench_xla.py --ignore_machine_config -k "test_eval[${model}"
	echo
	echo
done