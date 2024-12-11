import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../functions.dart';

class SystemPath extends StatefulWidget {
  const SystemPath({super.key});

  @override
  State<SystemPath> createState() => _SystemPathState();
}

class _SystemPathState extends State<SystemPath> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) * 0.6 - 10,
      width: width(context) * 0.8,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Shortest Path',
            style: GoogleFonts.afacad(
              textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/computer.png',
                    width: 75,
                  ),
                  Text(
                    'System $senderPc',
                    style: GoogleFonts.afacad(
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_right_alt_rounded,
                size: 25,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/computer.png',
                    width: 75,
                  ),
                  Text(
                    'System $receiverPc',
                    style: GoogleFonts.afacad(
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            'Path',
            style: GoogleFonts.afacad(
              textStyle: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.tertiary,
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Container(
            width: 200,
            height: height(context) * 0.325,
            child: ListView.builder(
                itemCount: routerPath.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/computer.png',
                            width: 75,
                          ),
                          Text(
                            'System ${routerPath[index]}',
                            style: GoogleFonts.afacad(
                              textStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          if (index != routerPath.length - 1)
                            Container(
                              width: 2,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1)),
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            )
                        ],
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
