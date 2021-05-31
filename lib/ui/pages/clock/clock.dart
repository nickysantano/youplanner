part of '../pages.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  double secondsAngle = 0;
  double minutesAngle = 0;
  double hoursAngle = 0;
  Timer timer;

  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      final now = DateTime.now();
      print(now);

      setState(() {
        secondsAngle = (pi / 30) * now.second;
        minutesAngle = pi / 30 * now.minute;
        hoursAngle = (pi / 6 * now.hour) + (pi / 45 * minutesAngle);
      });
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clock"),
        backgroundColor: Color(0xFFf96060),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Stack(
            children: <Widget>[
              Image.asset('assets/images/clock.png'),

              //seconds
              Transform.rotate(
                child: Container(
                  child: Container(
                    height: 140,
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.black, borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  alignment: Alignment(0, -0.35),
                ),
                angle: secondsAngle,
              ),

              //minutes
              Transform.rotate(
                child: Container(
                  child: Container(
                    height: 115,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.black, borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  alignment: Alignment(0, -0.30),
                ),
                angle: minutesAngle,
              ),

              //hours
              Transform.rotate(
                child: Container(
                  child: Container(
                    height: 75,
                    width: 7,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  alignment: Alignment(0, -0.3),
                ),
                angle: hoursAngle,
              ),

              //dot
              Container(
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(50),
                  ),
                ),
                alignment: Alignment(0, 0),
              ),

            ],
          ),
          width: 370,
          height: 370,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFf96060),
              width: 8,
            ),
            borderRadius: BorderRadius.circular(200),
          ),
        ),
      ),
      
    );
  }
}