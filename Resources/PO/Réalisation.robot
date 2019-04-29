*** Settings ***
Resource  ../variables.robot
Resource  Réalisation_ressource.robot

*** Keywords ***
Prendre en compte la demande avec profil Pilote
    [Arguments]  ${dateTime}
    Réalisation_ressource.Charger La page de Pilotage
#    Réalisation_ressource.effacer filtre
    Réalisation_ressource.Verifier que la page est bien charge
    Réalisation_ressource.selectionner le projet avec le status Déposée  ${dateTime}
    Réalisation_ressource.Clicker sur action
    Réalisation_ressource.Aller dans Pilotage

Prendre en compte la demande avec profil Urbaniste
    [Arguments]  ${dateTime}
    Réalisation_ressource.Charger La page d'urbaniste
#    Réalisation_ressource.effacer filtre
    Réalisation_ressource.Verifier que la page est bien charge
    Réalisation_ressource.selectionner le projet avec le status Déposée  ${dateTime}
    Réalisation_ressource.Clicker sur action
    Réalisation_ressource.Aller dans Travaux salle


Urbanisation-réalisation
    Réalisation_ressource.Travaux à mener
    Réalisation_ressource.Suivi travaux
    Réalisation_ressource.Enregistrer travaux

Livraison Stockage
    Réalisation_ressource.Livraison Réception
    Réalisation_ressource.Enregistrer pilotage

Rackage/Câblage/Autres SWANs
    Réalisation_ressource.Rackage
    Réalisation_ressource.Jarretièrage
    Réalisation_ressource.Autres SWAN
    Réalisation_ressource.Enregistrer pilotage

Recette
    Réalisation_ressource.Recette En cour
    Réalisation_ressource.Enregistrer pilotage
    Réalisation_ressource.Recette OK
    Réalisation_ressource.Enregistrer pilotage

Cloturer
    Réalisation_ressource.Cloturer