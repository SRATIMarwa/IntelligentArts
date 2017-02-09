#L'objectif de ce script python est d'effectuer un prétraitement des images avant de les utiliser dans le modèle inception v3
#Ce prétraitement consiste à:
## Redimenssionner toutes les images en une taille de 256*256 afin d'homogénéiser l'ensemble
## Transformer toutes les images en niveau de gris
## Découper les images en petits morceaux de 16*16 avec une translation de 8

#Ce script n'est fonctionnel que dans les os unix ubuntu ayant Opencv installé

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
				chemin_fichier_traite=chemin_dossier_traite+'/'+dossier+'_'+fichier
				#Vérification que l'image n'est pas déjà traitée
				if not os.path.exists(chemin_fichier_traite):
					#chargement de l'image en niveaux de gris
					img = cv2.imread(chemin_fichier,0)
					#redimmenssionnement de l'image en 256*256
					img=cv2.resize(img,(256,256))
					#enregistrement de l'image
					cv2.imwrite(chemin_fichier_traite,img)
					#on parcours les colonnes de l'image avec un pas de 8
					for j in range(0,241,8):
						#on parcours les lignes de l'image avec un pas de 8
						for i in range(0,241,8):
							#on découpe le morceau dont les coordonnées du point de départ sont :(i,j) height=16 et width=16
							img_crop=img[j:j+16,i:i+16]
							chemin_img_crop=chemin_dossier_traite+'/'+dossier+'_'+nom_fichier+'_'+str(i)+'_'+str(j)+ext_fichier
							cv2.imwrite(chemin_img_crop,img_crop)
						








