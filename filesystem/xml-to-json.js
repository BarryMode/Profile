var XML = require('simple-xml');
var fs  = require('fs');

function XMLtoJSON(filename) {}
fs.readFile(filename + '.xml', 'utf8', function (err, data) {
  var content = JSON.stringify(XML.parse(data));
  fs.writeFile(filename + '.json', content);
});