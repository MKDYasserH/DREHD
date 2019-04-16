*** Settings ***
Resource  ../Resources/PO/demandeur.robot
Resource  ../Resources/PO/urbaniste.robot
Resource  ../Resources/PO/Déposée.robot
Resource  ../Resources/PO/Réalisation.robot
Resource  ../Resources/common.robot

Suite Setup  common.Begin Web Test
Suite Teardown  common.End Web Test
*** Variables ***
*** Test Cases ***
Demandeur/ Saisie de la demande En Création
    [Tags]  1
    demandeur.Acceder Au Site
    demandeur.Choisir Profil Demandeur
    demandeur.Creation d'une demande    5
    demandeur.Enregistrer Les Informations
    demandeur.Ajouter Nouveau Materiel
    demandeur.Soumettre Sa demande

Déposée Prise En Compte
    [Tags]  2
    Déposée.Prendre en compte la demande
    Déposée.Accueil DIF
    Déposée.Valider demande

#
Réalisation
    [Tags]  4
    Réalisation.Prendre en compte la demande avec profil Pilote
    Réalisation.Livraison Stockage

RECETTE FERMEE
     [Tags]  5
     Réalisation.Cloturer
