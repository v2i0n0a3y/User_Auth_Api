import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sowlab_auth/auth/Signup/page3/verification_model.dart';

class VerificationViewModel extends ChangeNotifier {
  VerificationModel _model = VerificationModel();

  VerificationModel get model => _model;

  void pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      _model = _model.copyWith(fileName: result.files.single.name);
    } else {
      // User canceled the picker
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected')),
      );
    }

    notifyListeners();
  }

  void removeFile() {
    _model = _model.copyWith(fileName: "File Not Selected");
    notifyListeners();
  }

  void signUp(BuildContext context) {
    // Handle the sign-up logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign Up Successful!')),
    );
  }
}
