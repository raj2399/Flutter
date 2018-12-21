import 'package:flutter/material.dart';
import 'package:myapp/pages/Addtodo.dart';
import 'package:myapp/Models/model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() => runApp(MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.red,
  ),
  debugShowCheckedModeBanner: false,
      home:ToDoHome('title')

    ));
class ToDoHome extends StatefulWidget
{

  final String title;
  ToDoHome(this.title);

  @override
  ToDoHomeState createState() {
    return new ToDoHomeState();
  }
}

class ToDoHomeState extends State<ToDoHome> with SingleTickerProviderStateMixin{
 TabController con;
 List<Task> taskdone=[];
 List<Task> taskleft=[];
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    con=TabController(length:2, vsync: this);
    getdata().then((data){
      print(data);
    });
  }
 Future<Map<String,List<Task>>>getdata() async {
   String url = 'https://rkdemotask.herokuapp.com/tasks';
   Map<String, List<Task>> response = {'done': [], 'left': []};
   var res = await http.get(url).then((data) {
     if (data.statusCode == 200) {
       List parsedata = json.decode(data.body);
       for (int i = 0; i < parsedata.length; i++) {
         Task taskData = Task.fromJson(parsedata[i]);
         if (taskData.status) {
           response['done'].add(taskData);
         }
         else {
           response['left'].add(taskData);
         }
       }
       print('this is${data.body}');
     }
   });
   return response;
 }

   @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(
        title: Text('${widget.title}'),centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: (){
            print(Task(id:1,title: 'task1',status: true).id);

      }),

bottomNavigationBar: TabBar(controller: con,tabs:[
    Tab(child: Icon(Icons.assignment_turned_in,color:Colors.red)),
    Tab(child: Icon(Icons.assignment_late,color:Colors.red)),
]
),

      body:TabBarView(controller: con,
        children:[
          Image.asset('Assets/1.jpg'),
          Image.asset('Assets/2.jpg')
          //Center(child: Text('tod1')),
          //Center(child: Text('todo2'))
        ])

      );///

  }
}
