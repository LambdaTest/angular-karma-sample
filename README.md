# Run Selenium Tests With Karma Test Runner — TestMu AI (Formerly LambdaTest)

![JavaScript](https://user-images.githubusercontent.com/95698164/172134732-2e9c780e-10ac-4956-b366-86ffc25bf070.png)

<p align="center">
  <a href="https://www.testmuai.com/blog/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample" target="_bank">Blog</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/support/docs/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample" target="_bank">Docs</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/learning-hub/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample" target="_bank">Learning Hub</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/newsletter/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample" target="_bank">Newsletter</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.testmuai.com/certifications/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample" target="_bank">Certifications</a>
  &nbsp; &#8901; &nbsp;
  <a href="https://www.youtube.com/@TestMuAI" target="_bank">YouTube</a>
</p>
&emsp;
&emsp;
&emsp;

*Learn how to use Karma Test Runner framework to configure and run your JavaScript automation testing scripts on the TestMu AI platform*

[<img height="58" width="200" src="https://user-images.githubusercontent.com/70570645/171866795-52c11b49-0728-4229-b073-4b704209ddde.png">](https://accounts.lambdatest.com/register)


## Table Of Contents

* [Pre-requisites](#pre-requisites)
* [Configuring TestMu AI tunnel To Run Karma Tests With TestMu AI](#configuring-lambdatest-tunnel-to-run-karma-tests-with-lambdatest)
* [Integrating Your Karma Testing Framework With TestMu AI](#integrating-your-karma-testing-framework-with-lambdatest)
* [Avoid Timeouts With psuedoActivityInterval](#avoid-timeouts-with-psuedoactivityinterval)


## Pre-requisites

In order to perform tests with TestMu AI using Karma testing framework, you would need the below things to be already set up:

**1. Global Dependencies**
* Make sure to use the latest version of JavaScript.
* A Git or GitHub repository
* Download and install node.js and node package manager or npm.
To install node.js with homebrew use the below command.

`$ brew install node`

* If you have npm already installed, you may want to upgrade it to latest version. Here the code you can run in your terminal to upgrade npm.

`npm install npm@latest -g`

* Install [Angular CLI](https://cli.angular.io/)(Command Line Interface) with the below command.

`$ npm install -g @angular/cli`


**2. TestMu AI Authentication Credentials**

Be aware of your TestMu AI authentication credentials i.e. your TestMu AI username, access key and HubURL. You need to set them up as your environment variables. You can retrieve them from your [TestMu AI automation dashboard](https://automation.lambdatest.com/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample) by clicking on the key icon near the help button.

```
Start tunnel with command from the configure tunnel in your dashboard
this tunnel name will be needed to run the tests
```
* For Windows user:
```bash
set LT_USERNAME=”YOUR_USERNAME”
set LT_ACCESS_KEY=”YOUR ACCESS KEY”
set LT_TUNNEL=”TUNNEL NAME”
```

* For macOS/Linux user:
```bash
export LT_USERNAME=”YOUR_USERNAME”
export LT_ACCESS_KEY=”YOUR ACCESS KEY”
export LT_TUNNEL=”TUNNEL NAME”
```

### Setting Up

Clone the sample project from TestMu AI GitHub repository by using the below command in your cmd/terminal.

`git clone https://github.com/LambdaTest/angular-karma-sample && cd angular-karma-sample`

Install the node.js dependencies and Karma CLI globally using the below command.

`npm install -g karma-cli && npm install`

> **Change Browsers & Framework For Sample Project:**
> If you wish to add more browsers or change the framework to something other than the one used in our Sample project then you can do so by editing the browser array/ framework array in the *karma.conf.js* file.


## Configuring TestMu AI tunnel To Run Karma Tests With TestMu AI

To help you perform cross browser testing of your locally stored web pages, TestMu AI provides an SSH(Secure Shell) tunnel connection with the name TestMu AI tunnel. With TestMu AI tunnel, you can execute a test your local Karma tests on cloud for performing automated cross browser testing on more than 2000 browsers offered by Selenium Grid on TestMu AI. So you make sure how well your changes look, even before your customers. Curious to know more about TestMu AI tunnel?

> Follow our documentation on TestMu AI tunnel to know it all. OS specific instructions to download and setup tunnel binary can be found at the following links.
 * [Documentation For Windows User](/docs/local-testing-for-windows/)
 * [Documentation For Mac User](/docs/local-testing-for-macos/)
 * [Documentation For Linux User](/docs/local-testing-for-linux/)

> Download the binary file of:
 * [TestMu AI tunnel for Windows](https://downloads.lambdatest.com/tunnel/v3/windows/64bit/LT_Windows.zip)
 * [TestMu AI tunnel for Mac](https://downloads.lambdatest.com/tunnel/v3/mac/64bit/LT_Mac.zip)
 * [TestMu AI tunnel for Linux](https://downloads.lambdatest.com/tunnel/v3/linux/64bit/LT_Linux.zip)

Once, the tunnel is successfully set up. You can add the below code to your capabilities for testing internal servers on your network.

`tunnel: true,`


## Integrating Your Karma Testing Framework With TestMu AI

To integrate Karma test runner with TestMu AI you need to set up TestMu AI authentication credentials **(access key & username)** as your environment variables in the ***karma.conf.js*** file.

**Test Scenario:** Check out this sample [karma.conf.js](https://github.com/LambdaTest/angular-karma-sample/blob/master/src/karma.conf.js) file for integrating Karma test runner with TestMu AI. You can use the sample file to test your own automation test suite by replacing the environment variables according to your need. 

After declaring the required environment variable, comes the time to execute your test using the below command.

karma start karma.conf.js

`karma start karma.conf.js`

If you wish to use Jenkins, then [follow this documentation](/docs/jenkins-with-lambdatest/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample).

### Parallel Testing

Parallel testing is one of the most in-demand feature of TestMu AI Selenium Grid. By parallel testing, you can run more than one test case, simultaneously. This means that, parallel testing would allow you to execute numerous automation test cases altogether. So you execute a single test scenario across different browsers or could run different test scenarios across the same browser but with different browser versions.

To perform parallel testing, navigate to sample project “**angular-karma-sample**” and run the below command.

`$ ng test`

Monitor and analyze your test result ont the [TestMu AI Automation Dashboard](https://automation.lambdatest.com/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample).


## Avoid Timeouts With psuedoActivityInterval

To make sure our machines are not hold for long due to some incorrect test, we have come up with a restriction on the number of seconds that our machine is kept reserved for you. In cases, where our servers fail to retrieve a request from your local machine for more than 90 seconds, then your tests are aborted from the queue with the error message related to Timeouts.

If you wish to avoid such timeouts, you need to make use of the below parameter:

``` js
customLaunchers: { chrome: {
 pseudoActivityInterval: 5000 // 5000 ms heartbeat to avoid timeouts
 } }
```

> **Note**: psuedoActivityInterval is presented as a default parameter with a value set to 0. Make sure to provide a value more than 0 in order to avoid the timeouts.


## Tutorials 📙

Check out our latest tutorials on TestNG automation testing 👇

* [Angular Testing With Jasmine And Karma Using Selenium [Tutorial]](https://www.testmuai.com/blog/angular-testing-with-jasmine-and-karma/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample)


## Documentation & Resources :books:
 
Visit the following links to learn more about TestMu AI's features, setup and tutorials around test automation, mobile app testing, responsive testing, and manual testing.

* [TestMu AI Documentation](https://www.testmuai.com/support/docs/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample)
* [TestMu AI Blog](https://www.testmuai.com/blog/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample)
* [TestMu AI Learning Hub](https://www.testmuai.com/learning-hub/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample)    


## TestMu AI Community :busts_in_silhouette:

The [TestMu AI Community](https://community.testmuai.com/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample) allows people to interact with tech enthusiasts. Connect, ask questions, and learn from tech-savvy people. Discuss best practises in web development, testing, and DevOps with professionals from across the globe 🌎


## What's New At TestMu AI ❓

To stay updated with the latest features and product add-ons, visit [Changelog](https://changelog.testmuai.com/) 
      

## 🚀 [LambdaTest is Now TestMu AI](https://www.testmuai.com/lambdatest-is-now-testmuai/)

👋 Welcome to TestMu AI, the next evolution of LambdaTest. As of January 2026, LambdaTest has officially rebranded to TestMu AI. We have evolved from a cross-browser testing cloud into a unified, AI-native quality engineering platform designed for the modern DevOps era.

Whether you have been part of the LambdaTest community for years or are just discovering TestMu AI, our mission remains the same: to help you ship faster with high-scale test execution, autonomous testing, and deep quality analytics.

**🔄 Our Rebrand Journey**

We chose the name TestMu AI to reflect our shift towards intelligent, autonomous testing. While our identity has changed, our core technology and commitment to the testing community stay the same.

👉 Find [LambdaTest's New Home](https://www.testmuai.com/).

**🔭 Explore TestMu AI**

The same infrastructure LambdaTest customers relied on, now delivered through autonomous AI agents.

- [KaneAI](https://www.testmuai.com/kane-ai/)
- [Agent-to-Agent Testing](https://www.testmuai.com/agent-to-agent-testing/)
- [HyperExecute](https://www.testmuai.com/hyperexecute/)
- [Real Device Cloud](https://www.testmuai.com/real-device-cloud/)
- [Pricing](https://www.testmuai.com/pricing/)
- [Documentation](https://www.testmuai.com/support/docs/)

## We are here to help you :headphones:

* Got a query? we are available 24x7 to help. [Contact Us](support@testmuai.com/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample)
* For more info, visit - [TestMu AI](https://www.testmuai.com/?utm_source=github&utm_medium=repo&utm_campaign=angular-karma-sample)
