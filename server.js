(function() {
  var app, express, fs;

  express = require('express');

  fs = require('fs');

  app = express.createServer();

  app.use(express.static(__dirname + '/public'));

  app.set('view engine', 'jade');

  app.get('/', function(request, response) {
    return response.render('index', {
      title: 'Stats 60'
    });
  });
		
  app.get('/quiz', function(request, response) {
    return fs.readFile("quiz/1.json", function(err, data) {
      return response.render('quiz', JSON.parse(data))
    });
  });

  app.get('/test', function(request, response) {
    return response.render('test', {
      user: {
        name: 'TJ',
        email: 'tj@vision-media.ca',
        city: 'Victoria',
        province: 'BC'
      },
      title: "blah"
    });
  });

		app.post(

  app.listen(3000);

  console.log("Express server listening on port %d", app.address().port);

}).call(this);
