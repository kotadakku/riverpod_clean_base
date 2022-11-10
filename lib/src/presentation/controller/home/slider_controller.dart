import 'package:riverpod_base/src/service/home/home_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliderController extends StateNotifier<int>{
  final HomeService homeService;
  SliderController({required this.homeService}) : super(1){
  }

  Future<void> changeSliderIndex(int newTabIndex) async {
    state = homeService.changeSliderIndex(newTabIndex);
  }
}

final sliderControllerProvider = StateNotifierProvider<SliderController, int>((ref) {
  return SliderController(
    homeService: ref.watch(homeServiceProvider),
  );
});