import 'package:application_patient/controller/meditation_controller.dart';
import 'package:application_patient/data/meditation/data_cours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursThree extends StatefulWidget {
  const CoursThree({super.key});

  @override
  State<CoursThree> createState() => _CoursThreeState();
}

class _CoursThreeState extends State<CoursThree> {
  late PageController _controller;
  late ScrollController _scroll;
  bool position = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0, viewportFraction: 0.8);
    _scroll = ScrollController(initialScrollOffset: 0.0)
      ..addListener(() {
        if (_scroll.offset > 450) {
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

  @override
  void dispose() {
    super.dispose();
    _scroll.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: position
          ? FloatingActionButton(
              onPressed: () {
                _scroll.animateTo(0,
                    duration: const Duration(microseconds: 300),
                    curve: Curves.easeIn);
                Get.find<MeditationController>().addSaison(true, "saison4");
                Get.find<MeditationController>().updateSaison4();
              },
              backgroundColor: Colors.grey,
              child: const Icon(Icons.arrow_upward_outlined),
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
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Refining Your Meditation",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: Get.height * 0.47,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.white,
                child: PageView.builder(
                    controller: _controller,
                    padEnds: false,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      Course course = data[index];
                      return Container(
                        margin: const EdgeInsets.only(
                            right: 10, bottom: 20, left: 10),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    course.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: Colors.deepPurple.shade500,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      course.steps,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(letterSpacing: 0.8),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Open Eyes Versus Closed Eyes:",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Text(
                              "* Closed Eye Meditation :",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text(
                              '''
- When you close your eyes, it makes it easier to cut out visual distractions — you can focus on your sensations.
- Closing your eyes helps you become more aware of subtler experiences, for example, you will sense fragrances and hear soft sounds.
- However, closing your eyes will likely increase the restlessness of your thoughts in the absence of external stimuli.
- Some people also feel sleepy, when they close their eyes.
* Open Eye Meditation : 
- Open eyes can help you focus on an object, and you naturally bring your awareness to every sensation of the present moment.
- However, you may find yourself distracted by external distractions.

''',
                              textAlign: TextAlign.justify,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                          Text(
                            "Notes:",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              '''
Following your breath and expanding your awareness helps you relax.
You can observe the inner workings of your mind, by observing recurring thoughts that hold the key to your inner beliefs.

''',
                              textAlign: TextAlign.justify,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
