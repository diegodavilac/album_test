import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoalbumtest/data/model/photo.dart';
import 'package:photoalbumtest/features/home/components/photo_item_list.dart';
import 'package:photoalbumtest/features/photo_detail/photo_detail_screen.dart';
import 'package:photoalbumtest/features/photo_selection/photo_selection_controller.dart';

class PhotoSelectionScreen extends GetView<PhotoSelectionController> {
  static const routeName = '/photoSelection';

  PhotoSelectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Selected photo(s)',
          style: Theme.of(context)
              .primaryTextTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.separated(
            itemCount: controller.selectedPhotos.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              Photo photo = controller.selectedPhotos[index];
              return PhotoItemList(
                selectionMode: false,
                photo: photo,
                isSelected: true,
                onLongPress: () {},
                onSelected: (value) {},
                onTap: () {
                  Get.toNamed(PhotoDetailScreen.routeName.replaceFirst(':id', photo.id.toString()));
                },
              );
            });
      }),
    );
  }
}
