import 'package:connectmywallet/Utility/toast_widget.dart';
import 'package:connectmywallet/network/di/di_container.dart';
import 'package:connectmywallet/screen_and_cubit/send_tokens/cubit/send_token_cubit.dart';
import 'package:connectmywallet/themes/textstylefile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendTokenScreen extends StatefulWidget {
  const SendTokenScreen({super.key});

  @override
  SendTokenScreenState createState() => SendTokenScreenState();
}

class SendTokenScreenState extends State<SendTokenScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _receiverAddressController =
      TextEditingController();
  SendTokenCubit sendTokenCubit = SendTokenCubit(repository: diInstance.call());

  @override
  void dispose() {
    _amountController.dispose();
    _receiverAddressController.dispose();
    super.dispose();
  }

  void _submitTransaction() {
    FocusScope.of(context).unfocus();
    final amount = _amountController.text;
    final receiverAddress = _receiverAddressController.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Transaction Confirmation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amount: $amount'),
            const SizedBox(height: 8),
            Text('Receiver Address: $receiverAddress'),
          ],
        ),
        actions: [
          RawMaterialButton(
            onPressed: () {
              sendTokenCubit.sendToken(
                  recieverAddress: receiverAddress, amount: amount);
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text(
          'Send Token',
          style: AppTextStyles.mainTextStyle.copyWith(fontSize: 30),
        ),
      ),
      body: BlocListener<SendTokenCubit, SendTokenState>(
        bloc: sendTokenCubit,
        listener: (context, state) {
          if (state is SendTokenSentState) {
            Navigator.pop(context);
            if (state.success == true) {
              myToastMessage(message: 'Your Transaction is Completed');
            } else {
              myToastMessage(message: 'Your Transaction is Aborted');
            }
          }
          if (state is SendTokenErrorState) {
            Navigator.pop(context);
            myToastMessage(message: state.error);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Token Amount',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _receiverAddressController,
                decoration: const InputDecoration(
                  labelText: 'Receiver Address',
                ),
              ),
              const SizedBox(height: 32),
              RawMaterialButton(
                onPressed: _submitTransaction,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
