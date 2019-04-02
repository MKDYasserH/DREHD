*** Settings ***
Resource  ../variables.robot
Resource  Réalisation_ressource.robot

*** Keywords ***
Prendre en compte la demande
    Réalisation_ressource.Charger La page de Pilotage
    Réalisation_ressource.Verifier que la page est bien charge
    Réalisation_ressource.selectionner le projet avec le status Déposée
    Réalisation_ressource.Clicker sur action

Urbanisation-réalisation
    Réalisation_ressource.Aller dans Travaux salle
    Réalisation_ressource.Travaux à mener
    Réalisation_ressource.Suivi travaux
   #Réalisation_ressource.Enregistrer travaux

IHM pilotage
    Réalisation_ressource.Aller dans Pilotage
    Réalisation_ressource.Livraison Réception
    Réalisation_ressource.Autres SWAN
    Réalisation_ressource.Enregistrer pilotage
    Réalisation_ressource.Rackage
    Réalisation_ressource.Jarretièrage
    Réalisation_ressource.Enregistrer

