import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String textTitle;
  final Color color;
  const CommonAppBar(
      {super.key,
      this.textTitle = 'EFYMEN',
      this.color = const Color(0xFFFFC400)});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(textTitle,
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w400,
          )),
      backgroundColor: color,
      leading: IconButton(
        icon: Image.asset('assets/icons/logo.png'),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 3,
              )
            ],
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 3,
              )
            ],
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
