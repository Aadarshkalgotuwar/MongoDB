Assignment> //calculate the sum of marks of all the student

Assignment> var map=function(){emit(this.age,this.marks)}
Assignment> var reduce=function(age,marks){return Array.sum(marks)}
Assignment> db.studentdata.mapReduce(map,reduce,{'out':'result1'})


{ result: 'result1', ok: 1 }

Assignment> db.result1.find()
[
  { _id: 23, value: 85 },
  { _id: 20, value: 120 },
  { _id: 25, value: 90 },
  { _id: 22, value: 80 }
]



--------------------------------------------------------------------------

// for finding the average marks of all students

Assignment> var map=function(){emit(this.age,this.marks)};
Assignment> var reduce=function(age,marks){return Array.avg(marks)};
Assignment> db.studentdata.mapReduce(map,reduce,{query:{age:{$gt:20}},out:'result2'})

{ result: 'result2', ok: 1 }
Assignment> db.result2.find()
[
  { _id: 22, value: 80 },
  { _id: 23, value: 85 },
  { _id: 25, value: 90 }
]
Assignment>
