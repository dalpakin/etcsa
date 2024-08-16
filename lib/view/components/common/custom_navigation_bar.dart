import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int, String?) onSelect;
  final int selectedIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onSelect,
    required this.selectedIndex,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _onItemTapped(int index) {
    if (index == 1) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.dataset),
                title: const Text('Draft Patient Form'),
                onTap: () {
                  Navigator.pop(context);
                  widget.onSelect(index, 'patient');
                },
              ),
              ListTile(
                leading: const Icon(Icons.dataset),
                title: const Text('Draft Procedure Form'),
                onTap: () {
                  Navigator.pop(context);
                  widget.onSelect(index, 'procedure');
                },
              ),
            ],
          );
        },
      );
    } else if (index == 2) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.add_circle),
                title: const Text('Add Patient Form'),
                onTap: () {
                  Navigator.pop(context);
                  widget.onSelect(index, 'patient');
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_circle),
                title: const Text('Add Procedure Form'),
                onTap: () {
                  Navigator.pop(context);
                  widget.onSelect(index, 'procedure');
                },
              ),
            ],
          );
        },
      );
    } else if (index == 3) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.send),
                title: const Text('Sent Patient Form'),
                onTap: () {
                  Navigator.pop(context);
                  widget.onSelect(index, 'sent-patient');
                },
              ),
              ListTile(
                leading: const Icon(Icons.send),
                title: const Text('Sent Procedure Form'),
                onTap: () {
                  Navigator.pop(context);
                  widget.onSelect(index, 'sent-procedure');
                },
              ),
            ],
          );
        },
      );
    } else {
      widget.onSelect(index, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomBarBubble(
      selectedIndex: widget.selectedIndex,
      color: const Color.fromRGBO(254, 107, 1, 0.8),
      items: [
        BottomBarItem(iconData: Icons.home),
        BottomBarItem(iconData: Icons.dataset),
        BottomBarItem(iconData: Icons.add_circle),
        BottomBarItem(iconData: Icons.send),
        BottomBarItem(iconData: Icons.dashboard),
      ],
      onSelect: _onItemTapped,
    );
  }
}

class LocalNotificationsPage extends StatelessWidget {
  const LocalNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notifications'),
      ),
      body: const Center(
        child: Text('This is the Local Notifications page.'),
      ),
    );
  }
}

class PushNotificationsPage extends StatelessWidget {
  const PushNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Notifications'),
      ),
      body: const Center(
        child: Text('This is the Push Notifications page.'),
      ),
    );
  }
}
