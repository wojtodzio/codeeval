var fs = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if(line != ""){
    var matrix = line.split(',');
    var min = 100;

    matrix.forEach(function (row) {
      var length = 0;
      for(var i = 0; i < row.length; ++i){
        if(row[i] == 'Y')
          break;
        else if(row[i] == '.')
          length++;
        else
          length = 0;
      }
      if(length < min)
        min = length;
    });
    process.stdout.write(min.toString());
    process.stdout.write('\n');
  }
});
