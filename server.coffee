express = require('express')
fs = require('fs')
cradle = require('cradle')
#util = require('util')
db = new(cradle.Connection)().database('stat60')
exec = require('child_process').exec
app = express.createServer()

# Setup configuration
app.use express.static(__dirname + '/public')
app.use express.bodyParser() # Needs this to parse request.body!
app.set 'view engine', 'jade'

# App Routes
app.get '/', (request, response) ->
  response.render 'index', { title: 'Stats 60' }

# app.get '/quiz', (request, response) ->
#   exec "cd quiz; R CMD BATCH problem1.R", (error, stdout, stderr) ->
#     fs.readFile "quiz/1.json", (err, data) ->
#       response.render 'quiz', JSON.parse(data)

app.get '/quiz', (request, response) ->
  db.get '2f496737719ca37994f1bbf3790028fc', (error, doc) ->
#    util.puts JSON.stringify(JSON.parse(doc)["Q1P1"][1])
    response.render 'quiz', JSON.parse(doc)["Q1P1"][1]

app.post '/quiz', (request, response) ->
  db.get '2f496737719ca37994f1bbf3790028fc', (error, doc) ->
    response.send if Number(request.body.answer) is Number(JSON.parse(doc)["Q1P1"][1].answer) then "Correct!" else "Whoa horsey!"

# Listen
app.listen 3000
console.log "Express server listening on port %d", app.address().port
