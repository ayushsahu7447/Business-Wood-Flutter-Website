import 'package:flutter/material.dart';

class Info {
  String title;
  String description;
  IconData iconData;

  Info({
    required this.title,
    required this.description,
    required this.iconData,
  });
}

List<Info> infos = [
  Info(
    title: 'Market Intelligence ',
    description:
        'We are strategists. Our teams exposure to startups and businesses through case studies and data analysis enables us to provide tailored solutions for every client.',
    iconData: Icons.arrow_circle_up_sharp,
  ),
  Info(
    title: 'Visual StoryTelling',
    description:
    'Create captivating videos and graphics that transport your audience into the heart of your brands narrative with stunning visuals that leave a lasting impression ',
    iconData: Icons.edit_note,
  ),
  Info(
    title: 'How we work',
    description:
        'We use a diverse strategy to target, reach out to, and build relationships with customers digitally, across a multi - channel approach, resulting in leads that drive sales',
    iconData: Icons.work,
  ),
  Info(
    title: 'Fast Track Wonders',
    description:
    'Experience the magic of our swift and seamless workflow. From concept to delivery, our skilled team ensures impressive results at lightning speed.',
    iconData: Icons.delivery_dining_outlined,
  ),
];