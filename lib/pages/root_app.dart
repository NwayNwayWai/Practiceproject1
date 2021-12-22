import 'package:flutter/material.dart';
import 'package:practiseapp1/json/constant.dart';
import 'package:practiseapp1/pages/account_page.dart';
import 'package:practiseapp1/pages/cart_page.dart';
import 'package:practiseapp1/pages/more_page.dart';
import 'package:practiseapp1/pages/store_page.dart';
import 'home_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab=0;
  //appbar
  AppBar appbar=null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getFooter(),
      appBar: getAppBar(),
      body: getBody(),
    );
  }
  Widget getBody(){
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        StorePage(),
        AccountPage(),
        CartPage(),
        MorePage()
      ],
    );
  }
  Widget getAppBar(){
    switch(activeTab){
        case 0:
        appbar=null;
        break;
        case 1:
        appbar=null;
        break;
        case 2:
        return AppBar(
          centerTitle: true,
          elevation: 0.8,
          backgroundColor: Colors.white,
          title: Text(
            "ACCOUNT",
          style: TextStyle(color: Colors.black),
          ),
        );
        break;
        case 3:
          return AppBar(
            centerTitle: true,
            elevation: 0.8,
            backgroundColor: Colors.white,
            title: Text("CART",
              style: TextStyle(color: Colors.black),) ,
          );
        break;
        case 4:
          return AppBar(
            centerTitle: true,
            elevation: 0.8,
            backgroundColor: Colors.white,
            title: Text("MORE",
              style: TextStyle(color: Colors.black),
            ),
          );
          break;
      default:
    }
  }
  Widget getFooter(){
    return Container(
      height:80,
      decoration: BoxDecoration(color: Colors.white,border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left:10,right:10,top:5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index){
            return IconButton(
                icon: Icon(
                  itemsTab[index]['icon'],
                  size: itemsTab[index]['size'] ,
                 color: activeTab == index ? Colors.orangeAccent:Colors.black,
                ),
                onPressed:(){
                  setState(() {
                    activeTab=index;
                  });
                });
    })),
      ),
    );
  }
}
