var fs = require('fs');
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function(line){
  if(line.length === 0) return;

  var elements = line.split(' ');
  var m = elements.pop();

  if(m > elements.length) return;

  var output = elements[elements.length - m];
  console.log(output);
});
