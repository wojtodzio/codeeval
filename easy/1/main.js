var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  var args = line.split(' ');
  var firstDivider = args[0];
  var secondDivider = args[1];
  var rangeTo = args[2];

  for(var i = 1; i <= rangeTo; ++i){
    if(i % firstDivider == 0){
      process.stdout.write('F')
        if(i % secondDivider == 0)
          process.stdout.write('B')
    }
    else if(i % secondDivider == 0)
      process.stdout.write('B')
    else
      process.stdout.write(i.toString());

    if(i == rangeTo)
      process.stdout.write('\n');
    else
      process.stdout.write(' ');
  }
});
