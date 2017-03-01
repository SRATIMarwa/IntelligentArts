import numpy
"Préciser le chemin du dossiers où les deux fichiers à comparer ont été mis"
cheminracine = "C:\Test\\"
cheminFichierUn = cheminracine
cheminFichierUn += "_F3759_7889.jpg.txt"
cheminFichierDeux = cheminracine
cheminFichierDeux += "_F3759_7889_copie.jpg.txt"

"Lire les données des fichiers texte à comparer avec numpy.genfromtxt"
fichierUn = numpy.genfromtxt(cheminFichierUn,dtype=None,delimiter=',')
fichierDeux = numpy.genfromtxt(cheminFichierDeux,dtype=None,delimiter=',')
"Ne laisser que 5 décimales après la virgule"
dataUn=numpy.around(fichierUn,decimals=5)
dataDeux=numpy.around(fichierDeux,decimals=5)
"Comparer les valeurs des fichiers une à une avec une tolérance de 0,00001"
result = numpy.allclose(dataUn,dataDeux,rtol=0.00001, atol=0.00001)
print("Le résultat de la comparaison des valeurs des fichiers bottlenecks '%s' et '%s' est '%s'" % (cheminFichierUn,cheminFichierDeux,result))
