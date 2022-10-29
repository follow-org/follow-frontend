import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:follow_app/constants.dart';
import 'package:follow_app/models/video.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.LowQuality,
    );
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference reference = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask = reference.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = uploadTask.snapshot;
    String downloadUrl = snap.ref.fullPath;
    return downloadUrl;
  }

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  // Future<String> _uploadImageToStorage(String id, String videoPath) async {
  //   Reference ref = firebaseStorage.ref().child('thumnails').child(id);

  //   UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
  //   TaskSnapshot snap = uploadTask.snapshot;
  //   String downloadUrl = snap.ref.fullPath;
  //   print(downloadUrl);
  //   return downloadUrl;
  // }

  // function to upload video
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      String videoUrl = await _uploadVideoToStorage(uid, videoPath);
      // String thumbnail = await _uploadImageToStorage(uid, videoPath);
      // get id
      // var allDocs = await firestore.collection('videos').get();
      // // int len = allDocs.docs.length;

      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: uid,
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: songName,
        caption: caption,
        videoUrl: videoUrl,
        thumbnail: "",
      );

      await firestore
          .collection('videos')
          .doc(uid)
          .set(
            video.toJson(),
          )
          .then(
            (value) => Get.back(),
          );
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }
}
