import 'package:flutter/cupertino.dart';
import 'package:mycar/ui/list_transaction_page/list_transaction_screen.dart';

class ListTransactionPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ListTransactionPageState();
}

class ListTransactionPageState extends State<ListTransactionPage>{
  @override
  Widget build(BuildContext context) {
    return ListTransactionScreen();
  }

}