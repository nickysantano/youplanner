part of 'widgets.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;
  
  const ProfileWidget({
    Key key,
    this.imagePath,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          // Positioned(
          //   bottom: 0,
          //   right: 4,
          //   child: buildEditIcon(color),
          // ),
        ],
      ),
    );
  }

  Widget buildImage(){
    final image = NetworkImage(imagePath);

    return Ink.image(
      image: image,
      fit: BoxFit.cover,
      width: 128,
      height: 128,
    );
  }
}