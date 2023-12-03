// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class QRScannerScreen extends StatefulWidget {
//   const QRScannerScreen({Key? key}) : super(key: key);

//   @override
//   State<QRScannerScreen> createState() => _QRScannerScreenState();
// }

// class _QRScannerScreenState extends State<QRScannerScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   String scannedCode = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "QR Scanner",
//           style: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             const Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Place the QR code in the area",
//                     style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1,
//                     ),
//                   ),
//                   Text(
//                     "Scanning will be started automatically",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black54,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 4,
//               child: Stack(
//                 children: [
//                   QRView(
//                     key: qrKey,
//                     onQRViewCreated: _onQRViewCreated,
//                   ),
//                   _buildQrScannerOverlay(),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Center(
//                 child: Text(
//                   "$scannedCode",
//                   style: const TextStyle(fontSize: 18),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildQrScannerOverlay() {
//     return Container(
//       // Your overlay design goes here
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) async {
//       setState(() async {
//         List<String> parts = scanData.code!.split(',');

//         if (parts.length >= 3) {
//           String welcomeMessage = parts[0];
//           String uniqueId = parts[1];
//           String name = parts[2];

//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           String storedName = prefs.getString('name') ?? '';

//           if (storedName.isEmpty) {
//             // If the name is not stored, display the welcome message
//             prefs.setString('name', name);
//             scannedCode = 'Welcome $name';
//           } else if (storedName == name) {
//             // If the name is already used, show a pop-up message
//             Fluttertoast.showToast(
//               msg: "This name is already used!",
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.BOTTOM,
//               timeInSecForIosWeb: 1,
//               backgroundColor: Colors.red,
//               textColor: Colors.white,
//               fontSize: 16.0,
//             );
//             scannedCode =
//                 'Welcome $name'; // Display the welcome message even if the name is already used
//           } else {
//             // Otherwise, update the scannedCode state with the welcome message
//             scannedCode = 'Welcome $name';
//           }
//         } else {
//           scannedCode = scanData.code!;
//         }
//       });
//     });
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class QRScannerScreen extends StatefulWidget {
//   const QRScannerScreen({Key? key}) : super(key: key);

//   @override
//   State<QRScannerScreen> createState() => _QRScannerScreenState();
// }

// class _QRScannerScreenState extends State<QRScannerScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   String scannedCode = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "QR Scanner",
//           style: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             const Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Place the QR code in the area",
//                     style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1,
//                     ),
//                   ),
//                   Text(
//                     "Scanning will be started automatically",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black54,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 4,
//               child: Stack(
//                 children: [
//                   QRView(
//                     key: qrKey,
//                     onQRViewCreated: _onQRViewCreated,
//                   ),
//                   _buildQrScannerOverlay(),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Center(
//                 child: Text(
//                   "$scannedCode",
//                   style: const TextStyle(fontSize: 18),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildQrScannerOverlay() {
//     return Container(
//       // Your overlay design goes here
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) async {
//       setState(() async {
//         List<String> parts = scanData.code!.split(',');

//         if (parts.length >= 3) {
//           String welcomeMessage = parts[0];
//           String uniqueId = parts[1];
//           String name = parts[2];

//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           String storedName = prefs.getString('name') ?? '';

//           if (storedName.isNotEmpty && storedName == name) {
//             prefs.setString('name', name);
//             scannedCode = 'Welcome $name';
//             // );
//           } else if (storedName.isNotEmpty && storedName == name) {
//             prefs.setString('name', name);
//             scannedCode = 'Welcome $name';

//             Fluttertoast.showToast(
//               msg: "This name is already used!",
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.BOTTOM,
//               timeInSecForIosWeb: 1,
//               backgroundColor: Colors.red,
//               textColor: Colors.white,
//               fontSize: 16.0,
//             );
//           }
//         } else {
//           scannedCode = scanData.code!;
//         }
//       });
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedCode = '';

  get overlayColor => Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 161, 212, 253),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "QR Scanner",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Place the QR code in the area",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "Scanning will be started automatically",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                    ),
                    _buildQrScannerOverlay(),
                    // QrScannerOverlay(overlayColor: overlayColor),
                  ],
                )),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "$scannedCode",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrScannerOverlay() {
    // Implement your overlay design here
    return Container(
      // color: Colors.transparent, // Replace with your overlay color
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        // Split the scanned data by comma
        List<String> parts = scanData.code!.split(',');

        // Check if the split parts contain the expected information
        if (parts.length >= 3) {
          // Extract the relevant information
          String welcomeMessage = parts[0];
          String uniqueId = parts[1];
          String name = parts[2];

          // Update the scannedCode state with the desired information
          scannedCode = 'Welcome $name';
        } else {
          // If the data doesn't match the expected format, set it as is
          scannedCode = scanData.code!;
        }
      });
    });
  }
}
