var exec = require('cordova/exec');

module.exports = {
    pay : function(testParams, success, error) {
        exec(success, error, "TffCMB", "pay", [testParams]);
    }
};
