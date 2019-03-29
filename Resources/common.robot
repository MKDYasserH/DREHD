*** Settings ***
Library  SeleniumLibrary
Resource  variables.robot

*** Variables ***

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    maximize browser window

End Web Test
    Close Browser