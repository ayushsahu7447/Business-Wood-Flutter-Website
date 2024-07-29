import 'package:bw/models/footer_links.dart';
import 'package:bw/widgets/footer_links.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class SixthSection extends StatefulWidget {
//   const SixthSection({Key? key}) : super(key: key);
//
//   @override
//   State<SixthSection> createState() => _SixthSectionState();
// }
//
// class _SixthSectionState extends State<SixthSection> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300.0,
//       color: Colors.pink.shade100,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           bool isWideScreen = constraints.maxWidth > 800;
//
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Expanded(
//                 child: isWideScreen
//                     ? Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: footer
//                       .map((footer) => FooterLink(footer: footer))
//                       .toList(),
//                 )
//                     : Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: footer
//                       .map((footer) => FooterLink(footer: footer))
//                       .toList(),
//                 ),
//               ),
//               if (isWideScreen)
//                 Container(
//                   margin: const EdgeInsets.only(
//                     left: 50.0,
//                     right: 80.0,
//                   ),
//                   height: 200.0,
//                   width: 250.0,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Subscribe Now',
//                         style: GoogleFonts.quicksand(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 15.0,
//                       ),
//                       TextField(
//                         decoration: InputDecoration(
//                           suffixIcon: const Icon(
//                             Icons.person_outline_rounded,
//                             color: Colors.black,
//                           ),
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 20.0, vertical: 20.0),
//                           hintText: 'Your Email',
//                           hintStyle: GoogleFonts.quicksand(
//                             color: Colors.black45,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black26,
//                               width: 1.5,
//                             ),
//                             borderRadius: BorderRadius.circular(100.0),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black26,
//                               width: 1.5,
//                             ),
//                             borderRadius: BorderRadius.circular(100.0),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10.0,
//                       ),
//                       SizedBox(
//                         height: 50.0,
//                         width: 250.0,
//                         child: TextButton(
//                           style: TextButton.styleFrom(
//                             backgroundColor: Colors.red,
//                             foregroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(100.0),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Text(
//                             'Subscribe Now',
//                             style: GoogleFonts.quicksand(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }



class SixthSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 900;
    final double containerHeight = isDesktop ? 300.0 : 800.0;
    final double containerWidth = isDesktop ? 800.0 : MediaQuery.of(context).size.width - 40;

    return Container(
      height: containerHeight,
      color: Colors.indigo.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: isDesktop
          ? _buildDesktopLayout(containerWidth)
          : _buildMobileLayout(containerWidth),
    );
  }

  Widget _buildDesktopLayout(double containerWidth) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: footer
                .map((footer) => FooterLink(footer: footer))
                .toList(),
          ),
        ),
        const SizedBox(width: 50.0),
        _buildSubscriptionForm(),
      ],
    );
  }

  Widget _buildMobileLayout(double containerWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: footer
              .map((footer) => FooterLink(footer: footer))
              .toList(),
        ),
        const SizedBox(height: 30.0),
        _buildSubscriptionForm(),
      ],
    );
  }

  Widget _buildSubscriptionForm() {
    return Container(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subscribe Now',
            style: GoogleFonts.quicksand(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15.0),
          TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.person_outline_rounded,
                color: Colors.black,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              hintText: 'Your Email',
              hintStyle: GoogleFonts.quicksand(
                fontSize: 14,
                color: Colors.black45,
                fontWeight: FontWeight.w700,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black26,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(100.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black26,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 50.0,
            width: 300,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Subscribe Now',
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:bw/models/footer_links.dart';
// import 'package:bw/widgets/footer_links.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class SixthSection extends StatefulWidget {
//   const SixthSection({Key? key}) : super(key: key);
//
//   @override
//   State<SixthSection> createState() => _SixthSectionState();
// }
//
// class _SixthSectionState extends State<SixthSection> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300.0,
//       color: Colors.pink.shade100,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Expanded(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: footer
//                   .map((footer) => FooterLink(footer: footer,))
//                   .toList(),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(
//               left: 50.0,
//               right: 80.0,
//             ),
//             height: 200.0,
//             width: 250.0,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Subscribe Now',
//                   style: GoogleFonts.quicksand(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15.0,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                     suffixIcon: const Icon(
//                       Icons.person_outline_rounded,
//                       color: Colors.black,
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 20.0, vertical: 20.0),
//                     hintText: 'Your Email',
//                     hintStyle: GoogleFonts.quicksand(
//                       color: Colors.black45,
//                       fontWeight: FontWeight.w700,
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Colors.black26,
//                         width: 1.5,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Colors.black26,
//                         width: 1.5,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//                 SizedBox(
//                   height: 50.0,
//                   width: 250.0,
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       'Subscribe Now',
//                       style: GoogleFonts.quicksand(
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }