import 'package:bw/models/scroll_offset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final String price;
  final int index;
  const ItemCard({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.index,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> with TickerProviderStateMixin {
  bool isHovered = false;

  late AnimationController controller;

  late Animation<double> imageReveal;
  late Animation<double> imageOpacity;
  late Animation<double> headingTextOpacity;
  late Animation<double> subTextOpacity;
  late Animation<double> descriptionOpacity;
  late Animation<double> priceOpacity;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
        reverseDuration: const Duration(milliseconds: 500));

    imageReveal = Tween<double>(begin: 00.0, end: 170.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.50, curve: Curves.easeInOutCubic)));

    imageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut)));

    headingTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.5, curve: Curves.easeOut)));

    subTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.6, curve: Curves.easeOut)));

    descriptionOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 0.8, curve: Curves.easeOut)));

    priceOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize = screenWidth < 620 ? 100.0 : 180.0;
    double titleFontSize = screenWidth < 600 ? 12.0 : 20.0;
    double subtitleFontSize = screenWidth < 600 ? 6.0 : 15.0;
    double descriptionFontSize = screenWidth < 600 ? 8.0 : 16.0;
    double priceFontSize = screenWidth < 600 ? 12.0 : 18.0;



    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 375),
        height: 180.0,
        width: 520.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: isHovered
              ? [
            const BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 20.0,
              color: Colors.black12,
            ),
          ]
              : [],
        ),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          child: InkWell(
            hoverColor: Colors.white,
            highlightColor: Colors.white,
            splashColor: Colors.black12,
            onTap: () {},
            child: BlocBuilder<DisplayOffset, ScrollOffset>(
                buildWhen: (previous, current) {
                  if ((current.scrollOffsetValue >= 1000 &&
                      current.scrollOffsetValue <= 1950) ||
                      controller.isAnimating) {
                    return true;
                  } else {
                    return false;
                  }
                }, builder: (context, state) {
              if (state.scrollOffsetValue >= (1100 + (widget.index * 100))) {
                controller.forward();
              } else {
                controller.reverse();
              }
              return AnimatedBuilder(
                  animation: imageOpacity,
                  builder: (context, child) {
                    return Row(
                      children: [
                        SizedBox(
                          height: imageSize,
                          width: imageSize,
                          child: Center(
                            child: FadeTransition(
                              opacity: imageOpacity,
                              child: SizedBox(
                                height: imageReveal.value,
                                width: imageReveal.value,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    widget.image,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.medium,
                                    scale: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FadeTransition(
                                opacity: headingTextOpacity,
                                child: Text(
                                  widget.title,
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w700,
                                    fontSize: titleFontSize,
                                  ),
                                ),
                              ),
                              FadeTransition(
                                opacity: subTextOpacity,
                                child: Text(
                                  widget.subtitle,
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w500,
                                    fontSize: subtitleFontSize,
                                    color: Colors.black38,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              FadeTransition(
                                opacity: descriptionOpacity,
                                child: Text(
                                  widget.description,
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,
                                    fontSize:descriptionFontSize,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              FadeTransition(
                                opacity: priceOpacity,
                                child: Text(
                                  widget.price,
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w700,
                                    fontSize: priceFontSize,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                      ],
                    );
                  });
            }),
          ),
        ),
      ),
    );
  }
}














// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class ItemCard extends StatefulWidget {
//   final String image;
//   final String title;
//   final String subtitle;
//   final String description;
//   final String price;
//   final int index;
//   const ItemCard({
//     Key? key,
//     required this.image,
//     required this.title,
//     required this.subtitle,
//     required this.description,
//     required this.price,
//     required this.index,
//   }) : super(key: key);
//
//   @override
//   State<ItemCard> createState() => _ItemCardState();
// }
//
// class _ItemCardState extends State<ItemCard> with TickerProviderStateMixin{
//   bool isHovered = false;
//
//   late AnimationController controller;
//
//   late Animation<double> imageReveal;
//   late Animation<double> imageOpacity;
//   late Animation<double> headingTextOpacity;
//   late Animation<double> subTextOpacity;
//   late Animation<double> descriptionOpacity;
//   late Animation<double> priceOpacity;
//
//   @override
//   void initState() {
//     controller = AnimationController(
//         vsync: this,
//         duration: const Duration(milliseconds: 1500),
//         reverseDuration: const Duration(milliseconds: 500));
//
//     imageReveal = Tween<double>(begin: 00.0, end: 170.0).animate(
//         CurvedAnimation(
//             parent: controller,
//             curve: const Interval(0.0, 0.50, curve: Curves.easeInOutCubic)));
//
//     imageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.0, 0.5, curve: Curves.easeOut)));
//
//     headingTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
//         CurvedAnimation(
//             parent: controller,
//             curve: const Interval(0.3, 0.5, curve: Curves.easeOut)));
//
//     subTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
//         CurvedAnimation(
//             parent: controller,
//             curve: const Interval(0.4, 0.6, curve: Curves.easeOut)));
//
//     descriptionOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
//         CurvedAnimation(
//             parent: controller,
//             curve: const Interval(0.6, 0.8, curve: Curves.easeOut)));
//
//     priceOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//         parent: controller,
//         curve: const Interval(0.8, 1.0, curve: Curves.easeOut)));
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 180,
//       width: 580,
//       child: AnimatedBuilder(
//           animation: controller,
//           builder: (context, child) {
//             return Row(
//               children: [
//                 SizedBox(
//                   height: 180.0,
//                   width: 180.0,
//                   child: Center(
//                     child: FadeTransition(
//                       opacity: imageOpacity,
//                       child: SizedBox(
//                         height: imageReveal.value,
//                         width: imageReveal.value,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10.0),
//                           child: Image.network(
//                             widget.image,
//                             fit: BoxFit.cover,
//                             filterQuality: FilterQuality.medium,
//                             scale: 0.5,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20.0,
//                 ),
//                 Flexible(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       FadeTransition(
//                         opacity: headingTextOpacity,
//                         child: Text(
//                           widget.title,
//                           style: GoogleFonts.quicksand(color: Colors.black,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                       ),
//                       FadeTransition(
//                         opacity: subTextOpacity,
//                         child: Text(
//                           widget.subtitle,
//                           style: GoogleFonts.quicksand(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15.0,
//                             color: Colors.black38,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10.0,
//                       ),
//                       FadeTransition(
//                         opacity: descriptionOpacity,
//                         child: Text(
//                           widget.description,
//                           style: GoogleFonts.quicksand(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.0,
//                             color: Colors.black54,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 15.0,
//                       ),
//                       FadeTransition(
//                         opacity: priceOpacity,
//                         child: Text(
//                           widget.price,
//                           style: GoogleFonts.quicksand(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 18.0,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20.0,
//                 ),
//               ],
//             );
//           })
//     );
//   }
// }