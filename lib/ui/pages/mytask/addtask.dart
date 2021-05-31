part of '../pages.dart';

class AddTask extends StatefulWidget {
  final DateTime selectedDate;
  
  const AddTask({Key key, this.selectedDate}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
  static const String routeName = "/addtask";
}

class _AddTaskState extends State<AddTask> {
  
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    Tasks tasks = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Color(0xFFf96060),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Center(
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: () async {
                  //save task
                  bool validated = _formKey.currentState.validate();
                  if(validated){
                    _formKey.currentState.save();
                    final data = Map<String,dynamic>.from(_formKey.currentState.value);
                    data['date'] = (data['date'] as DateTime).millisecondsSinceEpoch;
                    data['user_id'] = FirebaseAuth.instance.currentUser.uid;
                    // data['user_id'] = context.read(userRepoProvider).user.id;
                    if(tasks == null){
                      await taskDBS.create(data);
                    }else{
                      //edit update
                      await taskDBS.updateData(tasks.id, data);
                    }
                    
                    Navigator.pop(context);
                  }

                  // Navigator.push(context,
                  //   new MaterialPageRoute(builder: (context) => new MyTask()));
                },
                child: Text("Save"),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFf96060), elevation: 0),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FormBuilder(
            key: _formKey,
              child: Column(
            children: [
              FormBuilderTextField(
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                ]),
                name: "title",
                initialValue: tasks?.title,
                decoration: InputDecoration(
                  hintText: "Add Title",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 48.0),
                ),
              ),
              Divider(),
              FormBuilderTextField(
                name: "description",
                initialValue: tasks?.description,
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
                title: Text("Important"),
                initialValue: tasks?.public ?? false,
                controlAffinity: ListTileControlAffinity.leading,
                decoration: InputDecoration(border: InputBorder.none),
              ),
              Divider(),
              FormBuilderDateTimePicker(
                name: "date",
                initialValue: tasks != null ? tasks.date : 
                widget.selectedDate ?? DateTime.now(),
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
