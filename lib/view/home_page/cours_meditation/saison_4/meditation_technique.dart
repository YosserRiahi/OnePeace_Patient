// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:application_patient/controller/meditation_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CourseFour extends StatefulWidget {
  const CourseFour({super.key});

  @override
  State<CourseFour> createState() => _CourseFourState();
}

class _CourseFourState extends State<CourseFour> {
  late ScrollController _scroll;
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  bool position = false;
  @override
  void initState() {
    super.initState();
    initPlayer();
    _scroll = ScrollController(
      initialScrollOffset: 0.0,
    )..addListener(() {
        if (_scroll.offset > 550) {
          setState(() {
            position = true;
          });
        } else {
          setState(() {
            position = false;
          });
        }
      });
  }

  void initPlayer() async {
    _controller = VideoPlayerController.asset("assets/video/Meditation_b.mp4")
      ..initialize()
      ..pause();
    _chewieController = ChewieController(
        videoPlayerController: _controller,
        aspectRatio: _controller.value.aspectRatio);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: position
          ? FloatingActionButton(
              elevation: 20,
              backgroundColor: Colors.black87,
              child: const Icon(
                Icons.arrow_upward_rounded,
              ),
              onPressed: () {
                _scroll.animateTo(400,
                    duration: const Duration(microseconds: 700),
                    curve: Curves.linear);
                Get.find<MeditationController>().addSaison(true, "saison5");
                Get.find<MeditationController>().updateSaison5();
              },
            )
          : Container(),
      body: SafeArea(
          child: CustomScrollView(
        controller: _scroll,
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            backgroundColor: Colors.deepPurple.shade50,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Meditation Technique",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: const Color.fromARGB(255, 56, 65, 113),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Star Icon.svg",
                    width: 20,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Visualisation Meditation :",
                        style: Theme.of(context).textTheme.headline6),
                  ),
                ],
              ),
            ),
          ),
          const Visualisation(),
          const CandleMeditation(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                children: [
                  const TitleWalking(),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '''
1. This is a very simple and effective way in which to meditate, especially for beginners.
2. Choose a slightly enclosed path, for example, in a park
3. Avoid very rocky or difficult paths, as part of your mind will be engaged in negotiating the path
4. Ideally, stay away from crowded or noisy areas.
5. Take a few breaths, and anchor your mind to your walking.
6. Keep your feet shoulder-width apart, and balance your weight evenly on both feet.
7. Walk mindfully, observing how your feet rise and fall.
8. Keep the pace steady and even. 
9. Start with at least 15-minute walking sessions.
10. During times of stress, walking meditation may be more relaxing than seated postures.
''',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            // ignore: unnecessary_null_comparison
            child: Container(
                width: double.infinity,
                height: Get.height * 0.3,
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: Chewie(
                  controller: _chewieController,
                )),
          ),
        ],
      )),
    );
  }
}

class TitleWalking extends StatelessWidget {
  const TitleWalking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Star Icon.svg",
          width: 20,
          height: 20,
        ),
        SvgPicture.asset(
          "assets/icons/Star Icon.svg",
          width: 20,
          height: 20,
        ),
        SvgPicture.asset(
          "assets/icons/Star Icon.svg",
          width: 20,
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("Walking Meditation: ",
              style: Theme.of(context).textTheme.headline6),
        ),
      ],
    );
  }
}

class CandleMeditation extends StatelessWidget {
  const CandleMeditation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/Star Icon.svg",
                  width: 20,
                  height: 20,
                ),
                SvgPicture.asset(
                  "assets/icons/Star Icon.svg",
                  width: 20,
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Candle meditation :",
                      style: Theme.of(context).textTheme.headline6),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: 230,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    //1. Sit comfortably and close your eyes.
                    CardCandle(
                      color: Colors.cyan.shade50,
                      title: "1. Sit comfortably and close your eyes.",
                    ),
                    CardCandle(
                      color: Colors.blue.shade50,
                      title:
                          "2. Leave your hands lightly resting on your knees, palms facing upwards.",
                    ),
                    CardCandle(
                      color: Colors.green.shade50,
                      title:
                          "3. Ensure that the room is dimly lit and at a comfortable temperature.",
                    ),
                    CardCandle(
                      color: Colors.purple.shade50,
                      title:
                          "4. Light a candle, and place it at eye level or slightly below at roughly 50-55cm away from you.",
                    ),
                    CardCandle(
                      color: Colors.red.shade50,
                      title:
                          "5. Stare at the candle, and focus on the shape and color of the flame.",
                    ),
                    CardCandle(
                      color: Colors.orange.shade50,
                      title:
                          "6. When thoughts come and go, observe them, without engaging with them.",
                    ),
                    CardCandle(
                      color: Colors.red.shade50,
                      title:
                          "7. Candle meditation not only relieves anxiety and insomnia, it also improves eye health and strengthens memory.",
                    ),
                    CardCandle(
                      color: Colors.grey.shade50,
                      title:
                          "8. If your eyes become watery, cup your palms, and gently touch your eyes — do not rub them.",
                    ),

                    CardCandle(
                      color: Colors.pink.shade50,
                      title:
                          "9. When you have finished, lie down, and keep your eyes closed for 5 minutes, before you open them.",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardCandle extends StatelessWidget {
  const CardCandle({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        color: color,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        width: 200,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}

class Visualisation extends StatelessWidget {
  const Visualisation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            const TextVisualisation(
              duration: Duration(milliseconds: 500),
              title:
                  "1. Sit in a comfortable position on a chair or on the floor, and rest your hands, palms upwards, on your knees.",
            ),
            const TextVisualisation(
                duration: Duration(milliseconds: 550),
                title: '2. Take two or three breaths, to clear your mind.'),
            const TextVisualisation(
                duration: Duration(milliseconds: 600),
                title: '3. Close your eyes.'),
            const TextVisualisation(
                duration: Duration(milliseconds: 650),
                title:
                    '4. Imagine yourself on the beach or in a serene environment.'),
            const TextVisualisation(
                duration: Duration(milliseconds: 700),
                title:
                    '5. Focus on the sensation of the sand on your feet and the warm sun on your back.'),
            const TextVisualisation(
                duration: Duration(milliseconds: 750),
                title:
                    '6. In your mind, listen to the sound of waves washing over your feet and the sensation of water trickling over your toes.'),
            const TextVisualisation(
                duration: Duration(milliseconds: 800),
                title:
                    '7. If you imagine yourself in a forest, listen for the chirping of birds, or feel the gentle wind'),
            const TextVisualisation(
                duration: Duration(milliseconds: 850),
                title:
                    '8. If you feel your mind wandering, gently bring the mental picture back into focus.'),
            const TextVisualisation(
                duration: Duration(milliseconds: 900),
                title:
                    '9. In addition to relaxation, visualisation helps unlock your creativity and imagination.'),
          ],
        ),
      ),
    );
  }
}

class TextVisualisation extends StatelessWidget {
  const TextVisualisation({
    Key? key,
    required this.title,
    required this.duration,
  }) : super(key: key);
  final String title;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1, end: 0),
      duration: duration,
      builder: ((context, value, _) {
        return Transform(
          transform: Matrix4.translationValues(Get.width * value, 0, 0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        );
      }),
    );
  }
}
