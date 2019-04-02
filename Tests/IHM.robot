*** Settings ***
Resource  ../Resources/PO/demandeur.robot
Resource  ../Resources/PO/urbaniste.robot
Resource  ../Resources/common.robot

Suite Setup  common.Begin Web Test
Suite Teardown  common.End Web Test

*** Test Cases ***
Test 1
    [Tags]  1
    demandeur.Acceder Au Site

    demandeur.Choisir Profil Demandeur

    demandeur.Creation d'une demande

    demandeur.Enregistrer Les Informations

    demandeur.Ajouter Nouveau Materiel

    demandeur.Soumettre Sa demande


Test 2
    [Tags]  3
    urbaniste.Acceder Au Site Avec Compte Urbaniste

    urbaniste.Rechercher Demande

    urbaniste.Renseigner Info Dif

    urbaniste.Remplir La Fiche Etude

    urbaniste.Verifier Statut Projet

