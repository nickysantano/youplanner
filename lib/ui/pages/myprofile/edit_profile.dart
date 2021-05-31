part of '../pages.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
  static const String routeName = "/useredit";
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isVisible = true;
  String password = '';

  @override
  Widget build(BuildContext context) {
    Users users = ModalRoute.of(context).settings.arguments;
    final ctrlName = TextEditingController(text: users.name);
    final ctrlDescription = TextEditingController(text: users.description);
    final ctrlPassword = TextEditingController(text: users.password);
    final ctrlEmail = TextEditingController(text: users.email);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Color(0xFFf96060),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Center(
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: () async {
                  //save task
                  bool validated = _formKey.currentState.validate();
                  if (validated) {
                    _formKey.currentState.save();
                    final data =
                        Map<String, dynamic>.from(_formKey.currentState.value);
                    data['user_id'] = FirebaseAuth.instance.currentUser.uid;
                    // data['user_id'] = context.read(userRepoProvider).user.id;
                    // if (users == null) {
                    //   await taskDBS.create(data);
                    // } else {
                    //   //edit update
                    //   await taskDBS.updateData(users.uid, data);
                    // }
                    Users users = Users(
                        "",
                        ctrlName.text,
                        ctrlEmail.text,
                        ctrlPassword.text,
                        defaultPicturePath,
                        ctrlDescription.text,
                        "",
                        "");
                    await AuthServices.editProfile(users).then((value) =>
                        ActivityServices.showToast(
                            "Berhasil Disimpan", Colors.green));
                    // isLoading = false;
                    // Navigator.pushReplacementNamed(context, Profile.routeName);
                    Navigator.pop(context);
                  }

                  // Navigator.push(context,
                  //   new MaterialPageRoute(builder: (context) => new MyTask()));
                },
                child: Text("Save"),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFf96060), elevation: 0),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: ctrlName,
                    // initialValue: users?.name,
                    decoration: InputDecoration(
                      labelText: "your name",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.isEmpty ? "Wajib diisi" : null;
                    },
                  ),

                  SizedBox(
                    height: 24,
                  ),

                  TextFormField(
                    controller: ctrlPassword,
                    obscureText: isVisible,
                    // initialValue: users?.password,
                    decoration: InputDecoration(
                      labelText: "your password",
                      border: InputBorder.none,
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
                      prefixIcon: Icon(Icons.vpn_key),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.isEmpty ? "Wajib diisi" : null;
                    },
                  ),

                  SizedBox(
                    height: 24,
                  ),

                  TextFormField(
                    controller: ctrlDescription,
                    // initialValue: users?.description,
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "your description",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.short_text),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return value.isEmpty ? "Wajib diisi" : null;
                    },
                  ),

                  SizedBox(
                    height: 24,
                  ),

                  // FormBuilderTextField(
                  //   validator: FormBuilderValidators.compose([
                  //     FormBuilderValidators.required(context),
                  //   ]),
                  //   name: "name",
                  //   controller: ctrlName,
                  //   initialValue: users?.name,
                  //   decoration: InputDecoration(
                  //     hintText: "your name...",
                  //     border: InputBorder.none,
                  //     prefixIcon: Icon(Icons.account_circle),
                  //     // contentPadding: const EdgeInsets.only(left: 48.0),
                  //   ),
                  // ),
                  // Divider(),
                  // FormBuilderTextField(
                  //   validator: FormBuilderValidators.compose([
                  //     FormBuilderValidators.required(context),
                  //     (value) {
                  //       password = value;
                  //       return value.length < 6
                  //           ? "Password must have at least 6 characters!"
                  //           : null;
                  //     },
                  //   ]),
                  //   name: "password",
                  //   initialValue: users?.password,
                  //   obscureText: isVisible,
                  //   decoration: InputDecoration(
                  //       hintText: "your password...",
                  //       border: InputBorder.none,
                  //       prefixIcon: Icon(Icons.vpn_key),
                  //       suffixIcon: new GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             isVisible = !isVisible;
                  //           });
                  //         },
                  //         child: Icon(isVisible
                  //             ? Icons.visibility
                  //             : Icons.visibility_off),
                  //       )
                  //       // contentPadding: const EdgeInsets.only(left: 48.0),
                  //       ),
                  // ),
                  // Divider(),
                  // FormBuilderTextField(
                  //   name: "description",
                  //   initialValue: users?.description,
                  //   minLines: 1,
                  //   maxLines: 5,
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     hintText: "your description...",
                  //     prefixIcon: Icon(Icons.short_text),
                  //   ),
                  // ),
                ],
              ))
        ],
      ),
    );
  }
}
