part of 'pages.dart';

class ForgotPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: ForgotPassPage(),
    );
  }
}

class ForgotPassPage extends StatefulWidget {
  @override
  _ForgotPassPageState createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
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
            Text("Forgot Password", style: TextStyle(
              fontSize: 35
            ),),
            Text("Please enter your mail ID to receive your password and reset information", style: TextStyle(
              fontSize: 18,
              color: Colors.grey
            ),),
            SizedBox(height:20,),
            Text("Mail ID", style: TextStyle(
              fontSize: 24,
            ),),

            TextField(
              decoration: InputDecoration(
                hintText: "nicky@example.com"
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),

            SizedBox(height:40,),

            Center(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                      new ResetPass()
                    )
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: Color(0xFFf96060)
                  ),
                  child: Text("Send Request", style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}