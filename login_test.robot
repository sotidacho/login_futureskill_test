*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}         https://app.futureskill.co/my-library
${BROWSER}     Chrome
${USERNAME}    padcenter@prachakij.com
${PASSWORD}    Padcenter11

*** Test Cases ***
ทดสอบเข้าสู่ระบบ FutureSkill
    เปิดบราวเซอร์และไปยังหน้าล็อกอิน
    กรอกอีเมลและรหัสผ่าน
    คลิกปุ่มเข้าสู่ระบบ
    ปิด Popup หลังล็อกอิน
    ตรวจสอบว่าล็อกอินสำเร็จ
    บันทึกภาพหน้าจอ
    ปิดบราวเซอร์

*** Keywords ***
เปิดบราวเซอร์และไปยังหน้าล็อกอิน
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name:email    timeout=10s

กรอกอีเมลและรหัสผ่าน
    Input Text    name:email    ${USERNAME}
    Input Text    name:password    ${PASSWORD}

คลิกปุ่มเข้าสู่ระบบ
    Click Button    css=button[type='submit']

ปิด Popup หลังล็อกอิน
    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath=//button[contains(text(), 'ให้ภายหลัง')]    timeout=5s
    Run Keyword And Ignore Error    Click Button    xpath=//button[contains(text(), 'ให้ภายหลัง')]

ตรวจสอบว่าล็อกอินสำเร็จ
    Wait Until Page Contains    สวัสดี บริษัท ศูนย์พัฒนาผู้นำ จำกัด    timeout=10s

บันทึกภาพหน้าจอ
    Capture Page Screenshot    login-success.png

ปิดบราวเซอร์
    Close Browser
