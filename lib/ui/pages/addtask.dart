part of 'pages.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
  static const String routeName = "/addtask";
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Color(0xFFf96060),
          ),
          onPressed: () {},
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new MyTask()));
                //save task
              },
              child: Text("Save"),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FormBuilder(
              child: Column(
            children: [
              FormBuilderTextField(
                name: "title",
                decoration: InputDecoration(
                  hintText: "Add Title",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 48.0),
                ),
              ),
              Divider(),
              FormBuilderTextField(
                name: "description",
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add Details",
                  prefixIcon: Icon(Icons.short_text),
                ),
              ),
              Divider(),
              FormBuilderSwitch(
                name: "public",
                title: Text("Public"),
                initialValue: false,
                controlAffinity: ListTileControlAffinity.leading,
                decoration: InputDecoration(border: InputBorder.none),
              ),
              Divider(),
              FormBuilderDateTimePicker(
                name: "date",
                initialValue: DateTime.now(),
                fieldHintText: "Add Date",
                inputType: InputType.date,
                format: DateFormat('EEEE, dd MMMM, yyyy'),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.calendar_today_sharp)),
              )
            ],
          ))
        ],
      ),
    );
  }
}
