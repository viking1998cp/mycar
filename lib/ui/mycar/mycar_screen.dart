import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycar/common/color.dart';
import 'package:mycar/common/string.dart';
import 'package:mycar/common/widget/image_from_network.dart';
import 'package:mycar/common/widget/image_radius.dart';
import 'package:mycar/ui/list_transaction_page/list_transaction_page.dart';

class MyCarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyCarScreenState();
}

class MyCarScreenState extends State<MyCarScreen> {
  final String urlIconArrow = "assets/images/icon_arrow.png";
  final String urlBackgroundHeader = "assets/images/background_header.jpg";
  final String urlAvatar =
      "https://ntmoi.vinhphuc.gov.vn/ct/cms/chuyenmon/PublishingImages/ha%202014/ouw1336747112.jpg";
  final String iconTimeChecked = "assets/images/calendar_checked.png";
  final String urlInstagram = "https://lh3.googleusercontent.com/2sREY-8UpjmaLDCTztldQf6u2RGUtuyf6VT5iyX3z53JS4TdvfQlX-rNChXKgpBYMw";
  final String urlFacebook = "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Facebook_logo_36x36.svg/1200px-Facebook_logo_36x36.svg.png";
  final String urlTwiter ="https://lh3.googleusercontent.com/x3XxTcEYG6hYRZwnWAUfMavRfNNBl8OZweUgZDf2jUJ3qjg2p91Y8MudeXumaQLily0";
  final String urlBanner = "https://cdn.24h.com.vn/upload/4-2018/images/2018-11-29/Nhung-kinh-nghiem-vang-de-mua-o-to-de-dang-o-to1-1543465877-720-width660height371.jpg";


  //background
  Widget background() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          imageFromNetWork(
            urlBanner,
            MediaQuery.of(context).size.width,
            120.0
          )
        ],
      ),
    );
  }

  //header (avatar , name and button 1)
  Widget header(){
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Row(
        children: <Widget>[
          imageRadius(urlAvatar, 80, 80, 40),
          Container(
            height: 60.0,
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                      color: blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.music_note,
                  size: 12.0,
                  color: blue,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: FlatButton(
              child: Container(
                height: 60.0,
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 5.0),
                      child: Text(button1,
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black)
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.navigate_next, size: 20.0, color: Colors.black,))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  //List social
  Widget listSocialNetwork(){
    return  Container(
      margin: EdgeInsets.only(left: 10.0, top: 15.0),
      child: Row(
        children: <Widget>[
          Image.asset(iconTimeChecked,width: 40.0, height: 40.0,fit: BoxFit.cover,),
          Container(
            margin: EdgeInsets.only(left: 8.0),
            height: 40.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                    child: Text(timeChecked_top, style: TextStyle(fontSize: 16.0),)),
                Expanded(
                  flex: 1,
                  child: Text(timeChecked_bottom, style: TextStyle(fontSize: 16.0),),
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 8.0),
                    child: imageRadius(urlInstagram, 40, 40,10)),
                Container(
                    padding: EdgeInsets.only(right: 8.0),
                    child: imageRadius(urlTwiter, 40, 40, 10)),
                Container(
                    padding: EdgeInsets.only(right: 8.0),
                    child: imageRadius(urlFacebook, 40, 40, 10))
              ],
            ),
          )
        ],
      ),
    );
  }

  // garage content
  Widget garage(){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 15.0),
      color: gray2,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text("Garage", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.directions_car, size: 80.0,),
                      Container(
                        child: Text("MyCar", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 60.0),
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: green),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Text("4", style: TextStyle(color: Colors.white),) ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.directions_car, size: 80.0,),
                      Container(
                        child: Text("History", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 60.0),
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: green),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Text("10", style: TextStyle(color: Colors.white),) ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  //Menu item
  Widget menuItem(Icon icon, String title, Color color){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: color
              ),
              child: icon),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("menu 1", style: TextStyle(fontSize: 14.0),),
                     Expanded(
                       child: Container(
                         alignment: Alignment.centerRight,
                           child: Icon(Icons.navigate_next)),
                     )
                    ],
                  ),
                  Divider(
                    color: gray,
                    height: 10.0,
                    thickness: 4.0,
                  )
                ],

              ),
            ),
          )
        ],
      ),
    );
  }

  //bottom menu
  Widget bottomMenu(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      child: Column(
        children: <Widget>[
          menuItem(Icon(
            Icons.assignment,
            color: Colors.white,
            size: 20.0,
          ), menu1, red),
          menuItem(Icon(
            Icons.people,
            color: Colors.white,
            size: 20.0,
          ), menu1, Colors.amber),
          menuItem(Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 20.0,
          ), menu1, pink)
        ],
      ),
    );
  }
  Widget content() {
    return Container(
      margin: EdgeInsets.only(top: 80.0),
      child: Column(
        children: <Widget>[
          header(),
          listSocialNetwork(),
          garage(),
          bottomMenu()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: gray,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              Icon(
                Icons.music_note,
                size: 12.0,
              )
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListTransactionPage()));
            },
            child: Container(
              margin: EdgeInsets.only(right: 15.0),
              width: 60.0,
              color: Colors.black,
              child: Center(
                child: Image.asset(
                  urlIconArrow,
                  height: 30.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[background(), content()],
        ),
      ),
    );
  }
}
