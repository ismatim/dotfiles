mongo_shell_banner =
  '' +
  '*******************************************************************************\n' +
  '                      ACCESS PROHIBITED										\n' +
  '*******************************************************************************\n' +
  '                                                                   \n' +
  'Access to this database is restricted; you may not access data on this system  \n' +
  'unless explicitly authorised, in accordance with Ismael Jonas Tisminetzky.     \n' +
  '                                                                \n' +
  '*******************************************************************************\n' +
  '                      ACCESS PROHIBITED										\n' +
  '*******************************************************************************\n' +
  '';

print(mongo_shell_banner);

(function() {
  prompt = function() {
    if (typeof db == 'undefined') {
      return '(nodb)> ';
    }
    // Check the last db operation
    try {
      db.runCommand({getLastError: 1});
    } catch (e) {
      print(e);
    }
    return db + '> ';
  };

  load('~/startup/mongodb/lodash.js');
})();

function printSchema(obj, indent) {
  for (var key in obj) {
    if (typeof obj[key] != 'function') {
      //we don't want to print functions
      var specificDataTypes = [Date, Array]; //specify the specific data types you want to check
      var type = '';
      for (var i in specificDataTypes) {
        // looping over [Date,Array]
        if (obj[key] instanceof specificDataTypes[i]) {
          //if the current property is instance of the DataType
          type = '==is_' + specificDataTypes[i].name + '=='; //get its name
          break;
        }
      }
      print(indent, key, typeof obj[key], type); //print to console (e.g roles object is_Array)
      if (typeof obj[key] == 'object') {
        //if current property is of object type, print its sub properties too
        printSchema(obj[key], indent + '\t');
      }
    }
  }
}
