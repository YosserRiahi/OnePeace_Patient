import 'package:application_patient/controller/meditation_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CoursOne extends StatefulWidget {
  const CoursOne({super.key});

  @override
  State<CoursOne> createState() => _CoursOneState();
}

class _CoursOneState extends State<CoursOne> {
  late ScrollController scroll;
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  bool position = false;
  @override
  void initState() {
    super.initState();
    scroll = ScrollController(
      initialScrollOffset: 0.0,
    )..addListener(() {
        if (scroll.offset > 400) {
          setState(() {
            position = true;
          });
        } else {
          setState(() {
            position = false;
          });
        }
      });
    initPlayer();
  }

  void initPlayer() async {
    _controller = VideoPlayerController.asset(
        "assets/video/Meditation_and_Visualisation.mp4")
      ..initialize();
    _chewieController = ChewieController(
        videoPlayerController: _controller,
        aspectRatio: _controller.value.aspectRatio)
      ..pause();
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
      backgroundColor: Colors.white,
      body: CustomScrollView(controller: scroll, slivers: [
        SliverAppBar(
          elevation: 0.0,
          expandedHeight: 250,
          backgroundColor: Colors.deepPurple.shade50,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.only(bottom: 10),
            title: Text(
              "Basic of Meditation",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w500, color: Colors.indigo.shade500),
            ),
          ),
          pinned: true,
          floating: false,
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '''
Explain the processes of practising visualisation, candle, and walking techniques of meditation.Outline some of the physical benefits of meditation.Describe the mental benefits of meditation.Outline some of the emotional benefits of meditation.Identify the basics of learning meditation.
Outline the three steps of meditation for beginners.Explain the steps to refining meditation practise.Distinguish between open and closed eyes meditation. 
Outline the appropriate procedures for the different types of meditation.Describe how to perform desk meditation.
                      ''',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.black87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "The basic of meditation:",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  '''
There are several different ways in which to meditate.
At first, it may seem strange to sit still with nothing but your thoughts for company, and you may initially feel restless.
However, it is worth the effort, as training your awareness has the potential to transform your approach to life.
Although meditation can be challenging at first, practise can help maximise its benefits.
              ''',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.black87),
                ),
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Card(
            elevation: 0,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Meditation is fairly simple and straightforward,but beginners may need to be aware of the following:",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      letterSpacing: 1.0, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                child: Text(
                  '''* Your mind will likely be restless, busy and easily distracted at first.
* Do not expect instant results — give yourself time to understand your inner mind.
* Meditation is not only for stressed executives. Anyone, including youngsters or the elderly, can meditate.
* The art of meditation does not take years to learn — you can actually learn it in minutes — but skill and practise help you maximise the benefits.
* Do not try too hard to concentrate or be too worried about achieving the ‘right result’ — just flow with it.

''',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w400, color: Colors.black87),
                ),
              )
            ]),
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
        SliverOpacity(
          opacity: 1,
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Start Practise",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    '''
It’s very easy to learn to meditate. Choose a good place without distractions and clutter, and try to meditate at regular times. Set yourself an achievable meditation goal, and settle down into a comfortable sitting or standing posture.
Get started with simple, seated meditation using the following steps:
''',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        letterSpacing: 0.7, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "Steps: ",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            width: double.infinity,
            height: Get.height * 0.344,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: Get.width * 0.7,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 20,
                    color: Colors.amber.shade200,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Step 1: Find the Right Place and the Right Time",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            Text(
                              '''
* Find a quiet place where you’re likely to be undisturbed.
* Clear the place of clutter and mess.
* If you like, you can light a lightly scented candle or incense stick, to help you relax.
* You can meditate at any time of the day: morning, noon or night.
* Try and meditate at the same time every day, so that you make it a part of your daily routine.

''',
                              textAlign: TextAlign.justify,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      letterSpacing: 0.7,
                                      fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.7,
                  child: Card(
                    elevation: 20,
                    color: Colors.blueAccent.shade100,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Step 2: Set an Achievable Meditation Goal",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            Text(
                              '''
* Find a quiet place where you’re likely to be undisturbed.
* Clear the place of clutter and mess.
* If you like, you can light a lightly scented candle or incense stick, to help you relax.
* You can meditate at any time of the day: morning, noon or night.
* Try and meditate at the same time every day, so that you make it a part of your daily routine.

''',
                              textAlign: TextAlign.justify,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      letterSpacing: 0.7,
                                      fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.7,
                  child: Card(
                    elevation: 20,
                    color: Colors.blue.shade100,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Step 3: Get Seated in a Comfortable Posture",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            Text(
                              '''
* Find a quiet place where you’re likely to be undisturbed.
* Clear the place of clutter and mess.
* If you like, you can light a lightly scented candle or incense stick, to help you relax.
* You can meditate at any time of the day: morning, noon or night.
* Try and meditate at the same time every day, so that you make it a part of your daily routine.

''',
                              textAlign: TextAlign.justify,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      letterSpacing: 0.7,
                                      fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
      floatingActionButton: position
          ? FloatingActionButton(
              backgroundColor: Colors.deepPurple.shade100,
              child: const Icon(
                Icons.arrow_upward_outlined,
              ),
              onPressed: () {
                scroll.animateTo(0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
                Get.find<MeditationController>().addSaison(true, "saison2");
                Get.find<MeditationController>().updateSaison2();
              })
          : Container(),
    );
  }
}
