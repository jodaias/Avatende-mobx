import 'dart:io';

class ImageUploadModel {
  String fileName;
  File fileToUpload;
  String folder;
  String subFolder;

  ImageUploadModel({
    this.fileName,
    this.fileToUpload,
    this.folder,
    this.subFolder,
  });
}
