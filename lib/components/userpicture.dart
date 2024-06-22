 import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserPicture extends StatefulWidget {
  const UserPicture({super.key, required this.onPickImage});

  final void Function(File pickedImage) onPickImage;

  @override
  State<UserPicture> createState() => _UserPictureState();
}

class _UserPictureState extends State<UserPicture> {
  File? _pickedImageFile;

void _pickImage() async {
 final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 100, maxWidth: 150);
 if (pickedImage == null){
  return;
 }
 setState(() {
   _pickedImageFile = File(pickedImage.path);
 });
 widget.onPickImage(_pickedImageFile!);
}

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey.shade100,
          foregroundImage: _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
          child: const Icon(Icons.person, size: 60,),
        ),
        TextButton.icon(
          onPressed: _pickImage, 
          icon: const Icon(Icons.photo_camera), 
          label: const Text('Add Image'))
      ],
    );
  }
}