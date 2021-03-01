import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ContextMenuAction {
  edit,
  delete,
}

class AppContextMenu extends StatefulWidget {
  const AppContextMenu({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  static const double _padding = 8;

  final void Function(ContextMenuAction action) onSelect;

  @override
  _AppContextMenuState createState() => _AppContextMenuState();
}

class _AppContextMenuState extends State<AppContextMenu>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 120),
  );

  static double _height = 80;

  static const _size = Size(200, 80);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
    Future.delayed(
      const Duration(milliseconds: 80),
      _controller.forward,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = _size * _controller.value;
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
          ),
          child: FittedBox(
            child: Opacity(
              opacity: _controller.value,
              child: SizedBox(
                height: _size.height,
                width: _size.width,
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppContextMenu._padding,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('Edit Home Screen'),
                              Spacer(),
                              Icon(Icons.keyboard_outlined),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black.withOpacity(0.3),
                              width: 0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppContextMenu._padding,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Delete App',
                                style: TextStyle(
                                  color: CupertinoColors.destructiveRed,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.delete_outlined,
                                color: CupertinoColors.destructiveRed,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
