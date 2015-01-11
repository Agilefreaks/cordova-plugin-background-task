
var exec = require("cordova/exec");

var BackgroundTask = {
    name: 'BackgroundTask',

    /// Begin background task
    /// @param successFn a success callback with signature function(taskId)
    begin: function (successFn) {
        exec(successFn, null, "BackgroundTask", "begin", []);
    },

    /// End background task
    /// @param taskId a previously issued task ID
    /// @param successFn a success callback
    end: function (taskId, successFn) {
        exec(successFn, null, "BackgroundTask", "end", [ taskId ]);
    }
};

module.exports = BackgroundTask;
