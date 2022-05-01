import 'package:avatende/app/models/views/upload_image.dart';
import 'package:avatende/app/pages/perfil/mycliper.dart';
import 'package:avatende/app/pages/signup/signup_user_page.dart';
import 'package:avatende/app/pages/stores/user/user_store.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:math' as math;

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 290);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final appStore = GetIt.I<AppStore>();
  final userStore = new UserStore();

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
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
                Column(
                  children: <Widget>[
                    Observer(builder: (_) {
                      return GestureDetector(
                        onTap: () async {
                          await appStore.showDialogGetImage(context);
                          userStore.setLoading(true);
                          await _saveImageProfile(context);
                        },
                        child: Observer(builder: (_) {
                          return userStore.loading
                              ? Container(
                                  width: mediaSize.height * 0.15,
                                  height: mediaSize.width * 0.22,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.purple[700],
                                    child: CircularProgressIndicator(
                                      color: Colors.white10,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: mediaSize.height * 0.15,
                                  height: mediaSize.width * 0.22,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.purple[700],
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: appStore.imageFiles.isNotEmpty
                                              ? FileImage(
                                                      appStore.imageFiles[0])
                                                  as ImageProvider
                                              : appStore.userViewModel.image ==
                                                          "" ||
                                                      appStore.userViewModel
                                                              .image ==
                                                          null
                                                  ? NetworkImage(
                                                      profileUrlDefault)
                                                  : NetworkImage(appStore
                                                      .userViewModel.image))),
                                );
                        }),
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return Text(
                        '${appStore.userViewModel.name}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      );
                    })
                  ],
                ),
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
                          companyId: appStore.companyViewModel?.companyId(),
                          departmentId:
                              appStore.departmentViewModel?.departmentId(),
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
                            borderRadius: BorderRadius.all(Radius.circular(16)),
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
  }

  Future<void> _saveImageProfile(BuildContext ctx) async {
    var user = appStore.userViewModel;
    user.imageFile =
        appStore.imageFiles.isNotEmpty ? appStore.imageFiles[0] : null;

    //Formando Object to send
    if (user.imageFile != null) {
      var fileName = "${user.email}-${DateTime.now()}";
      var uploadImage = new ImageUploadModel(
          fileName: fileName,
          folder: "profile_images",
          subFolder: user.userId(),
          fileToUpload: user.imageFile);

      var urlResul = await appStore.uploadImageFileInStorage(ctx, uploadImage);
      user.image = urlResul;
      appStore.setUser(user);

      await userStore.updateUser(user.userId(), user.toMap());
      appStore.setImageFiles([]);
      userStore.setLoading(false);
    }
  }
}
