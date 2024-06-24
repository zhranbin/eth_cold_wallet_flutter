import 'package:eth_cold_wallet_flutter/provider/language_provider.dart';
import 'package:eth_cold_wallet_flutter/widget/ab_app_bar.dart';
import 'package:flutter/material.dart';

class ImportAccountPage extends StatefulWidget {
  const ImportAccountPage({super.key});

  @override
  State<ImportAccountPage> createState() => _ImportAccountPageState();
}

class _ImportAccountPageState extends State<ImportAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ABAppBar(
        title: AB_getS(context).importAccount,
      ),
      body: const Center(
        child: Text('ImportAccountPage'),
      ),
    );
  }
}
