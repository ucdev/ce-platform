var connect = require('connect');
var Mincer  = require('mincer');

var environment = new Mincer.Environment();
environment.appendPath('app/assets/javascripts');
environment.appendPath('app/assets/stylesheets');

var app = connect();
app.use('/assets', Mincer.createServer(environment));
app.use(function (req, res) {
  // your application here...
});