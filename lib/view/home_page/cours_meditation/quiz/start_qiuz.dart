import 'package:application_patient/controller/quiz_controller.dart';
import 'package:application_patient/data/meditation/quiz_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class QuizDetails extends StatelessWidget {
  QuizController controller = Get.put(QuizController());

  QuizDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple.shade500,
      ),
      body: GetBuilder<QuizController>(builder: (controller) {
        return SafeArea(
          bottom: false,
          child: SizedBox(
            width: double.infinity,
            height: Get.height,
            child: Column(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                      animation: controller.controller,
                      builder: (context, child) {
                        return LayoutBuilder(builder: (context, constraints) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Stack(
                                fit: StackFit.loose,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 30,
                                    padding: const EdgeInsets.only(left: 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                  ),
                                  Container(
                                    width: constraints.maxWidth *
                                        controller.animation.value,
                                    height: 28,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.black,
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight,
                                            colors: [
                                              Colors.deepPurple.shade100,
                                              Colors.deepPurple.shade200,
                                              Colors.deepPurple.shade300
                                            ]),
                                        border: Border.all(
                                            color: Colors.grey.shade100,
                                            width: 2)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      }),
                ),
                Expanded(
                  flex: 6,
                  child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: dataQuiz.length,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (value) {
                        controller.updatePage(value);
                      },
                      itemBuilder: (context, index) {
                        Question question = dataQuiz[index];
                        return Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  question.question,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: question.options.length,
                                  itemBuilder: (context, value) {
                                    String option = question.options[value];
                                    return GestureDetector(
                                      onTap: () {
                                        controller.checkAnswer(question, value);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.black26,
                                                width: 2)),
                                        height: 110,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                option,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
