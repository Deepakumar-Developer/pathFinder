import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:router_innovation/functions.dart';

class SystemRouters extends StatefulWidget {
  const SystemRouters({super.key});

  @override
  State<SystemRouters> createState() => _SystemRoutersState();
}

class _SystemRoutersState extends State<SystemRouters> {
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
        children: [
          Text(
            'Router Table',
            style: GoogleFonts.afacad(
              textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Image.asset(
            'assets/router.png',
            fit: BoxFit.fill,
            width: 125,
            height: 125,
          ),
          SizedBox(
            height: 220,
            child: PageView.builder(
                itemCount: routingTable.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        'Router ${index + 1}',
                        style: GoogleFonts.afacad(
                          textStyle: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            tableText('To'),
                            tableText('Cost'),
                            tableText('Next'),
                          ])
                        ],
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView(
                          children: [
                            Table(
                              border: TableBorder.all(),
                              children: routingTable[index].map((map) {
                                return TableRow(
                                  children: [
                                    tableText('${map['toPc']}'),
                                    tableText('${map['cost']}'),
                                    tableText(
                                        '${map['nextPc'] == 0 ? '-' : map['nextPc']}'),
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Swipe >>',
              style: GoogleFonts.afacad(
                textStyle: TextStyle(
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tableText(String str) {
    return TableCell(
      child: Center(
        child: Text(
          str,
          style: GoogleFonts.afacad(
            textStyle: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
