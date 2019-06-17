*** Settings ***
Resource  ../Resources/PO/Création.robot
Resource  ../Resources/PO/Etude.robot
Resource  ../Resources/PO/Déposée.robot
Resource  ../Resources/PO/Réalisation.robot
Resource  ../Resources/commun.robot
Library           DateTime

Suite Setup  Run Keywords   commun.Begin Web Test  Get DateTime
Suite Teardown  commun.End Web Test

*** Keywords ***
Get DateTime
    ${INTITULE_PROJET}=   Get Current Date
    Set Suite Variable	${INTITULE_PROJET}

*** Test Cases ***
Demandeur/ Saisie de la demande En Création
    [Tags]  1
    Création.Acceder Au Site
    Création.Creation d'une demande    Nouveau matériel  ${INTITULE_PROJET}
    Création.Enregistrer Les Informations
    Création.Ajouter Nouveau Materiel
    Création.Detail Cablage
    Création.Soumettre Sa demande

Déposée Prise En Compte
    [Tags]  2
    Déposée.Prendre en compte la demande    intitule_projet
    Déposée.Accueil DIF
    Déposée.Connecter RA  ${INTITULE_PROJET}
    Déposée.Prendre en compte la demande    ${INTITULE_PROJET}
    Déposée.Accueil DIF 2
    Déposée.Valider demande

Etude
    [Tags]  3
    Etude.Acceder Au Site Avec Compte Urbaniste
    Etude.Rechercher Demande    ${INTITULE_PROJET}
    Etude.Renseigner Info Dif
    Etude.Remplir La Fiche Etude
    Etude.Verifier Statut Projet    ${INTITULE_PROJET}

Réalisation
    [Tags]  4
    Prendre en compte la demande avec profil Urbaniste  ${INTITULE_PROJET}
    Réalisation.Urbanisation-réalisation
    Réalisation.Prendre en compte la demande avec profil Pilote  ${INTITULE_PROJET}
    Réalisation.Livraison Stockage
    Réalisation.Rackage/Câblage/Autres SWANs

RECETTE FERMEE
    [Tags]  5
    Réalisation.Recette
    Réalisation.Cloturer
