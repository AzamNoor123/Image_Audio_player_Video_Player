import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/custom_widgets/drawer.dart';
import 'package:task_4_side_navigation_media_fetching/helper/constat_resources.dart';
import 'package:task_4_side_navigation_media_fetching/helper/dimension.dart';
import 'package:task_4_side_navigation_media_fetching/helper/string_resources.dart';
import 'package:task_4_side_navigation_media_fetching/helper/widget_extension.dart';

import '../Bloc/ImageBloc/image_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  String aaa = '';

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
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: BlocBuilder<ImageBlocBloc, ImageBlocState>(
          builder: (context, state) {
            if (state is Loading) {
              return Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 100)),
                  Text(StringResources.TITle_Description),
                  Image.asset(
                    ConstResource.HOME_iMAGE,
                    height: 200,
                    width: 200,
                  )
                ],
              ).centerwidget;
            }
            if (state is ImageGetState) {
              aaa = state.images;
            }
            return SizedBox(
              height: Dimension.D_300,
              width: Dimension.D_300,
              //color: Colors.amber,
              child: Image.file(
                File(aaa),
                fit: BoxFit.fill,
              ).centerwidget,
            );
          },
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
