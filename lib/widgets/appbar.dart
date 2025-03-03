import 'package:flutter/material.dart';

class HabitAssistantAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const HabitAssistantAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
          icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
        ),
    );
  }
}
