*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot

*** Keywords ***
Charger La page d'accueil
    Go To  ${WEBSITE_Accueil}

Verifier que la page est bien charge
    Wait Until Page Contains  Choisir Le profile
#    popup
    sleep  2s
    Wait Until Page Contains Element  xpath=/html/body/div[2]/div[4]/div[1]/div  50s
    Click Element   xpath=/html/body/div[2]/div[4]/div[1]/div
#effacer filtre
    Click Element   xpath=//a[contains(.,'Affiner le filtre')]
    Click Element   xpath=//a[.='Effacer le filtre']
#    popup
    sleep  2s
    Wait Until Page Contains Element  xpath=/html/body/div[2]/div[4]/div[1]/div  50s
    Click Element   xpath=/html/body/div[2]/div[4]/div[1]/div

selectionne le projet avec le status Déposée
    Input Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[4]/input     ${INTITULE_PROJET}
    Sleep   3s

Clicker sur action
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=//*[@id="t_demandes"]/tbody/tr[1]/td[9]/a

aller dans accueil
    Click Element   xpath=/html/body/main/div/a[4]

Prise en compte
    Click Element   xpath=//*[@id="prise_en_compte"]

Datacenter retenue
    Select From List By Value   xpath=/html/body/main/div/form/div[1]/div[2]/div/div/div[2]/select  1

Objet Demande Nouveu materiel
    Select From List By Value   xpath=/html/body/main/div/form/div[1]/div[2]/div/div/div[4]/select  1

Info accueil
    Select From List By Value   xpath=/html/body/main/div/form/div[1]/div[3]/div/div/div[1]/div/div/div[1]/select  ok
    Input Text  name=date_verif_accueil  22/03/2019
    Select From List By Value   xpath=/html/body/main/div/form/div[1]/div[3]/div/div/div[2]/div/div/div[1]/select  ok
    Input Text  name=date_etude_capacitaire  26/03/2019
    Select From List By Value   xpath=/html/body/main/div/form/div[1]/div[3]/div/div/div[2]/div/div/div[3]/select  allprofil

Clicker sur Enregistrer
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=/html/body/main/div/form/input[3]

Etape Suivante
    Click Element   xpath=/html/body/main/div/form/div[1]/div[3]/div/div/div[3]/div/div[2]/a[2]


