*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot

*** Variables ***

*** Keywords ***
Charger La Page
    Go To  http://dv0bywsc05.rouen.francetelecom.fr/debug.php/api/auth/login?cuid=wazd2D2

    sleep  3s

    Click Element  xpath=/html/body/div[2]/div[4]/div[1]/div

    Wait Until Page Contains  Liste des demandes

Rechercher Demande en etude
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Clear Element Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[4]/input

    Input Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[4]/input  ProjetTestT 1

    Clear Element Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[8]/input

    Input Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[8]/input  Etudes

    Execute JavaScript  window.scrollTo(1000, 1000)

    Click Link  xpath=//*[@id="t_demandes"]/tbody/tr/td[9]/a

Info DIF
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Select From List By Value  xpath=/html/body/main/div/form/div/div[1]/div[5]/div[1]/div/div/div[1]/div/div[2]/select  hayat6 tajri6

    Select From List By Value  xpath=/html/body/main/div/form/div/div[1]/div[6]/div[1]/div/div/div[2]/select  hayat3 tajri3

    Click Element  xpath=/html/body/main/div/form/input

    Click Link  xpath=/html/body/main/div/a[5]

Etude
    Click Element  xpath=//*[@id="etudes_mener"]/div/label[1]/input

    Wait Until Page Contains  A lancer

    Select From List By Value  xpath=//*[@id="etudes_emplacement"]  OK

    Click Element  xpath=//*[@id="etudes_emplacement_date_fin"]

    Click Element  xpath=/html/body/div[3]/div[1]/table/tbody/tr[2]/td[1]

    Click Element  xpath=//*[@id="date_fin_trav_infr_prev"]

    Click Element  xpath=/html/body/div[3]/div[1]/table/tbody/tr[3]/td[5]

    Click Element  xpath=//*[@id="etude"]/div/input[1]

    Wait Until Page Contains  L'élément a été créé avec succès

    Wait Until Page Contains  Etape suivante

    Click Element  id=etape_suivante

    Wait Until Page Contains  Liste des demandes

Verifier Fin Etude
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Clear Element Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[4]/input

    Input Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[4]/input  ProjetTestT 1

    Clear Element Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[8]/input

    Input Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[8]/input  Réalisation




