var myStepDefinitionsWrapper = function () {
  this.World = require("../support/world.js").World; // overwrite default World constructor

  this.Given(/^I am on the Cucumber.js GitHub repository$/, function(callback) {
    // Express the regexp above with the code you wish you had.
    // `this` is set to a new this.World instance.
    // i.e. you may use this.browser to execute the step:

    this.visit('http://github.com/cucumber/cucumber-js', callback);

    // The callback is passed to visit() so that when the job's finished, the next step can
    // be executed by Cucumber.
  });

  this.When(/^I go to the README file$/, function(callback) {
    // Express the regexp above with the code you wish you had. Call callback() at the end
    // of the step, or callback.pending() if the step is not yet implemented:

    // callback.pending();
    callback();
  });

  this.Then('I should see "$title" as the page title', function(title, callback) {
    // the above string is converted to the following Regexp by Cucumber:
    // /^I should see "([^"]*)" as the page title$/
    console.log(this.browser.evaluate("document.title"));
    // this.browser.text('title').should.include.string(title);
    // if (!this.isOnPageWithTitle(title))
    //   // You can make steps fail by calling the `fail()` function on the callback:
      callback.fail(new Error("Expected to be on page with title " + title));
    // else
      // callback();
  });
};

module.exports = myStepDefinitionsWrapper;