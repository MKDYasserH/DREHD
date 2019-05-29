*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot
Resource  Création_ressources.robot
*** Variables ***
*** Keywords ***
Acceder Au Site
    Création_ressources.Charger La page
    Création_ressources.Verifier que la page est bien charge

Choisir Profil Demandeur
    Création_ressources.Choisir le profile
    Création_ressources.Vérifier que le profile demandeur est selectionne

Creation d'une demande
    [Arguments]  ${numb}    ${INTITULE_PROJET}
    Création_ressources.Creer nouvelle demande
    Création_ressources.Renseigner la description du projet  ${numb}    ${INTITULE_PROJET}
    Création_ressources.Renseigner l'implantation
    Création_ressources.Renseigner Info Complementaire

Enregistrer Les Informations
    Création_ressources.Premier submit

Ajouter Nouveau Materiel
    Création_ressources.Ajout materiel
    Création_ressources.Renseigner Info materiel

Ajouter Materiel Existant
    Création_ressources.Ajout materiel
    Création_ressources.Renseigner Info materiel existant

Detail Cablage
    Création_ressources.Renseigner Info cablage

Soumettre Sa demande
    Création_ressources.Deposer Demande