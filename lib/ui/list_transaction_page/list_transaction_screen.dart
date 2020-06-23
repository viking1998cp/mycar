import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mycar/common/color.dart';
import 'package:mycar/common/shared/hexcolor.dart';
import 'package:mycar/core/model/transaction.dart';

class ListTransactionScreen extends StatefulWidget{
    @override
  State<StatefulWidget> createState() => ListTransactionScreenState();
}

class ListTransactionScreenState extends State<ListTransactionScreen>{

  List<Transaction> _transactions;
  final String urlIconWave = "assets/images/icon_wave.png";
  final String urlIconAdd = "assets/images/icon_add.png";
  final String urlIconPay = "assets/images/icon_pay.png";
  final String urlIconWallet = "assets/images/icon_wallet.png";
  final String urlIconTranSaction = "assets/images/icon_transaction.png";

  int _selectedIndex;

  /**
   * type =1 Nạp tiền điện thoại
   * type =2 Chuyển tiền
   * type = 3 Trả thưởng
   * type = 4 Thanh toán  hợp đồng
   */
  @override
  void initState() {
    _transactions = List<Transaction>();
    _transactions.add(new Transaction(1, "Nạp điện thoại", "Tình yêu", "21/06", "Thành công", 19400));
    _transactions.add(new Transaction(2, "Cháu quang", "cau chinh", "21/06", "Thành công", 500000));
    _transactions.add(new Transaction(3, "Trả thưởng", "Viettel trả thưởng ViettelPay 202005 84474692778", "21/06", "Thành công", 240));
    _transactions.add(new Transaction(1, "Nạp điện thoại", "Tình yêu", "20/06", "Thành công", 24000));
    _transactions.add(new Transaction(1, "Nạp điện thoại", null, "10/06", "Thành công", 47500));
    _transactions.add(new Transaction(2, "0979-829-629", "chinhbv tt HD viettel TV", "06/06", "Thành công", 240000));
    _transactions.add(new Transaction(4, "Truyền hình/Internet Viettel", null, "06/06", "Thành công", 213400));
    _selectedIndex = 3;

  }

  //filter date
  Widget dateFilter(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Text("THÁNG 6/2020", style: TextStyle(color: gray3, fontSize: 15.0,fontWeight: FontWeight.bold),),
    );
  }
  Widget iconFlowType(int type){
    switch(type){
      case 1:
        return Image.asset(urlIconWave,);
        break;
      case 2:
        return Image.asset(urlIconWallet);
        break;
      case 3:
        return Image.asset(urlIconAdd);
        break;
      case 4:
        return Image.asset(urlIconPay);
        break;
      default:
        return null;
        break;
    }
  }

  //item ( my transaction )
  Widget itemTransaction(Transaction transaction){
    final formatter = new NumberFormat("###,###");
    return Container(

      child: Column(
        children: <Widget>[
          Divider(
            color: gray,
            thickness: 2.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(right: 10.0),
                        alignment: Alignment.bottomLeft,
                        child: iconFlowType(transaction.type))),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(transaction.title, style: TextStyle(fontSize: 18.0, wordSpacing: 0, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        height: 35.0,
                        alignment: Alignment.centerLeft,
                        child: transaction.content != null ?Text(transaction.content, style: TextStyle(color: gray3, fontSize: 16),) : null,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Text(transaction.dateTime, style: TextStyle(color: gray3, fontSize: 14)),
                            Container(
                              margin: EdgeInsets.only(left: 5.0),
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: green
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 5.0),
                                child: Text(transaction.status, style: TextStyle(color: gray3, fontSize: 14))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(((transaction.type == 3) ? "+" :"-" )+formatter.format(transaction.price) +" đ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //builder list item transaction
  Widget listTransaction(){
    return Expanded(
      child: ListView.builder(
          itemCount: _transactions.length,
          itemBuilder: (context, index){
              return itemTransaction(_transactions[index]);
          },

      ),
    );
  }

  //ontap menu
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                HexColor("00ADA4"),
                HexColor("028FA4"),
                HexColor("0073BA")
              ],
            ),
          ),
        ),
        title: Center(child: Text("Lịch sử giao dịch", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w400),)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 5.0),
                    child: Center(child: Text("Lọc", style: TextStyle(fontSize: 18.0))
                    )
                ),
                Icon(Icons.filter_list, size: 25.0,)
              ],
            ),
          )
        ],
      ),
      //body
      body:Container(
        child: Column(
          children: <Widget>[
            dateFilter(),
            listTransaction()
          ],
        ),
      ) ,
      //Menu
      bottomNavigationBar:BottomNavigationBar(
        selectedItemColor: HexColor("2B8DCC"),
        unselectedItemColor: gray3,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Trang chủ')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.more),
              title: Text('Ưu đãi')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              title: Center(child: Text('Chuyển tiền'))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('Lịch sử')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_contact_calendar),
              title: Text('Cá nhân')
          ),

        ],
      )
    );
  }

}