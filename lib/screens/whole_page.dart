import 'package:bw/models/scroll_offset.dart';
import 'package:bw/screens/sections/fifth_section.dart';
import 'package:bw/screens/sections/first_section.dart';
import 'package:bw/screens/sections/fourth_section.dart';
import 'package:bw/screens/sections/second_section.dart';
import 'package:bw/screens/sections/sixth_section.dart';
import 'package:bw/screens/sections/third_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WholePage extends StatefulWidget {
  const WholePage({Key? key}) : super(key: key);

  @override
  State<WholePage> createState() => _WholePageState();
}

class _WholePageState extends State<WholePage> {
  late ScrollController controller;
  @override
  void initState(){
    controller = ScrollController();
    super.initState();

    controller.addListener(() {
      context.read<DisplayOffset>().changeDisplayOffset(
          (MediaQuery.of(context).size.height + controller.position.pixels)
              .toInt()
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
    child: Column(
      children: [
        FirstSection(),
        SizedBox(
          height: 100.0,
        ),
        SecondSection(),
        SizedBox(
          height: 100.0,
        ),
        ThirdSection(),
        SizedBox(
          height: 120.0,
        ),
        FourthSection(),
        SizedBox(
          height: 100.0,
        ),
        FifthSection(),
        SizedBox(
          height: 100,
        ),
        SixthSection(),
      ],
    ),);
  }
}
