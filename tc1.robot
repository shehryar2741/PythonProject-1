*** Settings ***
Library     SeleniumLibrary
Library     DateTime


*** Variables ***
${LOGIN_BUTTON_LOC}     class=mdc-button--raised


*** Test Cases ***
LoginTest
    open browser
    ...    https://moodle.lut.fi/login/index.php
    ...    chrome
    ...    options=add_experimental_option("excludeSwitches", ["enable-logging"])
    maximize browser window
    click element    class=eupopup-button
    scroll element into view    class=buttonlut
    click button    class=buttonlut
    input text    id=username    Shehryar.Malik@student.lut.fi
    input text    id=password    4tke@KEiA.8S@qn2333
    Click Element    ${LOGIN_BUTTON_LOC}
    Sleep    2s
    close browser
    Log Current Date For TestCase


*** Keywords ***
Log Current Date For TestCase
    ${date} =    Get Current Date
    Log To Console    \n\n*** Test started at ${date} ***\n
