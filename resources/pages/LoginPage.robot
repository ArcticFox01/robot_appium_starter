***Settings***
Resource   ../helpers/CommonIOS.robot
Resource   ../locators/LoginPageLocator.robot
Resource   ../locators/ProductsPageLocator.robot

*** Keywords ***
Verify Login Page
    [Documentation]    Verify login Locators in login page
    Verify Element    ${app_logo}
    Verify Element    ${input_login_username}
    Verify Element    ${input_password}
    Verify Element    ${button_login}

Perform Login
    [Documentation]    Verify Login page and perform login
    [Arguments]  ${user}=${username}    ${pass}=${password}
    Verify Login Page
    Input Text to Element  	 ${input_login_username}  ${user}
    Input Text to Element    ${input_password}        ${pass}
    Click Element            ${button_login}
    Sleep    5s

Verify Error Appear
    [Documentation]    Verify the error popup when login fail
    [Arguments]  ${login_err_header}    ${login_err_text}
    Verify Element Text      ${popup_login_error_header}  ${login_err_header}
    Verify Element Text      ${popup_login_error_text}  ${login_err_text} 

Verify Error Popup Disappear
    [Documentation]    Verify that the error popup is hide after clicking OK button
    Verify Element Not Available    ${popup_login_error}
    Verify Element Not Available    ${popup_login_error_header}
    Verify Element Not Available    ${popup_login_error_text}
    