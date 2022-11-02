// ignore_for_file: avoid_print

import 'package:application_patient/data/meditation/quiz_data.dart';
import 'package:application_patient/view/home_page/cours_meditation/quiz/score_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));
    animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    pageController.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
    pageController.dispose();
  }

//----------------- values ---------------------//
  bool _isAnswer = false;
  bool get answer => _isAnswer;

  int _correctAnswer = 0;
  int get correctAnswer => _correctAnswer;

  int currentPage = 0;

  int _incorrectAnswer = 0;
  int get incorrectAnswer => _incorrectAnswer;

  final int _pageLength = dataQuiz.length;

  void checkAnswer(Question question, int selectIndex) {
    _isAnswer = true;
    controller.stop();
    if (question.answers == selectIndex + 1) {
      _correctAnswer++;
    } else {
      _incorrectAnswer++;
    }
    if (currentPage == (_pageLength - 1) &&
        controller.isCompleted &&
        !_isAnswer) {
      print("condition verifie");
      Get.off(() => ScoreQuiz(
          correct: correctAnswer, incorrect: incorrectAnswer, lenght: 15));
      controller.stop();
    } else if (currentPage == (_pageLength - 1) && _isAnswer) {
      Get.off(() => ScoreQuiz(
          correct: correctAnswer, incorrect: incorrectAnswer, lenght: 15));
    } else {
      Future.delayed(const Duration(milliseconds: 600), () {
        nextPage();
      });
    }

    update();
  }

  updatePage(int value) {
    currentPage = value;
    update();
  }

  nextPage() {
    if (currentPage < _pageLength) {
      _isAnswer = false;
      controller.reset();
      controller.forward();

      pageController.nextPage(
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
      controller.forward().whenComplete(() {
        nextPage();
      });
    }

    update();
  }
}
