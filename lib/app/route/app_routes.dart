import 'package:get/get.dart';
import '../pages/splash_view.dart';
import '../pages/home_view.dart';
import '../pages/search_view.dart';
import '../pages/playlist_detail_view.dart';
import '../pages/now_playing_view.dart';

abstract class Routes {
  static const splash = '/splash';
  static const home = '/home';
  static const search = '/search';
  static const playlistDetail = '/playlist-detail';
  static const nowPlaying = '/now-playing';
}

class AppPages {
  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashView()),
    GetPage(name: Routes.home, page: () => HomeView()),
    GetPage(name: Routes.search, page: () => SearchView()),
    GetPage(name: Routes.playlistDetail, page: () => PlaylistDetailView()),
    GetPage(name: Routes.nowPlaying, page: () => NowPlayingView()),
  ];
}
