import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoalbumtest/features/photo_detail/photo_detail_controller.dart';

class PhotoDetailScreen extends GetView<PhotoDetailController> {
  static const routeName = '/photo/:id';

  PhotoDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.errorMessage.value != null) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: Text(
              controller.errorMessage.value ?? '',
              style:
                  Theme.of(context).primaryTextTheme.headlineMedium?.copyWith(
                        color: Colors.black87,
                      ),
              textAlign: TextAlign.center,
            ),
          );
        }

        final photo = controller.photo.value;

        if (photo == null) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: Text(
              'Invalid data',
              style:
                  Theme.of(context).primaryTextTheme.headlineMedium?.copyWith(
                        color: Colors.black87,
                      ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.network(
                photo.url,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    photo.title,
                    style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    'Album: ${photo.albumId}',
                    style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
