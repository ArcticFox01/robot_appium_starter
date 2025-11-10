*** Settings ***
Variables  ../env.yaml
Library    AppiumLibrary     timeout=${default_timeout}     run_on_failure=Log And Capture Error
Library    Process
Library    OperatingSystem

*** Keywords ***
Log And Capture Error
    AppiumLibrary.Capture Page Screenshot
    AppiumLibrary.Log Source

Spawn Appium Server
    Start Process   appium
    ...             -p    ${appium.port}
    ...             -g    logs/appium.log
    ...             shell=true
    ...             stdout=NONE
    Sleep   ${fast_timeout}

Open iOS Application
    Open Application    remote_url=${appium.server}
    ...     appium:udid=${udid}
    ...     platformName=iOS
    ...     appium:automationName=XCUITest
    ...     appium:deviceName=${device_name}
    ...     appium:bundleId=${bundle_id}
    ...     appium:alias=Device
    ...     appium:newCommandTimeout=${appium_timeout}
    ...     appium:includeSafariInWebviews=${True}
    ...     appium:printPageSourceOnFindFailure=true
    ...     appium:autoGrantPermissions=true

Suite Setup Config
    Spawn Appium Server

Test Setup Config
    Open iOS Application
    Sleep   ${fast_timeout}

Test Teardown Config
    Close All Applications
 
Suite Teardown Config
    Terminate Process
