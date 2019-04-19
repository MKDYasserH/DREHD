*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot

*** Keywords ***
Charger La page de Pilotage
    Go To  ${WEBSITE_Pilote}

Charger La page d'urbaniste
    Go To  ${WEBSITE_URBANISTE}
#effacer filtre
    Click Element   xpath=//a[contains(.,'Affiner le filtre')]
    Click Element   xpath=//a[.='Effacer le filtre']

Verifier que la page est bien charge
    Wait Until Page Contains  Choisir Le profile
    sleep  2s
#    popup
    Wait Until Page Contains Element  xpath=/html/body/div[2]/div[4]/div[1]/div  50s
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
    Wait Until Page Contains Element   xpath=//a[.='Pilotage']  10s
    Click Element   xpath=//a[.='Pilotage']

Livraison Réception
    Execute JavaScript    window.scrollTo(1000, 1000);
    #ok
    Select From List By Value    //select[@name="statut_livr_recption"]    ok
    #date
    Input Text   xpath://input[@name='date_fin_livr_reception']  12/04/2019

Autres SWAN
    Execute JavaScript    window.scrollTo(1000, 1000);

    Select From List By Value    //select[@name="statut_autre_swan"]    ok

    Input Text  xpath://input[@name='date_fin_prev_autre_swan']  13/04/2019

Enregistrer pilotage
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=//input[@name='save']

Rackage
    Select From List By Value    //select[@name="statut_rackage"]    ok

    Input Text  xpath://input[@name='date_fin_prev_rackage']    13/04/2019

Jarretièrage
    Select From List By Value    //select[@name="statut_jarretierage"]    ok

    Input Text  xpath://input[@name='date_fin_prev_jarretierage']   13/04/2019

Recette En cour
    Execute JavaScript    window.scrollTo(1000, 1000);
    Select From List By Value   //select[@name="statut_recette"]     en_cours
    Input Text  name=date_fin_prev_recette  02/04/2019

Recette OK
    Execute JavaScript    window.scrollTo(1000, 1000);

    Select From List By Value   //select[@name="statut_recette"]    ok
    Input Text  xpath://input[@name='date_fin_prev_recette']  02/04/2019

Cloturer
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=/html/body/main/div/form/a[2]
