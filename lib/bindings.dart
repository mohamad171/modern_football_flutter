
import 'package:get/get.dart';
import 'package:modern_football/controllers/SocialController.dart';

import 'controllers/auth_api_controller.dart';




class ModernfootballBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthApiController());
    Get.put(ProfileController());
    Get.put(CompetitionsController());
    Get.put(NewsController());
    Get.put(MatchesController());
    Get.put(StandingsController());
    Get.put(VideosController());
    Get.put(TopGoalsController());
    Get.put(SocialController());

    

  }
}