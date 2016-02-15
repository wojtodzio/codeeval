var fs = require('fs');
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  var timestamps = line.split(' ');
  var sortedTimestamps = timestamps.sort(function(a, b) {
    return a > b ? -1 : 1;
  });
  var output = sortedTimestamps.join(' ');
  console.log(output);
})
