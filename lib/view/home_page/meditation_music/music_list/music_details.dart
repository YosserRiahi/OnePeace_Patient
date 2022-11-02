// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:audioplayers/audioplayers.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:application_patient/data/categories_music/models/categorie_model.dart';
import 'package:lottie/lottie.dart';

class DetailsMusic extends StatefulWidget {
  final Musiques music;
  const DetailsMusic({
    Key? key,
    required this.music,
  }) : super(key: key);

  @override
  State<DetailsMusic> createState() => _DetailsMusicState();
}

class _DetailsMusicState extends State<DetailsMusic> {
  final _player = AudioPlayer();
  bool isplaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    super.initState();

    _player.setSourceUrl(widget.music.url!);
    _player.onPlayerStateChanged.listen((event) {
      setState(() {
        isplaying = event == PlayerState.playing;
      });
    });
    _player.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    _player.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: baseColor,
        leading: const GetbackButton(),
        title: Text(
          'Music Meditation',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.grey),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClayContainer(
                spread: 2,
                color: baseColor,
                curveType: CurveType.none,
                width: 40,
                height: 30,
                depth: 50,
                borderRadius: 15,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/icons/Heart Icon.svg"),
                )),
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: Get.width,
          height: Get.height,
          color: baseColor,
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                const LogoMusic(),
                const Spacer(),
                Text(
                  "Music Title",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(
                  widget.music.title ?? "",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black45, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Slider(
                  inactiveColor: Colors.white,
                  activeColor: Colors.grey.shade300,
                  value: position.inSeconds.toDouble(),
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await _player.seek(position);
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClayContainer(
                      width: Get.width * 0.15,
                      height: Get.width * 0.15,
                      color: baseColor,
                      borderRadius: Get.width * 0.07,
                      curveType: CurveType.none,
                      depth: 40,
                      child: Center(
                        child: Icon(
                          Icons.arrow_left,
                          size: Get.width * 0.12,
                          color: Colors.deepPurpleAccent.withOpacity(0.6),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (isplaying) {
                          await _player.pause();
                        } else {
                          await _player.play(UrlSource(widget.music.url!));
                        }
                      },
                      child: ClayContainer(
                        width: Get.width * 0.15,
                        height: Get.width * 0.15,
                        color: baseColor,
                        borderRadius: Get.width * 0.07,
                        curveType: CurveType.none,
                        depth: 40,
                        child: Center(
                          child: isplaying
                              ? Icon(
                                  Icons.pause_circle,
                                  size: Get.width * 0.12,
                                  color: Colors.black12,
                                )
                              : Icon(
                                  Icons.play_arrow,
                                  size: Get.width * 0.12,
                                  color: Colors.black12,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        _player.pause();
                      },
                      child: ClayContainer(
                        width: Get.width * 0.15,
                        height: Get.width * 0.15,
                        color: baseColor,
                        depth: 40,
                        borderRadius: Get.width * 0.07,
                        curveType: CurveType.none,
                        child: Center(
                          child: Icon(
                            Icons.arrow_right,
                            size: Get.width * 0.12,
                            color: Colors.deepPurpleAccent.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GetbackButton extends StatelessWidget {
  const GetbackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: ClayContainer(
          spread: 2,
          color: baseColor,
          curveType: CurveType.none,
          height: 20,
          width: 20,
          depth: 50,
          borderRadius: 10,
          child: const Center(
              child: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 20,
          )),
        ),
      ),
    );
  }
}

class LogoMusic extends StatelessWidget {
  const LogoMusic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      width: Get.width * 0.5,
      height: Get.width * 0.5,
      color: baseColor,
      depth: 100,
      borderRadius: Get.width * 0.25,
      curveType: CurveType.none,
      child: LottieBuilder.asset("assets/categorie/animation_music.json"),
    );
  }
}
