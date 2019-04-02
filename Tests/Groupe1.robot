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
    demandeur.Creation d'une demande    ${number}
    demandeur.Enregistrer Les Informations
    demandeur.Ajouter Nouveau Materiel
    demandeur.Soumettre Sa demande

Déposée Prise En Compte
    [Tags]  2
    Déposée.Prendre en compte la demande
    Déposée.Accueil DIF
    Déposée.Valider demande

Etude
    [Tags]  3
    urbaniste.Acceder Au Site Avec Compte Urbaniste
    urbaniste.Rechercher Demande
    urbaniste.Renseigner Info Dif
    urbaniste.Remplir La Fiche Etude
    urbaniste.Verifier Statut Projet

Réalisation
    [Tags]  4
    Réalisation.Prendre en compte la demande
    Réalisation.Urbanisation-réalisation
    Réalisation.IHM pilotage
    Réalisation.Recette
    Réalisation.Cloturer






