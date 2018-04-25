#!/bin/bash

# define vars
WORKDIR=$(dirname "${BASH_SOURCE[0]}")/..

# script args check
if [ "$1" != "cpu" ] && [ "$1" != "gpu" ]; then
	echo "missing compute option CPU or GPU"
	echo "example usage: ./scripts/run.sh cpu"
	exit 1
fi

rm -rf $WORKDIR/Output

docker build -t fastrcnn -f $WORKDIR/Dockerfile-py3-$1 $WORKDIR

docker run --rm -itd \
	-v $PWD/$WORKDIR/Output:/cntk/Examples/Image/Detection/FasterRCNN/Output \
	--name fastrcnn \
	fastrcnn

docker exec -it fastrcnn bash -c \
	"source /cntk/activate-cntk && \
	bash -c 'python /cntk/Examples/Image/Detection/train.py \
	--tagged-images /cntk/Examples/Image/DataSets/Grocery/grocery/ \
	--num-train 200 \
	--num-epochs 1' && \
     bash -c 'python /cntk/Examples/Image/Detection/predict.py \
	--tagged-images /cntk/Examples/Image/DataSets/Grocery/grocery/ \
	--num-test 5 \
	--conf-threshold 0.82'"
