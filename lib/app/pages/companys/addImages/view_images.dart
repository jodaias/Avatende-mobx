import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ViewImages extends StatefulWidget {
  final int _index;
  final AssetEntity _asset;
  ViewImages(
    this._index,
    this._asset, {
    Key key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => AssetState(this._index, this._asset);
}

class AssetState extends State<ViewImages> {
  int _index = 0;
  AssetEntity _asset;
  AssetState(this._index, this._asset);
  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    await this
        ._asset
        .thumbDataWithOption(ThumbOption(width: 300, height: 300, quality: 50));
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (null != this._asset.thumbData) {
      var asUint8List;

      this._asset.thumbData.then((value) {
        asUint8List = value.buffer.asUint8List();
      });

      return Image.memory(
        asUint8List,
        fit: BoxFit.cover,
        gaplessPlayback: true,
      );
    }

    return Text(
      '${this._index}',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
