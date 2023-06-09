import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/helper/constat_resources.dart';
import 'package:task_4_side_navigation_media_fetching/helper/Extension_Pkg/context_extension.dart';
import 'package:task_4_side_navigation_media_fetching/helper/dimension.dart';
import 'package:task_4_side_navigation_media_fetching/helper/string_resources.dart';
import '../Nvigator/bloc/navigator_bloc.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });
  AdvancedDrawerController controller = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: context.widthC * Dimension.D_0_2,
                height: context.heightC * Dimension.D_0_2,
                margin: const EdgeInsets.only(
                  top: Dimension.D_20,
                  bottom: Dimension.D_60,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  ConstResource.HOME_iMAGE,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                onTap: () {
                  BlocProvider.of<NavigatorBloc>(context)
                      .add(loadingImageNavigatorEvent());
                  controller.hideDrawer();
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
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: Dimension.D_12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: Dimension.D_16,
                  ),
                  child: Text(StringResources.TERMS_POLICY),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
