import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutterstore/features/authentication/model/userModel.dart';
import 'package:flutterstore/utils/popups/loaders.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // function  to store data on firebase

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(
          title: 'FirebaseAuthException: ${e.message}');
    } on FirebaseException catch (e) {
      log('FirebaseException: ${e.message}');
      throw AnimationLoaderWidget.errorSnackBar(
          title: 'FirebaseException: ${e.message}');
    } on FormatException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(
          title: 'FormatException: ${e.message}');
    } on PlatformException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(
          title: 'PlatformException: ${e.message}');
    } catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(
          title: 'Unknown error occurred: $e');
    }
  }
}
