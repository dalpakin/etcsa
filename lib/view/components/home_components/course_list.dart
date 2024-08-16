import 'package:etcsa/view/components/home_components/course_box.dart';
import 'package:flutter/material.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      {
        'icon':
            "https://medsis.izmirekonomi.edu.tr/static/media/department_icon_1.9443ce996c3542c7f0884c0abd3024d4.svg",
        'courseCode': "CCS 510",
        'courseTitle': "Elective Clerkship"
      },
      {
        'icon':
            "https://medsis.izmirekonomi.edu.tr/static/media/department_icon_1.9443ce996c3542c7f0884c0abd3024d4.svg",
        'courseCode': "CCS 511",
        'courseTitle': "Advanced Clerkship"
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Large screen layout
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 3 / 2,
            ),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return CourseBox(
                isCurrentCourse: true,
                icon: course['icon']!,
                courseCode: course['courseCode']!,
                courseTitle: course['courseTitle']!,
              );
            },
          );
        } else {
          // Small screen layout
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CourseBox(
                  icon: course['icon']!,
                  courseCode: course['courseCode']!,
                  courseTitle: course['courseTitle']!,
                ),
              );
            },
          );
        }
      },
    );
  }
}
