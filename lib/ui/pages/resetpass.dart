part of 'pages.dart';

class ResetPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: ResetPass(),
    );
  }
}

class ResetPassPage extends StatefulWidget {
  @override
  _ResetPassPageState createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //   onPressed: ,
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text("Reset Password", style: TextStyle(
              fontSize: 35
            ),),
            Text("Reset code was sent to your email. Please enter the code and create a new password.", style: TextStyle(
              fontSize: 18,
              color: Colors.grey
            ),),
            SizedBox(height:20,),
            Text("Reset Code", style: TextStyle(
              fontSize: 24,
            ),),

            TextField(
              decoration: InputDecoration(
                hintText: "****"
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),

            SizedBox(height:40,),

            Text("Password", style: TextStyle(
              fontSize: 24,
            ),),

            TextField(
              decoration: InputDecoration(
                hintText: "Enter your new password here..."
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),

            SizedBox(height: 40,),

            Text("Confirm Password", style: TextStyle(
              fontSize: 24,
            ),),

            TextField(
              decoration: InputDecoration(
                hintText: "Re-Enter your new password here..."
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),

            Expanded(
              child: Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (context) =>
                        new PasswordChangedSuccess()
                      )
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Color(0xFFf96060)
                    ),
                    child: Text("Change Password", style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}