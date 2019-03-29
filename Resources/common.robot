*** Settings ***
Library  SeleniumLibrary
Resource  variables.robot


*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    maximize browser window

End Web Test
    Close Browser