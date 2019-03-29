*** Settings ***
Library  SeleniumLibrary
Resource  ../variables.robot
*** Variables ***

*** Keywords ***
Charger La page
    Go To  ${WEBSITE_URL}

Verifier que la page est bien charge
    Wait Until Page Contains  Choisir Le profile

