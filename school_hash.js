var _ = require('lodash');

school_hash = [
  {'teacher': 'Raju', 'student': 'Guru', 'subject': 'History', 'mark1': '100', 'mark2': '100'},
  {'teacher': 'Shanta', 'student': 'Murali', 'subject': 'Geography', 'mark1': '80', 'mark2': '60'},
  {'teacher': 'Prabhu', 'student': 'Guru', 'subject': 'Maths', 'mark1': '90', 'mark2': '95'},
  {'teacher': 'Raju', 'student': 'Murali', 'subject': 'Civics', 'mark1': '100', 'mark2': '100'},
  {'teacher': 'Raju', 'student': 'Guru', 'subject': 'Civics', 'mark1': '85', 'mark2': '80'},
  {'teacher': 'Raju', 'student': 'Jansi', 'subject': 'Civics', 'mark1': '80', 'mark2': '70'},
  {'teacher': 'Raju', 'student': 'Jansi', 'subject': 'History', 'mark1': '100', 'mark2': '70'},
  {'teacher': 'Raju', 'student': 'Murali', 'subject': 'History', 'mark1': '70', 'mark2': '100'},
  {'teacher': 'Shanta', 'student': 'Guru', 'subject': 'Geography', 'mark1': '80', 'mark2': '90'},
  {'teacher': 'Shanta', 'student': 'Jansi', 'subject': 'Geography', 'mark1': '60', 'mark2': '100'},
  {'teacher': 'Prabhu', 'student': 'Murali', 'subject': 'Maths', 'mark1': '100', 'mark2': '85'},
  {'teacher': 'Prabhu', 'student': 'Jansi', 'subject': 'Maths', 'mark1': '100', 'mark2': '90'}
;

// var result = _.filter(school_hash,{'student': 'Guru'});
// console.log(result);
// var ans1 = _.filter(school_hash,{'student'});
// console.log(ans1);
var = _.groupBy(school_hash,'student')
