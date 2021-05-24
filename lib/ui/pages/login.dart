part of 'pages.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
  static const String routeName = "/onboard";
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  // final AuthServices auth = AuthServices();

  bool isVisible = true;
  bool isLoading = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Welcome back!",
                        style: TextStyle(fontSize: 35),
                      ),
                      Text(
                        "Sign in to continue...",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      TextFormField(
                        controller: ctrlEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                          InputDecoration(hintText: "email@example.com"),
                        style: TextStyle(fontSize: 20),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          email = value;
                          if (value.isEmpty) {
                            return "Please fill all field!";
                          } else {
                            if (!EmailValidator.validate(value)) {
                              return "Email is not valid!";
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      TextFormField(
                        controller: ctrlPass,
                        obscureText: isVisible,
                        decoration: InputDecoration(
                            suffixIcon: new GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible =
                                      !isVisible; //tulisan gini supaya isa balik" visibilitynya
                                });
                              },
                              child: Icon(isVisible
                                      ? Icons.visibility
                                      : Icons
                                          .visibility_off //biar icon isa ganti" pas dipencet nanti
                                  ),
                            ),
                            hintText: "your password..."),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          password = value;
                          return value.length < 6
                              ? "Password must have 6 or more characters!"
                              : null;
                        },
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 20),
                        child: Center(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              print(email + password);
                              if (_formKey.currentState.validate()) {
                                //melanjutkan ke tahap berikutnya
                                setState(() {
                                  isLoading = true;
                                });
                                await AuthServices.signIn(email, password)
                                    .then((value) {
                                  if (value == "success") {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ActivityServices.showToast(
                                        "Login success", Colors.greenAccent);
                                    Navigator.push(
                                        context, PageTransition(type: PageTransitionType.fade, child: MainMenu()));
                                        Phoenix.rebirth(context);
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ActivityServices.showToast(
                                        value, Colors.redAccent);
                                  }
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Please check the field",
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white);
                              }
                            },
                            icon: Icon(Icons.login_rounded),
                            label: Text("Login"),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFf96060),
                              elevation: 0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Register()));
                        },
                        child: Text(
                          "Not Registered yet? Join Now.",
                          style: TextStyle(
                            color: Colors.deepOrange[400],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ),
      ),
    );
  }
}
