express = require('express')
app = express.createServer()

# Setup configuration
app.use express.static(__dirname + '/public')
app.set 'view engine', 'jade'

# App Routes
app.get '/', (request, response) ->
  response.render 'index', { title: 'Express with Coffee' }

# Listen
app.listen 3000
console.log "Express server listening on port %d", app.address().port