var fs = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (message){
  if(message.length == 0) return;

  var array = [ 1, 1 ], tmp;

  for(var i = message.length - 2; i >= 0; --i){
    tmp = array[0];

    if(message[i] == '1' || (message[i] == '2' && message[i + 1] < '7'))
      array[0] += array[1]

    array[1] = tmp;
  }
  console.log(array[0]);
})
