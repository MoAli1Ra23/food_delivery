import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePerViewer extends StatefulWidget {
  const ImagePerViewer({
    Key? key,
    this.onTab,
    this.tempImage,
    this.file,
    required this.source,
  }) : super(key: key);
  final Function(File)? onTab;
  final Image? tempImage;
  final File? file;
  final ImageSource source;

  @override
  State<ImagePerViewer> createState() =>
      _ImagePerViewerState(onTab, tempImage, source);
}

class _ImagePerViewerState extends State<ImagePerViewer> {
  final Function(File)? onTab;
  final Image? tempImage;
    File? f;
  late bool isCamOrGellartyOpend;
  @override
  void initState() {
    isCamOrGellartyOpend = false;
    super.initState();
  }

  final ImageSource source;
  pick() async {
    await ImagePicker().pickImage(source: source).then((value) {
      if (value == null) {
        return;
      }

      setState(() {
        print(value);
        f = File(value.path);
        isCamOrGellartyOpend = false;
      });

      return onTab!.call(File(value.path));
    });
  }

  _ImagePerViewerState(this.onTab, this.tempImage, this.source);
  Widget setImage() {
    if (f == null) {
      return tempImage!;
    } else {
      return Image(image: FileImage(f!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        children: [
          SizedBox(height: 120, child: setImage()),
          TextButton.icon(
              onPressed: () async {
                if (isCamOrGellartyOpend == true) return;
                setState(() {
                  isCamOrGellartyOpend = true;
                });
                pick();
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text("get image")),
        ],
      ),
    );
  }
}
