import 'package:application_patient/controller/meditation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursFive extends StatefulWidget {
  const CoursFive({super.key});

  @override
  State<CoursFive> createState() => _CoursFiveState();
}

class _CoursFiveState extends State<CoursFive> {
  late ScrollController _controller;
  bool position = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        if (_controller.offset > 450) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Benetifs of Meditation Practise",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      floatingActionButton: position
          ? FloatingActionButton(
              backgroundColor: Colors.black87,
              onPressed: () {
                _controller.animateTo(0,
                    duration: const Duration(seconds: 1), curve: Curves.easeIn);
                Get.find<MeditationController>().addSaison(true, "quiz");
                Get.find<MeditationController>().updateQuiz();
              },
              child: const Icon(Icons.arrow_upward_outlined),
            )
          : Container(),
      body: SafeArea(
          bottom: false,
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Text(
                      '''
Meditation is a reliable way in which to control and dismiss troublesome and stressful thoughts that keep us from feeling happy and healthy.
The practise is also known to rewire the brain and reset our internal programming, to help us respond better to life’s challenges.
Meditation is a safe, non-invasive set of techniques that are used to focus attention in a mindful way and heighten awareness.
Through regular practise, you can expect to enjoy a wide range of physical, mental, and emotional benefits.
''',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            letterSpacing: 1.0,
                          ),
                    ),
                  ),
                  Text(
                    "Physical Benefits: ",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '''
1. Helps lower blood pressure.
2. Helps lower cholesterol levels.
3. Helps increase energy levels
4. Helps relax nerve signals that are responsible for tension in blood vessels and controlling cardiovascular co-ordination.
5. Reduces tension-related pain, including headaches, muscle aches, and joint pain — as your mind relaxes, so does your body, and the tight muscles gradually release stored tension.
6. Strengthens the immune system and helps you become more resistant to disease.
7. Calms your breathing.
8. Helps you sleep better — it helps streamline your thoughts in preparation for a good night’s sleep.
Not only does meditation help you sleep better, it also helps you stay asleep for longer.
9. Makes pain management easier for patients dealing with chronic pain conditions, such as arthritis or cancer — meditation helps alter the perception of pain in the brain.
''',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(letterSpacing: 1.0),
                    ),
                  ),
                  Text(
                    "Mental Benefits: ",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '''
1. Increased concentration, focus, and cognitive abilities — meditation is known to reverse poor attention patterns and absent-mindedness by bringing your awareness to the present moment.
2. Reduces the release of cortisol (a stress hormone) and cytokines (inflammation-causing chemicals).
3. It controls anxiety symptoms, including shallow breathing, paranoid thoughts, panic attacks, and obsessive-compulsive behaviors.
4. Promotes creativity, imagination, and mental agility.
5. Helps stave off degenerative conditions, such as Alzheimer’s and dementia, by strengthening brain health.
6. Improves myelin (a protective sheath for nerves made of phospholipids and proteins) and the density of nerve fibers.
7. Modern research shows that meditation helps strengthen the grey matter in the hippocampus in the brain, which is the area that is responsible for memory and learning.
''',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(letterSpacing: 1.0),
                    ),
                  ),
                  Text(
                    "Emotional Benefits: ",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '''
1. Encourages the production of serotonin, a mood-enhancing chemical, which, in turn, boosts feelings of well-being — people who practise meditation regularly are less vulnerable to depression and anxiety-related conditions.
2. Promotes mental clarity and peace of mind.
3. Boosts emotional wellbeing.
4. Helps you respond, rather than react impulsively to situations.
5. Increases feelings of compassion and empathy.
6. Increases self-awareness. 
''',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(letterSpacing: 1.0),
                    ),
                  ),
                  Text(
                    "Meditation Requirements: ",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '''
The good news is that meditation does not require any expensive equipment.
Moreover, you can meditate for a few minutes anywhere you want and at any time: at your desk, in the house, in the park, or before a meeting.
Although some people practise meditation for spiritual purposes, it requires no religious affiliation.
Regardless of your faith or religion or lack of it, you can practise meditation and reap its benefits.
Meditation is a holistic healing practise that relieves stress, reduces anxiety, and promotes general well-being.
You become a calmer, stronger, and more self-aware person and feel better physically, mentally, and emotionally.
''',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(letterSpacing: 1.0),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
