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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              // clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.all(0.0),
              elevation: 0,
              child: TableCalendar(
                calendarController: _calendarController,
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
                calendarStyle: CalendarStyle(),
                builders: CalendarBuilders(),
              ),
            ),

            StreamBuilder(
               stream: taskDBS.streamQueryList(args: [
                QueryArgsV2(
                  'user_id',
                  isEqualTo: uid,
                ),
              ]),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  final tasks = snapshot.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      Tasks task = tasks[index];
                      return ListTile(
                        title: Text(task.title),
                        subtitle: Text(DateFormat("EEEE, dd MMMM, yyyy").format(task.date)),
                        onTap: () => Navigator.pushNamed(
                          context, TaskDetails.routeName, arguments: task
                        ),
                      );
                    },
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFf96060),
        onPressed: () {
          Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: AddTask()));
        },
      ),
    );
  }
}
