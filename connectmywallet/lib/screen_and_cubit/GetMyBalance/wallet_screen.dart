import 'package:connectmywallet/network/models/get_my_balance/get_my_balance_model.dart';
import 'package:connectmywallet/screen_and_cubit/home_screen.dart';
import 'package:connectmywallet/screen_and_cubit/recieve_token_screen.dart';
import 'package:connectmywallet/screen_and_cubit/send_tokens/send_token_screen.dart';
import 'package:connectmywallet/themes/textstylefile.dart';
import 'package:flutter/material.dart';

class WalletBalnceAndOperation extends StatefulWidget {
  const WalletBalnceAndOperation({super.key, required this.getMyBalanceModel});
  final GetMyBalanceModel getMyBalanceModel;

  @override
  State<WalletBalnceAndOperation> createState() =>
      _WalletBalnceAndOperationState();
}

class _WalletBalnceAndOperationState extends State<WalletBalnceAndOperation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        leadingWidth: 10,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Crypto Wallet',
                  style: AppTextStyles.mainTextStyle.copyWith(fontSize: 30),
                ),
                Text('Balance: ${widget.getMyBalanceModel.result} ETH',
                    style: AppTextStyles.mainTextStyle.copyWith(fontSize: 10)),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SendTokenScreen();
                }));
              },
              child: Text('Send Tokens', style: AppTextStyles.mainTextStyle),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AccountDetailScreen();
                }));
              },
              child: Text('Receive Tokens', style: AppTextStyles.mainTextStyle),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to add tokens
              },
              child: Text('Add Tokens', style: AppTextStyles.mainTextStyle),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));
              },
              child: Text('Check Out New Account',
                  style: AppTextStyles.mainTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}
