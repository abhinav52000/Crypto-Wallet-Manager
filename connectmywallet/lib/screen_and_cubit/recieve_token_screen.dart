import 'package:connectmywallet/Utility/save_address.dart';
import 'package:connectmywallet/network/di/di_container.dart';
import 'package:connectmywallet/screen_and_cubit/GetMyBalance/cubit/get_my_balnce_cubit.dart';
import 'package:connectmywallet/themes/textstylefile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetailScreen extends StatefulWidget {
  const AccountDetailScreen({super.key});
  @override
  State<AccountDetailScreen> createState() => _AccountDetailScreenState();
}

class _AccountDetailScreenState extends State<AccountDetailScreen> {
  String? address;
  String? amount;
  GetMyBalnceCubit getMyBalnceCubit =
      GetMyBalnceCubit(repository: diInstance.call());

  @override
  void initState() {
    myAddressLoad();
    super.initState();
  }

  myAddressLoad() async {
    address = await loadMyValue();
    setState(() {});
    getMyBalnceCubit.getMyBalance(address: address.toString());
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
          'Account Detail',
          style: AppTextStyles.mainTextStyle.copyWith(fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account Address:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              address.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            BlocListener<GetMyBalnceCubit, GetMyBalnceState>(
              bloc: getMyBalnceCubit,
              listener: (context, state) {
                if (state is GetMyBalanceLoadedState) {
                  setState(() {
                    amount = state.getMyBalanceModel.result;
                  });
                }
              },
              child: const Text(
                'Account Balance:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${amount ?? '############'} ETH',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
