import 'package:flutter/material.dart';
import 'package:huiyiapp/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:huiyiapp/providers/bonus.dart';
import 'package:huiyiapp/widgets/bonus_container.dart';

class BonusPage extends StatefulWidget {
  static const route = "/bonusPage";

  @override
  _BonusPageState createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  String currentSn;
  bool _isInit = true;
  Future<void> setSnData(BonusProvider bonus) async {
    await bonus.fetchBonusData();
    if (_isInit) {
      currentSn = bonus.bonusDatas2.keys.toList()[0];
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bonus = Provider.of<BonusProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("會員獎金查詢"),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: setSnData(bonus),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SafeArea(
                child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 10, right: 10, left: 10, bottom: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Center(
                        child: Text(
                          "\$" + bonus.bonusDatas[currentSn].totalBouns,
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                      constraints:
                          BoxConstraints(minWidth: 300, minHeight: 120),
                      decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Row(
                        children: [
                          Text(
                            "總獎金:",
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            width: 120,
                          ),
                          Text(
                            "切換會員帳號:",
                            style: TextStyle(fontSize: 17),
                          ),
                          PopupMenuButton(
                            itemBuilder: (context) => popUpMenu(context, bonus),
                            icon: Icon(Icons.expand_more),
                            onSelected: (String sn) {
                              setState(() {
                                currentSn = sn;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: BonusContainer(
                            bonus.bonusDatas[currentSn].sn, "會員編號："),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: BonusContainer(
                            bonus.bonusDatas[currentSn].orgSum + "人", "組織總人數:"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.75,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 5,
                        crossAxisCount: 3),
                    itemBuilder: (context, i) => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.blue[100]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.money),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            bonus.bonusItemsName[i],
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            bonus.bonusDatas2[currentSn][i],
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    itemCount: bonus.bonusDatas2[currentSn].length,
                  ),
                )
              ],
            ));
          }
        },
      ),
    );
  }

  List<PopupMenuEntry<String>> popUpMenu(
      BuildContext context, BonusProvider bonus) {
    final bonusData = bonus.bonusDatas2;
    List<PopupMenuEntry<String>> menuList = [];
    for (int i = 0; i < bonusData.length; i++) {
      //把獎金會員編號轉乘陣列
      final bonusKeyList = bonusData.keys.toList();
      menuList.add(
        PopupMenuItem<String>(
          child: Text(bonusKeyList[i]),
          value: bonusKeyList[i],
        ),
      );
    }
    return menuList;
  }
}
