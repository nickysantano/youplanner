part of '../pages.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}