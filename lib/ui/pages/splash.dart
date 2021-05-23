part of 'pages.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _loadSplash();
  }

  _loadSplash() async{
    var _duration = Duration(seconds: 3);
    return Timer(_duration, checkAuth);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf96060),
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
            )
          ),
        ),
      ),
    );
  }

  void splashToHome() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, Onboard.routeName);
      },
    );
  }

  void checkAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      Navigator.pushReplacementNamed(context, MainMenu.routeName);
      ActivityServices.showToast("Welcome Back", Colors.blue);
    } else {
      Navigator.pushReplacementNamed(context, Onboard.routeName);
    }
  }
}