import 'package:bookhubuz/controller/main/books/exchange/exchange_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangePage extends GetView<ExchangeController> {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donation"),
      ),
      body: Container(),
    );
  }
}
