import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/Bloc/Nvigator/bloc/navigator_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/Views/audio.dart';
import 'package:task_4_side_navigation_media_fetching/Views/image.dart';
import 'package:task_4_side_navigation_media_fetching/Views/video.dart';
import 'package:task_4_side_navigation_media_fetching/custom_widgets/drawer.dart';
import 'package:task_4_side_navigation_media_fetching/helper/context_extension.dart';
import 'package:task_4_side_navigation_media_fetching/helper/dimension.dart';
import 'package:task_4_side_navigation_media_fetching/helper/string_resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blueAccent,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: CustomDrawer(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(StringResources.TITle_Name),
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: Dimension.D_250.toInt()),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
          body: BlocBuilder<NavigatorBloc, NavigatorStates>(
            builder: (context, state) {
              if (state is LoadingImageNavigatorState) {
                return ImageScreen();
              }
              if (state is LoadingMusicNavigatorState) {
                return MusicPlayer();
              }
              if (state is LoadingVideoNavigatorState) {
                return VideoScreen();
              }
              return Column(
                children: [
                  SizedBox(
                    height: context.heightC * Dimension.D_0_1,
                  ),
                  Text(StringResources.TITle_Description),
                  Image.asset(
                    'assets/video.png',
                    height: context.heightC * Dimension.D_0_5,
                    width: context.widthC * Dimension.D_0_5,
                  )
                ],
              );
            },
          )),
    );
  }

  _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
