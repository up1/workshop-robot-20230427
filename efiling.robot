*** Settings ***
Library   SeleniumLibrary

*** Test Cases ***
ทดสอบ flow การยื่นภาษี 2023
    เข้าไปยังหน้าแรกของการยื่นภาษี
    ทำการอ่านข้อมูลข่าวสาร
    ทำการเข้าหน้ายื่นแบบ online

*** Keywords ***
ทำการเข้าหน้ายื่นแบบ online
    Click Element    xpath://*[@id="top"]/div/div[2]/button[1]/a
ทำการอ่านข้อมูลข่าวสาร
    Wait Until Element Is Visible    id:announceModal
    Element Should Contain   id:exampleModalLabel   แจ้งข่าวสาร
    # Click link ของรายละเอียด
    Click Element    xpath://*[@id="announceModal"]/div/div/div[2]/div/div[2]/span/a
    Switch Window	MAIN
    # กดปิด popup แจ้งข่าวสาร
    Click Element    xpath://*[@id="announceModal"]/div/div/div[1]/button/span

เข้าไปยังหน้าแรกของการยื่นภาษี
    Open Browser   url=https://efiling.rd.go.th/rd-cms/
    ...    browser=gc
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window