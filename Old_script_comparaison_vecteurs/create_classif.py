import os
import numpy
cheminracine = "C:\Test\\"
chemindst = cheminracine
chemindst += "Classif.txt"
dst = open(chemindst, "a")
for element in os.listdir(cheminracine):
	if "." not in element:
		print("Dossier traite '%s'" % element)
		chemindossier = cheminracine
		chemindossier += element
		for fichier in os.listdir(chemindossier):
			dst.write(element)
			dst.write('\n')
	else:
		print("'%s' est un fichier" % element)

dst.close()

