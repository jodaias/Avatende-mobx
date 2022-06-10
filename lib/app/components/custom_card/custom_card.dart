import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    Key? key,
    required this.label,
    required this.iconData,
    required this.onTap,
    required this.edgeInsets,
  }) : super(key: key);

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
            child: SizedBox(
              width: mediaSize.width * 0.28,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    size: mediaSize.width * 0.05,
                    color: Colors.purple[400],
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: mediaSize.width * 0.03,
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
