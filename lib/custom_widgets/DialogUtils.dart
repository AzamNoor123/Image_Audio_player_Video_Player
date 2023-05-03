import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/Views/home.dart';

import '../Bloc/ImageBloc/image_bloc_bloc.dart';

class dialogUtils extends StatelessWidget {
  const dialogUtils({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Choose Image Source'),
      content: Text('Select Camera or Galery'),
      actions: [
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<ImageBlocBloc>(context).add(ImageFromCamera());

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen()),
                  (Route<dynamic> route) => false);
            },
            child: Icon(Icons.camera_alt_outlined)),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<ImageBlocBloc>(context).add(ImageFromGallery());
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen()),
                  (Route<dynamic> route) => false);
            },
            child: Icon(Icons.image_search))
      ],
    );
  }
}
