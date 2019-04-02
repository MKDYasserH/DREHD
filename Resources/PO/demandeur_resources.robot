*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot
*** Variables ***
${Number}=  ${0}
*** Keywords ***
Charger La page
    Go To  ${WEBSITE_URL}

    sleep  3s

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
    ${Number} =  Set Variable  ${Number + 1}

    Click Element  xpath=//*[@id="projet"]/div/div[1]/div/div[2]/select


    Click Element  xpath=//*[@id="projet"]/div/div[1]/div/div[2]/select/option[2]


    Click Element  xpath=//*[@id="projet"]/div/div[1]/div/div[4]/select


    Click Element  xpath=//*[@id="projet"]/div/div[1]/div/div[4]/select/option[2]


    Clear Element Text  name=date_livraison


    Input Text  name=date_livraison  ${DATE_PROJET}


    Click Element  name=date_fin_souhaitee


    Click Element  xpath=/html/body/div[3]/div[1]/table/tbody/tr[5]/td[5]


    Clear Element Text  name=projet


    Input Text  name=projet  ${INTITULE_PROJET} ${Number}


    Clear Element Text   name=desc_demande


    Input Text   name=desc_demande  ${DESCRIPTION_PROJET}

Renseigner l'implantation

#    Click Element  xpath=/html/body/main/div/form/div/div[1]/div[3]/div/div[1]/div/div[2]/select
#
#    Page Should Contain Element    xpath=/html/body/main/div/form/div/div[1]/div[3]/div/div[1]/div/div[2]/select/option[1]
#
#    Click Element  xpath=/html/body/main/div/form/div/div[1]/div[3]/div/div[1]/div/div[2]/select/option[2]
    Select From List By Value  xpath=/html/body/main/div/form/div/div[1]/div[3]/div/div[1]/div/div[2]/select  1

Renseigner Info Complementaire
    Click Element  xpath=/html/body/main/div/form/div/div[2]/div[1]/div[2]/div/div/div[2]/select


    Click Element  xpath=/html/body/main/div/form/div/div[2]/div[1]/div[2]/div/div/div[2]/select/option[2]


    Click Element  xpath=/html/body/main/div/form/div/div[2]/div[1]/div[2]/div/div/div[4]/select


    Click Element  xpath=/html/body/main/div/form/div/div[2]/div[1]/div[2]/div/div/div[4]/select/option[2]

Premier submit

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Click Button  name=save

    Wait Until Page Contains  L'élément a été créé avec succès

Ajout materiel

    Click Link  xpath=/html/body/main/div/a[2]

    Wait Until Page Contains  Liste de Matériel

    Click Link  xpath=/html/body/main/div/div[5]/div[2]/a

    Wait Until Page Contains  Détails Matériel

Renseigner Info materiel

    Select From List By Value  xpath=//*[@id="categorie"]  Accessoires de Baie

    Wait Until Page Contains  FRANCE TELECOM

    Select From List By Value  xpath=//*[@id="contsructeur"]  FRANCE TELECOM

    Wait Until Page Contains  MECANO

    Select From List By Value  xpath=//*[@id="reference"]  MECANO

    Wait Until Page Contains  Plateau générique 19 pouces

    Select From List By Value  xpath=//*[@id="modele"]  Plateau générique 19 pouces

    Input Text  name=hostname_parent  hostname

    Input Text  name=nbre_alimentation  5

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Click Button  id=bt_save_materiel

Deposer Demande

    Click Link  xpath=/html/body/main/div/a[1]

    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

    Click Link  xpath=/html/body/main/div/form/a[2]

    Wait Until Page Contains  La demande a été déposée avec succes