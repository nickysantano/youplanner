part of 'pages.dart';

class PasswordChangedSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: PasswordChangedSuccessPage(),
    );
  }
}

class PasswordChangedSuccessPage extends StatefulWidget {
  @override
  _PasswordChangedSuccessPageState createState() => _PasswordChangedSuccessPageState();
}

class _PasswordChangedSuccessPageState extends State<PasswordChangedSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/success.png")
              )
            ),
          ),
          Text("Successful!", style: TextStyle(
            fontSize: 35
          ),),
          Text("You've successfully changed your password. Sign in using your new password!", style: TextStyle(
            fontSize: 18,
            color: Colors.grey
          ),textAlign: TextAlign.center,),
          SizedBox(height: 70,),
          Center(
            child: InkWell(
              onTap: (){

              },
              child: Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (context) =>
                        new Login()
                      )
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Color(0xFFf96060)
                    ),
                    child: Text("Login Again", style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}