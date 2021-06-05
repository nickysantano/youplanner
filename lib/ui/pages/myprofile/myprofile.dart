part of '../pages.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = false;
  String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFFf96060),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: StreamBuilder<QuerySnapshot>(
              stream: userCollection.where('uid', isEqualTo: uid).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return ProfilePic(
                    img: "assets/images/profile-icon.png",
                    name: "none",
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ActivityServices.loadings();
                }

                return new ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    Users users;
                    users = new Users(
                      doc.data()['uid'],
                      doc.data()['name'],
                      doc.data()['email'],
                      doc.data()['password'],
                      doc.data()['imagePath'],
                      doc.data()['description'],
                      doc.data()['createdAt'],
                      doc.data()['updatedAt'],
                    );

                    return Column(
                      children: [
                        ProfilePic(
                          name: users.name,
                          img: users.imagePath,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          users.description
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProfileMenu(
                          press: () {
                            Navigator.pushNamed(context, EditProfile.routeName, arguments: users);
                          },
                          text: "Edit Profile",
                          icon: Icons.edit,
                        ),
                        ProfileMenu(
                            press: () async {
                              setState(() {
                                isLoading = true;
                              });
                              await AuthServices.signOut().then((value) {
                                setState(() {
                                  isLoading = false;
                                });
                                if (value == true) {
                                  ActivityServices.showToast(
                                      "Logout Success", Color(0xFFf96060));
                                  Navigator.pushReplacementNamed(
                                      context, Login.routeName);
                                } else {
                                  ActivityServices.showToast(
                                      "Log Out Failed", Color(0xFFFF7751));
                                }
                              });
                            },
                            text: "Log Out",
                            icon: Icons.logout),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ),
          isLoading == true ? ActivityServices.loadings() : Container()
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    this.press,
    this.icon,
    this.text,
  }) : super(key: key);

  final Function press;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFF5F6F9),
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Color(0xFFf96060),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              )
            ],
          )),
    );
  }
}

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key key,
    this.img,
    this.name,
  }) : super(key: key);

  final String img;
  final String name;

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future chooseFile(String type) async {
    ImageSource imgSrc;
    if (type == "camera") {
      imgSrc = ImageSource.camera;
    } else {
      imgSrc = ImageSource.gallery;
    }

    final selectedImage = await imagePicker.getImage(
      source: imgSrc,
      imageQuality: 50,
    );
    setState(() {
      imageFile = selectedImage;
    });
  }

  void showFileDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Confirmation"),
            content: Text("Pick image from:"),
            actions: [
              ElevatedButton.icon(
                onPressed: () async {
                  await chooseFile("camera");
                  if (imageFile != null) {
                    await AuthServices.changeProfilePicture(imageFile)
                        .then((value) {
                      if (value == true) {
                        ActivityServices.showToast(
                            "Profile pic updated", Color(0xFFf96060));
                      } else {
                        ActivityServices.showToast(
                            "Error update profile", Color(0xFFFF7751));
                      }
                    });
                  }
                },
                icon: Icon(Icons.camera_alt_outlined),
                label: Text("camera"),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  await chooseFile("gallery");
                  if (imageFile != null) {
                    await AuthServices.changeProfilePicture(imageFile)
                        .then((value) {
                      if (value == true) {
                        ActivityServices.showToast(
                            "Profile pic updated", Color(0xFFf96060));
                      } else {
                        ActivityServices.showToast(
                            "Error update profile", Color(0xFFFF7751));
                      }
                    });
                  }
                },
                icon: Icon(Icons.picture_as_pdf_outlined),
                label: Text("Gallery"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: [
              CircleAvatar(
                backgroundImage: widget.img == defaultPicturePath
                    ? AssetImage(widget.img)
                    : NetworkImage(widget.img),
              ),
              Positioned(
                right: -12,
                bottom: 0,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      showFileDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white)),
                      primary: Color(0xFFF5F6F9),
                      elevation: 0,
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          widget.name,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        )
      ],
    );
  }
}
