#L'objectif de ce script python est d'effectuer un prétraitement des images avant de les utiliser dans le modèle inception v3

#Ce script n'est fonctionnel que dans les os unix ubuntu ayant Opencv installé

#!/usr/bin/env python

import cv2
import numpy as np
import os
import math



#chemin où stocker les images traitées
chemin_p_traitees='/home/ubuntu/Images_traitees_normalisees'

#Vérification que le dossier global qui contiendra les images traitées n'existe pas, dans ce cas on le crée
if not os.path.exists(chemin_p_traitees):
	os.makedirs(chemin_p_traitees)

#Chemin où se trouve les dossiers des images
chemin='/home/ubuntu/Images_C2RMF'

# pour chaque dossier du chemin spécifié, on suppose ici qu'on garde les dossiers tels qu'ils sont
for dossier in os.listdir(chemin):
	#Rajout du nom dossier au chemin initial
	chemin_dossier=chemin+'/'+dossier
	#Vérification que le fichier trouvé est effectivement un dossier	
	if os.path.isdir(chemin_dossier):		
		chemin_dossier_traite=chemin_p_traitees+'/'+dossier
		#Vérification que le dossier qui contiendra les images traitées n'existe pas, dans ce cas on le crée
		if not os.path.exists(chemin_dossier_traite):
			os.makedirs(chemin_dossier_traite)
		#On parcours tous les fichiers du dossier qui contient les images à traiter
		for fichier in os.listdir(chemin_dossier):
			#séparation du nom de fichier avec l'extention
			nom_fichier,ext_fichier=os.path.splitext(fichier)
			#on ne traite que les fichiers de type image
			if ext_fichier in ('.jpg','.png','.tiff','.gif','.bmp'):
				print(fichier)
				chemin_fichier=chemin_dossier+'/'+fichier
				#Renommage de l'image traitée
				chemin_fichier_traite=chemin_dossier_traite+'/'+dossier+'_'+nom_fichier
				#Vérification que l'image n'est pas déjà traitée
				if not os.path.exists(chemin_fichier_traite):				
					#chargement de l'image en niveaux de gris
					img_GRAY = cv2.imread(chemin_fichier,0)
					rows,cols = img_GRAY.shape
					#on parcours les colonnes de l'image avec un pas de cols/5
					for j in range(0,cols-math.floor(cols/5)+cols%5+1,math.floor(cols/10)):
						#on parcours les lignes de l'image avec un pas de rows/5
						for i in range(0,rows-math.floor(rows/5)+cols%5+1,math.floor(rows/10)):
							img_crop_1=img_GRAY[i:i+math.ceil(rows/5),j:j+math.ceil(cols/5)]
							chemin_img_crop_1=chemin_dossier_traite+'/'+dossier+'_'+nom_fichier+'_'+str(i)+'_'+str(j)+ext_fichier
							
							cv2.imwrite(chemin_img_crop_1,cv2.resize(img_crop_1,(299,299)))
					#enregistrement de l'image
					cv2.imwrite(chemin_fichier_traite+"_GRAY"+ext_fichier,cv2.resize(img_GRAY,(299,299)))











