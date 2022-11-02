// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:application_patient/data/categories_music/models/categorie_model.dart';
import 'package:application_patient/view/home_page/meditation_music/music_list/music_details.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartListing extends StatefulWidget {
  const StartListing({
    Key? key,
    required this.music,
  }) : super(key: key);
  final List<Musiques> music;

  @override
  State<StartListing> createState() => _StartListingState();
}

class _StartListingState extends State<StartListing> {
  late PageController _pageController;

  bool _isplaying = false;
  // ignore: non_constant_identifier_names
  int? current_index;

  toggle() {
    setState(() {
      _isplaying = !_isplaying;
      current_index = null;
    });
  }

  setindexplay(int index) {
    setState(() {
      current_index = index;
      _isplaying = true;
    });
  }

  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _player.onPlayerStateChanged.listen((event) {
      setState(() {
        _isplaying = event == PlayerState.playing;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        elevation: 0,
        leading: const GetbackButton(),
      ),
      body: SafeArea(
          bottom: false,
          // ignore: sized_box_for_whitespace
          child: Container(
            width: double.infinity,
            height: Get.height,
            color: baseColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.4,
                    child: Card(
                      color: baseColor,
                      elevation: 0,
                      child: PageView.builder(
                          controller: _pageController,
                          itemCount: widget.music.length,
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (value) {},
                          itemBuilder: ((context, index) {
                            Musiques morceau = widget.music[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const LogoMusic(),
                                Center(
                                    child: Text(
                                  morceau.title!,
                                  style: Theme.of(context).textTheme.headline4,
                                )),
                              ],
                            );
                          })),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView.builder(
                      itemCount: widget.music.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Musiques morceau = widget.music[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            elevation: 4,
                            color: baseColor,
                            shadowColor: baseColor.withOpacity(0.9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(10),
                              onTap: () {
                                _player.play(UrlSource(morceau.url!));
                                setindexplay(index);
                                _pageController.jumpToPage(
                                  index,
                                );
                              },
                              title: Text(
                                morceau.title!,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      toggle();
                                      _player.stop();
                                    },
                                    child: current_index == index
                                        ? const Icon(
                                            Icons.pause_circle_filled_rounded)
                                        : const Icon(Icons.play_arrow_rounded)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
