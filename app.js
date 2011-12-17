(function() {
  var app, express;

  express = require('express');

  app = express.createServer();

  app.use(express.static(__dirname + '/public'));

  app.set('view engine', 'jade');

  app.get('/', function(request, response) {
    response.render('index', {
      title: 'Express with Coffee'
    });
    return alert("hi");
  });

  app.listen(3000);

  console.log("Express server listening on port %d", app.address().port);

}).call(this);
