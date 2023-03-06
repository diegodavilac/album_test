import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoalbumtest/data/model/photo.dart';
import 'package:photoalbumtest/features/home/components/photo_item_list.dart';
import 'package:photoalbumtest/features/home/home_controller.dart';
import 'package:photoalbumtest/features/photo_selection/photo_selection_screen.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  ScrollController _scrollController = ScrollController();

  void onMore() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.position.pixels) {
      if (controller.listEnded) {
        _scrollController.removeListener(onMore);
      }
      if (!controller.isLoading.value) {
        controller.loadData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(onMore);

    return Scaffold(
      appBar: AppBar(
        leading: Obx(() {
          if (controller.selectionMode.value) {
            return IconButton(
              onPressed: () {
                controller.selectionMode.value = false;
                controller.selectedPhotos.clear();
                controller.photos.refresh();
              },
              iconSize: 24,
              splashRadius: 16,
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            );
          } else {
            return Container();
          }
        }),
        centerTitle: true,
        title: Obx(() {
          if (controller.selectionMode.value) {
            return Text(
                'Selected ${controller.selectedPhotos.length} photo(s)');
          } else {
            return const Text('Photo album');
          }
        }),
        actions: [
          Obx(
            () => Visibility(
              visible: controller.selectionMode.value,
              child: TextButton(
                onPressed: () {
                  controller.selectedPhotos.clear();
                  controller.photos.refresh();
                },
                child: Text(
                  'Clear',
                  style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.selectionMode.value,
              child: TextButton(
                onPressed: controller.selectedPhotos.isNotEmpty ? () {
                  Get.toNamed(PhotoSelectionScreen.routeName, arguments: controller.selectedPhotos);
                } : null,
                child: Text(
                  'Next',
                  style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                        color: controller.selectedPhotos.isNotEmpty ? Colors.white : Colors.white54,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
            controller: _scrollController,
            itemCount: controller.photos.length,
            itemBuilder: (BuildContext context, int index) {
              Photo photo = controller.photos[index];
              return PhotoItemList(
                selectionMode: controller.selectionMode.value,
                photo: photo,
                isSelected: controller.selectedPhotos.firstWhereOrNull(
                        (element) => element.id == photo.id) !=
                    null,
                onLongPress: () {
                  controller.selectedPhotos.add(photo);
                  controller.selectionMode.value = true;
                  controller.photos.refresh();
                },
                onSelected: (value) {
                  if (controller.selectedPhotos.contains(photo)) {
                    controller.selectedPhotos.remove(photo);
                  } else {
                    controller.selectedPhotos.add(photo);
                  }
                },
              );
            });
      }),
    );
  }
}
