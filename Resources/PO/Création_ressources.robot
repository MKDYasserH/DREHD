*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot
*** Variables ***
*** Keywords ***
Charger La page
    Go To  ${WEBSITE_URL}
    sleep  2s
    Wait Until Page Contains Element  xpath=/html/body/div[2]/div[4]/div[1]/div  50s
    Click Element  xpath=/html/body/div[2]/div[4]/div[1]/div

Verifier que la page est bien charge
    Wait Until Page Contains  Choisir Le profile

Choisir le profile
    Click Element  xpath=//*[@id="choisirProfil"]
    Click Element  xpath=//*[@id="choisirProfil"]/option[1]

Vérifier que le profile demandeur est selectionne
    Wait Until Page Contains Element  xpath=/html/body/header/div/ul/li[1]/ul/li[2]/a

Creer nouvelle demande
    Mouse over    xpath=/html/body/header/div/ul/li[1]/a
    Page Should Contain Element    xpath=/html/body/header/div/ul/li[1]/ul    5s
    Click Link   xpath=/html/body/header/div/ul/li[1]/ul/li[2]/a
    Wait Until Page Contains  Edition de la demande

Renseigner la description du projet
    [Arguments]  ${number}  ${INTITULE_PROJET}
    #Entité hébergée*
    Click Element  xpath=//*[@id="projet"]/div/div[1]/div/div[2]/select
    Click Element  xpath=//*[@id="projet"]/div/div[1]/div/div[2]/select/option[2]
    #Objet demande*
    Select From List By Label  xpath=//select[@name='objet_demande']  ${number}
    #Date livraison Prévue*
    Clear Element Text  name=date_livraison
    Input Text  name=date_livraison  ${DATE_PROJET}
    #Date fin souhaitée*
    Input Text  name=date_fin_souhaitee  26/04/2019
    #Projet*
    Clear Element Text  name=projet
    Input Text  name=projet  ${INTITULE_PROJET}
    #Descriptif de la demande*
    Clear Element Text   name=desc_demande
    Input Text   name=desc_demande  ${DESCRIPTION_PROJET}

Renseigner l'implantation
    #Datacenter*
    Select From List By Label  xpath=//select[@name='datacenter']  NORMANDIE OREE

Renseigner Info Complementaire
    #Infrastructure*
    Select From List By Label  xpath=//select[@name='infra']    GW HORS PROD 1
    #Responsable Patrimonial
    Select From List By Label  xpath=//select[@name='responsable_patrimonial']    /Orange/Fictif/Externe/

Premier submit
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Button  name=save
    Wait Until Page Contains  L'élément a été créé avec succès

Ajout materiel
    #Clicker sur label Matériel
    Click Link  xpath=//a[.='Matériel']
    Wait Until Page Contains  Liste de Matériel
    #Clicker sur ajouter
    Click Link  xpath=//a[.='Ajouter']
    Wait Until Page Contains  Détails Matériel

Renseigner Info materiel
    #Cat.*
    Select From List By Value  xpath=//*[@id="categorie"]  Accessoires de Baie
    Wait Until Page Contains  FRANCE TELECOM    50s
    #Constr.*
    Select From List By Value  xpath=//*[@id="contsructeur"]  FRANCE TELECOM
    Wait Until Page Contains  Plateau générique 19 pouces   50s
    Select From List By Value  xpath=//*[@id="modele"]  Plateau générique 19 pouces
    Wait Until Page Contains  MECANO    50s
    Select From List By Value  xpath=//*[@id="reference"]  MECANO
    Input Text  name=hostname_parent  hostname
    Input Text  name=nbre_alimentation  5
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Button  id=bt_save_materiel

Renseigner Info materiel existant
    #Chercher par code 26E
    Input Text  xpath=//div[@id='sm_recherche_unitaire']//div[3]/input[1]   0000554518
    Click Element   xpath=//img[@id='sm_imnums_equipement_exist']
    #Type de mouvement
    Select From List By Label  xpath=//select[@id='sm_type_movement']   J-CAT Sortie de salle
    Input Text  xpath=//textarea[@id='sm_commentaire']  commentaire
    #Clicker sur enregistrer
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains Element    xpath=//button[@id='sm_save_materiel']  15s
    Wait Until Keyword Succeeds  50s    5s  Click Element    xpath=//button[@id='sm_save_materiel']
Renseigner Info cablage
    Wait Until Page Contains  Liste de Matériel
    Click Link  xpath=//*[@id="table_icons"]/tbody/tr/td[3]/a
    Wait Until Page Contains  Edition du cablage
    Click Button  id=addLigne
    Wait Until Page Contains  Traiter une ligne de cablage
    Wait Until Page Contains  Nombre
    sleep  1s
    Input Text    //input[@name="nombre"]    5
    sleep  1s
    Input Text    //input[@name="destination"]    destination
    Click Element    //button[@id="enregistrer-ligne"]
    Wait Until Page Contains  LAN
    sleep  2s
    Click Link  xpath=//*[@id="send"]

Deposer Demande
    Click Link  xpath=/html/body/main/div/a[1]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Link  xpath=/html/body/main/div/form/a[2]
    Wait Until Page Contains  La demande a été déposée avec succes