*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot
Resource  ../commun.robot

*** Keywords ***
Charger La page de Pilotage
    Go To  ${WEBSITE_Pilote}
    commun.Fermer fenetre
Charger La page d'urbaniste
    Go To  ${WEBSITE_URBANISTE}
    commun.Fermer fenetre
#    Wait Until Page Contains Element  xpath=/html/body/div[2]/div[4]/div[1]/div  50s
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
Verifier que la page est bien charge
    Wait Until Page Contains  Choisir le profil
#    popup
    sleep  2s
    commun.Fermer Fenetre
#effacer filtre
#    Click Element   xpath=//a[contains(.,'Affiner le filtre')]
#    Click Element   xpath=//a[.='Effacer le filtre']
#    popup
    sleep  2s
    commun.Fermer Fenetre

selectionner le projet avec le status Déposée
    [Arguments]  ${INTITULE_PROJET}
    Input Text  xpath=//thead[@class='thead-default']//th[4]/input[1]     ${INTITULE_PROJET}
    Sleep   3s

Clicker sur action
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=//*[@id="t_demandes"]/tbody/tr[1]/td[9]/a

Aller dans Travaux salle
    Sleep  3s
    Click Element   xpath=/html/body/main/div/a[6]

Travaux à mener
    Click Element    xpath=(//label)[4]
    Click Element    xpath=(//label)[5]
    Click Element    xpath=(//label)[6]

Suivi travaux
    Select From List By Value    //select[@name="travaux_cfo"]    ok
    Click Element    xpath=//*[@id="travaux_cfo_date_fin"]
    Click Element    xpath=(//td[@class="day"])[9]
    Select From List By Value    //select[@name="travaux_cfa"]    ok
    Click Element    xpath=//*[@id="travaux_cfa_date_fin"]
    Click Element    xpath=(//td[@class="day"])[6]
    Select From List By Value    //select[@name="travaux_salle"]    ok
    Click Element    xpath=//*[@id="travaux_salle_date_fin"]
    Click Element    xpath=(//td[@class="day"])[8]

Enregistrer travaux
    Execute JavaScript    window.scrollTo(1000, 1000);
    Click Element   xpath=//*[@id="travaux"]/div/input[1]
    Execute JavaScript    window.scrollTo(1000, 1000);
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
