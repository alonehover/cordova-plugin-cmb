var exec = require('cordova/exec');

module.exports = {
    pay : function(params, success, error) {
        exec(success, error, "TffCMB", "pay", [params]);
    }
};
