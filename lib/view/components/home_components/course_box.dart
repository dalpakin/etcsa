import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseBox extends StatelessWidget {
  final String icon;
  final bool? isCurrentCourse;
  final String courseCode;
  final String courseTitle;

  const CourseBox({
    super.key,
    required this.icon,
    required this.courseTitle,
    this.isCurrentCourse = false,
    required this.courseCode,
  });

  @override
  Widget build(BuildContext context) {
    final Widget networkSvg = SvgPicture.network(
      icon,
      semanticsLabel: 'SVG',
      placeholderBuilder: (BuildContext context) => Container(
          padding: const EdgeInsets.all(30.0),
          child: const CircularProgressIndicator()),
    );

    return Container(
      decoration: BoxDecoration(
        color: isCurrentCourse!
            ? Colors.blue.withOpacity(0.1)
            : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          networkSvg,
          const SizedBox(height: 5),
          Text(
            courseCode,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          Text(
            courseTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
