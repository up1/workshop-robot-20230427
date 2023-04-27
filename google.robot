*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
ค้นหาข้อมูลสำเร็จด้วยคำว่า robot
    ผู้ใช้งานเข้าไปยังหน้าแรกของระบบเพื่อค้นหา
    ผู้ใช้งานทำการค้นหาด้วยคำว่า robot
    จะต้องเจอผลการค้นหาที่ถูกต้อง

*** Keywords ***
ผู้ใช้งานทำการค้นหาด้วยคำว่า robot
    Input Text   name:q   robot
    Press Keys   name:q   RETURN

ผู้ใช้งานเข้าไปยังหน้าแรกของระบบเพื่อค้นหา
    Open Browser   url=https://www.google.com/   
    ...    browser=gc
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Element Is Visible    name:q
    Wait Until Element Is Visible    xpath://div[2]/div/img
    

