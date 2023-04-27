*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Success with upload 3 files
    เข้ามายังหน้า upload files
    เลือก 3 files เพื่อทำการ upload
    ทำการ upload และตรวจสอบสถานะของ file ที่ 1
    ทำการ upload และตรวจสอบสถานะของ file ที่ 2
    ทำการ upload และตรวจสอบสถานะของ file ที่ 3

*** Keywords ***
เลือก 3 files เพื่อทำการ upload
    Choose File   xpath://div[1]/input[2]  ${CURDIR}/data/1.txt
    Choose File   xpath://div[1]/input[2]  ${CURDIR}/data/2.txt
    Choose File   xpath://div[1]/input[2]  ${CURDIR}/data/3.txt

เข้ามายังหน้า upload files
    Open Browser   url=http://nervgh.github.io/pages/angular-file-upload/examples/simple/
    ...    browser=gc
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
