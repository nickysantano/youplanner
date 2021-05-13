part of '../pages.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isLoading = false;
  String msg = "Fail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Account"),
          backgroundColor: Color(0xFFf96060),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await AuthServices.signOut().then((value) {
                      if (value) {
                        setState(() {
                          isLoading = false;
                        });
                        ActivityServices.showToast(
                            "Logout success", Colors.greenAccent);
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new Login()));
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                        ActivityServices.showToast(msg, Colors.redAccent);
                      }
                    });
                  },
                  icon: Icon(Icons.logout),
                  label: Text("Logout"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFf96060),
                    elevation: 0,
                  )),
            ),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ));
  }
}
