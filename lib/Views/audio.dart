import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/helper/constat_resources.dart';
import 'package:task_4_side_navigation_media_fetching/helper/dimension.dart';
import 'package:task_4_side_navigation_media_fetching/helper/string_resources.dart';
import 'package:task_4_side_navigation_media_fetching/helper/Extension_Pkg/widget_extension.dart';

import '../AudioBloc/music_bloc.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            height: Dimension.D_300,
            width: Dimension.D_300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ConstResource.AUDIO_ASSET_IMAGE),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: Dimension.D_28, sigmaY: Dimension.D_28),
              child: Container(
                color: Colors.black.withOpacity(Dimension.D_0_0_6),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimension.D_30),
                child: Image.asset(ConstResource.AUDIO_ASSET_IMAGE_2,
                    width: Dimension.D_250),
              ),
              SizedBox(
                height: Dimension.D_40,
              ),
              InkWell(
                onTap: () {
                  BlocProvider.of<MusicBloc>(context).add(LoadEvent());
                },
                child: Container(
                  color: Colors.white,
                  child: Text(
                    StringResources.LOAD_MUSIC,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimension.D_15,
                        letterSpacing: Dimension.D_0_6),
                  ),
                ),
              ),
              //Setting the seekbar
              SizedBox(
                height: Dimension.D_50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: Dimension.D_250,
                    child: BlocBuilder<MusicBloc, MusicState>(
                      builder: (context, state) {
                        if (state is Musicplayed) {
                          return Slider.adaptive(
                            onChanged: (value) {
                              var seekPosition =
                                  Duration(seconds: value.toInt());
                              BlocProvider.of<MusicBloc>(context)
                                  .add(SeekPositionChanged(seekPosition));
                            },
                            onChangeEnd: (newValue) async {
                              var seekPosition =
                                  Duration(seconds: newValue.toInt());
                              BlocProvider.of<MusicBloc>(context)
                                  .add(ApplySeekPosition(seekPosition));
                            },
                            value: state.position.inSeconds.toDouble(),
                            min: 0,
                            max: state.duration.inSeconds.toDouble(),
                            activeColor: Colors.white,
                          );
                        }

                        return Text('');
                      },
                    ),
                  ),
                  Text(
                    '',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              SizedBox(
                height: Dimension.D_60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Dimension.D_30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.D_60),
                      color: Colors.black87,
                      border: Border.all(color: Colors.white38),
                    ),
                    width: Dimension.D_50,
                    height: Dimension.D_50,
                    child: InkWell(
                        child: Icon(
                          Icons.fast_rewind_rounded,
                          color: Colors.white,
                        ),
                        onTapDown: (details) {},
                        onTapUp: (details) {}),
                  ),
                  BlocBuilder<MusicBloc, MusicState>(builder: (context, state) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: Dimension.D_20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.D_60),
                        color: Colors.black87,
                        border: Border.all(color: Colors.pink),
                      ),
                      width: Dimension.D_60,
                      height: Dimension.D_60,
                      child: InkWell(
                        onTap: () async {
                          if (state is Musicloading) {
                            BlocProvider.of<MusicBloc>(context)
                                .add(LoadEvent());
                          }
                          if (state is Musicplayed) {
                            BlocProvider.of<MusicBloc>(context)
                                .add(PausedEvent());
                          }
                          if (state is Musicpaused) {
                            BlocProvider.of<MusicBloc>(context)
                                .add(ResumeEvent());
                          }
                        },
                        child: Center(
                          child: Icon(
                            state is Musicplayed
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.D_60),
                      color: Colors.black87,
                      border: Border.all(color: Colors.white38),
                    ),
                    width: 50.0,
                    height: Dimension.D_50,
                    child: InkWell(
                      onTapDown: (details) {},
                      onTapUp: (details) {},
                      child: Icon(
                        Icons.fast_forward_rounded,
                        color: Colors.white,
                      ).centerwidget,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
