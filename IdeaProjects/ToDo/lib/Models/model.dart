class Task{
 final int  id;
 final String title;
 final bool status;
 Task({this.id,this.title,this.status});
 static Task fromJson(Map<String,dynamic> json){
   return Task(
     id: int.parse(json['Id']),
     title: json['Title'],
     status: json['Status']=='done'?true:false,
   );
 }

}