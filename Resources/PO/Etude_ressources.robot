*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot

*** Variables ***

*** Keywords ***
Charger La Page
    Go To  ${WEBSITE_URBANISTE}
    sleep  2s
    Wait Until Page Contains Element  xpath=/html/body/div[2]/div[4]/div[1]/div  50s
    Click Element  xpath=/html/body/div[2]/div[4]/div[1]/div
    Wait Until Page Contains  Liste des demandes

effacer filtre
    commun.Fermer fenetre
    Wait Until Page Contains Element  xpath=//a[contains(.,'Affiner le filtre')]  50s
    commun.Fermer fenetre
    Click Link   xpath=//a[contains(.,'Affiner le filtre')]
    commun.Fermer fenetre
    Wait Until Page Contains Element  xpath=//a[.='Effacer le filtre']  50s
    commun.Fermer fenetre
    Click Link   xpath=//a[.='Effacer le filtre']
    commun.Fermer fenetre

Rechercher Demande en etude
    [Arguments]  ${INTITULE_PROJET}
    commun.Fermer fenetre
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    commun.Fermer fenetre
    Clear Element Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[4]/input
    commun.Fermer fenetre
    Input Text  xpath=//thead[@class='thead-default']//th[4]/input[1]  ${INTITULE_PROJET}
    Clear Element Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[8]/input
    Input Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[8]/input  Etudes
    Execute JavaScript  window.scrollTo(1000, 1000)
    commun.Fermer fenetre
    Click Link  xpath=//*[@id="t_demandes"]/tbody/tr/td[9]/a
    Wait Until Page Contains  Edition de la demande

Info DIF

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Select From List By Value  xpath=/html/body/main/div/form/div/div[1]/div[5]/div[1]/div/div/div[1]/div/div[2]/select  htajri6
    Select From List By Value  xpath=/html/body/main/div/form/div/div[1]/div[6]/div[1]/div/div/div[2]/select  htajri3
    Click Element  xpath=/html/body/main/div/form/input
    Click Link  xpath=/html/body/main/div/a[5]

Etude
    Click Element  xpath=//input[@value='etudes_emplacement']
    Wait Until Page Contains  A lancer
    Select From List By Value  xpath=//select[@id='etudes_emplacement']  ok
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element  xpath=//*[@id="etudes_emplacement_date_fin"]
    Click Element  xpath=/html/body/div[3]/div[1]/table/tbody/tr[2]/td[1]
    Click Element  xpath=//*[@id="date_fin_trav_infr_prev"]
    Click Element  xpath=/html/body/div[3]/div[1]/table/tbody/tr[3]/td[5]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element  xpath=//input[@name='submit']
    Wait Until Page Contains  L'élément a été créé avec succès
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains  Etape suivante
    Click Element  id=etape_suivante
    Wait Until Page Contains  Liste des demandes

Verifier Fin Etude
    [Arguments]  ${INTITULE_PROJET}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Clear Element Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[4]/input
    Input Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[4]/input  ${INTITULE_PROJET}
    Clear Element Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[8]/input
    Input Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[8]/input  Réalisation




