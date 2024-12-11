import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../functions.dart';

class CircuitInput extends StatefulWidget {
  const CircuitInput({super.key});

  @override
  State<CircuitInput> createState() => _CircuitInputState();
}

class _CircuitInputState extends State<CircuitInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width(context) * 0.2,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            color: Theme.of(context).colorScheme.primary.withOpacity(.05),
          ),
          child: DropdownButtonFormField<int>(
            value: fromPc,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            items: _buildItems(
                int.parse(pcCount.text)), // Adjust the count as needed
            onChanged: (value) {
              setState(() {
                fromPc = value!;
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(
            Icons.compare_arrows_rounded,
            size: 25,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        Container(
            width: width(context) * 0.2,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              color: Theme.of(context).colorScheme.primary.withOpacity(.05),
            ),
            child: DropdownButtonFormField<int>(
              value: toPc,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              items: _buildItems(
                  int.parse(pcCount.text)), // Adjust the count as needed
              onChanged: (value) {
                setState(() {
                  toPc = value!;
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            )),
        Expanded(
            child: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              ':',
              style: GoogleFonts.afacad(
                textStyle: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        )),
        Container(
          width: width(context) * 0.25,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            color: Theme.of(context).colorScheme.primary.withOpacity(.05),
          ),
          child: TextField(
            cursorHeight: 20,
            keyboardType: TextInputType.number,
            controller: costController,
            style: GoogleFonts.afacad(
              textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.w300,
                  fontSize: 15),
            ),
            onSubmitted: (e) {
              setState(() {
                updateNetwork();
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Cost of $fromPc to $toPc',
              labelStyle: GoogleFonts.afacad(
                textStyle: TextStyle(
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<int>> _buildItems(int count) {
    return List.generate(count, (index) {
      return DropdownMenuItem<int>(
        value: index + 1,
        child: Text('${index + 1}'),
      );
    });
  }
}
