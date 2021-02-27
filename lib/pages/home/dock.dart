import 'package:flutter/material.dart';
import 'package:ipad_ui/pages/home/app_icon/app_icon.dart';

class Dock extends StatelessWidget {
  const Dock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 108,
        width: 560,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 1),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              child: Center(
                child: AppIcon(
                  index: 0,
                  key: ValueKey(0),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: AppIcon(
                  index: 1,
                  key: ValueKey(1),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: AppIcon(
                  index: 2,
                  key: ValueKey(2),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              width: 2,
              color: const Color.fromRGBO(230, 230, 230, 1),
            ),
            const Expanded(
              child: Center(
                child: AppIcon(
                  index: 3,
                  key: ValueKey(3),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: AppIcon(
                  index: 4,
                  key: ValueKey(4),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: AppIcon(
                  index: 5,
                  key: ValueKey(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
