import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:router_innovation/pages/my_home_page.dart';

import '../functions.dart';
import 'my_builder_page.dart';

class MySetupPage extends StatefulWidget {
  const MySetupPage({super.key});

  @override
  State<MySetupPage> createState() => _MySetupPageState();
}

class _MySetupPageState extends State<MySetupPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pcCount.clear();
    projectName.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Stack(
            children: [
              SizedBox(
                height: height(context),
                width: width(context),
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: width(context),
                        child: Align(
                          alignment: Alignment(0, 0),
                          child: SvgPicture.asset(
                            'assets/set_up.svg',
                            width: 250,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.75, 0),
                      child: Text(
                        'Set Up:',
                        style: GoogleFonts.afacad(
                          textStyle: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontSize: 42,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: width(context) * 0.85,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.05),
                      ),
                      child: TextField(
                        controller: projectName,
                        style: GoogleFonts.afacad(
                          textStyle: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.w300),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter the project name',
                          hintStyle: GoogleFonts.afacad(
                            textStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiary
                                    .withOpacity(0.5),
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: width(context) * 0.85,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.05),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: pcCount,
                        style: GoogleFonts.afacad(
                          textStyle: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.w300),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'No.of PC\'s',
                          hintStyle: GoogleFonts.afacad(
                            textStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiary
                                    .withOpacity(0.5),
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (projectName.text.isNotEmpty &&
                            pcCount.text.isNotEmpty) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyBuilderPage()),
                          );
                        } else {
                          showToast('Enter all fields first!');
                        }
                      },
                      child: Container(
                        width: width(context) * 0.85,
                        height: 50,
                        alignment: Alignment(0, 0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text(
                          'Create',
                          style: GoogleFonts.afacad(
                            textStyle: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.075,
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment(-0.85, -0.95),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
