*** Settings ***
Library  SeleniumLibrary
Resource  variables.robot
*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    maximize browser window

End Web Test
    Close Browser

Fermer fenetre
    ${isvisible} =  Run Keyword And Return Status    Element Should Be Visible   xpath:/html/body/div[2]/div[4]/div[1]/div
    Run Keyword If    ${isvisible}    Clicker sur fermer

Clicker sur fermer
    Wait Until Page Contains Element  xpath=/html/body/div[2]/div[4]/div[1]/div  50s
    Click Element   xpath=/html/body/div[2]/div[4]/div[1]/div
