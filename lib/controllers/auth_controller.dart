import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:follow_app/views/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:follow_app/constants.dart';
import 'package:follow_app/models/user.dart' as model;
import 'package:image_picker/image_picker.dart';

import '../views/screens/splash/splash_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  var firbaseAuth = FirebaseAuth.instance;

  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;
  // User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firbaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const SplashScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

// Functions and controller for profile picture
  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile picture',
          'You have successfully selected your profile picture');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  // function upload to firebase storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print('logged in successfully');
      } else {
        Get.snackbar('Error Logging in', 'Please enter all the fields');
      }
    } catch (e) {
      Get.snackbar(
        'Error while logging in',
        e.toString(),
      );
    }
  }

  // registering the user
  void registerUser(String username, String email, String password) async {
    try {
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty
          // && image != null
          ) {
        // save our user data to auth and firestore
        UserCredential cred = await firbaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          //profilePhoto: downloadUrl,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          "Error creating an account",
          'Please enter all fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error creating an account",
        e.toString(),
      );
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }
}
