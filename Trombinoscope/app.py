
import tkinter as tk
from tkinter.constants import CENTER, GROOVE, LEFT, NO, YES
from afficher import *


def mailing():
   
    webbrowser.open(f"mailto:{email}")



def forward():
    global indice
    global max
    global label
    global email
    global photo
    


    if indice == max :
        indice = 0
    else : 
        indice = indice + 1

    (nom, prenom, email, image) = tous[indice]
    label = f"{nom} {prenom}"
    photo = afficher_image(f"./images/{image.replace('.png', '.jpg')}")
    canvas.itemconfig(canvas_img, image=photo)
    nomination['text']=label
    addmail['text'] = email

def backward():
    global indice
    global max
    global label
    global email
    global photo

    if indice == 0 : 
        indice = max
    else :
        indice = indice - 1

    (nom, prenom, email, image) = tous[indice]
    label = f"{nom} {prenom}"
    photo = afficher_image(f"./images/{image.replace('.png', '.jpg')}")
    canvas.itemconfig(canvas_img, image=photo)
    nomination['text']=label
    addmail['text'] = email
    
# création fenêtre
root = tk.Tk()

#******************************

# interface de la fenetre
root.title("Trombinoscope")
# taille de la fenêtre
root.geometry("600x600")
# dimension minimum
root.minsize(200, 200)
# dimension maximum
root.maxsize(800, 600)
# pour faire une modif
root.configure(bg="white") 

# afficher logo (format .ico)
root.iconbitmap("images/logo.ico")
# rendre possible ou non le redimensionnement de la fenêtre
root.resizable(width=True, height=True)

#***********************************

# ajout d'un titre
titre = tk.Label(root, text='Ecole Microsoft IA', font=("Helvetica", 20), fg='black')
# afficher titre à la fenêtre 
titre.pack()

#***********************************

# création et ajout du canevas
width = 400
height = 300
canvas = tk.Canvas(root, width = width, height=height, bg="white")
canvas.pack(side=tk.TOP, padx=5, pady=5)

#***********************************
# récupération et ajout de l'image
image = ImageTk.PhotoImage(file="images/logo.ico")
canvas_img = canvas.create_image(width/2, height/2, image=image)

#**********************************
nomination = tk.Label(root, text= "", font=("Helvetica", 20), fg='black' )
nomination.pack()



# création et ajout des boutons précédent et suivant
boutons = tk.PanedWindow(root, orient=tk.HORIZONTAL)
precedent= tk.Button(root, text="précédent", command=backward)
suivant= tk.Button(root, text="suivant", command=forward)
boutons.add(precedent)
boutons.add(suivant)
boutons.pack(padx=10, pady=10)

#*********************************************




addmail = tk.Button(root, text= "", font=("Helvetica", 20), fg='blue', command=mailing)
addmail.pack()
#**********************************

# boucle d'affichage
root.mainloop()




