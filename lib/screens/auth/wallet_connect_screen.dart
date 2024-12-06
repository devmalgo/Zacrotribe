import 'package:flutter/material.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class WalletConnectScreen extends StatefulWidget {
  const WalletConnectScreen({super.key});

  @override
  State<WalletConnectScreen> createState() => _WalletConnectScreenState();
}

class _WalletConnectScreenState extends State<WalletConnectScreen> {

  var connector = WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
      name: '',
      description: 'An app for add rewards to read news',
      url: 'https://walletconnect.org',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}
