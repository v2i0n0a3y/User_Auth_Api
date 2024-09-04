class VerificationModel {
  final String? fileName;

  VerificationModel({this.fileName});

  VerificationModel copyWith({String? fileName}) {
    return VerificationModel(
      fileName: fileName ?? this.fileName,
    );
  }
}
