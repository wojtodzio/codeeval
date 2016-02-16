String.prototype.toWidth = function(width){
  var missingSpaces = width - this.length;
  return Array(missingSpaces + 1).join(' ') + this;
}

for(var x = 1; x <= 12; ++x){
  process.stdout.write(x.toString());
  for(var y = 2; y <= 12; ++y){
    toPrint = (x * y).toString().toWidth(4);
    process.stdout.write(toPrint);
  }
  process.stdout.write('\n');
}
