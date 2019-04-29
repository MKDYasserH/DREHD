*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot
Resource  Etude_ressources.robot
*** Variables ***
*** Keywords ***
Acceder Au Site Avec Compte Urbaniste
    Etude_ressources.Charger La Page

Rechercher Demande
    [Arguments]  ${dateTime}
    Etude_ressources.Rechercher Demande en etude    ${dateTime}

Renseigner Info Dif
    Etude_ressources.Info DIF

Remplir La Fiche Etude
    Etude_ressources.Etude

Verifier Statut Projet
    Etude_ressources.Verifier Fin Etude