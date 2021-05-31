part of '../pages.dart';

class MyTask extends StatefulWidget {
  @override
  _MyTaskState createState() => _MyTaskState();
  static const String routeName = "/mytask";
}

class _MyTaskState extends State<MyTask> {
  String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference taskCollection =
      FirebaseFirestore.instance.collection("tasks");
  CalendarController _calendarController = CalendarController();
  Map<DateTime, List<Tasks>> _groupedTasks;

  _groupTasks(List<Tasks> tasks) {
    _groupedTasks = {};
    tasks.forEach((task) {
      DateTime date =
          DateTime.utc(task.date.year, task.date.month, task.date.day, 12);
      if (_groupedTasks[date] == null) {
        _groupedTasks[date] = [];
        
        // print('1' + task.toString());
        print(_groupedTasks[date]);
      }
      _groupedTasks[date].add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Task"),
        backgroundColor: Color(0xFFf96060),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: taskDBS.streamQueryList(args: [
            QueryArgsV2(
              'user_id',
              isEqualTo: uid,
            ),
          ]),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final tasks = snapshot.data;
              // print(tasks);
              _groupTasks(tasks);
              DateTime selectedDate = _calendarController.selectedDay;
              final _selectedTasks = _groupedTasks[selectedDate] ?? [];
              print('111' + _groupedTasks[selectedDate].toString());
              print('222'+_selectedTasks.toString());

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    // clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.all(0.0),
                    elevation: 0,
                    child: TableCalendar(
                      calendarController: _calendarController,
                      events: _groupedTasks,
                      onDaySelected: (date, tasks, holidays){
                        setState(() {
                          
                        });
                      },
                      weekendDays: [7],
                      headerStyle: HeaderStyle(
                        decoration: BoxDecoration(
                          color: Color(0xFFf96060),
                        ),
                        headerMargin: const EdgeInsets.only(bottom: 16.0),
                        titleTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                        formatButtonDecoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        formatButtonTextStyle: TextStyle(color: Colors.white),
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                        rightChevronIcon: Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ),
                      calendarStyle: CalendarStyle(
                        selectedColor: Color(0xFFf96060),
                        markersColor: Colors.deepOrange[200],
                        todayColor: Colors.deepOrange[100],
                      ),
                      builders: CalendarBuilders(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                    child: Text(DateFormat('EEEE, dd MMMM yyyy').format(selectedDate ?? DateTime.now()),
                    style: Theme.of(context).textTheme.headline6,),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _selectedTasks.length,
                    // itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Tasks task = tasks[index];
                      Tasks task = _selectedTasks[index];
                      return ListTile(
                        title: Text(task.title),
                        subtitle: Text(DateFormat("EEEE, dd MMMM, yyyy")
                            .format(task.date)),
                        onTap: () => Navigator.pushNamed(
                            context, TaskDetails.routeName,
                            arguments: task),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => Navigator.pushNamed(
                              context, AddTask.routeName,
                              arguments: task),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFFf96060),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: AddTask()));
        },
      ),
    );
  }
}
