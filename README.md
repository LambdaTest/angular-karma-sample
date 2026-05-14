# Run Angular Karma Tests with Selenium on TestMu AI (Formerly LambdaTest)

<p align="center">
  <a href="https://www.testmuai.com/"><img src="https://img.shields.io/badge/MADE%20BY%20TestMu%20AI-000000.svg?style=for-the-badge&labelColor=000" alt="Made by TestMu AI"></a>
  <a href="https://www.npmjs.com/package/karma"><img src="https://img.shields.io/npm/v/karma.svg?style=for-the-badge&labelColor=000000" alt="Karma version"></a>
  <a href="https://community.testmuai.com/"><img src="https://img.shields.io/badge/Join%20the%20community-blueviolet.svg?style=for-the-badge&labelColor=000000" alt="Community"></a>
</p>

## Getting Started

[TestMu AI](https://www.testmuai.com/) (Formerly LambdaTest) lets you run Karma Test Runner with Selenium across 3000+ real browsers and operating systems. This sample shows how to configure Angular + Karma to run on the TestMu AI cloud.

- [Sign up on TestMu AI](https://www.testmuai.com/register/) (Formerly LambdaTest).
- Follow the documentation on [Run Angular Karma tests with Selenium on TestMu AI](https://www.testmuai.com/support/docs/karma-integration-with-testmu/) (Formerly LambdaTest) for the full setup walkthrough.

### Prerequisites

- Node.js and npm (latest stable)
- Angular CLI: `npm install -g @angular/cli`
- A TestMu AI (Formerly LambdaTest) account with your username and access key

### Setup

Clone and install dependencies:

```bash
git clone https://github.com/LambdaTest/angular-karma-sample && cd angular-karma-sample
npm install -g karma-cli && npm install
```

Set your credentials as environment variables.

**macOS / Linux:**

```bash
export LT_USERNAME="YOUR_USERNAME"
export LT_ACCESS_KEY="YOUR_ACCESS_KEY"
export LT_TUNNEL="YOUR_TUNNEL_NAME"
```

**Windows:**

```bash
set LT_USERNAME="YOUR_USERNAME"
set LT_ACCESS_KEY="YOUR_ACCESS_KEY"
set LT_TUNNEL="YOUR_TUNNEL_NAME"
```

### Run tests

```bash
karma start karma.conf.js
```

For parallel execution across browsers:

```bash
ng test
```

View results on your TestMu AI dashboard.

### Local testing with TestMu AI Tunnel

To test locally hosted apps, set up the TestMu AI tunnel. OS-specific guides:

- [Local Testing on Windows](https://www.testmuai.com/support/docs/local-testing-for-windows/)
- [Local Testing on macOS](https://www.testmuai.com/support/docs/local-testing-for-macos/)
- [Local Testing on Linux](https://www.testmuai.com/support/docs/local-testing-for-linux/)

Add the following to your capabilities:

```js
tunnel: true,
```

### Avoid timeouts with `pseudoActivityInterval`

TestMu AI aborts test sessions if the machine is held idle for 90+ seconds. To keep sessions alive, send a heartbeat:

```js
customLaunchers: {
  chrome: {
    pseudoActivityInterval: 5000 // 5s heartbeat
  }
}
```

The default is `0` (disabled). Set any value above `0` to enable.

## Contributions

Contributions are welcome. Open an issue to discuss your idea before submitting a pull request. When reporting bugs, include your Node.js version, OS, and Angular CLI version.

## TestMu AI (Formerly LambdaTest) Community

Connect with testers and developers in the [TestMu AI Community](https://community.testmuai.com/). Ask questions, share what you are building, and discuss best practices in test automation and DevOps.
  
## TestMu AI (Formerly LambdaTest) Certifications

Earn free [TestMu AI Certifications](https://www.testmuai.com/certifications/) for testers, developers, and QA engineers. Validate your skills in Selenium, Cypress, Playwright, Appium, Espresso and more. Industry-recognized, shareable on LinkedIn, and built by practitioners, not marketers.

## Learning Resources by TestMu AI (Formerly LambdaTest)

Learn modern testing through tutorials, guides, videos, and weekly updates:

* [TestMu AI Blog](https://www.testmuai.com/blog/) - Tutorials, deep dives, and framework guides for testers and developers.
* [TestMu AI Learning Hub](https://www.testmuai.com/learning-hub/) - Long-form learning paths on Selenium, Cypress, Playwright, Appium, and AI-native testing.
* [TestMu AI Newsletter](https://www.testmuai.com/newsletter/) - Weekly roundup of what's new in testing, dev tools, and AI.
* [TestMu AI on YouTube](https://www.youtube.com/@TestMuAI) - Walkthroughs, product demos, and talks from TestMu Conference.

## LambdaTest is Now TestMu AI

On **January 12, 2026**, [LambdaTest evolved to TestMu AI](https://www.testmuai.com/lambdatest-is-now-testmuai/), the world's first fully autonomous **Agentic AI Quality Engineering Platform**.

Same team. Same infrastructure. Same customer accounts. All existing LambdaTest logins, scripts, capabilities, and integrations continue to work without change.

👉 Find the new home for [LambdaTest](https://www.testmuai.com).

### How LambdaTest Evolved into TestMu AI

In 2017, we launched LambdaTest with a simple mission: make testing fast, reliable, and accessible. As LambdaTest grew, we expanded into Test Intelligence, Visual Regression Testing, Accessibility Testing, API Testing, and Performance Testing, covering the full depth of the testing lifecycle.

As software development entered the AI era, testing had to evolve, too. We rebuilt the architecture to be AI-native from the ground up, with autonomous agents that **plan, author, execute, analyze, and optimize tests** while keeping humans in the loop. The platform integrates with your repos, CI, IDEs, and terminals, continuously learning from every code change and development signal.

That evolution earned a new name: **TestMu AI**, built for an AI-first future of quality engineering. TestMu is not a new name for us. It is the name of our annual community conference, which has brought together 100,000+ quality engineers to discuss how AI would reshape testing, long before that became an industry norm. TestMu AI reflects our commitment to community-driven innovation and AI-native architecture.

## Support

Got a question? Email [support@testmuai.com](mailto:support@testmuai.com) or chat with us 24x7 from our chat portal.
