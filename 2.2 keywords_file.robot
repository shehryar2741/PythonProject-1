*** Settings ***
Library             SeleniumLibrary
Resource            ../Resources/variables_file.robot

*** Keywords ***
Open the browser
    Open Browser                           ${URL}  ${BROWSER}

Give Page Time To Load
    [Documentation]                         Generic keyword that sleeps the browser for 1 second
    [Arguments]                             ${how_many_seconds}
    Sleep                                   ${how_many_seconds}

Allow location pop-up
    Handle Alert                            action=Allow    timeout=None

Accept cookies
    Wait Until Page Contains Element       class=stick-footer-panel__link
    Click Element                          class=stick-footer-panel__link

Enters the city name in the input field
    [Documentation]                        Enters the city name
    [Arguments]                            ${CITY_NAME}=Helsinki
    Wait Until Element Is Visible          xpath=//input[@placeholder="Search city"]
    Input Text                             xpath=//input[@placeholder="Search city"]      ${CITY_NAME}

Click search button
    Click Element                          xpath=//button[contains(text(),"Search")]

Error message is displayed
    Page Should Contain                    Not found. To make search more precise put the city's name

Click first option of available city
    Wait Until Element Is Visible          xpath=//*[@class='search-dropdown-menu'][1]
    Click Element                          xpath=//*[@class='search-dropdown-menu'][1]

Page contains valid city data
    [Documentation]                        Enters the city name
    [Arguments]                            ${CITY_NAME}
    Wait Until Element Is Visible           xpath=//h2[contains(text(), ${CITY_NAME})]





