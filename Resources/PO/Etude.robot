*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot
Resource  Etude_ressources.robot
*** Variables ***
*** Keywords ***
Acceder Au Site Avec Compte Urbaniste
    Etude_ressources.Charger La Page
#    Etude_ressources.effacer filtre

Rechercher Demande
    [Arguments]  ${INTITULE_PROJET}
    Etude_ressources.Rechercher Demande en etude    ${INTITULE_PROJET}

Renseigner Info Dif
    Etude_ressources.Info DIF

Remplir La Fiche Etude
    Etude_ressources.Etude

Verifier Statut Projet
    [Arguments]  ${INTITULE_PROJET}
    Etude_ressources.Verifier Fin Etude  ${INTITULE_PROJET}