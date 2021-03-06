*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot

*** Keywords ***
Charger La page d'accueil
    Go To  ${WEBSITE_Accueil}
Verifier que la page est bien charge
    commun.Fermer fenetre
    Wait Until Page Contains  Choisir le profil  50s
#    popup
    sleep  2s
    commun.Fermer fenetre
effacer filtre
    Click Element   xpath=//a[contains(.,'Affiner le filtre')]
    Click Element   xpath=//a[.='Effacer le filtre']
#    popup
    sleep  2s
#    Wait Until Page Contains Element  xpath=/html/body/div[2]/div[4]/div[1]/div  50s
#    Click Element   xpath=/html/body/div[2]/div[4]/div[1]/div
    commun.Fermer fenetre


selectionne le projet avec le status Déposée
    [Arguments]  ${INTITULE_PROJET}
    Input Text  xpath=//thead[@class='thead-default']//th[4]/input[1]    ${INTITULE_PROJET}
    Sleep   3s

Clicker sur action
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=//*[@id="t_demandes"]/tbody/tr[1]/td[9]/a

aller dans accueil
    Click Element   xpath=/html/body/main/div/a[4]

Prise en compte
    Click Element   xpath=//*[@id="prise_en_compte"]

Datacenter retenue
    Select From List By Value   xpath=//select[@name='datacenter_retenu']  1

Info accueil
#Vérification Accueil
    Select From List By Value   xpath=//select[@name='statut_verif_accueil']  ok
    Input Text  name=date_verif_accueil  22/03/2019
#Etude capacitaire Datacenter
    Select From List By Value   xpath=//select[@name='statut_etude_capacitaire']  ok
    Input Text  name=date_etude_capacitaire  26/03/2019
#Responsable
    Select From List By Value   xpath=//select[@name='responsable']  allprofil

Clicker sur Enregistrer
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=/html/body/main/div/form/input[3]

Etape Suivante
    Click Element   xpath=//a[.='Etape suivante']

Charger Page RA
    Go To  ${WEBSITE_RA}

Choisir Pilote
    Execute JavaScript    window.scrollTo(1000, 1000);
    Select From List By Value  xpath=//select[@name='pilote']  vwtk7928

Clicker sur Enregistrer RA
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=//input[@name='save']
