*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://app.futureskill.co/my-library
${BROWSER}  Chrome
${USERNAME}  padcenter@prachakij.com
${PASSWORD}  Padcenter11

*** Test Cases ***
ทดสอบเข้าสู่ระบบ FutureSkill
    เปิดเบราว์เซอร์และไปยังหน้าล็อกอิน
    กรอกชื่อผู้ใช้และรหัสผ่าน
    คลิกปุ่มเข้าสู่ระบบ
    ตรวจสอบว่าล็อกอินสำเร็จ
    บันทึกภาพหน้าจอ
    ปิดเบราว์เซอร์

*** Keywords ***
เปิดเบราว์เซอร์และไปยังหน้าล็อกอิน
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name:email    timeout=10s

กรอกชื่อผู้ใช้และรหัสผ่าน
    Input Text    name:email    ${USERNAME}
    Input Text    name:password    ${PASSWORD}

คลิกปุ่มเข้าสู่ระบบ
    Click Button    css:button[type='submit']

ตรวจสอบว่าล็อกอินสำเร็จ
    Wait Until Page Contains    My Library    timeout=10s

บันทึกภาพหน้าจอ
    Capture Page Screenshot    login-success.png

ปิดเบราว์เซอร์
    Close Browser
