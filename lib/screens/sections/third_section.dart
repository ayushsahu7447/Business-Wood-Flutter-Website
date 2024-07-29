import 'package:bw/models/infos.dart';
import 'package:bw/widgets/info_card.dart';
import 'package:bw/widgets/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/scroll_offset.dart';


import 'package:bw/models/infos.dart';
import 'package:bw/widgets/info_card.dart';
import 'package:bw/widgets/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/scroll_offset.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({Key? key}) : super(key: key);

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 375),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double bigtitleFontSize = screenWidth < 600 ? 20.0 : 45.0;
    return Container(
      color: Colors.indigo.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1080) {
            // Web view: Show items in a row
            return Column(
              children: [
                BlocBuilder<DisplayOffset, ScrollOffset>(
                  buildWhen: (previous, current) {
                    if ((current.scrollOffsetValue >= 1900 && current.scrollOffsetValue <= 2300) ||
                        controller.isAnimating) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  builder: (context, state) {
                    if (state.scrollOffsetValue > 2100.0) {
                      controller.forward();
                    } else {
                      controller.reverse();
                    }
                    return TextReveal(
                      controller: controller,
                      maxHeight: 55.0,
                      child: Text(
                        'Why Business Woods',
                        style: GoogleFonts.quicksand(
                          fontSize: bigtitleFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: infos.map((info) => InfoCard(info: info)).toList(),
                ),
              ],
            );
          } else {
            // Mobile view: Show items in a column without scroll
            return Column(
              children: [
                BlocBuilder<DisplayOffset, ScrollOffset>(
                  buildWhen: (previous, current) {
                    if ((current.scrollOffsetValue >= 1900 && current.scrollOffsetValue <= 2300) ||
                        controller.isAnimating) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  builder: (context, state) {
                    if (state.scrollOffsetValue > 2100.0) {
                      controller.forward();
                    } else {
                      controller.reverse();
                    }
                    return TextReveal(
                      controller: controller,
                      maxHeight: 55.0,
                      child: Text(
                        'Why Business Woods?',
                        style: GoogleFonts.quicksand(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                Column(
                  children: infos.map((info) => InfoCard(info: info)).toList(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}


// class ThirdSection extends StatefulWidget {
//   const ThirdSection({Key? key}) : super(key: key);
//
//   @override
//   State<ThirdSection> createState() => _ThirdSectionState();
// }
//
// class _ThirdSectionState extends State<ThirdSection> with TickerProviderStateMixin{
//
//   late AnimationController controller;
//
//   @override
//   void initState(){
//     controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000),reverseDuration: Duration(milliseconds: 375));
//     super.initState();
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 510,
//       color: Colors.red.withOpacity(0.1),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 50,
//             ),
//
//             BlocBuilder<DisplayOffset, ScrollOffset>(
//                 buildWhen: (previous, current) {
//                   if ((current.scrollOffsetValue >= 1900 && current.scrollOffsetValue <= 2300) || controller.isAnimating) {
//                     return true;
//                   } else {
//                     return false;
//                   }
//                 }, builder: (context, state) {
//               if (state.scrollOffsetValue > 2100.0) {
//                 controller.forward();
//               } else {
//                 controller.reverse();
//               }
//               return TextReveal(
//                 controller: controller,
//                 maxHeight: 55.0,
//                 child: Text(
//                   'Why Business Woods',
//                   style: GoogleFonts.quicksand(
//                     fontSize: 45.0,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               );
//             }),
//
//             SizedBox(height: 40,),
//
//       Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: infos
//               .map((info) => InfoCard(
//             info: info,
//           ))
//               .toList()),
//       const SizedBox(
//         height: 50.0,)
//
//           ],
//         ),
//     );
//   }
// }
