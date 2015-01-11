
var exec = require("cordova/exec");

var BackgroundTask = function () {
    this.name = "BackgroundTask";
};

BackgroundTask.prototype.begin = function (successFn) {
    exec(successFn, null, "BackgroundTask", "begin", []);
};

BackgroundTask.prototype.end = function (taskId, successFn) {
    exec(successFn, null, "BackgroundTask", "end", [ taskId ]);
};

module.exports = new BackgroundTask();
