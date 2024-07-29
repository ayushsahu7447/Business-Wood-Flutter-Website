import 'package:bw/models/cheifs.dart';
import 'package:bw/models/scroll_offset.dart';
import 'package:bw/widgets/chef_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text_reveal.dart';

class FifthSection extends StatefulWidget {
  const FifthSection({Key? key}) : super(key: key);

  @override
  State<FifthSection> createState() => _FifthSectionState();
}

class _FifthSectionState extends State<FifthSection> with TickerProviderStateMixin {
  late AnimationController controller;
  late ScrollController scrollController;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
      reverseDuration: const Duration(
        milliseconds: 375,
      ),
    );

    scrollController = ScrollController();

    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _scrollLeft() {
    scrollController.animateTo(
      scrollController.offset - MediaQuery.of(context).size.width,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    scrollController.animateTo(
      scrollController.offset + MediaQuery.of(context).size.width,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DisplayOffset, ScrollOffset>(
          buildWhen: (previous, current) {
            if (current.scrollOffsetValue > 2500) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state.scrollOffsetValue > 3100) {
              controller.forward();
            } else {
              controller.reverse();
            }
            return TextReveal(
              maxHeight: 55.0,
              controller: controller,
              child: Text(
                'Our Portfolio',
                style: GoogleFonts.quicksand(
                  fontSize: MediaQuery.of(context).size.width > 600 ? 40.0 : 25.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
        const SizedBox(
          height: 50.0,
        ),
        Row(
          children: [
            IconButton(
              onPressed: _scrollLeft,
              icon: Icon(Icons.arrow_back_ios),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: chefs
                      .map((chef) => ChefCard(
                    chef: chef,
                  ))
                      .toList(),
                ),
              ),
            ),
            IconButton(
              onPressed: _scrollRight,
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ],
    );
  }
}

// import 'package:bw/models/cheifs.dart';
// import 'package:bw/models/scroll_offset.dart';
// import 'package:bw/widgets/chef_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../widgets/text_reveal.dart';
//
//
//
// class FifthSection extends StatefulWidget {
//   const FifthSection({Key? key}) : super(key: key);
//
//   @override
//   State<FifthSection> createState() => _FifthSectionState();
// }
//
// class _FifthSectionState extends State<FifthSection>
//     with TickerProviderStateMixin {
//   late AnimationController controller;
//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(
//         milliseconds: 1000,
//       ),
//       reverseDuration: const Duration(
//         milliseconds: 375,
//       ),
//     );
//     super.initState();
//
//     Future.delayed(const Duration(milliseconds: 1000), () {
//       controller.forward();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         BlocBuilder<DisplayOffset, ScrollOffset>(
//           buildWhen: (previous, current) {
//             if (current.scrollOffsetValue > 2500) {
//               return true;
//             } else {
//               return false;
//             }
//           },
//           builder: (context, state) {
//             if (state.scrollOffsetValue > 3100) {
//               controller.forward();
//             } else {
//               controller.reverse();
//             }
//             return TextReveal(
//               maxHeight: 55.0,
//               controller: controller,
//               child: Text(
//                 'Most Expert Chefs',
//                 style: GoogleFonts.quicksand(
//                   fontSize: MediaQuery.of(context).size.width > 600 ? 40.0 : 30.0,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             );
//           },
//         ),
//         const SizedBox(
//           height: 50.0,
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: chefs
//                 .map((chef) => ChefCard(
//               chef: chef,
//             ))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class FifthSection extends StatefulWidget {
//   const FifthSection({Key? key}) : super(key: key);
//
//   @override
//   State<FifthSection> createState() => _FifthSectionState();
// }
//
// class _FifthSectionState extends State<FifthSection>
//     with TickerProviderStateMixin {
//   late AnimationController controller;
//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(
//         milliseconds: 1000,
//       ),
//       reverseDuration: const Duration(
//         milliseconds: 375,
//       ),
//     );
//     super.initState();
//
//     Future.delayed(const Duration(milliseconds: 1000), () {
//       controller.forward();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         bool isMobile = constraints.maxWidth < 600;
//
//         return Column(
//           children: [
//             BlocBuilder<DisplayOffset, ScrollOffset>(
//               buildWhen: (previous, current) {
//                 if (current.scrollOffsetValue > 2500) {
//                   return true;
//                 } else {
//                   return false;
//                 }
//               },
//               builder: (context, state) {
//                 if (state.scrollOffsetValue > 3100) {
//                   controller.forward();
//                 } else {
//                   controller.reverse();
//                 }
//                 return TextReveal(
//                   maxHeight: isMobile ? 30.0 : 55.0,
//                   controller: controller,
//                   child: Text(
//                     'Most Expert Chefs',
//                     style: GoogleFonts.quicksand(
//                       fontSize: isMobile ? 30.0 : 40.0,
//                       fontWeight: FontWeight.w700,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             if (isMobile)
//               Column(
//                 children: chefs
//                     .map((chef) => ChefCard(
//                   chef: chef,
//                 ))
//                     .toList(),
//               )
//             else
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: chefs
//                     .map((chef) => ChefCard(
//                   chef: chef,
//                 ))
//                     .toList(),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }
//
//
//
//








//
// class FifthSection extends StatefulWidget {
//   const FifthSection({Key? key}) : super(key: key);
//
//   @override
//   State<FifthSection> createState() => _FifthSectionState();
// }
//
// class _FifthSectionState extends State<FifthSection>
//     with TickerProviderStateMixin {
//   late AnimationController controller;
//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(
//         milliseconds: 1000,
//       ),
//       reverseDuration: const Duration(
//         milliseconds: 375,
//       ),
//     );
//     super.initState();
//
//     Future.delayed(const Duration(milliseconds: 1000), () {
//       controller.forward();
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         BlocBuilder<DisplayOffset, ScrollOffset>(
//             buildWhen: (previous, current) {
//               if (current.scrollOffsetValue > 2500) {
//                 return true;
//               } else {
//                 return false;
//               }
//             }, builder: (context, state) {
//           if (state.scrollOffsetValue > 3100) {
//             controller.forward();
//           } else {
//             controller.reverse();
//           }
//           return TextReveal(
//             maxHeight: 55.0,
//             controller: controller,
//             child: Text(
//               'Most Expert Chefs',
//               style: GoogleFonts.quicksand(
//                 fontSize: 40.0,
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           );
//         }),
//         const SizedBox(
//           height: 50.0,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: chefs
//               .map((chef) => ChefCard(
//             chef: chef,
//           ))
//               .toList(),
//         ),
//       ],
//     );
//   }
// }
