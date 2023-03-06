import 'package:get/get.dart';
import 'package:photoalbumtest/features/home/home_bindings.dart';
import 'package:photoalbumtest/features/home/home_screen.dart';
import 'package:photoalbumtest/features/photo_detail/photo_detail_bindings.dart';
import 'package:photoalbumtest/features/photo_detail/photo_detail_screen.dart';
import 'package:photoalbumtest/features/photo_selection/photo_selection_bindings.dart';
import 'package:photoalbumtest/features/photo_selection/photo_selection_screen.dart';

const initialPage = HomeScreen.routeName;

List<GetPage> navPages = <GetPage>[
  GetPage(
    name: HomeScreen.routeName,
    page: () => HomeScreen(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: PhotoSelectionScreen.routeName,
    page: () => PhotoSelectionScreen(),
    binding: PhotoSelectionBindings(),
  ),
  GetPage(
    name: PhotoDetailScreen.routeName,
    page: () => PhotoDetailScreen(),
    binding: PhotoDetailBindings(),
  )
];
