*** Settings ***
Library   SeleniumLibrary
Test Template    Flow login failure
Suite Setup  ไปยังหน้า login

*** Test Cases ***
#--------------------------------------------------------
#     Test case name       |     User       | Password   |
#--------------------------------------------------------
User ผิด                          somkiat1        1234567
Password ผิด                      somkiat         45678
User ว่าง หรือ ไม่ได้กรอก            ${EMPTY}        1234567
Password ว่าง หรือ ไม่ได้กรอก        somkiat          ${EMPTY}

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
    