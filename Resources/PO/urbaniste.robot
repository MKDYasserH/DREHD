*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot
Resource  urbaniste_resources.robot
*** Variables ***
*** Keywords ***
Acceder Au Site Avec Compte Urbaniste
    urbaniste_resources.Charger La Page

Rechercher Demande
    urbaniste_resources.Rechercher Demande en etude

Renseigner Info Dif
    urbaniste_resources.Info DIF

Remplir La Fiche Etude
    urbaniste_resources.Etude

Verifier Statut Projet
    urbaniste_resources.Verifier Fin Etude