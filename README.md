![LambdaTest Logo](https://www.lambdatest.com/static/images/logo.svg)
---
# angular-karma-sample

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
2. lambdatest Credentials
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

### Running Tests

* Tests in Parallel:
    - Navigate to angular-karma-sample
    - Run following command

    ```
    $ ng test
    ```

You will see the test result in the [lambdatest Dashboard](https://automation.lambdatest.com)

### Resources

##### [SeleniumHQ Documentation](http://www.seleniumhq.org/docs/)
##### [Karma Documentation](http://karma-runner.github.io/3.0/intro/how-it-works.html)
