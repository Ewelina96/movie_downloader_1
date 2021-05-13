import 'package:flutter/material.dart';
import 'package:movie_downloader_1/generated/l10n.dart';
import 'package:movie_downloader_1/values/dimensions.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      AppBar(title: Text(S.of(context).appTitle));

  @override
  Size get preferredSize => Size.fromHeight(Dimensions.appBarHeight);
}
