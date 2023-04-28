*** Settings ***
Library   SeleniumLibrary
Suite Setup   ไปยังหน้า login    

*** Test Cases ***
Case login failure
    [Template]  Flow login failure
    somkiat1        1234567
    somkiat         45678
    ${EMPTY}        1234567
    somkiat         ${EMPTY}

*** Keywords ***
Flow login failure
    [Arguments]  ${user}   ${password}
    ทำการ login ด้วย user="${user}" และ password="${password}"
    ไม่สามารถ login เข้าระบบได้

ไม่สามารถ login เข้าระบบได้
    Wait Until Element Contains    xpath:/html/body/div/h4    Login failure    

ทำการ login ด้วย user="${user}" และ password="${password}"
    Input Text    name=name    ${user}
    Input Text    name=password    ${password}
    Click Element    xpath://form/button
    
ไปยังหน้า login
    Open Browser   http://167.71.200.223:3000/login   browser=chrome
    Maximize Browser Window  
    