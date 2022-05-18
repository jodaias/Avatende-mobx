import 'dart:io';

class ImageUploadModel {
  String fileName;
  File fileToUpload;
  String folder;
  String subFolder;

  ImageUploadModel({
    required this.fileName,
    required this.fileToUpload,
    required this.folder,
    required this.subFolder,
  });
}
