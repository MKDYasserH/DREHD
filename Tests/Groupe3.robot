*** Settings ***
Resource  ../Resources/PO/Création.robot
Resource  ../Resources/PO/Etude.robot
Resource  ../Resources/PO/Déposée.robot
Resource  ../Resources/PO/Réalisation.robot
Resource  ../Resources/commun.robot
Library           DateTime

Suite Setup  Run Keywords   commun.Begin Web Test   Get DateTime
Suite Teardown  commun.End Web Test

*** Keywords ***
Get DateTime
    ${dateTime}=   Get Current Date
    Set Suite Variable	${dateTime}

*** Test Cases ***
Demandeur/ Saisie de la demande En Création
    [Tags]  1
    Création.Acceder Au Site
    Création.Creation d'une demande    Sortie de matériel   ${dateTime}
    Création.Enregistrer Les Informations
    Création.Ajouter Materiel Existant
#    Création.Detail Cablage
    Création.Soumettre Sa demande

Déposée Prise En Compte
    [Tags]  2
    Déposée.Prendre en compte la demande    ${dateTime}
    Déposée.Accueil DIF
    Déposée.Valider demande

Réalisation
    [Tags]  4
#    Prendre en compte la demande avec profil Urbaniste
#    Réalisation.Urbanisation-réalisation
    Réalisation.Prendre en compte la demande avec profil Pilote  ${dateTime}
#    Réalisation.Livraison Stockage
    Réalisation.Rackage/Câblage/Autres SWANs

RECETTE FERMEE
    [Tags]  5
#    Réalisation.Recette
    Réalisation.Cloturer
