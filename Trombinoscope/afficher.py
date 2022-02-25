import tkinter as tk
from bdd import BDD

from tkinter.constants import CENTER, GROOVE, LEFT, NO, YES
from PIL import Image, ImageTk
import mysql.connector as mysql
import unidecode
import webbrowser

# Connexion à la base de donnée.
bdd = BDD()

# Récupération de l'id, nom, prénom.
user_info = bdd.dbSelectNomPrenom()

#********************************


indice = 0
max = len(user_info)
tous = user_info
label = None
tete = None
photo = None

def afficher_image(image) :
    i = Image.open(image)
    photo = ImageTk.PhotoImage(i.resize((400, 300)))
    return photo


    

def afficher(elements):
    global tous
    global max
    global label
    global email
    global photo

    tous = elements
    max = len(tous) - 1

def formater_nom(nom, prenom):
    return(nom + "_" + prenom)

def formater_image(image) :
    return(".\\images" + image + ".jpg")

def formater_email(email):
    return(".\\Trombinoscope" + email + ".txt") 




    




# recipients = f"{email}"
def lister_bro():
       
        bdd = mysql.connect(user='root', password='root', host='localhost', port="8081", database='trombinoscope')
        cursor = bdd.cursor()

        promo = []

        query = "SELECT nom, prenom, photo FROM personnes"
        cursor.execute(query)
        
        for enregistrement in cursor :
            bro = (formater_image(enregistrement[0], enregistrement[1]))
            promo.append(bro)

        cursor.close()
        bdd.close()
    
    

#***********************************        


adresses = []
with open("adresses.txt", "r") as file:
    for row in file:
        # Enlever le retour à la ligne.
        row = row.replace('\n', '')

        # Isoler nom et prénom
        adresses.append(row)

user_with_email = {}

# On parcourt chaque éléments de notre base de données
for user_bdd in user_info:
    nom_bdd = user_bdd[0].lower().replace(' ', '-')
    prenom_bdd = user_bdd[1].lower().replace(' ', '-')

    # Enlever les accents & caractères spéciaux
    nom_bdd = unidecode.unidecode(nom_bdd)
    prenom_bdd = unidecode.unidecode(prenom_bdd)

    for adresse in adresses:
        prenom_adresse, nom_adresse = adresse.split('@')[0].split('.')

        if nom_bdd in nom_adresse and prenom_bdd in prenom_adresse:
            user_with_email[user_bdd[0]] = adresse
    # break

# Mise a jour de la base de donnée.
for key in user_with_email:
    bdd.dbUpdateUserEmail(key, user_with_email[key])
    # print(key, user_with_email[key])


