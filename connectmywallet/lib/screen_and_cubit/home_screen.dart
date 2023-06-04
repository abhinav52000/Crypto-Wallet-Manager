import 'package:connectmywallet/Utility/save_address.dart';
import 'package:connectmywallet/network/di/di_container.dart';
import 'package:connectmywallet/screen_and_cubit/GetMyBalance/cubit/get_my_balnce_cubit.dart';
import 'package:connectmywallet/screen_and_cubit/GetMyBalance/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetMyBalnceCubit getMyBalnceCubit =
      GetMyBalnceCubit(repository: diInstance.call());

  late QRViewController qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: BlocListener<GetMyBalnceCubit, GetMyBalnceState>(
        bloc: getMyBalnceCubit,
        listener: (context, state) {
          if (state is GetMyBalanceLoadedState) {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WalletBalnceAndOperation(
                  getMyBalanceModel: state.getMyBalanceModel);
            }));
          }
        },
        child: Center(
          child: SizedBox(
            height: 250,
            width: 250,
            child: QRView(
              key: qrKey,
              formatsAllowed: const [BarcodeFormat.qrcode],
              // overlay: QrScannerOverlayShape(cutOutSize: 100),
              onQRViewCreated: (controller) {
                setState(() {
                  qrViewController = controller;
                });
                qrViewController.scannedDataStream.listen((scanData) {
                  qrViewController.pauseCamera();
                  saveMyValue(
                      scanData.code.toString().replaceAll('ethereum:', ''));
                  getMyBalnceCubit.getMyBalance(
                      address:
                          scanData.code.toString().replaceAll('ethereum:', ''));
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    qrViewController.dispose();
    super.dispose();
  }
}
