import 'package:flutter/material.dart';
import 'package:italian_food/views/menu/widgets/menu_item_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItemWidget(),
        MenuItemWidget(),
        MenuItemWidget(),
      ],
    );
  }
}
