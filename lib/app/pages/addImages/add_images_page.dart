import 'dart:io';
import 'package:avatende/app/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/app/models/views/upload_image.dart';
import 'package:avatende/app/pages/addImages/custom_grid_images/custom_grid_images.dart';
import 'package:avatende/app/pages/signup/components/field_title.dart';
import 'package:avatende/app/pages/stores/company/company_store.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:avatende/app/storesGlobal/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class AddImagesPage extends StatefulWidget {
  @override
  _AddImagesPageState createState() => _AddImagesPageState();
}

class _AddImagesPageState extends State<AddImagesPage> {
  final appStore = GetIt.I<AppStore>();
  final pageStore = GetIt.I<PageStore>();

  final companyStore = new CompanyStore();

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Cadastro de Imagens - Anúncio'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FieldTitle(
                      title: 'Imagens para os Anúncios',
                      subtitle: 'Adicione até 5 imagens',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: CustomGridImages(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Button para salvar imagens
                    Observer(builder: (_) {
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20, bottom: 12),
                        height: mediaSize.height * 0.05,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(
                                mediaSize.width * 0.50,
                                mediaSize.height * 0.50)),
                            elevation: MaterialStateProperty.all(2),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                            textStyle: MaterialStateProperty.all(
                              TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: companyStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('SALVAR'),
                          onPressed: appStore.imageFiles.isNotEmpty &&
                                  !companyStore.loading
                              ? () {
                                  companyStore.loading = true;
                                  appStore.imageFiles
                                      .asMap()
                                      .forEach((index, element) async {
                                    //setObject upload
                                    var imageUploadModel =
                                        _setImageUpload(element);

                                    var resulUrlImage =
                                        await appStore.uploadImageFileInStorage(
                                            context, imageUploadModel);

                                    companyStore.images.add(resulUrlImage);
                                    if (companyStore.images.length ==
                                        appStore.imageFiles.length) {
                                      companyStore.setCompanyId(appStore
                                          .companyViewModel!
                                          .companyId());
                                      await companyStore.saveImages();

                                      pageStore.setPage(0);
                                      appStore.setImageFiles([]);
                                    }
                                  });
                                }
                              : null,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _setImageUpload(File file) {
    var company = appStore.companyViewModel;

    var fileName = "${company!.companyId()}-${DateTime.now()}";
    var folder = "ads_images";

    var imageUpload = new ImageUploadModel(
        fileName: fileName,
        fileToUpload: file,
        folder: folder,
        subFolder: company.companyId() ?? "");

    return imageUpload;
  }
}
