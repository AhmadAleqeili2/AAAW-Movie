

import 'package:flutter/material.dart';

class utilsREstart extends StatefulWidget {
  const utilsREstart({super.key, required this.child});
  final Widget child;
  @override
  State<utilsREstart> createState() => _UtilsRestartState();

  // access for any thing include class private
  static void reDraw(BuildContext context) =>
      context.findAncestorStateOfType<_UtilsRestartState>()?.changeKey();
}

class _UtilsRestartState extends State<utilsREstart> {
  /// [key] create key
  Key key = UniqueKey();

  /// [changeKey]  new key and update ui
  void changeKey() {
    key = UniqueKey();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.child);
  }
}