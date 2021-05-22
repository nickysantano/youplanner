part of 'pages.dart';

class TaskDetails extends StatelessWidget {
  final Tasks tasks;

  const TaskDetails({Key key, this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
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