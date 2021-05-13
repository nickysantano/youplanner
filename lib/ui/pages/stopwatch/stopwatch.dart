part of '../pages.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  final Dependencies dependencies = new Dependencies();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Scaffold(
       appBar: AppBar(
          title: Text("Stopwatch"),
          backgroundColor: Color(0xFFf96060),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: new Container(
            alignment: Alignment.center,
            child: mediaQueryData.orientation == Orientation.portrait
                ? MainScreenPortrait(dependencies: dependencies)
                : MainScreenLandscape(dependencies: dependencies)));
  }
}