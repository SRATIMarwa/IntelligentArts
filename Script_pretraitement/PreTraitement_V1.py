#!/usr/bin/env python

import cv2
import numpy as np
import os



#chemin où stocker les images traitées
chemin_p_traitees='/home/marwa/Photos_traitees'

#Vérification que le dossier global qui contiendra les images traitées n'existe pas, dans ce cas on le crée
if not os.path.exists(chemin_p_traitees):
	os.makedirs(chemin_p_traitees)

#Chemin où se trouve les dossiers des images
chemin='/home/marwa/Photos/Jeux de données 1'

# pour chaque dossier du chemin spécifié, on suppose ici qu'on garde les dossiers tels qu'ils sont
for dossier in os.listdir(chemin):
	#Rajout du nom dossier au chemin initial
	chemin_dossier=chemin+'/'+dossier
	#Vérification que le fichier trouvé est effectivement un dossier	
	if os.path.isdir(chemin_dossier):		
		chemin_dossier_traite=chemin_p_traitees+'/'+dossier+'_traite'
		#Vérification que le dossier qui contiendra les images traitées n'existe pas, dans ce cas on le crée
		if not os.path.exists(chemin_dossier_traite):
			os.makedirs(chemin_dossier_traite)
		#On parcours tous les fichiers du dossier qui contient les images à traiter
		for fichier in os.listdir(chemin_dossier):
			#séparation du nom de fichier avec l'extention
			nom_fichier,ext_fichier=os.path.splitext(fichier)
			#on ne traite que les fichiers de type image
			if ext_fichier in ('.jpg','.jpeg','.png','.tiff','.gif','.bmp'):
				print(fichier)
				chemin_fichier=chemin_dossier+'/'+fichier
				#Renommage de l'image traitée
				chemin_fichier_traite=chemin_dossier_traite+'/'+nom_fichier+'_traitee'+ext_fichier
				#Vérification que l'image n'est pas déjà traitée
				if not os.path.exists(chemin_fichier_traite):
					#chargement de l'image en niveaux de gris
					img = cv2.imread(chemin_fichier,0)
					#redimmenssionnement de l'image en 250*250
					img=cv2.resize(img,(250,250))
					#enregistrement de l'image
					cv2.imwrite(chemin_fichier_traite,img)
			

	








