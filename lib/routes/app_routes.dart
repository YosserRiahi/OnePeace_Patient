import 'package:application_patient/core/constant/route_name.dart';
import 'package:application_patient/dependency_injection/forget_bind.dart';
import 'package:application_patient/dependency_injection/home_bind.dart';
import 'package:application_patient/dependency_injection/login_bind.dart';
import 'package:application_patient/dependency_injection/meditation_bind.dart';
import 'package:application_patient/dependency_injection/onboarding_bind.dart';
import 'package:application_patient/dependency_injection/sign_up_bind.dart';
import 'package:application_patient/view/complet-profil/complet_profil.dart';
import 'package:application_patient/view/home_page/activity/add_dose_water.dart';
import 'package:application_patient/view/home_page/activity/configuration_drink_water.dart';
import 'package:application_patient/view/home_page/activity/fetch_water.dart';
import 'package:application_patient/view/home_page/care_youself/welcome_doctor.dart';
import 'package:application_patient/view/home_page/cours_meditation/quiz/quiz_meditation.dart';
import 'package:application_patient/view/home_page/cours_meditation/saison_1/meditation_cours_1.dart';
import 'package:application_patient/view/home_page/cours_meditation/saison_2/meditation_reduce_stress.dart';
import 'package:application_patient/view/home_page/cours_meditation/saison_3/refining_your_meditation.dart';
import 'package:application_patient/view/home_page/cours_meditation/saison_4/meditation_technique.dart';
import 'package:application_patient/view/home_page/cours_meditation/tutoriel_meditation.dart';
import 'package:application_patient/view/home_page/home_page.dart';
import 'package:application_patient/view/home_page/practise/timer_widget.dart';
import 'package:application_patient/view/login/login_page.dart';
import 'package:application_patient/view/onboarding/onboarding_page.dart';
import 'package:application_patient/view/reset_password/reset_password.dart';
import 'package:application_patient/view/sign_up/sign_up_page.dart';
import 'package:application_patient/view/verifie_code/verification_code.dart';

import 'package:get/get.dart';

import '../view/home_page/cours_meditation/quiz/start_qiuz.dart';
import '../view/home_page/cours_meditation/saison_5/benetifs_cours.dart';
import '../view/home_page/meditation_music/welcome_music/welcome_music.dart';
import '../view/welcome_page/welcome_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: RoutesName.onboarding,
        page: () => OnboardingPage(),
        binding: OnboardingBind()),
    GetPage(name: RoutesName.welcome, page: () => const WelcomePage()),
    GetPage(
        name: RoutesName.login,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: RoutesName.signup,
        page: () => const SignUpPage(),
        binding: SignUpBinding()),
    GetPage(
        name: RoutesName.forget,
        page: () => ForgetPassword(),
        binding: ForgetBinding()),
    GetPage(
        name: RoutesName.home,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
      name: RoutesName.welcomMusic,
      page: () => WelcomeMusic(),
    ),
    //GetPage(
    //   name: RoutesName.detailsMusic,
    // page: () =>   DetailsMusic(),
    // binding: DetailsMusicBinding()),
    GetPage(
        name: RoutesName.learnmeditation,
        page: () => LearnMdetation(),
        binding: Meditabind()),
    GetPage(
      name: RoutesName.coursone,
      page: () => const CoursOne(),
    ),
    GetPage(
      name: RoutesName.courstwo,
      page: () => const CourseTwo(),
    ),
    GetPage(
      name: RoutesName.coursthree,
      page: () => const CoursThree(),
    ),
    GetPage(
      name: RoutesName.coursfour,
      page: () => const CourseFour(),
    ),
    GetPage(
      name: RoutesName.coursfive,
      page: () => const CoursFive(),
    ),
    GetPage(
      name: RoutesName.quiz,
      page: () => const QuizMeditation(),
    ),
    GetPage(
      name: RoutesName.startquiz,
      page: () => QuizDetails(),
    ),
    GetPage(
      name: RoutesName.waterConfig,
      page: () => const ConfigurationWater(),
    ),
    GetPage(
      name: RoutesName.fetchwater,
      page: () => const FetchWidget(),
    ),
    GetPage(
      name: RoutesName.addwater,
      page: () => const DetailsPage(),
    ),
    GetPage(
      name: RoutesName.practise,
      page: () => const PractiseCounter(),
    ),
    GetPage(
      name: RoutesName.code,
      page: () => Verification(),
    ),
    GetPage(
      name: RoutesName.doctors,
      page: () => DoctorsWidget(),
    ),
    GetPage(
      name: RoutesName.complet,
      page: () => CompletProfil(),
    )
  ];
}
