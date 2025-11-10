***Settings***
Resource          ../config/ios_config.robot
Resource          ../resources/pages/ProductsPage.robot
Resource          ../resources/pages/LoginPage.robot

Suite Setup       Suite Setup Config
Test Setup        Test Setup Config
Test Teardown     Test Teardown Config
Suite Teardown    Suite Teardown Config

***Test Cases***

As an iOS user, I should be able to see multiple products on the Products page
    [Documentation]    Verify that multiple products are displayed on the page
    [Tags]    regression
    LoginPage.Perform Login
    ProductsPage.Verify Multiple Products Display

As an iOS user, I should be able to see multiple products with details
    [Documentation]    Verify that multiple products are displayed on the page
    [Tags]    regression
    LoginPage.Perform Login
    ProductsPage.Verify All Product Card

As an iOS user, I should be able to see product detial when selecting product item
    [Documentation]    Verify that prduct detail is shown when selecting product item
    [Tags]    regression
    LoginPage.Perform Login
    ProductsPage.Verify Product Item Details

