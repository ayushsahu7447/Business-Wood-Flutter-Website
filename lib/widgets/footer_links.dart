import 'package:bw/models/footer_links.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterLink extends StatelessWidget {
  final Footer footer;
  const FooterLink({Key? key, required this.footer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.0,
        ),
        Text(
          footer.title,
          style: GoogleFonts.quicksand(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: footer.parameters
              .map(
                (params) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                params,
                style: GoogleFonts.quicksand(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black45,
                ),
              ),
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}