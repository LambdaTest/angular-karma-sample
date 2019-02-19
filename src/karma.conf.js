// Karma configuration file, see link for more information
// https://karma-runner.github.io/1.0/config/configuration-file.html

module.exports = function(config) {

    // Lambdatest grid hostname and port
    var webdriverConfig = {
        hostname: 'hub.lambdatest.com',
        port: 80
    }

    config.set({
        hostname: 'localhost', // hostname, where karma web server will run
        port: 9876,
        basePath: './',
        frameworks: ['jasmine', '@angular-devkit/build-angular'],
        plugins: [
            'karma-jasmine',
            'karma-webdriver-launcher',
            'karma-jasmine-html-reporter',
            'karma-coverage-istanbul-reporter',
            require('@angular-devkit/build-angular/plugins/karma')
        ],
        client: {
            clearContext: false
        },
        coverageIstanbulReporter: {
            dir: require('path').join(__dirname, '../coverage/karma-sample'),
            reports: ['html', 'lcovonly', 'text-summary'],
            fixWebpackSourcePaths: true
        },
        captureTimeout: 600000,
        browserDisconnectTimeout: 60000,
        browserDisconnectTolerance: 1,
        browserNoActivityTimeout: 60000,
        reporters: ['progress', 'kjhtml'],
        colors: true,
        logLevel: config.LOG_DEBUG,
        browsers: ['chrome'],
        customLaunchers: {
            chrome: {
                base: 'WebDriver',
                config: webdriverConfig,
                browserName: 'chrome',
                platform: 'windows 10',
                version: '71.0',
                name: 'Karma',
                tunnel: true, // In case karma is running on local machine
                video: true, // capture video for your test
                visual: true, // capture screenshots on each step
                network: true, // capture network logs for your test
                console: true, // capture browser console logs
                user: process.env.LT_USERNAME,
                accessKey: process.env.LT_ACCESS_KEY
            }
        },
        singleRun: true,
        autoWatch: false
    });
};