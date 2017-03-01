import os
import numpy
import time  

"Préciser le chemin du dossiers où le fichier contenant la totalité des bottlenecks existe et le fichier de caractéristiques à comparer"
start_time = time.time() 
cheminracine = "C:\Test\\"
chemindst = cheminracine
chemindst += "Classif.txt"
chemindstsansclasse = cheminracine
chemindstsansclasse += "All_bottlenecks.txt"
cheminfile = cheminracine
cheminfile += "test.txt"

"Chargement du contenu du fichier contenant la totalité des bottlenecks dans une matrice numpy"
all = numpy.loadtxt(chemindstsansclasse,dtype=None,delimiter=' ')
print('ok all')
"Chargement du contenu du fichier contenant les classes des bottlenecks dans une matrice numpy"
src = open(chemindst, "r")
classif = src.readlines()
src.close()
print('ok classif')
"Chargement du contenu du fichier à comparer"
file = numpy.loadtxt(cheminfile,dtype=None,delimiter=',')
print('ok test')
"On compare le vecteur correspondant au fichier à classifier avec tous les vecteurs bottlenecks un à un"
"On stocke la liste des résultats obtenus"
result = []
for i in range(0,numpy.shape(all)[0]):
	print(i)
	j = 0
	if numpy.allclose(file,all[i,:],rtol=0.0001, atol=0.0001):
		result.insert(j,classif[i])
		j = j + 1
	
"On affiche la liste des classes obtenue"	
print(result)
"On affiche le temps qu'a pris le traitement pour s'effectuer"
interval = time.time() - start_time  
print('Total time in seconds:', interval)  
from time import *
print(strftime('%H hour %M minute %S second', gmtime(interval)))
