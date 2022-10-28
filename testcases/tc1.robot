*** Settings ***
Library     SeleniumLibrary
Library     DateTime


*** Variables ***
${LOGIN_BUTTON_LOC}     xpath://body/main[1]/div[1]/div[2]/div[1]/div[2]/form[1]/input[4]


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
    input text    id=password    ***************
    click element    ${LOGIN_BUTTON_LOC}
    close browser
    Log Current Date For TestCase


*** Keywords ***
Log Current Date For TestCase
    ${date} =    Get Current Date
    Log To Console    \n\n*** Test started at ${date} ***\n
