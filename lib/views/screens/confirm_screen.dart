import 'package:flutter/material.dart';
import 'package:follow_app/constants.dart';
import 'package:follow_app/controllers/upload_video_controller.dart';
import 'dart:io';
import 'package:follow_app/helper/util_extensions.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../widgets/text_input_field.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: VideoPlayer(controller),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      30.verticalSpace(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width - 20,
                        child: CustomTextField(
                          label: 'Song Name',
                          textController: _songController,
                          icon: const Icon(Icons.music_note),
                          hintColor: AppColors.black,
                        ),
                      ),
                      20.verticalSpace(),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width - 20,
                        child: CustomTextField(
                          label: 'Caption',
                          textController: _captionController,
                          icon: const Icon(Icons.closed_caption),
                          hintColor: AppColors.black,
                        ),
                      ),
                      15.verticalSpace(),
                      ElevatedButton(
                        onPressed: () async {
                          await uploadVideoController.uploadVideo(
                            _songController.text,
                            _captionController.text,
                            widget.videoPath,
                          );
                        },
                        child: const Text(
                          'Share',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
