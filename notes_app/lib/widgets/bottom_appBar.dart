import 'package:flutter/material.dart';

class BtmAppBar extends StatelessWidget {
  const BtmAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            bottomAppBarIcons(Icons.color_lens),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: bottomAppBarIcons(Icons.calendar_month),
            ),
            const SizedBox(
              width: 10,
            ),
            bottomAppBarIcons(Icons.mic),
          ],
        ),
      ),
      shape: const CircularNotchedRectangle(),
    );
  }
}

Icon bottomAppBarIcons(IconData icon) {
  return Icon(
    icon,
    color: Colors.brown,
    size: 35,
  );
}
