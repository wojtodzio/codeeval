var fs = require('fs');
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function(line) {
  if(line.length == 0) return;

  var total = parseInt(line), sum = 0;

  [5, 3, 1].forEach(function(coin){
    sum += Math.floor(total / coin);
    total %= coin;
  })

  console.log(sum);
})
