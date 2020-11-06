import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  const PageTile(
      {Key key, this.label, this.iconData, this.onTap, this.highlighted})
      : super(key: key);

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: highlighted ? Colors.purple[400] : Colors.black54,
          )),
      leading: Icon(
        iconData,
        color: highlighted ? Colors.purple[400] : Colors.black54,
      ),
      onTap: onTap,
    );
  }
}
