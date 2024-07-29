import 'package:bw/models/item.dart';
import 'package:bw/models/scroll_offset.dart';
import 'package:bw/widgets/item_card.dart';
import 'package:bw/widgets/text_reveal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection>
    with TickerProviderStateMixin {
  late AnimationController controller;
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
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double bigtitleFontSize = screenWidth < 600 ? 20.0 : 55.0;
    return Column(
      children: [

        BlocBuilder<DisplayOffset, ScrollOffset>(
          buildWhen: (previous, current) {
            if ((current.scrollOffsetValue >= 900 &&
                current.scrollOffsetValue <= 1300) ||
                controller.isAnimating) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state.scrollOffsetValue > 1100.0) {
              controller.forward();
            } else {
              controller.reverse();
            }
            return TextReveal(
              controller: controller,
              maxHeight: 70.0,
              child: Text(
                'Our Service for Clients',
                style: GoogleFonts.quicksand(
                  fontSize: bigtitleFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 100,
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
          child: Center(
            child: Wrap(
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 70,
              spacing: 100,
                 children: items
                  .map(
                    (item) => ItemCard(
                  image: item.image,
                  title: item.title,
                  subtitle: item.subtitle,
                  description: item.description,
                  price: item.price,
                  index: items.indexOf(item) + 1,
                ),
              )
                  .toList(),
            ),
          ),
        ),
        const SizedBox(
          height: 100.0,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.indigo.shade800,
          ),
          onPressed: () {},
          child: Text(
            'View More',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
