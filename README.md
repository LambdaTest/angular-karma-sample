![LambdaTest Logo](https://www.lambdatest.com/static/images/logo.svg)
---
# angular karma sample

### Environment Setup

1. Global Dependencies
    * Install [Node.js](https://nodejs.org/en/)
    * Or Install Node.js with [Homebrew](http://brew.sh/)
    ```
    $ brew install node
    ```
    * Install [Angular CLI](https://cli.angular.io/)
    ```
    $ npm install -g @angular/cli
    ```
2. Lambdatest Credentials
    * Set LambdaTest username and access key in environment variables. It can be obtained from [LambdaTest dashboard](https://automation.lambdatest.com/)    
    example:
    - For linux/mac
    ```
    export LT_USERNAME="YOUR_USERNAME"
    export LT_ACCESS_KEY="YOUR ACCESS KEY"
    ```
    - For Windows
    ```
    set LT_USERNAME="YOUR_USERNAME"
    set LT_ACCESS_KEY="YOUR ACCESS KEY"
    ```
3. Setup
    * Clone [angular-karma-sample](https://github.com/LambdaTest/angular-karma-sample) from GitHub.
    * Navigate to the cloned directory
    * Install project dependencies
    ```
    $ npm install
    ```

##### Setting test through jenkins
Please refer this [url](https://www.lambdatest.com/support/docs/display/TD/Selenium+with+Jenkins)

#####  Routing traffic through your local machine
- Set tunnel value to `true` in test capabilities
> OS specific instructions to download and setup tunnel binary can be found at the following links.
>    - [Windows](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+Windows)
>    - [Mac](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+MacOS)
>    - [Linux](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+Linux)

### Important Note:
Some Safari & IE browsers, doesn't support automatic resolution of the URL string "localhost". Therefore if you test on URLs like "http://localhost/" or "http://localhost:8080" etc, you would get an error in these browsers. A possible solution is to use "localhost.lambdatest.com" or replace the string "localhost" with machine IP address. For example if you wanted to test "http://localhost/dashboard" or, and your machine IP is 192.168.2.6 you can instead test on "http://192.168.2.6/dashboard" or "http://localhost.lambdatest.com/dashboard".


### Running Tests

* Tests in Parallel:
    - Navigate to angular-karma-sample
    - Run following command

    ```
    $ ng test
    ```

You will see the test result in the [lambdatest Dashboard](https://automation.lambdatest.com)

### Browser Launcher Configuration
> This configuration can be found in `src/karma.conf.js`

```javascript
    customLaunchers: {
        chrome: {
             base: 'WebDriver',
             config: webdriverConfig,
             browserName: 'chrome',
             platform: 'windows 10',
             version: '71.0',
             name: 'Karma With Heartbeat',
             tunnel: true, // In case karma is running on local machine
             video: true, // capture video for your test
             visual: true, // capture screenshots on each step
             network: true, // capture network logs for your test
             console: true, // capture browser console logs
             user: process.env.LT_USERNAME,
             accessKey: process.env.LT_ACCESS_KEY,
             pseudoActivityInterval: 5000 // 5000 ms heartbeat to avoid timeouts
        }
    }
```
### pseudoActivityInterval
Interval in ms to do some activity to avoid killing session by timeout.
If not set or set to `0` - no activity will be performed.

## About LambdaTest

[LambdaTest](https://www.lambdatest.com/) is a cloud based selenium grid infrastructure that can help you run automated cross browser compatibility tests on 2000+ different browser and operating system environments. LambdaTest supports all programming languages and frameworks that are supported with Selenium, and have easy integrations with all popular CI/CD platforms. It's a perfect solution to bring your [selenium automation testing](https://www.lambdatest.com/selenium-automation) to cloud based infrastructure that not only helps you increase your test coverage over multiple desktop and mobile browsers, but also allows you to cut down your test execution time by running tests on parallel.

### Resources

##### [SeleniumHQ Documentation](http://www.seleniumhq.org/docs/)
##### [Karma Documentation](http://karma-runner.github.io/3.0/intro/how-it-works.html)
