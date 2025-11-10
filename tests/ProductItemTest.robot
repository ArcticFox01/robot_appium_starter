***Settings***
Resource          ../config/ios_config.robot
Resource          ../resources/pages/ProductsPage.robot

Suite Setup       Suite Setup Config
Test Setup        Test Setup Login
Test Teardown     Test Teardown Config
Suite Teardown    Suite Teardown Config

***Test Cases***

As an iOS user, I should be able to see multiple products on the Products page
    [Documentation]    Verify that multiple products are displayed on the page
    [Tags]    smoke    regression
    # ProductsPage.Verify Header "Products" Appear
    ProductsPage.Verify Multiple Products Display

As an iOS user, I should be able to see multiple products with details
    [Documentation]    Verify that multiple products are displayed on the page
    [Tags]    regression
    # ProductsPage.Verify Header "Products" Appear
    ProductsPage.Verify All Product Card

As an iOS user, I should be able to see product detial when selecting product item
    [Documentation]    Verify that prduct detail is shown when selecting product item
    [Tags]    regression
    # ProductsPage.Verify Header "Products" Appear
    ProductsPage.Verify Product Item Details

