import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconButton? leading;

  final String? title;

  const BasicAppBar({
    super.key,
    this.title,
    this.leading,
  });

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? 'Daily News',
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.black12,
      centerTitle: true,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
