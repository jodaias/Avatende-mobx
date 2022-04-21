import 'dart:io';

import 'package:avatende/app/pages/perfil/mycliper.dart';
import 'package:avatende/app/pages/signup/signup_user_page.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:math' as math;

import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndialog/ndialog.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 290);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return Observer(builder: (_) {
      return ClipPath(
        clipper: MyClipper(),
        child: Container(
          padding: EdgeInsets.only(top: 37),
          decoration: BoxDecoration(
              color: Colors.purple[500],
              boxShadow: [BoxShadow(blurRadius: 20, offset: Offset(0, 0))]),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                    onPressed: Navigator.of(context).pop,
                  ),
                  Text(
                    "Perfil",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print('Notificações aqui');
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Observer(builder: (_) {
                    return Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _showDialogGetImage(context);
                          },
                          child: Container(
                            width: mediaSize.height * 0.15,
                            height: mediaSize.width * 0.22,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: appStore.userViewModel.imageFile !=
                                            null
                                        ? FileImage(appStore.userViewModel
                                            .imageFile) as ImageProvider
                                        : appStore.userViewModel.image == ""
                                            ? NetworkImage(fileUrlDefault)
                                            : NetworkImage(
                                                appStore.userViewModel.image))),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          '${appStore.userViewModel.name}',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    );
                  }),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Observer(builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      print("//TODO: button clicked");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SignUpUserPage(
                            userViewModel: appStore.userViewModel,
                            isUpdate: true,
                            isPerfil: true,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 32, 16, 24),
                      child: Transform.rotate(
                        angle: (math.pi * 0.05),
                        child: Container(
                          width: 110,
                          height: 32,
                          child: Center(
                            child: Text("Editar Perfil"),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 20)
                              ]),
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      );
    });
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
                    await _pickImageFromGallery(ctx);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('From Camera'),
                  onTap: () async {
                    await _pickImageFromCamera(ctx);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _pickImageFromCamera(BuildContext ctx) async {
    var xFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (xFile == null) return;
    appStore.userViewModel.imageFile = File(xFile.path);
    _uploadImageFileInStorage(ctx);
    appStore.setUser(appStore.userViewModel);
  }

  _pickImageFromGallery(BuildContext ctx) async {
    var xFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (xFile == null) return;
    appStore.userViewModel.imageFile = File(xFile.path);
    _uploadImageFileInStorage(ctx);
    appStore.setUser(appStore.userViewModel);
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
      appStore.updateImageProfile();

      progressDialog.dismiss();
    } catch (e) {
      progressDialog.dismiss();
      print(e.toString());
    }
  }
}
