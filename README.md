# Jest Selenium Tutorial

![LAMBDATEST Logo](https://opengraph.githubassets.com/735233b65d346678698aebec548a3af423f731f66d30108eb252a796dbd506ab/LambdaTest/angular-karma-sample)

## Prerequisites

1. Install [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

```
sudo apt install npm
```

2. Install [Node.js](https://nodejs.org/en/)

```
sudo apt install nodejs
```

## Steps to Run your First Test

Step 1. Clone the Angular-Krma-Sample Repository.

```
git clone https://github.com/LambdaTest/angular-karma-sample
```

Step 2. Inside Angular-Krma-Sample folder, export the Lambda-test Credentials. You can get these from your automation dashboard.

<p align="center">
   <b>For Linux/macOS:</b>

```
export LT_USERNAME="YOUR_USERNAME"
export LT_ACCESS_KEY="YOUR ACCESS KEY"
```

<p align="center">
   <b>For Windows:</b>

```
set LT_USERNAME="YOUR_USERNAME"
set LT_ACCESS_KEY="YOUR ACCESS KEY"
```

Step 3. Inside Angular-Karma-Sample folder install necessary packages.

```
cd angular-karma-sample
npm i
```
### Setting test through jenkins
Please refer this [url](https://www.lambdatest.com/support/docs/display/TD/Selenium+with+Jenkins)

###  Routing traffic through your local machine
- Set tunnel value to `true` in test capabilities
> OS specific instructions to download and setup tunnel binary can be found at the following links.
>    - [Windows](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+Windows)
>    - [Mac](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+MacOS)
>    - [Linux](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+Linux)



### Running Tests in Parallel
Navigate to angular-karma-sample and run following command
```
 ng test
```
    
### Important Note:
Some Safari & IE browsers, doesn't support automatic resolution of the URL string "localhost". Therefore if you test on URLs like "http://localhost/" or "http://localhost:8080" etc, you would get an error in these browsers. A possible solution is to use "localhost.lambdatest.com" or replace the string "localhost" with machine IP address. For example if you wanted to test "http://localhost/dashboard" or, and your machine IP is 192.168.2.6 you can instead test on "http://192.168.2.6/dashboard" or "http://localhost.lambdatest.com/dashboard".


 ###  Routing traffic through your local machine
 - Set tunnel value to `true` in test capabilities
 > OS specific instructions to download and setup tunnel binary can be found at the following links.
 >    - [Windows](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+Windows)
 >    - [Mac](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+MacOS)
 >    - [Linux](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+Linux)

### Run test locally
Navigate to  the test folder and run the below command:
```
npm test local.test.js
```

 ### Important Note:
 Some Safari & IE browsers, doesn't support automatic resolution of the URL string "localhost". Therefore if you test on URLs like "http://localhost/" or "http://localhost:8080" etc, you would get an error in these browsers. A possible solution is to use "localhost.lambdatest.com" or replace the string "localhost" with machine IP address. For example if you wanted to test "http://localhost/dashboard" or, and your machine IP is 192.168.2.6 you can instead test on "http://192.168.2.6/dashboard" or "http://localhost.lambdatest.com/dashboard".
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


