*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
Success
    ไปยังหน้า login
    ทำการ login ด้วย user="somkiat" และ password="1234567"
    สามารถ login เข้าระบบได้

*** Keywords ***
สามารถ login เข้าระบบได้
    Wait Until Element Contains    xpath:/html/body/div/h4    Login success

ทำการ login ด้วย user="${user}" และ password="${password}"
    Input Text    name=name    ${user}
    Input Text    name=password    ${password}
    Click Element    xpath://form/button
    
ไปยังหน้า login
    Open Browser   http://167.71.200.223:3000/login   browser=chrome
    Maximize Browser Window  
    