import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photoalbumtest/data/model/photo.dart';
import 'dart:developer' as developer;

class PhotoItemList extends StatelessWidget {
  const PhotoItemList({
    Key? key,
    required this.selectionMode,
    required this.photo,
    required this.isSelected,
    required this.onLongPress,
    required this.onSelected,
    this.onTap,
  }) : super(key: key);

  final bool selectionMode;
  final Photo photo;
  final bool isSelected;
  final Function() onLongPress;
  final Function(bool?) onSelected;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    if (selectionMode) {
      return ValueBuilder<bool?>(
          initialValue: isSelected,
          key: UniqueKey(),
          builder: (value, update) {
            return CheckboxListTile(
              value: value,
              onChanged: (value) {
                onSelected.call(value);
                update(value == true);
              },
              title: Image.network(
                photo.thumbnailUrl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              subtitle: Text(
                photo.title,
                style: Theme.of(context).primaryTextTheme.labelMedium?.copyWith(
                      color: Colors.black,
                    ),
              ),
            );
          });
    }

    return ListTile(
      onLongPress: onLongPress,
      onTap: onTap,
      title: Image.network(
        photo.thumbnailUrl,
        height: 80,
        width: 80,
        fit: BoxFit.cover,
      ),
      subtitle: Text(
        photo.title,
        style: Theme.of(context).primaryTextTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
      ),
    );
  }
}
