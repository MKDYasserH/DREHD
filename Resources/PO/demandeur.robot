*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot
*** Variables ***

*** Keywords ***
Charger La page
    Go To  ${WEBSITE_URL}

Verifier que la page est bien charge
    Wait Until Page Contains  Choisir Le profile

Choisir le profile
    Click Element  xpath=//*[@id="choisirProfil"]
    Click Element  xpath=//*[@id="choisirProfil"]/option[1]

Vérifier que le profile demandeur est selectionne
    Wait Until Page Contains Element  xpath=/html/body/header/div/ul/li[1]/ul/li[2]/a

Creer nouvelle demande
    Mouse over    xpath=/html/body/header/div/ul/li[1]

    Page Should Contain Element    xpath=//*[@id="list_of_test_types"]    5s

    Click Element   ${User_Menu Link}

    Mouse Down    xpath=//li[contains(.,'${STR}')]

    Click Element  xpath=//li[contains(.,'${STR}')]

    Wait Until Page Contains  En création

Renseigner la description du projet
    Click Element  xpath=//*[@id="projet"]/div/div[1]/div/div[2]/select

    Click Element  xpath=//*[@id="projet"]/div/div[1]/div/div[2]/select/option[2]

    Click Element  xpath=//*[@id="projet"]/div/div[1]/div/div[4]/select

    Click Element  xpath=//*[@id="projet"]/div/div[1]/div/div[4]/select/option[2]

    Clear Element Text  name=date_livraison

    Input Text  name=date_livraison  29/03/2019

    Clear Element Text  name=date_fin_souhaitee

    Input Text  name=date_fin_souhaitee  ${DATE_PROJET}

    Clear Element Text  name=projet

    Input Text  name=projet  ${INTITULE_PROJET}

    Clear Element Text   name=desc_demande

    Input Text   name=desc_demande  ${DESCRIPTION_PROJET}

