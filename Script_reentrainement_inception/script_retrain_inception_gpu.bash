#!/bin/bash
 
cd tensorflow

## Building the retrainer 

# Build the Inception-v3 retrain model 
bazel build -c opt --config=cuda tensorflow/examples/image_retraining:retrain 

# Run the Inception-v3 retrain model 
read -p 'Please enter your retrain images folder path : ' IMAGES_DIR
read -p 'Please enter a name for the bottleneck storage folder : ' BOTTLENECK_DIR
read -p 'Please enter a name for the logs storage folder : ' LOGS_DIR
read -p 'Please enter the number of training steps : ' NB_STEPS
#sudo mkdir /retrain_results
sudo mkdir /retrain_results/$BOTTLENECK_DIR
sudo chmod 777 /retrain_results/$BOTTLENECK_DIR
sudo mkdir /retrain_results/$LOGS_DIR
sudo chmod 777 /retrain_results/$LOGS_DIR
bazel-bin/tensorflow/examples/image_retraining/retrain --num_gpus=2 --how_many_training_steps=$NB_STEPS --image_dir "$IMAGES_DIR" --bottleneck_dir "/retrain_results/$BOTTLENECK_DIR" --summaries_dir "/retrain_results/$LOGS_DIR"

# Store files containing class labels and classification graph
read -p 'Please enter a name for your class labels file (must end with .txt) : ' CLASS_LABELS
read -p 'Please enter a name for your classification graph file (must end with .pb) : ' CLASS_GRAPH
sudo cp /tmp/output_labels.txt /retrain_results/$CLASS_LABELS
sudo cp /tmp/output_graph.pb /retrain_results/$CLASS_GRAPH

## Using retrained model to analyze new images 

# Build the label_image example
#bazel build tensorflow/examples/label_image:label_image

# Run the label_image example 
#read -p 'Please enter your test image path : ' TEST_IMAGE
#bazel-bin/tensorflow/examples/label_image/label_image --graph=/tmp/output_graph.pb --labels=/tmp/output_labels.txt --output_layer=final_result --image="$TEST_IMAGE" 

exit 0
