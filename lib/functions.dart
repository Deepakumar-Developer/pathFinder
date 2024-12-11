import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextEditingController projectName = TextEditingController();
TextEditingController pcCount = TextEditingController();
TextEditingController costController = TextEditingController();
List<Map<String, int>> network = [];
List<List<Map<String, int>>> routingTable = [];
List<int> routerPath = [];

Set<String> uniquePairs = {};

void customStatusBar(var statusBarColor, systemNavigationBarColor,
    statusBarIconBrightness, systemNavigationBarIconBrightness) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: statusBarColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: statusBarIconBrightness,
    systemNavigationBarColor: systemNavigationBarColor,
    systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
  ));
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: 16.0);
}

int toPc = 1, fromPc = 1;

int senderPc = 1, receiverPc = 1;

void updateNetwork() {
  final pairKey1 = '${fromPc}-${toPc}';
  final pairKey2 = '${toPc}-${fromPc}';

  if (!uniquePairs.contains(pairKey1) && !uniquePairs.contains(pairKey2)) {
    if (toPc != fromPc) {
      if (costController.text.isNotEmpty) {
        network.add({
          'fromPc': fromPc,
          'toPc': toPc,
          'cost': int.parse(costController.text)
        });
        uniquePairs.add(pairKey1);
        uniquePairs.add(pairKey2);
        costController.clear();
        fromPc = 1;
        toPc = 1;
        showToast('Down');
      } else {
        showToast('Give the Cost');
      }
    } else {
      showToast('No need');
    }
  } else {
    showToast('Already pari!');
  }
}

void buildNetwork() {
  List<List<Map<String, int>>> routers = [];

  for (int i = 1; i <= 5; i++) {
    List<Map<String, int>> routingTableValue = [];

    List<Map<String, int>> unProgressNodes = network.toList();
    List<Map<String, int>> tempTable = [];
    tempTable.add(
      {'toPc': i, 'cost': 0, 'nextPc': 0},
    );
    unProgressNodes.remove({'toPc': i, 'fromPc': i, 'cost': 0});
    List<Map<String, dynamic>> firstSystemName = [];
    List<int> listPc = [];
    int firstTime = 0;
    while (tempTable.isNotEmpty) {
      List<Map<String, int>> unProgressDeleteNode = [];
      Map<String, int> movedNode = shortestCost(tempTable);

      int systemName = movedNode['toPc']!;

      listPc = [];

      for (Map<String, int> node in unProgressNodes) {
        if (node['toPc'] == systemName || node['fromPc'] == systemName) {
          int totalCost = i == systemName
              ? node['cost']!
              : node['cost']! + movedNode['cost']!;
          tempTable.add(
            {
              'toPc': (node['toPc'] == systemName)
                  ? node['fromPc']!
                  : node['toPc']!,
              'cost': totalCost,
              'nextPc': nextPc(firstSystemName, systemName) == i
                  ? 0
                  : nextPc(firstSystemName, systemName),
            },
          );
          listPc.add(
              (node['toPc'] == systemName) ? node['fromPc']! : node['toPc']!);
          unProgressDeleteNode.add(node);
        }
      }
      if (firstTime == 0) {
        for (int i in listPc)
          firstSystemName.add({
            'systemName': i,
            'listPc': [i],
          });
      } else {
        for (int i = 0; i < firstSystemName.length; i++) {
          if (firstSystemName[i]['systemName']! == systemName) {
            firstSystemName[i]['listPc'].addAll(listPc);
          }
        }
      }
      firstTime += 1;
      for (Map<String, int> node in unProgressDeleteNode) {
        unProgressNodes.remove(node);
      }
      tempTable.remove(movedNode);
      routingTableValue.add(movedNode);
    }
    routers.add(routingTableValue);
  }
  for (List<Map<String, int>> router in routers) {
    List<Map<String, int>> routerValue = router.toList();
    List<Map<String, int>> path = [];
    for (int i = 0; i < router.length; i++) {
      for (int j = 0; j < router.length; j++) {
        if (router[i]['toPc'] == router[j]['toPc'] && i != j) {
          path.add(router[i]);
          path.add(router[j]);
          routerValue.remove(router[i]);
          routerValue.remove(router[j]);
        }
      }
    }
    routerValue.add(shortestCost(path));
    routingTable.add(routerValue);
  }
  showToast('Build Successfully');
}

int nextPc(List<Map<String, dynamic>> firstSystemName, int systemName) {
  if (firstSystemName.isNotEmpty) {
    for (Map<String, dynamic> map in firstSystemName) {
      if (map['listPc']!.indexOf(systemName) != -1) {
        return map['systemName']! ?? systemName;
      }
    }
  }
  return systemName;
}

Map<String, int> shortestCost(List<Map<String, int>> network) {
  Map<String, int> shortestCost = network.first;
  int minCost = shortestCost['cost']!;

  for (Map<String, int> connection in network) {
    int currentCost = connection['cost']!;
    if (currentCost < minCost) {
      minCost = currentCost;
      shortestCost = connection;
    }
  }

  return shortestCost;
}

void shortestPath(List<List<Map<String, int>>> routingTable) {
  int receiver = receiverPc, sender = senderPc;
  bool dataReach = false;

  routerPath.add(sender);
  while (!dataReach) {
    List<Map<String, int>> systemRouter = routingTable[sender - 1];

    for (Map<String, int> routerValue in systemRouter) {
      if (routerValue['toPc'] == receiver) {
        routerPath.add((routerValue['nextPc']! == 0)
            ? routerValue['toPc']!
            : routerValue['nextPc']!);
        sender = routerValue['nextPc']!;
        if (routerValue['nextPc'] == 0) {
          dataReach = true;
        }
      }
    }
  }
}
