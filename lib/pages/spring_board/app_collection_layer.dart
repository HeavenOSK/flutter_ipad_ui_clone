import 'package:flutter/material.dart';
import 'package:ipad_ui/components/normal_app_icon.dart';

class AppCollectionLayer extends StatelessWidget {
  const AppCollectionLayer({Key? key}) : super(key: key);

  static const double topPadding = 102;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: topPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < 6; i++)
            Column(
              children: const [
                NormalAppIcon(),
                SizedBox(height: 4),
                Text(
                  'example',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
