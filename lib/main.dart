import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'domain/list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Max fitness',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(title: TextStyle(color: Colors.white))
      ), //Theme
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(title: Text('MaxFit'), leading: Icon(Icons.verified_user),),
        body: WorkoutList(),
           ), // Scaffold
    ); // Container
  }
}

class WorkoutList extends StatelessWidget {

final workouts = <Workout>[
  Workout(title:'Test1', author: 'Max2', description: 'Test Workout', level: 'Beginner'),
  Workout(title:'Test2', author: 'Max3', description: 'Test Workout', level: 'Inter'),
  Workout(title:'Test3', author: 'Max4', description: 'Test Workout', level: 'Advaced'),
  Workout(title:'Test4', author: 'Max5', description: 'Test Workout', level: 'Beginner'),
  Workout(title:'Test5', author: 'Max6', description: 'Test Workout', level: 'Beginner'),
];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, i){
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical:4),
              child: Container(
                decoration: BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.7)),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal:10),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(Icons.toys, color: Theme.of(context).textTheme.title.color),
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1, color: Colors.white24))
                    ),
                  ),
                  title: Text(workouts[i].title, style: TextStyle(color: Theme.of(context).textTheme.title.color, fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).textTheme.title.color),
                  subtitle: subtitle(context, workouts[i]),
                ),
              ),

            );
          }
          ),
      ),
    );
  }
}

Widget subtitle( BuildContext context, Workout workout){
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch(workout.level){
  case 'Beginner':
    color = Colors.green;
    indicatorLevel = 0.33;
    break;
 case 'Inter':
    color = Colors.yellow;
    indicatorLevel = 0.66;
    break;
case 'Advaced':
    color = Colors.red;
    indicatorLevel = 1;
    break;
  } // difficulty

  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.title.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color)
        )
      ),
      SizedBox(width:10),
      Expanded(
        flex:3,
        child:Text(workout.level, style: TextStyle(color: Theme.of(context).textTheme.title.color))
      )
    ],
  );
}