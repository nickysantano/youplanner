part of '../pages.dart';

class TaskDetails extends StatefulWidget {

  static const String routeName = "/taskdetails";


  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    Tasks tasks = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      // appBar: AppBar(
        
      // ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(tasks.public ? "Public" : "Private"),
          ListTile(
            title: Text(
              tasks.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(DateFormat("EEEE, dd MMMM, yyyy").format(tasks.date)),
          ),

          const SizedBox(height: 10.0,),

          if(tasks.description != null)
          ListTile(
            title: Text(tasks.description,),
          ),

          const SizedBox(height: 20.0,),

        ],
      ),
    );
  }
}