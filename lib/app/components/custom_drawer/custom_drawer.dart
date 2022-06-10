import 'package:avatende/app/components/custom_drawer/custom_drawer_header.dart';
import 'package:avatende/app/components/custom_drawer/page_section.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(40),
      ),
      child: SizedBox(
        width: 220,
        child: Drawer(
          child: ListView(
            children: [
              CustomDrawerHeader(),
              PageSection(),
            ],
          ),
        ),
      ),
    );
  }
}
