const sqrt5 = Math.sqrt(5);
const sqrtPlus = (1 + sqrt5) / 2;

var fs = require('fs');
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function(n){
  if(n.length == 0) return;

  n = parseInt(n);

  var output = Math.pow(sqrtPlus, n) / sqrt5;
  output = Math.round(output);

  console.log(output);
})
