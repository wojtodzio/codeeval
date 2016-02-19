var fs = require('fs');
var file = fs.readFileSync(process.argv[2]).toString().split('\n');

if(file[file.length - 1].length == 0)
  file.pop();

var numberOfLines = file.shift();

if(numberOfLines > file.length)
  numberOfLines = file.length;

var mappedFile = file.map(function(line, index){
  return [line.length, index];
});

var sortedMap = mappedFile.sort(function(mappedObject1, mappedObject2){
  return mappedObject2[0] - mappedObject1[0];
});

var index;

for(var i = 0; i < numberOfLines; ++i){
  index = sortedMap[i][1];
  console.log(file[index]);
};
