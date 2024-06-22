import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
 

class PictureWrok extends StatefulWidget {
  const PictureWrok({
    super.key,
    required this.onPickImage,
    required this.onPickImage2,
  });
  final void Function(File pickedImage) onPickImage;
  final void Function(File pickedImage2) onPickImage2;

  @override
  State<PictureWrok> createState() => _PictureWrokState();
}

class _PictureWrokState extends State<PictureWrok> {
  File? _pickedImageFile;
  File? _pickedImageFile2;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 100, maxWidth: 150);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    widget.onPickImage(_pickedImageFile!);
  }

  // Image Two
  void _pickImage2() async {
    final pickedImage2 = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 100, maxWidth: 150);
    if (pickedImage2 == null) {
      return;
    }
    setState(() {
      _pickedImageFile2 = File(pickedImage2.path);
    });
    widget.onPickImage2(_pickedImageFile2!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Upload a Picture',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Poppins',
              // color: Theme.of(context).primaryColor
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColorDark)),
                    child: CircleAvatar(
                      foregroundImage: _pickedImageFile != null
                          ? FileImage(_pickedImageFile!)
                          : null,
                      child: TextButton.icon(
                        onPressed: _pickImage,
                        icon: const Icon(
                          Icons.camera_alt,
                          // color: Theme.of(context).primaryColor,
                        ),
                        label: const Text(
                          'Add Photo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            // color: Theme.of(context).primaryColorDark
                          ),
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).primaryColorDark),
                    ),
                    child: CircleAvatar(
                      foregroundImage: _pickedImageFile2 != null
                          ? FileImage(_pickedImageFile2!)
                          : null,
                      child: TextButton.icon(
                        onPressed: _pickImage2,
                        icon: const Icon(
                          Icons.camera_alt,
                          // color: Theme.of(context).primaryColor,
                        ),
                        label: const Text(
                          'Add Photo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            // color: Theme.of(context).primaryColorDark
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Upload a Video',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Poppins',
              // color: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
    );
  }
}
