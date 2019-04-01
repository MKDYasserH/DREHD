*** Settings ***
Resource  ../Resources/PO/demandeur.robot
Resource  ../Resources/common.robot

Suite Setup  common.Begin Web Test
Suite Teardown  common.End Web Test

*** Test Cases ***
Test 1
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