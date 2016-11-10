var exec = require('cordova/exec');

module.exports = {
    test : function(testParams, success, error) {
        exec(success, error, "TffCMB", "test", [testParams]);
    }
};
