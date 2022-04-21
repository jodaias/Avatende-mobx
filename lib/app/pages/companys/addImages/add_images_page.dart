import 'dart:io';

import 'package:avatende/app/pages/companys/addImages/view_images.dart';
import 'package:avatende/app/pages/signup/components/field_title.dart';
import 'package:avatende/app/pages/stores/company/company_store.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:multiple_image_picker/multiple_image_picker.dart';
import 'package:ndialog/ndialog.dart';

class AddImagesPage extends StatefulWidget {
  @override
  _AddImagesPageState createState() => _AddImagesPageState();
}

class _AddImagesPageState extends State<AddImagesPage> {
  final appStore = GetIt.I<AppStore>();

  final companyStore = new CompanyStore();

  List<AssetEntity> _listAssetEntity;

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldTitle(
            title: 'Imagens para os Anúncios',
            subtitle: 'Adicione até 6 imagens',
          ),
          Row(
            children: <Widget>[
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5, top: 8),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _showDialogGetImage(context);
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: companyStore.imageFiles.isNotEmpty
                                      ? FileImage(companyStore.imageFiles[0])
                                          as ImageProvider
                                      : NetworkImage(fileUrlDefault))),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5, top: 8),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _showDialogGetImage(context);
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: companyStore.imageFiles.length >= 2
                                      ? FileImage(companyStore.imageFiles[1])
                                          as ImageProvider
                                      : NetworkImage(fileUrlDefault))),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _showDialogGetImage(context);
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: companyStore.imageFiles.length >= 3
                                      ? FileImage(companyStore.imageFiles[2])
                                          as ImageProvider
                                      : NetworkImage(fileUrlDefault))),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
          Row(
            children: <Widget>[
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5, top: 8),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _showDialogGetImage(context);
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: companyStore.imageFiles.length >= 4
                                      ? FileImage(companyStore.imageFiles[3])
                                          as ImageProvider
                                      : NetworkImage(fileUrlDefault))),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5, top: 8),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _showDialogGetImage(context);
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: companyStore.imageFiles.length >= 5
                                      ? FileImage(companyStore.imageFiles[4])
                                          as ImageProvider
                                      : NetworkImage(fileUrlDefault))),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5, top: 8),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _showDialogGetImage(context);
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: companyStore.imageFiles.length >= 6
                                      ? FileImage(companyStore.imageFiles[05])
                                          as ImageProvider
                                      : NetworkImage(fileUrlDefault))),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ],
      );
    });
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(_listAssetEntity.length, (index) {
        var file = _listAssetEntity[index];
        return ViewImages(
          index,
          file,
          key: UniqueKey(),
        );
      }),
    );
  }

  _showDialogGetImage(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('From Gallery'),
                  onTap: () async {
                    // await _pickImage(ImageSource.gallery);
                    await _pickMultipleImages(ctx);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('From Camera'),
                  onTap: () async {
                    await _pickImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _pickImage(ImageSource source) async {
    var file = await ImagePicker.pickImage(source: source);
    if (file == null) return;
    companyStore.imageFiles.add(File(file.path));
  }

  _pickMultipleImages(BuildContext context) async {
    final List<AssetEntity> result = <AssetEntity>[];

    var list = await AssetPicker.pickAssets(context,
        maxAssets: 6, selectedAssets: result);
    if (list.isEmpty) return;
    _listAssetEntity = list;
  }

  _uploadImageFileInStorage(BuildContext ctx) {
    // upload to firebase storage
    var progressDialog = ProgressDialog(
      ctx,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );

    progressDialog.show();
    try {
      companyStore.addAdsImages();
      companyStore.setImageFile(null);
      // companyStore.updateAdsImages();
      // companyStore.setImages(companyStore.images);

      progressDialog.dismiss();
    } catch (e) {
      progressDialog.dismiss();
      print(e.toString());
    }
  }
}
