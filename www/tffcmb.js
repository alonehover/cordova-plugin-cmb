var exec = require('cordova/exec');

module.exports = {
    channel : function(success, error) {
        exec(success, error, "TffCMB", "keyboard", []);
    }
};
var exec = require('cordova/exec');

module.exports = {
    test : function(success, error) {
        exec(success, error, "TffCMB", "test", []);
    }
};
