import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:router_innovation/functions.dart';

import '../widgets/circuitInput.dart';
import '../widgets/system_path.dart';
import '../widgets/system_routers.dart';
import 'my_home_page.dart';

class MyBuilderPage extends StatefulWidget {
  const MyBuilderPage({super.key});

  @override
  State<MyBuilderPage> createState() => _MyBuilderPageState();
}

class _MyBuilderPageState extends State<MyBuilderPage> {
  bool showRouters = false, showPath = false, stop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          projectName.text,
          style: GoogleFonts.afacad(
            textStyle: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: SizedBox(
              height: height(context),
              width: width(context),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (routingTable.isNotEmpty) {
                              routerPath = [];
                              shortestPath(routingTable);
                              showPath = true;
                            } else {
                              showToast('Build the Network first!');
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: Colors.green),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Theme.of(context).colorScheme.surface,
                            size: 18,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (routingTable.isNotEmpty) {
                              showRouters = true;
                            } else {
                              showToast('Build the Network first!');
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: Theme.of(context).colorScheme.primary),
                          child: Icon(
                            Icons.miscellaneous_services_rounded,
                            color: Theme.of(context).colorScheme.surface,
                            size: 18,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            stop = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: Colors.redAccent),
                          child: Icon(
                            Icons.stop_rounded,
                            color: Theme.of(context).colorScheme.surface,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: width(context),
                    height: width(context),
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(.05),
                    ),
                    child: ListView.builder(
                        itemCount: network.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/computer.png',
                                        width: 75,
                                      ),
                                      Text(
                                        'System ${network[index]['fromPc']}',
                                        style: GoogleFonts.afacad(
                                          textStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          '${network[index]['cost']}',
                                          style: GoogleFonts.afacad(
                                            textStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18.0),
                                          child: Divider(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/computer.png',
                                        width: 75,
                                      ),
                                      Text(
                                        'System ${network[index]['toPc']}',
                                        style: GoogleFonts.afacad(
                                          textStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          );
                        }),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Build Connection:',
                    style: GoogleFonts.afacad(
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  CircuitInput(),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            routingTable = [];
                            chickBuildNetwork();
                          });
                        },
                        child: Container(
                          width: width(context) - 94,
                          height: 50,
                          alignment: Alignment(0, 0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Text(
                            'Build Network',
                            style: GoogleFonts.afacad(
                              textStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.surface,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            updateNetwork();
                          });
                        },
                        child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment(0, 0),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Icon(
                              Icons.check_rounded,
                              color: Theme.of(context).colorScheme.surface,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Text(
                      'Find your Shortest Path',
                      style: GoogleFonts.afacad(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 50,
                            child: DropdownButtonFormField<int>(
                              value: senderPc,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              items: _buildItems(int.parse(pcCount.text)),
                              onChanged: (value) {
                                setState(() {
                                  senderPc = value!;
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Sender',
                                labelStyle: GoogleFonts.afacad(
                                  textStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/computer.png',
                            width: 75,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_right_alt_rounded,
                        size: 25,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 50,
                            child: DropdownButtonFormField<int>(
                              value: receiverPc,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              items: _buildItems(int.parse(
                                  pcCount.text)), // Adjust the count as needed
                              onChanged: (value) {
                                setState(() {
                                  receiverPc = value!;
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Receiver',
                                labelStyle: GoogleFonts.afacad(
                                  textStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/computer.png',
                            width: 75,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showRouters = showPath = stop = false;
              });
            },
            child: Visibility(
              visible: showRouters || showPath || stop,
              child: Container(
                height: height(context),
                width: width(context),
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
              ),
            ),
          ),
          Visibility(visible: showRouters, child: SystemRouters()),
          Visibility(visible: showPath, child: SystemPath()),
          Visibility(
            visible: stop,
            child: Container(
              height: height(context) * 0.2,
              width: width(context) * 0.8,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Do you \nwant Delete\nthis \'${projectName.text}\'',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.afacad(
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        network = [];
                        routingTable = [];
                        routerPath = [];
                        uniquePairs = {};
                        costController.clear();
                        pcCount = TextEditingController(text: '0');
                        projectName.clear();
                        senderPc = receiverPc = 1;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()),
                        );
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Colors.red),
                      child: Text(
                        '  Stop  ',
                        style: GoogleFonts.afacad(
                          textStyle: TextStyle(
                              color: Theme.of(context).colorScheme.surface,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
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

  void chickBuildNetwork() {
    List<int> system = [];
    for (int i = 1; i <= int.parse(pcCount.text); i++) {
      for (Map<String, int> data in network) {
        if (data['toPc'] == i || data['fromPc'] == i) {
          if (system.indexOf(i) == -1) {
            system.add(i);
          }
        }
      }
    }
    if (system.length == int.parse(pcCount.text)) {
      buildNetwork();
    } else {
      showToast('Make sure all system connections!');
    }
  }
}
