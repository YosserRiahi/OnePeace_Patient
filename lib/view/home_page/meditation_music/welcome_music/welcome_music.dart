import 'package:application_patient/controller/categore_controller.dart';
import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:application_patient/data/categories_music/models/categorie_model.dart';
import 'package:application_patient/view/home_page/meditation_music/all_music/start_listing.dart';
import 'package:application_patient/view/home_page/meditation_music/music_list/music_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class WelcomeMusic extends StatelessWidget {
  WelcomeMusic({Key? key}) : super(key: key);
  CategorieController controller = Get.put(CategorieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      extendBodyBehindAppBar: true,
      body: GetBuilder<CategorieController>(builder: (controller) {
        return SafeArea(
          bottom: false,
          top: true,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              color: baseColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const WelcomeUser(
                        user: " ",
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.close_outlined),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const SubtitleWelcome(),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.center,
                        colors: [Colors.black12, Colors.black26],
                      ),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          bottom: 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 0,
                          child: SvgPicture.asset(
                            "assets/animations/meditation.svg",
                            width: Get.width * 0.29,
                            height: Get.width * 0.29,
                            color: Colors.deepPurple.shade200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TitleCardWelcome(),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              const SubTitleWelcome(),
                              const Spacer(),
                              ButtonListMusic(
                                press: () {
                                  Get.to(() => StartListing(
                                        music: controller.music,
                                      ));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  const SelectTitle(),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const SubTitleSelect(),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.categorie.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 7,
                    ),
                    itemBuilder: (context, index) {
                      final categorie = controller.categorie[index];
                      final morceau = categorie.musiques!.first;
                      return InkWell(
                          onTap: () {
                            Get.to(() => DetailsMusic(music: morceau));
                          },
                          child: CardCategorie(
                              categorie: categorie, press: () {}));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CardCategorie extends StatelessWidget {
  const CardCategorie({
    Key? key,
    required this.categorie,
    required this.press,
  }) : super(key: key);

  final Categorie categorie;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            fadeInCurve: Curves.easeIn,
            width: 100,
            height: 100,
            fadeOutCurve: Curves.linear,
            fadeInDuration: const Duration(seconds: 3),
            imageUrl: categorie.imageUrl ?? "",
            errorWidget: (context, url, error) {
              return SvgPicture.asset("assets/icons/Eroor.svg");
            },
            placeholder: ((context, url) {
              return Image.asset("assets/animations/spinner.gif");
            }),
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                categorie.name!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}

class SubTitleSelect extends StatelessWidget {
  const SubTitleSelect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Play sounds that suits your mood",
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}

class SelectTitle extends StatelessWidget {
  const SelectTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Select music",
      style: Theme.of(context).textTheme.headline6,
    );
  }
}

class ButtonListMusic extends StatelessWidget {
  const ButtonListMusic({
    Key? key,
    required this.press,
  }) : super(key: key);
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      splashColor: Colors.grey,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width * 0.4,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 5, offset: Offset(-10, 10))
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/icons/Plus Icon.svg"),
            SizedBox(
              width: Get.width * 0.02,
            ),
            Expanded(
              child: Text(
                "Start listening",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.indigo.withOpacity(0.6)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SubTitleWelcome extends StatelessWidget {
  const SubTitleWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Observe wandering thoughts as\nthey drift throught the mind",
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: Colors.grey, fontWeight: FontWeight.w300),
    );
  }
}

class TitleCardWelcome extends StatelessWidget {
  const TitleCardWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Mindfullness",
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(letterSpacing: 1.0, color: Colors.indigo),
    );
  }
}

class SubtitleWelcome extends StatelessWidget {
  const SubtitleWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_string_escapes
    return const Text("Here\'s something for you");
  }
}

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    Key? key,
    required this.user,
  }) : super(key: key);
  final String user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Hello, ",
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(user, style: Theme.of(context).textTheme.headline5)
      ],
    );
  }
}
