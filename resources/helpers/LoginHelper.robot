*** Settings ***
Resource    ../locators/LoginPageLocator.robot
Resource    ../locators/ProductsPageLocator.robot
Resource    CommonIOS.robot
Resource    ../pages/LoginPage.robot

*** Keywords ***
Login App
    Verify Login Page
    Input Username        testuser
    Input Password        password123
    Click button Login
    Wait Until Page Contains Element    ${screenProducts}