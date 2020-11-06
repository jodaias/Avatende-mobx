import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomCard extends StatelessWidget {
  CustomCard({Key key, this.label, this.iconData, this.edgeInsets, this.onTap})
      : super(key: key);

  final String label;
  final IconData iconData;
  final EdgeInsets edgeInsets;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Container(
        alignment: Alignment.topLeft,
        child: Observer(builder: (_) {
          return GestureDetector(
            onTap: onTap,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Container(
                height: 190,
                width: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      iconData,
                      size: 60,
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
          );
        }),
      ),
    );
  }
}
