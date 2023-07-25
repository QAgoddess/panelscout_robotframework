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
${SIGN OUT BUTTON}      xpath=//*[text()='Sign out']
${ADD A PLAYER}     xpath=//*[text()='Add player']
${SUBMIT BUTTON}        xpath=//*[3]/button[1]/span[1]
${NAMEINPUT}        xpath=//input[@name='name']
${SURNAMEINPUT}     xpath=//input[@name='surname']
${AGEINPUT}     xpath=//input[@name='age']
${MAINPOSITION}     xpath=//input[@name='mainPosition']


*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert dashboard
    [Teardown]      Close browser

Log out of the system
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert dashboard
    Click On The Sign Out Button
    [Teardown]      Close browser

Click add a player
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert dashboard
    Click On The Add A Player
    Assert add a player
    [Teardown]      Close browser

Adding a player
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Assert dashboard
    Click On The Add A Player
    Assert add a player
    Type in name
    Type in surname
    Type in age
    Type in main position
    Click On The Submit
    [Teardown]      Close browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}      user07@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}       Test-1234
Click on the Sign in button
    Click Element       ${SIGN IN BUTTON}
Assert dashboard
    Wait Until Element Is Visible       ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot  alert.png
Click on the Sign Out Button
    Click Element       ${SIGN OUT BUTTON}
Click On The Add A Player
    Click Element       ${ADD A PLAYER}
Assert add a player
    Wait Until Element Is Visible       ${SUBMIT BUTTON}
    Title Should Be     Add player
Type in name
    Input Text      ${NAMEINPUT}      Krzysztof
Type in surname
    Input Text      ${SURNAMEINPUT}      Kończyna
Type in age
    Input Text      ${AGEINPUT}      10.10.1999
Type in main position
    Input Text      ${MAINPOSITION}      bramkarz
Click On The Submit
    Click Element       ${SUBMIT BUTTON}