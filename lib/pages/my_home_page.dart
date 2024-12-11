import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:router_innovation/functions.dart';
import 'package:router_innovation/pages/my_setup_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          SizedBox(
            height: height(context),
            width: width(context),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/find_your_path.svg',
                        height: 250,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        'Design your',
                        style: GoogleFonts.afacad(
                          textStyle: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Network',
                            style: GoogleFonts.afacad(
                                textStyle: TextStyle(
                                    fontSize: 34,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Efficiency',
                            style: GoogleFonts.afacad(
                              textStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MySetupPage()),
                    );
                  },
                  child: Container(
                    width: width(context) - 40,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Icon(
                      Icons.arrow_right_alt_rounded,
                      size: 25,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: SizedBox(
              height: 60,
              child: Column(
                children: [
                  Text(
                    'Powered by:',
                    style: GoogleFonts.afacad(
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    'ByteWise Creators',
                    style: GoogleFonts.afacad(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
