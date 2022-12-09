import 'package:flutter/material.dart';
import 'package:mocky/view/widget/app_text_view.dart';

import '../../util/app_color.dart';

//app AppBar

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  String name;

  AppAppBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: AppBar(
        centerTitle: true,
        title: appTextView(
            name: name, color: AppColor.kBalck, isBold: true, size: 18),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
