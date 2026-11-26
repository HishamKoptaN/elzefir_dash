import 'package:flutter/material.dart';
import 'navigation/custom_app_bar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final bool showAppBar;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final String? title;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  CustomScaffold({
    super.key,
    required this.body,
    this.showAppBar = true,
    this.appBar,
    this.drawer,
    this.title,
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? CustomAppBar(title: title ?? '') : null,
      drawer: drawer,
      backgroundColor: backgroundColor ?? Colors.white,
      body: SafeArea(child: body),
      floatingActionButton: floatingActionButton,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
