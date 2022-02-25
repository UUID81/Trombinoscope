import mysql.connector as mysql




class BDD:

    # Constructeur.
    def __init__(self):

        self.__host = "localhost"
        self.__database = "trombinoscope"
        self.__user = "root"
        self.__password = "root"
        self.__port = "8081"
        self.curseur = None

    def connectBDD(self):
        # Connexion à la base de données.
        self.__connexion = mysql.connect( host = self.__host, 
                                        database = self.__database, 
                                        user = self.__user, 
                                        password = self.__password,
                                        port = self.__port,
                                        ) # Pour prévenir de 'caching_sha2_password' 


        # Cursor.
        self.cursor = self.__connexion.cursor()

    # Close connection.
    def close(self):
        self.cursor.close()
    
    def dbSelectNomPrenom(self):
        self.connectBDD()

        # SELECT id_personne, nom, prenom FROM personne;
        requete = "SELECT nom, prenom, email, photo FROM personnes;"

        self.cursor.execute(requete)
        result = self.cursor.fetchall()
        

        self.close()
        return result
    
    def dbUpdateUserEmail(self, id, email):
        self.connectBDD()

        # SELECT id_personne, nom, prenom FROM personne;
        requete = "UPDATE personnes SET email = %s WHERE id_personne = %s"
        param = (email, id, )
        self.cursor.execute(requete, param)

        self.__connexion.commit()        

        self.close()
    

    