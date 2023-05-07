import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/helper/dimension.dart';
import 'package:task_4_side_navigation_media_fetching/helper/widget_extension.dart';

import '../Bloc/ImageBloc/image_bloc_bloc.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<ImageBlocBloc, ImageBlocState>(
            builder: (context, state) {
              if (state is ImageGetState) {
                return Padding(
                  padding: const EdgeInsets.only(top: Dimension.D_100),
                  child: Container(
                      height: Dimension.D_250,
                      width: Dimension.D_250,
                      color: Colors.amber,
                      child: Image.file(
                        File(state.images),
                        fit: BoxFit.fill,
                      )),
                );
              }

              return Text('No Image is Picked')
                  .padding(EdgeInsets.only(top: Dimension.D_100))
                  .centerwidget;
            },
          ).centerwidget,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    BlocProvider.of<ImageBlocBloc>(context)
                        .add(ImageFromCamera());
                  },
                  icon: Icon(Icons.camera_alt_outlined),
                  label: Text('Camera')),
              ElevatedButton.icon(
                  onPressed: () {
                    BlocProvider.of<ImageBlocBloc>(context)
                        .add(ImageFromGallery());
                  },
                  icon: Icon(Icons.filter),
                  label: Text('Gallery'))
            ],
          ).padding()
        ],
      ),
    );
  }
}
