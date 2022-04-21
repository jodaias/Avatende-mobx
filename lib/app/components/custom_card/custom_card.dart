import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key key, this.label, this.iconData, this.edgeInsets, this.onTap})
      : super(key: key);

  final String label;
  final IconData iconData;
  final EdgeInsets edgeInsets;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;
    return Padding(
      padding: edgeInsets,
      child: Container(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Container(
              height: mediaSize.height * 0.23,
              width: mediaSize.width * 0.41,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    size: mediaSize.width * 0.14,
                    color: Colors.purple[400],
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
