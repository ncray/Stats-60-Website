express = require('express')
fs = require('fs')
exec = require('child_process').exec
app = express.createServer()

# Setup configuration
app.use express.static(__dirname + '/public')
app.use express.bodyParser() # Needs this to parse request.body!
app.set 'view engine', 'jade'

# App Routes
app.get '/', (request, response) ->
  response.render 'index', { title: 'Stats 60' }

app.get '/quiz', (request, response) ->
  exec "cd quiz; R CMD BATCH problem1.R", (error, stdout, stderr) ->
    fs.readFile "quiz/1.json", (err, data) ->
      response.render 'quiz', JSON.parse(data)

app.post '/quiz', (request, response) ->
  fs.readFile "quiz/1.json", (err, data) ->
    response.send if Number(request.body.answer) is Number(JSON.parse(data).answer) then "Correct!" else "Incorrect!"

app.get '/test', (request, response) ->
  response.render 'test',
    user:
      name: 'TJ'
      email: 'tj@vision-media.ca'
      city: 'Victoria'
      province: 'BC'
    title: "blah"

app.post '/test', (request, response) ->
  console.log request.body
  response.send request.body


# Listen
app.listen 3000
console.log "Express server listening on port %d", app.address().port
