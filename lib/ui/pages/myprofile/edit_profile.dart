part of '../pages.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
  static const String routeName = "/useredit";
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    Users users = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      
    );
  }
}