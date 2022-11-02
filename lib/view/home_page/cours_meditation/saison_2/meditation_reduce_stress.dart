import 'package:application_patient/controller/meditation_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CourseTwo extends StatefulWidget {
  const CourseTwo({super.key});

  @override
  State<CourseTwo> createState() => _CourseTwoState();
}

class _CourseTwoState extends State<CourseTwo> {
  late VideoPlayerController _controller;
  late ChewieController _chewie;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/Meditation_a.mp4")
      ..initialize()
      ..addListener(() {
        _controller.position.whenComplete(() {
          Get.find<MeditationController>().addSaison(true, "saison3");
          Get.find<MeditationController>().updateSaison3();
        });
      });
    _chewie = ChewieController(
        aspectRatio: _controller.value.aspectRatio,
        videoPlayerController: _controller)
      ..pause();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewie.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100.withOpacity(0.6),
      appBar: AppBar(
        elevation: 0,
        title: const Text("Meditation To Reduce Stress"),
        backgroundColor: Colors.deepPurple.shade100.withOpacity(0.7),
      ),
      body: SafeArea(
        child: Chewie(
          controller: _chewie,
        ),
      ),
    );
  }
}
