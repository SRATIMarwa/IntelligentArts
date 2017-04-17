import os
import numpy as np
import tensorflow as tf
from sklearn.metrics import classification_report

# We specify the folder containing the images to classify
imageTestPath = '/home/ubuntu/Images_test/'

# We need to know also where the files containing class labels and classification graph are
modelFullPath = '/retrain_results/output_graph_1_20000_steps.pb'
labelsFullPath = '/retrain_results/output_labels_1_20000_steps.txt'

def create_graph():
    """Creates a graph from saved GraphDef file and returns a saver."""
    # Creates graph from saved graph_def.pb.
    with tf.gfile.FastGFile(modelFullPath, 'rb') as f:
        graph_def = tf.GraphDef()
        graph_def.ParseFromString(f.read())
        _ = tf.import_graph_def(graph_def, name='')

# Creates graph from saved GraphDef.
create_graph()

def run_inference_on_image(imagePath):
    answer = None

    if not tf.gfile.Exists(imagePath):
        tf.logging.fatal('File does not exist %s', imagePath)
        return answer

    image_data = tf.gfile.FastGFile(imagePath, 'rb').read()

    with tf.Session() as sess:

        softmax_tensor = sess.graph.get_tensor_by_name('final_result:0')
        predictions = sess.run(softmax_tensor,
                               {'DecodeJpeg/contents:0': image_data})
        predictions = np.squeeze(predictions)

        top_k = predictions.argsort()[-5:][::-1]  # Getting top 5 predictions
        f = open(labelsFullPath, 'rb')
        lines = f.readlines()
        labels = [str(w).replace("\n", "") for w in lines]
        for node_id in top_k:
            human_string = labels[node_id]
            score = predictions[node_id]
            print('%s (score = %.5f)' % (human_string, score))

        answer = labels[top_k[0]]
        return answer


# For each image we predict the top 5 classes
initial_class=[]
prediction_class=[]
images=[]
for element in os.listdir(imageTestPath):
	print('***** Image testee : '+ element +' *****')
	initial_class += [element.split("_")[0].lower()]
	imagePath = imageTestPath
	imagePath += element
	prediction_class += [run_inference_on_image(imagePath).lower()]
	images += [element]
	

print("***** Tableau de resultat affichant le nom de l'image, sa classe d'origine et la classe predite : *****")
print(np.column_stack((images,initial_class,prediction_class)))
"print(prediction_class)"
print("***** Rapport de classification *****")
print classification_report(initial_class, prediction_class)