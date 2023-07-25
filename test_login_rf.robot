*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGN IN BUTTON}       xpath=//*[text()='Sign in']
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${REMIND PASSWORD}      xpath=//*[text()='Remind password']
${ENGLISH}      xpath=//div[3]/ul/li[2]
${POLSKI}       xpath=//div[3]/ul/li[1]
${PAGELOGO}       xpath=//*[@title='Logo Scouts Panel']

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click On The Submit Button
    Assert dashboard
    [Teardown]      Close browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}      user07@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}       Test-1234
Click on the Submit button
    Click Element       ${SIGN IN BUTTON}
Assert dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot  alert.png