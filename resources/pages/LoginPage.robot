***Settings***
Resource   ../helpers/CommonIOS.robot
Resource   ../locators/LoginPageLocator.robot
Resource   ../locators/ProductsPageLocator.robot

*** Keywords ***
Verify Login Page
    Verify Element    ${app_logo}
    Verify Element    ${input_login_username}
    Verify Element    ${input_password}
    Verify Element    ${button_login}

Input Username
    [Arguments]  ${text}
    Input Text to Element  	 ${input_login_username}  ${text}

Input Password
    [Arguments]  ${text}
    Input Text to Element  	 ${input_password}  ${text}

Click button Login
    Click Element            ${button_login}

Verify Error Appear
    [Arguments]  ${login_err_header}    ${login_err_text}
    Verify Element Text      ${popup_login_error_header}  ${login_err_header}
    Verify Element Text      ${popup_login_error_text}  ${login_err_text} 

Verify Error Popup Disappear
    Verify Element Not Available    ${popup_login_error}
    Verify Element Not Available    ${popup_login_error_header}
    Verify Element Not Available    ${popup_login_error_text}

Login App
    Verify Login Page
    Input Username        testuser
    Input Password        password123
    Click button Login
    Wait Until Page Contains Element    ${screenProducts}
    