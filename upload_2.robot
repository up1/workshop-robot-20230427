# How to run
# $robot -v BASE_URL:http://www.google.com upload_2.robot
#
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}      http://nervgh.github.io/pages/angular-file-upload/examples/simple/

*** Test Cases ***
Success with upload 3 files
    เข้ามายังหน้า upload files
    เลือก 3 files เพื่อทำการ upload
    ทำการ upload และตรวจสอบสถานะของ file ที่ 1
    ทำการ upload และตรวจสอบสถานะของ file ที่ 2
    ทำการ upload และตรวจสอบสถานะของ file ที่ 3

*** Keywords ***
Check upload progress
    [Arguments]  ${row_no}  ${expected_upload_progress}
    Click Element   xpath://table/tbody/tr[${row_no}]/td[5]/button[1]
    Wait Until Element Is Visible    xpath://div[@style="width: ${expected_upload_progress}%;"]

ทำการ upload และตรวจสอบสถานะของ file ที่ 1
    Check upload progress  1  33

ทำการ upload และตรวจสอบสถานะของ file ที่ 2
    Check upload progress  2  67

ทำการ upload และตรวจสอบสถานะของ file ที่ 3
    Check upload progress  3  100

เลือก 3 files เพื่อทำการ upload
    Choose File   xpath://div[1]/input[2]  ${CURDIR}/data/1.txt
    Choose File   xpath://div[1]/input[2]  ${CURDIR}/data/2.txt
    Choose File   xpath://div[1]/input[2]  ${CURDIR}/data/3.txt

เข้ามายังหน้า upload files
    Open Browser   url=${BASE_URL} 
    ...    browser=gc
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
