# iOS Test Automation with Robot Framework & Appium

A comprehensive test automation framework for iOS applications using [Robot Framework](https://robotframework.org/) with the Appium Library. This project demonstrates mobile testing best practices with a Page Object Model (POM) architecture for testing iOS applications.

## 🎯 Project Overview

This framework provides:
- **Mobile Test Automation**: Complete iOS app testing using Robot Framework and Appium
- **Page Object Model**: Organized, maintainable test structure with separation of concerns
- **Cross-Platform Compatibility**: Designed primarily for macOS with Xcode support
- **Comprehensive Reporting**: Built-in test reports with detailed logs and screenshots
- **Reusable Components**: Modular design with shared libraries and helper functions

> [!NOTE]
> This project requires macOS and Xcode for iOS testing. Android-specific Appium dependencies can be ignored when following the setup instructions.

## 📋 Prerequisites

### System Requirements
- **macOS** (required for iOS testing with Xcode)
- **RAM**: 8GB+ recommended
- **Storage**: 10GB+ free space for tools and simulators

### Required Tools

1. **Code Editor**
   - Install [VS Code](https://code.visualstudio.com/) (recommended) or your preferred IDE
   - Install Robot Framework extension for VS Code for better syntax highlighting

2. **Python Environment**
   ```bash
   # Install Python 3.9+ (3.9.10 recommended)
   # Option 1: Download from python.org
   # Option 2: Use pyenv for version management
   brew install pyenv
   pyenv install 3.9.10
   pyenv global 3.9.10

   # Verify installation
   python --version
   pip --version
   ```

3. **Java Development Kit**
   ```bash
   # Install JDK 11 or higher
   brew install openjdk@11

   # Set JAVA_HOME (add to ~/.zshrc or ~/.bash_profile)
   export JAVA_HOME=/usr/local/opt/openjdk@11
   export PATH="$JAVA_HOME/bin:$PATH"
   ```

4. **Xcode & iOS Tools**
   ```bash
   # Install Xcode from App Store
   # Install Command Line Tools
   xcode-select --install

   # Verify installation
   xcode-select -p
   ```

5. **Node.js & npm**
   ```bash
   # Install Node.js LTS version
   brew install node

   # Verify installation
   node --version
   npm --version
   ```

### Mobile Testing Tools

6. **Appium Setup**
   ```bash
   # Install Appium globally
   npm install -g appium

   # Install iOS driver (XCUITest)
   appium driver install xcuitest

   # Install Appium Doctor for troubleshooting
   npm install -g appium-doctor

   # Run diagnostics
   appium-doctor --ios
   ```

7. **Project Dependencies**
   ```bash
   # Clone this repository
   git clone <repository-url>
   cd Robot_MarketMini

   # Install Python dependencies
   pip install -r requirements.txt
   ```

8. **Test Application**
   - The test application is already included in the `APP/` folder as `MiniMarket.zip`
   - Extract the app from the zip file for use with iOS Simulator
   - For **Device**: You may need to repackage for physical iOS device installation
   - Update the `bundle_id` in `env.yaml` if different from `com.example.MiniMarket`

## ⚙️ Configuration

### Device Setup

1. **Connect Your Target Device**
   - **Physical Device**: Connect via USB to your Mac
   - **iOS Simulator**: Open desired simulator from Xcode

2. **Get Device UDID**
   ```bash
   # Method 1: Using Xcode
   # Open Xcode → Window → Devices and Simulators
   # Copy the Identifier from your selected device/simulator

   # Method 2: Using command line
   xcrun xctrace list devices
   # or for simulators only:
   xcrun simctl list devices
   ```

3. **Update Configuration**
   Edit `env.yaml` and update your device settings:
   ```yaml
   platform: ios
   appium:
       server: http://localhost:4723
       port: 4723
       bootstrap_port: 50010

   udid: YOUR_DEVICE_UDID_HERE  # Replace with actual UDID
   device_name: "Your Device Name"
   appium_timeout: 60
   fast_timeout: 3
   default_timeout: 15
   bundle_id: com.example.MiniMarket  # Update if different
   ```

### Start Appium Server
```bash
# Start Appium server (required before running tests)
appium --port 4723

# Or run in background
appium --port 4723 &
```

## 🚀 Running Tests

### Basic Test Execution

```bash
# Run all tests in the tests directory
robot tests

# Run specific test file
robot tests/LoginPageTest.robot

# Run multiple test files
robot tests/LoginPageTest.robot tests/ProductItemTest.robot

# Run with specific output directory
robot --outputdir results tests/LoginPageTest.robot
```

### Advanced Test Options

```bash
# Run tests with specific tags
robot --include login tests
robot --exclude skip tests

# Run with variable override
robot --variable DEVICE_NAME:"iPhone 14" tests

# Run with debugging (more verbose output)
robot --loglevel DEBUG tests

# Run tests without exiting on failure
robot --exitonfailure false tests

# Dry run (validate syntax without executing)
robot --dryrun tests

# Run with custom suite name
robot --suitestatlevel 2 --name "My Test Suite" tests
```

### Parallel Execution

```bash
# Install pabot for parallel execution
pip install robotframework-pabot

# Run tests in parallel (2 processes)
pabot --processes 2 tests

# Run with test level split
pabot --testlevelsplit tests

# Run with resource files
pabot --resourcefile resources/variables.robot tests
```

### Test Filtering and Selection

```bash
# Run tests by pattern
robot --test "Login*" tests

# Run tests by suite
robot --suite LoginPageTest tests

# Run with critical tags
robot --critical login tests

# Include/exclude combinations
robot --include login --exclude smoke tests
```

## 📊 Viewing Test Results

### Report Generation

```bash
# Open test report in default browser
open report.html

# Open detailed log file
open log.html

# View output XML (for integration)
open output.xml

# Custom output directory
robot --outputdir custom_results tests
open custom_results/report.html
```

### Report Analysis

- **report.html**: Executive summary with pass/fail statistics
- **log.html**: Detailed execution log with screenshots and step-by-step details
- **output.xml**: Machine-readable XML format (for CI/CD integration)

### Continuous Integration

```bash
# Generate JUnit-style XML for CI systems
robot --xunit results.xml tests

# Exit with proper status codes for CI
robot --exclude skip tests
echo $?  # Returns 0 if all tests pass, non-zero otherwise
```

## 📁 Project Structure

```
Robot_MarketMini/
├── 📋 env.yaml                    # Environment configuration (device settings, timeouts)
├── 📦 requirements.txt            # Python dependencies
├── 🗂️ config/                     # Global configuration and settings
│   └── ios_config.robot          # iOS-specific Appium configurations
├── 🧪 tests/                      # Test cases organized by functionality
│   ├── LoginPageTest.robot       # Login functionality tests
│   └── ProductItemTest.robot     # Product page tests
├── 📚 resources/                  # Reusable test components
│   🔧 helpers/                   # Global helper functions and utilities
│   │   ├── CommonIOS.robot       # iOS-specific common actions
│   │   └── LoginHelper.robot     # Login-related helper functions
│   🎯 locators/                  # UI element locators organized by page
│   │   ├── LoginPageLocator.robot    # Login page element locators
│   │   └── ProductsPageLocator.robot # Products page element locators
│   📄 pages/                     # Page Object Model implementations
│   │   ├── LoginPage.robot       # Login page actions and verifications
│   │   └── ProductsPage.robot   # Products page actions and verifications
├── 📊 report.html               # Test execution report
├── 📝 log.html                  # Detailed test execution log
└── 📄 output.xml                # Machine-readable test results
```

### Architecture Overview

This framework follows **Page Object Model (POM)** design pattern:

- **Separation of Concerns**: Test logic, page actions, and element locators are separated
- **Reusability**: Common functions are shared across multiple test cases
- **Maintainability**: Changes in UI require updates only in locator files
- **Scalability**: Easy to add new pages, tests, and functionality

### Component Responsibilities

#### 📁 `config/`
- **`ios_config.robot`**: Global Robot Framework settings, iOS Appium configurations, and common keywords
- Sets up test libraries, timeouts, and environment variables

#### 📁 `tests/`
- **Test Cases**: Business logic and test scenarios written in BDD-style format
- **Test Organization**: Grouped by functional areas (login, products, etc.)
- **Test Data**: Uses external data files and environment variables

#### 📁 `resources/helpers/`
- **`CommonIOS.robot`**: Generic iOS interactions (swipe, scroll, tap, wait)
- **`LoginHelper.robot`**: Login-specific reusable functions
- **Global Functions**: Actions that can be used across multiple pages

#### 📁 `resources/locators/`
- **Element Definitions**: All UI element locators organized by page
- **Maintenance Point**: Single source of truth for element identification
- **Strategy**: Uses XPath, ID, accessibility labels for reliable element location

#### 📁 `resources/pages/`
- **Page Objects**: High-level actions for each app screen
- **Business Actions**: User-facing operations (login, add to cart, search)
- **Verification Methods**: Page-specific validation functions

#### 📄 `env.yaml`
- **Environment Variables**: Device configuration, server settings, timeouts
- **Configuration Management**: Separate test environments (dev, staging, prod)
- **Security**: Keeps sensitive data out of version control

## 🔧 Development Guide

### Adding New Tests

1. **Create Test File**
   ```robot
   ***Settings***
   Resource          ../config/ios_config.robot
   Resource          ../resources/locators/NewPageLocator.robot
   Resource          ../resources/pages/NewPage.robot

   Test Tags    smoke

   Suite Setup       Suite Setup Config
   Test Setup        Test Setup Config
   Test Teardown     Test Teardown Config
   Suite Teardown    Suite Teardown Config

   ***Test Cases***
   As a user, I want to perform new action
       [Documentation]  Test description here
       NewPage.Verify Page Loaded
       NewPage.Perform Action    ${test_data}
       NewPage.Verify Success
   ```

2. **Create Page Object** (`resources/pages/NewPage.robot`)
3. **Create Locators** (`resources/locators/NewPageLocator.robot`)

### Best Practices

- **Use Descriptive Names**: Test cases should describe user behavior
- **Add Documentation**: Include test purpose and expected outcomes
- **Handle Timeouts**: Use appropriate wait strategies
- **Clean Up**: Ensure proper teardown to avoid test pollution
- **Version Control**: Don't commit sensitive data to repository

### Debugging Tips

```bash
# Run with verbose logging
robot --loglevel DEBUG tests/YourTest.robot

# Take screenshots on failure
# Configure in ios_config.robot:
# Library    AppiumLibrary    ...    run_on_failure=Capture Page Screenshot
```

## 🐛 Troubleshooting

### Common Issues

**"Appium server not running"**
```bash
# Start Appium server
appium --port 4723
```

**"Device not found"**
```bash
# Check device connection
xcrun xctrace list devices
# Update udid in env.yaml
```

**"Element not found"**
```bash
# Use Appium Inspector to verify locators
# Install via: npm install -g appium-inspector
```

**"Bundle ID incorrect"**
```bash
# Find correct bundle ID
xcrun simctl listapps | grep MiniMarket
```

### Performance Optimization

```bash
# Reduce logging for faster execution
robot --loglevel INFO tests

# Run tests in parallel
pabot --processes 4 tests

# Use test level splitting for large test suites
pabot --testlevelsplit tests
```

## 📚 Additional Resources

### Documentation
- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Appium Documentation](https://appium.io/docs/en/about-appium/intro/)
- [Appium Library Keywords](https://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html)

### Tools & Extensions
- [Appium Inspector](https://github.com/appium/appium-inspector)
- [VS Code Robot Framework Extension](https://marketplace.visualstudio.com/items?itemName=TomoTaka.robotframework)

### Community
- [Robot Framework Slack](https://robotframework.slack.com/)
- [Appium Discord](https://discord.gg/appium)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/robotframework+appium)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-test`
3. Add tests following the existing patterns
4. Run tests to ensure they pass: `robot tests`
5. Submit a pull request

## 📄 License

This project is open source. Please refer to the LICENSE file for details.

---

**Happy Testing! 🚀**

