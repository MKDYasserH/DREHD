*** Settings ***
Resource  ../variables.robot
Resource  Réalisation_ressource.robot

*** test cases ***

Recette
    Réalisation_ressource.Recette En cour
    Réalisation_ressource.Enregistrer
    Réalisation_ressource.Recette OK
    Réalisation_ressource.Enregistrer

Cloturer
    Réalisation_ressource.Cloturer

