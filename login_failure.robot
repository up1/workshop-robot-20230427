*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
User ว่าง หรือ ไม่ได้กรอก
    ไปยังหน้า login
    ทำการ login ด้วย user="${EMPTY}" และ password="1234567"
    ไม่สามารถ login เข้าระบบได้

Password ว่าง หรือ ไม่ได้กรอก
    ไปยังหน้า login
    ทำการ login ด้วย user="somkiat" และ password="${EMPTY}"
    ไม่สามารถ login เข้าระบบได้
User ผิด
    ไปยังหน้า login
    ทำการ login ด้วย user="somkiat1" และ password="1234567"
    ไม่สามารถ login เข้าระบบได้

Password ผิด
    ไปยังหน้า login
    ทำการ login ด้วย user="somkiat" และ password="45678"
    ไม่สามารถ login เข้าระบบได้

*** Keywords ***
ไม่สามารถ login เข้าระบบได้
    Wait Until Element Contains    xpath:/html/body/div/h4    Login failure    

ทำการ login ด้วย user="${user}" และ password="${password}"
    Input Text    name=name    ${user}
    Input Text    name=password    ${password}
    Click Element    xpath://form/button
    
ไปยังหน้า login
    Open Browser   http://167.71.200.223:3000/login   browser=chrome
    Maximize Browser Window  
    