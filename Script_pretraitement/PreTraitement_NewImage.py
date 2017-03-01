#L'objectif de ce script python est d'effectuer un prétraitement des nouvelles images avant de les utiliser dans le modèle inception v3
#Ce prétraitement consiste à:
## Transformer toutes les images en niveau de gris

#Ce script n'est fonctionnel que dans les os unix ubuntu ayant Opencv installé

#!/usr/bin/env python

import cv2
import numpy as np
import os

#chemin où stocker la nouvelle image traitée
chemin_p_traitees='/home/ubuntu/Nouvelles_images'
if not os.path.exists(chemin_p_traitees):
	os.makedirs(chemin_p_traitees)
#demander à l'utilisateur de renseigner le chemin de la nouvelle image
chemin = input("Veuillez renseigner le chemin de l'image: ")
#extraire le fichier du chemin
fichier = os.path.basename(chemin)
nom_fichier,ext_fichier=os.path.splitext(chemin)
#on ne traite que les fichiers de type image
if ext_fichier in ('.jpg','.jpeg','.png','.tiff','.gif','.bmp'):
	#Renommage de l'image traitée
	chemin_fichier_traite=chemin_p_traitees+'/'+fichier
	#Vérification que l'image n'est pas déjà traitée
	if not os.path.exists(chemin_fichier_traite):
		#chargement de l'image en niveaux de gris
		img = cv2.imread(chemin,0)
		#enregistrement de l'image
		cv2.imwrite(chemin_fichier_traite,img)
		print("Le chemin vers l'image traitée est le suivant : "+ chemin_fichier_traite)









