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
${SIGN OUT BUTTON}      xpath=//ul[2]/div[2]/div[2]/span
${ADD A PLAYER}     xpath=//*[text()='Add player']
${SUBMIT BUTTON}        xpath=//*[3]/button[1]/span[1]
${NAMEINPUT}        xpath=//input[@name='name']
${SURNAMEINPUT}     xpath=//input[@name='surname']
${AGEINPUT}     xpath=//input[@name='age']
${MAINPOSITION}     xpath=//input[@name='mainPosition']
${EVENTS COUNT}     xpath=//div[4]/div/div[1]
${ADD A PLAYER TITLE}       xpath=//header/div/h6
${MAIN PAGE BUTTON}     xpath=//ul[1]/div[1]/div[1]
${LAST CREATED PLAYER}      xpath=//div[3]/div/div/a[1]/button/span[1]
${SHORTCUTS}        xpath=//div[2]/div/div/h2


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
    Click On The Sign Out Button
    [Teardown]      Close browser

Click add a player
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Click On The Add A Player
    Assert add a player
    [Teardown]      Close browser

Adding a player
    Open login page
    Type in email
    Type in password
    Click On The Sign In Button
    Click On The Add A Player
    Assert add a player
    Type in name
    Type in surname
    Type in age
    Type in main position
    Sleep       8s
    Click On The Submit
    Sleep       3s
    Click On The Main Page
    Sleep       8s
    Check A Player
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
    Wait Until Element Is Visible       ${EVENTS COUNT}
    Title Should Be     Scouts panel
    Capture Page Screenshot  alert.png
Click on the Sign Out Button
    Wait Until Element Is Visible       ${SIGN OUT BUTTON}
    Click Element       ${SIGN OUT BUTTON}
Click On The Add A Player
    Wait Until Element Is Visible       ${ADD A PLAYER}
    Click Element       ${ADD A PLAYER}
Assert add a player
    Wait Until Element Is Visible       ${MAINPOSITION}
    Title Should Be     Add player
Type in name
    Wait Until Element Is Visible       ${NAMEINPUT}        2
    Input Text      ${NAMEINPUT}      Krzysztof
Type in surname
    Input Text      ${SURNAMEINPUT}      Kończyna
Type in age
    Input Text      ${AGEINPUT}      10.10.1999
Type in main position
    Input Text      ${MAINPOSITION}      bramkarz
Click On The Submit
    Wait Until Element Is Visible       ${SUBMIT BUTTON}        5
    Click Element       ${SUBMIT BUTTON}
Click On The Main Page
    Wait Until Element Is Visible       ${MAIN PAGE BUTTON}        10
    Click Element       ${MAIN PAGE BUTTON}
Check A Player
    Wait Until Element Is Visible       ${SHORTCUTS}        15
    Element Text Should Be      ${LAST CREATED PLAYER}      KRZYSZTOF KOŃCZYNA