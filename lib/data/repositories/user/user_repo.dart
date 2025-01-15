import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutterstore/data/repositories/auth/auth_repositories.dart';
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

  // Fetch the user data from data base using user id
  Future<UserModel> fetchUserDetail() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
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

  // Function to update user data

  Future<void> updateUserDetail(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
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

  // Function to update any specific field in user collection

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .update(json);
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

  //Function to remove user data from data base

  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId ).delete();
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
