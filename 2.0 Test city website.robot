*** Settings ***
Documentation

Library             SeleniumLibrary
Resource            ../Resources/variables_file.robot
Resource            ../Resources/keywords_file.robot

Suite Teardown      Close All Browsers

*** Test Cases ***

Search the correct city
  [Documentation]                               This test case enters the correct name of city
  [Tags]                                         a-testing
  Open Browser                                   ${URL}  ${BROWSER}  options=add_argument("window-size=1920x1080");add_argument("--no-sandbox");add_argument("--disable-notifications");add_argument("disable-infobars");add_experimental_option("excludeSwitches", ["enable-logging"])
  Give Page Time To Load                         5
  Maximize Browser Window
  Accept cookies
  Enters the city name in the input field        Helsinki
  Click search button
  Sleep                                          3
  Click first option of available city
  Page contains valid city data                  Helsinki
  Sleep                                          5
  Reload Page
  Give Page Time To Load                         10

Search the incorrect city
  [Documentation]                                 This test case enters the in-correct name of city
  [Tags]                                          aasma-testing
  Enters the city name in the input field         Helsinki123
  Click search button
  Error message is displayed
  Sleep                                           5