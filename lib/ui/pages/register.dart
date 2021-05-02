part of 'pages.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
  static const String routeName = "/register";
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  bool isVisible = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),

      resizeToAvoidBottomInset:
          false, //buat bikin tampilan gapapa pas keyboard keluar

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text("Hi there!", style: TextStyle(fontSize: 35)),
                        Text(
                          "Sign up to continue...",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        TextFormField(
                          controller: ctrlName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(hintText: "your name..."),
                          style: TextStyle(fontSize: 20),
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
                            return value.length < 6
                                ? "Password must have 6 or more characters!"
                                : null;
                          },
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 20),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Users users = new Users("", ctrlName.text,
                                      ctrlEmail.text, ctrlPass.text, "", "");
                                  await AuthServices.signUp(users)
                                      .then((value) {
                                    if (value == "success") {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      ActivityServices.showToast(
                                          "register success", Colors.green);
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  new Login()));
                                    } else {
                                      ActivityServices.showToast(
                                          value, Colors.red);
                                    }
                                  });

                                  //lanjut ke page berikut
                                } else {
                                  //kosongkan aja
                                  Fluttertoast.showToast(
                                      msg: "Please check all fields!",
                                      backgroundColor: Colors.red,
                                      toastLength: Toast.LENGTH_SHORT);
                                }
                              },
                              icon: Icon(Icons.save),
                              label: Text("Register"),
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
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Login()));
                          },
                          child: Text(
                            "Already registered? Login here!",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ),
      ),
    );
  }
}
