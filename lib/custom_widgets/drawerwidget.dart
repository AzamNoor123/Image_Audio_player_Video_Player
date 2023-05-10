import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/helper/dimension.dart';

import '../Bloc/Nvigator/bloc/navigator_bloc.dart';
import '../helper/string_resources.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimension.D_50),
      child: SafeArea(
        child: Drawer(
          backgroundColor: Colors.blue,
          child: ListView(
            children: [
              SizedBox(
                height: Dimension.D_100,
              ),
              ListTile(
                onTap: () {
                  BlocProvider.of<NavigatorBloc>(context)
                      .add(loadingImageNavigatorEvent());
                  Navigator.pop(context);
                },
                leading: Icon(Icons.camera_alt_outlined),
                title: Text(StringResources.IMAGES),
              ),
              ListTile(
                onTap: () {
                  BlocProvider.of<NavigatorBloc>(context)
                      .add(loadingMusicNavigatorEvent());
                  Navigator.pop(context);
                },
                leading: Icon(Icons.audio_file_outlined),
                title: Text(StringResources.AUDIO),
              ),
              ListTile(
                onTap: () {
                  BlocProvider.of<NavigatorBloc>(context)
                      .add(loadingVideoNavigatorEvent());
                  Navigator.pop(context);
                },
                leading: Icon(Icons.video_collection_outlined),
                title: Text(StringResources.VIDEOS),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
