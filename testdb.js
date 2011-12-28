var cradle = require('cradle'),
        sys = require('sys');
 
// Defaults to 127.0.0.1:5984
var conn = new(cradle.Connection)();
var db = conn.database('stat60');
 
// NOTE: Update this to an id in your database
var kindleDocId = 'd33ce82135ba71f3889954aeac000411'
 
db.get(kindleDocId, function (err, doc) {
    sys.puts(doc);
    sys.puts('Fetched this gadget: ' + doc.title);
});
