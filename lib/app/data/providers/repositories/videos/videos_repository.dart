import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

import '../../../models/product/product_firebase/product_firebase_model.dart';
import '../../../models/videos/video_post_model.dart';

class VideosRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();
  final FirebaseStorage _firebaseStorage = Get.find<FirebaseStorage>();

  Stream<List<VideoPostModel>> getVideos() async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('videos')
          .orderBy('createdAt', descending: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => VideoPostModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Either<String, Unit>> saveVideo({
    required String name,
  }) async {
    try {
      String uid = _firebaseAuth.currentUser!.uid;
      String uuid = const Uuid().v4();
      String id = 'video-$uuid';

      await _firebaseFirestore.collection('videos').doc(id).set(
        {
          'name': name,
          'id': id,
          'createdBy': uid,
          'createdAt': DateTime.now(),
        },
      );
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );

    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    MainController mainController = Get.find<MainController>();
    mainController.setDropiMessage('Subiendo Video');

    Reference ref = _firebaseStorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    MainController mainController = Get.find<MainController>();
    mainController.setDropiMessage('Subiendo imagen del video');

    Reference ref = _firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile((await getThumbnail(videoPath)));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<File> getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<Either<String, Unit>> uploadVideo({
    required String videoId,
    required String name,
    required String videoPath,
    required ProductFirebaseModel product,
  }) async {
    try {
      String uid = _firebaseAuth.currentUser!.uid;
      String email = _firebaseAuth.currentUser!.email!;

      String videoUrl = await _uploadVideoToStorage(videoId, videoPath);
      String thumbnail = await _uploadImageToStorage(videoId, videoPath);

      MainController mainController = Get.find<MainController>();
      mainController.setDropiMessage('Escribiendo en firebase');

      await _firebaseFirestore.collection('videos').doc(videoId).set({
        'name': name,
        'id': videoId,
        'createdById': uid,
        'createdByEmail': email,
        'createdAt': DateTime.now(),
        'videoUrl': videoUrl,
        'thumbnail': thumbnail,
        'product': {
          'name': product.name,
          'id': product.id,
          'thumbnail': product.thumbnail,
          'reference': product.reference,
        }
      });

      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }
}
