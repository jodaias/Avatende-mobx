import 'package:avatende/components/custom_drawer/custom_drawer_header.dart';
import 'package:avatende/components/custom_drawer/page_section.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(50),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.67,
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
