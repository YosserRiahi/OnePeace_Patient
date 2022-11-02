// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:application_patient/core/constant/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreQuiz extends StatelessWidget {
  const ScoreQuiz({
    Key? key,
    required this.correct,
    required this.incorrect,
    required this.lenght,
  }) : super(key: key);
  final int correct;
  final int incorrect;
  final int lenght;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.deepPurple.shade50,
        leading: IconButton(
            onPressed: () {
              Get.offNamed(RoutesName.home);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          "Score Quiz",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Correct Answers : ",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    correct.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "InCorrect Answers : ",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(incorrect.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Answers : ",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    lenght.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
