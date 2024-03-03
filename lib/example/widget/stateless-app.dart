import 'package:flutter/material.dart';
import 'package:hanflix/example/widget/button.dart';

class StatelessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // App 은 root widget 으로 앱의 시작점입니다.
    // 따라서 반드시 디자인 시스템 중 구글의 material widget 또는 애플의 cupertino widget 을 반환해야합니다.
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFF181818 ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text("Hey, Hankil", style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.w600)),
                            Text("Welcome back", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18)),
                          ]
                      ),
                    ],
                  ),
                  SizedBox(height: 180),
                  Text('Total balance', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 22)),
                  SizedBox(height: 5),
                  Text('\$1,158,100,514', style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w600)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(text: "Transfer", bgColor: Colors.amber, textColor: Colors.black),
                      Button(text: "Withdraw", bgColor: Colors.grey, textColor: Colors.black),
                    ],
                  ),
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Wallets', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 22)),
                      Text('View All', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: Color(0xFF1E1E1E),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(Icons.account_balance_wallet, color: Colors.black, size: 30),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bitcoin', style: TextStyle(color: Colors.white, fontSize: 22)),
                              Text('\$1,158,100,514', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
