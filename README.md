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
    * In the terminal export your lambdatest Credentials as environmental variables:
    ```
    $ export LT_USERNAME=<your lambdatest username>
    $ export LT_ACCESS_KEY=<your lambdatest access_key>
    ```
3. Project Dependencies
    * Install Node modules
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
>    - [Linux](https://www.lambdatest.com/support/docs/display/TD/Local+Testing+For+Linux)```

### Running Tests

* Tests in Parallel:

    ```
    $ ng test
    ```

You will see the test result in the [lambdatest Dashboard](https://automation.lambdatest.com)

### Resources

##### [SeleniumHQ Documentation](http://www.seleniumhq.org/docs/)
##### [Karma Documentation](http://karma-runner.github.io/3.0/intro/how-it-works.html)