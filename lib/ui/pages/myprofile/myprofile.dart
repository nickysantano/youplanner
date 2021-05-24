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
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection("users");

    return Scaffold(
        appBar: AppBar(
          title: Text("My Account"),
          backgroundColor: Color(0xFFf96060),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  fit: StackFit.expand,
                  overflow: Overflow.visible,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/profile-icon.png"),
                      backgroundColor: Colors.grey,
                    ),
                    Positioned(
                      right: -12,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                        child: FlatButton(
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.white)
                          ),
                          color: Color(0xFFf5f6f9),
                          onPressed: () {},
                          child: Image.asset("assets/images/camera.png"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // ElevatedButton.icon(
              //     onPressed: () async {
              //       setState(() {
              //         isLoading = true;
              //       });
              //       await AuthServices.signOut().then((value) {
              //         if (value) {
              //           setState(() {
              //             isLoading = false;
              //           });
              //           ActivityServices.showToast(
              //               "Logout success", Colors.greenAccent);
              //           Navigator.push(
              //               context,
              //               new MaterialPageRoute(
              //                   builder: (context) => new Login()));
              //         } else {
              //           setState(() {
              //             isLoading = false;
              //           });
              //           ActivityServices.showToast(msg, Colors.redAccent);
              //         }
              //       });
              //     },
              //     icon: Icon(Icons.logout),
              //     label: Text("Logout"),
              //     style: ElevatedButton.styleFrom(
              //       primary: Color(0xFFf96060),
              //       elevation: 0,
              //     )),
            ),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ));
  }
}
