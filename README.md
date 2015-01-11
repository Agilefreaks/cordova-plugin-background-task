## Background Task Plugin for Apache Cordova

Allows you to run JavaScript when the app is active and for 3 minutes after the app is suspended.

## Install

```
cordova plugin add https://github.com/pronebird/cordova-plugin-background-task.git
```

You **do not** need to reference any JavaScript, the Cordova plugin architecture will add a backgroundtask object to your root automatically when you build.

## Usage

### Begin background task

```js
backgroundTask.begin(function (taskId) {
    console.log('Begin background task with ID = ' + taskId);
});
```

### End background task

```js
backgroundTask.end(taskId, function () {
    console.log('End background task with ID = ' + taskId);
});
```

## Platform support

iOS only.

## License

MIT License
