***Settings***
Resource   ../helpers/CommonIOS.robot
Resource   ../locators/ProductsPageLocator.robot

*** Keywords ***
Switch To WebView
    # Get all available contexts. The contexts will look like 'NATIVE_APP' and 'WEBVIEW_1'
    ${contexts}=    Get Contexts
    Log    Available contexts: ${contexts}
    # Loop through the contexts and switch to the one starting with 'WEBVIEW'
    FOR    ${context}    IN    @{contexts}
        IF    '${context}' == 'NATIVE_APP'
            Continue For Loop
        ELSE
            Switch To Context    ${context}
            Log    Switched to context: ${context}
            BREAK
        END
    END 
    
Verify Header "Products" Appear
    Verify Element 	 ${screenProducts}
    Log    Successfully verified Products page is displayed

Verify Multiple Products Display
    [Documentation]    Verify that multiple products are displayed on the page
    ${product_count}=    Get Matching Xpath Count    ${product_cards}
    Should Be True    ${product_count} > 0
    Log    Found ${product_count} products on the page
    Log    Multiple products are displayed on the page

Verify Products Card Detial
    [Documentation]    Verify that the procduct detials on product card 
    [Arguments]    ${index}
    ${product_image}=    Get Locator With Index    ${product_image}    ${index}
    ${product_name}=     Get Locator With Index    ${product_name}    ${index}
    ${product_price}=    Get Locator With Index    ${product_price}    ${index}
    ${product_desc}=    Get Locator With Index     ${product_desc}    ${index}
    Verify Items In Products        ${product_image}
    Verify Items In Products        ${product_name}
    Verify Items In Products        ${product_price}
    Verify Product Price Format     ${product_price}
    Verify Items In Products        ${product_desc}

Verify Items In Products
    [Documentation]    Verify that product items are displayed on the products page
    [Arguments]    ${Product_Locator}    ${expected_text}=NONE
    Verify Element    ${productItems}
    Log    Product collection is visible on the page
    IF   '${expected_text}' != 'NONE'
        Element Should Contain Text   ${Product_Locator}    ${expected_text}
    END

Verify All Product Card
    [Documentation]    Verify that all product show as expected
    ${product_count}=    Get Matching Xpath Count    ${product_cards}
    Should Be True    ${product_count} > 0
    ${index}=    Set Variable    0
    FOR    ${index}    IN RANGE    ${product_count}
        Verify Products Card Detial    ${index}    
    END

Verify Items In Products Display
    [Documentation]    Verify that product items are displayed on the products page
    [Arguments]    ${Product_Locator}
    Verify Element    ${productItems}
    Log    Product collection is visible on the page

Verify Product Price Format
    [Documentation]    Verify that a product price matches the correct currency format (e.g. $299.99).
    ...                This keyword will:
    ...                - Get text from the given locator
    ...                - Log the price for debugging
    ...                - Verify it matches regex pattern ^\\$\\d{1,3}(,\\d{3})*(\\.\\d{2})?$
    ...                Example: $5, $299.99, $12,345.67
    [Arguments]    ${locator}
    ${price}=    Get Text    ${locator}
    Log To Console    Checking price: ${price}
    Should Match Regexp    ${price}    ^\\$\\d{1,3}(,\\d{3})*(\\.\\d{2})?$

Get Data From Card
    [Documentation]    Get data from item card and return data in dictionary
    [Arguments]    ${index}
    ${product_image}=        Get Locator With Index     ${product_image}        ${index}
    ${product_name}=         Get Locator With Index     ${product_name}         ${index}
    ${product_category}=     Get Locator With Index     ${product_category}     ${index}
    ${product_price}=        Get Locator With Index     ${product_price}        ${index}
    ${product_desc}=         Get Locator With Index     ${product_desc}         ${index}

    ${text_product_name}=            Get Text    ${product_name}
    ${text_product_category}=        Get Text    ${product_category}
    ${text_product_price}=           Get Text    ${product_price}
    ${text_product_desc}=            Get Text    ${product_desc}

    &{item_card}=    Create Dictionary    
    ...    name=${text_product_name}    
    ...    category=${text_product_category}    
    ...    price=${text_product_price}    
    ...    desc=${text_product_desc}
    RETURN    &{item_card}

Get Data From Product Detail
    [Documentation]    Get data from product detial and return data in dictionary
    ${text_deatial_name}=            Get Text    ${detail_name}
    ${text_deatial_category}=        Get Text    ${detail_category}
    ${text_deatial_price}=           Get Text    ${detail_price}
    ${text_deatial_desc}=            Get Text    ${detail_desc}

    &{item_detial}=    Create Dictionary
    ...    name=${text_deatial_name}
    ...    category=${text_deatial_category}
    ...    price=${text_deatial_price}
    ...    desc=${text_deatial_desc}
    
    RETURN    &{item_detial}    

Verify Product Item Details
    [Arguments]    ${index}=0
    [Documentation]    Verify product item details including name and price
    # Get data from card and save it in dictionary variable
    &{item_card}=    Get Data From Card    ${index}

    Log Many    ${item_card}
    ${product_card_locator}=    Get Locator With Index    ${product_card}    ${index}
    Run Keyword And Ignore Error    Click Element    ${product_card_locator}

    &{item_detial}=    Get Data From Product Detail

    # Check product deatial
    Should Be Equal As Strings    ${item_card}[name]        ${item_detial}[name]
    Should Be Equal As Strings    ${item_card}[category]    ${item_detial}[category]
    Should Be Equal As Strings    ${item_card}[price]       ${item_detial}[price]
    Should Be Equal As Strings    ${item_card}[desc]        ${item_detial}[desc]





