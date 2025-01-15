import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterstore/data/repositories/user/user_repo.dart';
import 'package:flutterstore/features/authentication/model/userModel.dart';
import 'package:flutterstore/utils/popups/loaders.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  // final userRepository = Get.put(UserRepository());
  var userRepository = Get.put(UserRepository());
  Rx<UserModel> userModel = UserModel.empty().obs;
  final profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // save user record from any regisration provider

  Future<void> fetchUserRecord() async {
    profileLoading.value = true;
    try {
      final user = await userRepository.fetchUserDetail();
      userModel(user);
    } catch (e) {
      userModel(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      final namePart =
          UserModel.namePart(userCredential.user!.displayName ?? "");

      final userName =
          UserModel.generateUserName(userCredential.user!.displayName ?? "");

      final user = UserModel(
        firstName: namePart[0],
        lastName: namePart.length > 1 ? namePart.sublist(1).join(' ') : '',
        userName: userName,
        email: userCredential.user!.email ?? '',
        phoneNumber: userCredential.user!.phoneNumber ?? '',
        profilePicture: userCredential.user!.photoURL ?? '',
        id: userCredential.user!.uid,
      );

      await userRepository.saveUserRecord(user);
    } catch (e) {
      AnimationLoaderWidget.warningSnackBar(
          title: "Data Not Saved",
          message: "Something Went Wrong While SAving Your Informations");
    }
  }
}
