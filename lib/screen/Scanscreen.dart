import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _scanBarcodeResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Builder(
        builder: (_) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: scanBarcodeNormal,
                  child: Text("Start barcode scan")),
              ElevatedButton(onPressed: scnQR, child: Text("Start QR scan")),
              ElevatedButton(
                  onPressed: startBarcodeStream,
                  child: Text("Start barcode scan stream")),
              Text("Barcode result $_scanBarcodeResult")
            ],
          ),
        ),
      ),
    );
  }

  void scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = "Failed to get platform version";
    }
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  void scnQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = "Failed to get platform version";
    }
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  void startBarcodeStream() async {
    try {
      await FlutterBarcodeScanner.getBarcodeStreamReceiver(
        "#ff666",
        "cancel",
        true,
        ScanMode.BARCODE,
      )!
          .listen((barcode) {});
    } catch (e) {
      print(e);
    }
  }
}
  