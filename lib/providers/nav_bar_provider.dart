import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarNotifire extends StateNotifier<int> {
  NavBarNotifire() : super(0);
  void selectPage(int index) {
    state = index;
  }
}

final navBarProviders = StateNotifierProvider<NavBarNotifire, int>((ref) {
  return NavBarNotifire();
});
