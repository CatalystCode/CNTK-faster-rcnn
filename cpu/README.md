# CNTK-faster-rcnn (cpu)
This project aims to help getting started for running the Faster RCNN CNTK
examples on a CPU-only container.

# Using the images
You will need to build the image and run the container by typing something like:

```
docker build .
docker run --rm -it -v `pwd`:`pwd` -w `pwd` hashfrombuild bash
```

# Running the examples
If you want to run the examples that come with CNTK, you'll need to make sure
the dataset is downloaded first:

```
cd /cntk/Examples/Image/Detection/FastRCNN
python install_data_and_model.py
```

Then you can run the example(s):

```
cd /cntk/Examples/Image/Detection/FastRCNN
python run_fast_rcnn.py
```

or

```
cd /cntk/Examples/Image/Detection/FasterRCNN
python run_faster_rcnn.py
```

