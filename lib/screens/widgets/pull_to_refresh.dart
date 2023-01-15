import 'package:flutter/material.dart';

class RefreshScreenWidget extends StatefulWidget {
  final Widget widget;
  final Future future;
  const RefreshScreenWidget({super.key, required this.widget, required this.future});

  @override
  State<RefreshScreenWidget> createState() => _RefreshScreenWidgetState();
}

class _RefreshScreenWidgetState extends State<RefreshScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: Colors.redAccent,
        onRefresh: () {
          return Future.delayed(const Duration(milliseconds: 1000), () {
            setState(() => widget.future);
          });
        },
        child: widget.widget);
    ;
  }
}
