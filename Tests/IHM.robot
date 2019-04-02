*** Settings ***
Resource  ../Resources/PO/déposée.robot
Resource  ../Resources/PO/demandeur.robot
Resource  ../Resources/PO/Réalisation.robot
Resource  ../Resources/common.robot

Suite Setup  common.Begin Web Test
Suite Teardown  common.End Web Test

*** Test Cases ***
Saisie de la demande En Création
    [Tags]    1
    demandeur.Charger La page
    demandeur.Verifier que la page est bien charge
    demandeur.Choisir le profile
    demandeur.Vérifier que le profile demandeur est selectionne
    demandeur.Creer nouvelle demande
    demandeur.Renseigner la description du projet
    demandeur.Renseigner l'implantation
    demandeur.Renseigner Info Complementaire
    demandeur.Premier submit
    demandeur.Ajout materiel
    demandeur.Renseigner Info materiel
    demandeur.Deposer Demande

Déposée Prise En Compte
    [Tags]    2
    déposée.Charger La page
    déposée.Prendre en compte la demande
    déposée.Accueil DIF
    déposée.Valider demande

Réalisation
    [Tags]    4
    Réalisation.Prendre en compte la demande
    Réalisation.Urbanisation-réalisation
    Réalisation.IHM pilotage
