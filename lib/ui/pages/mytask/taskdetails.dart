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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit), 
            onPressed: ()=> Navigator.pushReplacementNamed(
              context, AddTask.routeName, arguments: tasks
            ),
          ),

          IconButton(
            icon: Icon(Icons.delete), 
            onPressed: () async{
              //delete
              final confirm = await showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  title: Text("WARNING!"),
                  content: Text("Are you sure you wanted to delete?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, true), 
                      child: Text("Delete")
                    ),

                    TextButton(
                      onPressed: () => Navigator.pop(context, false), 
                      child: Text("Cancel", style: TextStyle(
                        color: Colors.grey.shade700
                      ),)
                    ),
                  ],
                ),
              ) ?? false;

              if(confirm){
                //delete and pop
                await taskDBS.removeItem(tasks.id);
                Navigator.pop(context);
              }
            },
          ),
        ],
        // title: Text("Task Details"),
        backgroundColor: Color(0xFFf96060),
        // automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(tasks.public ? "Public" : "Private"),
          ListTile(
            leading: Icon(Icons.event),
            title: Text(
              tasks.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(DateFormat("EEEE, dd MMMM, yyyy").format(tasks.date)),
          ),

          const SizedBox(height: 10.0,),

          if(tasks.description != null)
          ListTile(
            leading: Icon(Icons.short_text),
            title: Text(tasks.description,),
          ),

          const SizedBox(height: 20.0,),

        ],
      ),
    );
  }
}