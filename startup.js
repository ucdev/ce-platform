var spawn = require("child_process").spawn;
var railo = spawn('railo_init');

railo.stdout.on('data', function (data) {
  console.log('stdout: ' + data);
});

railo.stderr.on('data', function (data) {
  console.log('stderr: ' + data);
});

railo.on('exit', function (code) {
  console.log('child process exited with code ' + code);
});