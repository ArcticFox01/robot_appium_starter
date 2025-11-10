*** Variables ***
${username}=                    testuser
${password}=                    password123

# Login Locators
${app_logo}=                    app_logo
${app_title}=                   app_title
${app_subtitle}=                app_subtitle
${label_username}=              username_label
${input_login_username}=        login_username_field
${label_password}=              password_label
${input_password}=              login_password_field
${popup_login_error}=           //XCUIElementTypeAlert[@name="Login Error"]
${popup_login_error_header}=    //XCUIElementTypeStaticText[@name="Login Error"]
${popup_login_error_text}=      Invalid credentials
${button_ok}=                   OK
${button_login}=                login_button
