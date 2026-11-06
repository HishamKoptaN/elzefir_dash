import 'package:flutter/material.dart';
import 'navigation/custom_app_bar.dart';

class CustomScaffold extends StatelessWidget {
  Widget body;
  bool showAppBar;
  PreferredSizeWidget? appBar;
  Widget? drawer;
  String? title;
  Color? backgroundColor;
  Widget? floatingActionButton;
  FloatingActionButtonAnimator? floatingActionButtonAnimator;
  FloatingActionButtonLocation? floatingActionButtonLocation;
  Widget? bottomNavigationBar;
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
