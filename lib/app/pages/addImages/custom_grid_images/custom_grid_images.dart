import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:ndialog/ndialog.dart';

class CustomGridImages extends StatefulWidget {
  @override
  _CustomGridImagesState createState() => _CustomGridImagesState();
}

class _CustomGridImagesState extends State<CustomGridImages> {
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;

    return Observer(
      builder: (_) {
        return GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(appStore.imageFiles.length, (index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(appStore.imageFiles[index]),
                          ),
                        ),
                      ),
                    ),
                    new IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.purple[400],
                      ),
                      onPressed: () {
                        _removeItemFromImageFiles(index);
                      },
                    ),
                  ],
                );
              }) +
              List.generate(1, (index) {
                return appStore.imageFiles.length < 5
                    ? Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              appStore.showDialogGetImage(context);
                            },
                            child: Container(
                              width: mediaSize.width * 0.25,
                              height: mediaSize.height * 0.15,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(adsUrlDefault),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Stack();
              }),
        );
      },
    );
  }

  _removeItemFromImageFiles(int index) {
    appStore.imageFiles.removeAt(index);
    appStore.setImageFiles(appStore.imageFiles);
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
      // companyStore.addAdsImages();
      // companyStore.setImageFile(null);
      // companyStore.updateAdsImages();
      // companyStore.setImages(companyStore.images);

      progressDialog.dismiss();
    } catch (e) {
      progressDialog.dismiss();
      print(e.toString());
    }
  }
}
