*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot
Resource  demandeur_resources.robot
*** Variables ***
*** Keywords ***
Acceder Au Site
    demandeur_resources.Charger La page
    demandeur_resources.Verifier que la page est bien charge

Choisir Profil Demandeur
    demandeur_resources.Choisir le profile
    demandeur_resources.Vérifier que le profile demandeur est selectionne

Creation d'une demande
    demandeur_resources.Creer nouvelle demande
    demandeur_resources.Renseigner la description du projet
    demandeur_resources.Renseigner l'implantation
    demandeur_resources.Renseigner Info Complementaire

Enregistrer Les Informations
    demandeur_resources.Premier submit

Ajouter Nouveau Materiel
    demandeur_resources.Ajout materiel
    demandeur_resources.Renseigner Info materiel

Soumettre Sa demande
    demandeur_resources.Deposer Demande