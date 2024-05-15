// import 'package:bluetooth_print/bluetooth_print.dart';
// import 'package:bluetooth_print/bluetooth_print_model.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class PrintPage extends StatefulWidget {
//   final List<Map<String, dynamic>> data;

//   const PrintPage(this.data, {super.key});

//   @override
//   _PrintPageState createState() => _PrintPageState();
// }

// class _PrintPageState extends State<PrintPage> {
//   BluetoothPrint bluetoothPrint = BluetoothPrint.instance;

//   List<BluetoothDevice> _devices = [];
//   String _developMsg = "";

//   final NumberFormat f = NumberFormat("\$###,###.00", "en_US");

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) => initPrinter());
//   }

//   Future<void> initPrinter() async {
//     bluetoothPrint.startScan(timeout: const Duration(seconds: 2));

//     if (!mounted) return;

//     bluetoothPrint.scanResults.listen((List<BluetoothDevice> val) {
//       if (!mounted) return;
//       setState(() {
//         _devices = val;
//       });
//       if (_devices.isEmpty) {
//         setState(() {
//           _developMsg = "No Devices";
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     bluetoothPrint.stopScan();
//     super.dispose();
//   }

//   Future<void> _startPrint(BluetoothDevice device) async {
//     print("Clicked on device: ${device.name} (${device.address})");

//     if (device.address != null) {
//       try {
//         print("Attempting to connect to the device...");
//         await bluetoothPrint.connect(device);
//         bool? isConnected = await bluetoothPrint.isConnected;

//         if (isConnected != null && isConnected) {
//           print("Successfully connected to the device");

//           Map<String, dynamic> config = {
//             'width': 40,
//             'height': 70,
//             'gap': 2,
//           };
//           List<LineText> list = [];

//           list.add(
//             LineText(
//               type: LineText.TYPE_TEXT,
//               content: "Grocery App",
//               weight: 2,
//               height: 2,
//               align: LineText.ALIGN_CENTER,
//               linefeed: 1,
//             ),
//           );

//           for (var item in widget.data) {
//             list.add(
//               LineText(
//                 type: LineText.TYPE_TEXT,
//                 content: item['title'],
//                 weight: 0,
//                 align: LineText.ALIGN_LEFT,
//                 linefeed: 1,
//               ),
//             );

//             list.add(
//               LineText(
//                 type: LineText.TYPE_TEXT,
//                 content: "${f.format(item['price'])} x ${item['qty']}",
//                 weight: 0,
//                 align: LineText.ALIGN_LEFT,
//                 linefeed: 1,
//               ),
//             );
//           }

//           try {
//             print("Attempting to print the receipt...");
//             await bluetoothPrint.printReceipt(config, list);
//             print("Print job completed");
//           } catch (e) {
//             print("Printing error: $e");
//             setState(() {
//               _developMsg = "Printing error: $e";
//             });
//           }
//         } else {
//           print("Failed to connect to the device");
//           setState(() {
//             _developMsg = "Failed to connect to the device";
//           });
//         }
//       } catch (e) {
//         print("Error during printing: $e");
//         setState(() {
//           _developMsg = "Error: $e";
//         });
//       } finally {
//         bool? isConnected = await bluetoothPrint.isConnected;
//         if (isConnected != null && isConnected) {
//           await bluetoothPrint.disconnect();
//           print("Disconnected from the device");
//         } else {
//           print("Device was not connected, no need to disconnect");
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Select Printer"),
//       ),
//       body: _devices.isEmpty
//           ? Center(
//               child: Text(_developMsg),
//             )
//           : ListView.builder(
//               itemCount: _devices.length,
//               itemBuilder: (context, i) {
//                 return ListTile(
//                   leading: const Icon(Icons.print_outlined),
//                   title: Text(_devices[i].name ?? 'Unknown Device'),
//                   subtitle: Text(_devices[i].address ?? 'No Address'),
//                   onTap: () async {
//                     print(
//                         "Device tapped: ${_devices[i].name} (${_devices[i].address})");
//                     // _startPrint(_devices[i]);
//                     try {
//                       await bluetoothPrint.connect(_devices[i]);
//                     } finally {
//                       bool? isConnected = await bluetoothPrint.isConnected;
//                       print("is connected" + isConnected.toString());

//                       // Map<String, dynamic> config = {
//                       //   'width': 40,
//                       //   'height': 70,
//                       //   'gap': 2,
//                       // };

//                       Map<String, dynamic> config = Map();
//                       config['width'] = 40;
//                       config['height'] = 70;
//                       config['gap'] = 2;
//                       List<LineText> list = [];

//                       list.add(
//                         LineText(
//                           type: LineText.TYPE_TEXT,
//                           content: "Grocery App",
//                           weight: 2,
//                           height: 2,
//                           align: LineText.ALIGN_CENTER,
//                           linefeed: 1,
//                         ),
//                       );
//                       print("Before print");
//                       await bluetoothPrint.printReceipt(config, list);
//                       print("Print job completed");
//                     }
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }
