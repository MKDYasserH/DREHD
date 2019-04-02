*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot

*** Keywords ***
Charger La page de Pilotage
    Go To  ${WEBSITE_Pilote}

Verifier que la page est bien charge
    Wait Until Page Contains  Choisir Le profile
    sleep   10s
#    popup
    Click Element   xpath=/html/body/div[2]/div[4]/div[1]/div

selectionner le projet avec le status Déposée
    Input Text  xpath=//*[@id="t_demandes"]/thead/tr[2]/th[4]/input     ${INTITULE_PROJET}
    Sleep   3s

Clicker sur action
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=//*[@id="t_demandes"]/tbody/tr[1]/td[9]/a

Aller dans Travaux salle
    Click Element   xpath=/html/body/main/div/a[6]

Travaux à mener
    Click Element    xpath=(//label)[4]
    Click Element    xpath=(//label)[5]
    Click Element    xpath=(//label)[6]

Suivi travaux
    Select From List By Value    //select[@name="travaux_cfo"]    ok
    Click Element    xpath=//*[@id="travaux_cfo_date_fin"]
    Click Element    xpath=(//td[@class="day"])[2]
    Select From List By Value    //select[@name="travaux_cfa"]    ok
    Click Element    xpath=//*[@id="travaux_cfa_date_fin"]
    Click Element    xpath=(//td[@class="day"])[6]
    Select From List By Value    //select[@name="travaux_salle"]    ok
    Click Element    xpath=//*[@id="travaux_salle_date_fin"]
    Click Element    xpath=(//td[@class="day"])[8]

Enregistrer travaux
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=//*[@id="travaux"]/div/input[1]

Aller dans Pilotage
    Click Element   xpath=/html/body/main/div/a[7]

    Execute JavaScript    window.scrollTo(1000, 1000);

Livraison Réception
    Select From List By Value    //select[@name="statut_livr_recption"]    ok
    Click Element    xpath=/html/body/main/div/form/div[3]/div[1]/div/div/div[1]/div/input
    Click Element    xpath=/html/body/div[3]/div[1]/table/tbody/tr[3]/td[4]

Autres SWAN
    Select From List By Value    //select[@name="statut_autre_swan"]    ok
    Click Element   xpath=/html/body/main/div/form/div[3]/div[2]/div/div/div[1]/div/input[1]
    Click Element    xpath=/html/body/div[3]/div[1]/table/tbody/tr[4]/td[4]

Enregistrer pilotage
    Click Element   xpath=/html/body/main/div/form/input[2]

Rackage
    Select From List By Value    //select[@name="statut_rackage"]    ok
    Click Element   xpath=/html/body/main/div/form/div[2]/div[2]/div/div/div[1]/div/input[1]
    Click Element    xpath=/html/body/div[3]/div[1]/table/tbody/tr[2]/td[3]

Jarretièrage
    Select From List By Value    //select[@name="statut_jarretierage"]    ok
    Click Element   xpath=/html/body/main/div/form/div[2]/div[3]/div/div/div[1]/div/input[1]
    Click Element    xpath=/html/body/div[3]/div[1]/table/tbody/tr[4]/td[3]

Enregistrer
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=/html/body/main/div/form/input[2]


Recette En cour
    Execute JavaScript    window.scrollTo(1000, 1000);
    Select From List By Value   //select[@name="statut_recette"]     en_cours
    Input Text  name=date_fin_prev_recette  02/04/2019

Recette OK
    Select From List By Value   //select[@name="statut_recette"]    ok
    Input Text  name=date_fin_prev_recette  02/04/2019

Cloturer
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=/html/body/main/div/form/a[2]
