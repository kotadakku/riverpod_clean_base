import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeService {
  final Ref ref;
  HomeService(this.ref);

  int changeTabIndex(int newTabIndex){
    return newTabIndex;
  }

  int changeSliderIndex(int newTabIndex) {
    return newTabIndex;
  }

}

final homeServiceProvider = Provider<HomeService>((ref) {
  return HomeService(ref);
});