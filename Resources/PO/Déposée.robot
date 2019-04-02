*** Settings ***
Resource  ../variables.robot
Resource  Deposee_ressource.robot
*** Variables ***

*** Keywords ***

Prendre en compte la demande
    Deposee_ressource.Charger La page d'accueil
    Deposee_ressource.Verifier que la page est bien charge
    Deposee_ressource.selectionne le projet avec le status Déposée
    Deposee_ressource.clicker sur action

Accueil DIF
    Deposee_ressource.aller dans accueil

    Deposee_ressource.Prise en compte

    Deposee_ressource.Datacenter retenue

    Deposee_ressource.Objet Demande Nouveu materiel

    Deposee_ressource.Info accueil

Valider demande

    Deposee_ressource.Clicker sur Enregistrer
    Deposee_ressource.Etape Suivante
