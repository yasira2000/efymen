import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String textTitle;
  const CommonAppBar({super.key, this.textTitle = 'EFYMEN'});

  @override
  Widget build(BuildContext context) {
    String title = textTitle;
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: Image.asset('assets/icons/logo.png'),
        onPressed: () {},
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
