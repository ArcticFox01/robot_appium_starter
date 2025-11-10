***Settings***
Resource          ../config/ios_config.robot
Resource          ../resources/locators/LoginPageLocator.robot
Resource          ../resources/pages/LoginPage.robot
Resource          ../resources/pages/ProductsPage.robot

Test Tags    login

Suite Setup       Suite Setup Config
Test Setup        Test Setup Config
Test Teardown     Test Teardown Config
Suite Teardown    Suite Teardown Config

***Test Cases***
As an iOS user, I should be able to see Error when input incorrect Username and Password
    [Documentation]  User should be able to see error message appear when input incorrect Username and Password
    LoginPage.Verify Login Page
    LoginPage.Perform Login    myname    pass
    LoginPage.Verify Error Appear   Login Error    Invalid credentials
    Click Element                   ${button_ok}
    LoginPage.Verify Error Popup Disappear

As an iOS user, I should be redirected to "Products" Page when input correct Username and Password
    [Documentation]  User should be able see product page after loging in success
    LoginPage.Verify Login Page
    LoginPage.Perform Login    testuser    password123
    ProductsPage.Verify Header "Products" Appear
