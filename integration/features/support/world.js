var zombie = require('zombie');
var World = function World(callback) {
  zombie.debug = true;
  this.browser = new zombie({ debug: true, runScripts: false }); // this.browser will be available in step definitions

  this.visit = function(url, callback) {
    this.browser.visit(url, callback);
  };

  callback(); // tell Cucumber we're finished and to use 'this' as the world instance
};
exports.World = World;