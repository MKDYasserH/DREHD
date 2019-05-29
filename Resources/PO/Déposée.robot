*** Settings ***
Resource  ../variables.robot
Resource  Déposée_ressource.robot
*** Variables ***

*** Keywords ***

Prendre en compte la demande
    [Arguments]  ${INTITULE_PROJET}
    Déposée_ressource.Charger La page d'accueil
    Déposée_ressource.Verifier que la page est bien charge
    Déposée_ressource.selectionne le projet avec le status Déposée  ${INTITULE_PROJET}
    Déposée_ressource.clicker sur action

Accueil DIF
    Déposée_ressource.aller dans accueil
    Déposée_ressource.Prise en compte
    Déposée_ressource.Datacenter retenue
    Déposée_ressource.Info accueil

Valider demande
    Déposée_ressource.Clicker sur Enregistrer
    Déposée_ressource.Etape Suivante
