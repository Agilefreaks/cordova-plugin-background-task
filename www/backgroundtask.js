
var exec = require("cordova/exec");

var BackgroundTask = function () {
    this.name = "BackgroundTask";
};

BackgroundTask.prototype.begin = function (task) {
    exec(task, null, "BackgroundTask", "begin", []);
};

BackgroundTask.prototype.end = function (task) {
    exec(task, null, "BackgroundTask", "end", []);
};

module.exports = new BackgroundTask();
