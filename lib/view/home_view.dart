import 'package:flutter/material.dart';

import 'components/common/profile_image_viewer.dart';
import 'components/home_components/course_list.dart';

class HomeView extends StatefulWidget {
  static const route = '/home';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
              "Welcome, Ece Havancı",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 22),
            ),
            const SizedBox(
              height: 5,
            ),
            const ProfileImageViewer(
              stuID: '20190601022',
            ),
            const SizedBox(
              height: 15,
            ),
            Divider(),
            Text(
              "Your course list of this year,",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 15,
            ),
            const CourseList()
          ],
        ),
      ),
    );
  }
}
