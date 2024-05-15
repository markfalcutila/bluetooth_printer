// import 'package:app_printer/print_page.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class HomePage extends StatelessWidget {
//   final List<Map<String, dynamic>> data = [
//     {'title': 'Cadbury Dairy Milk', 'price': 15, 'qty': 2},
//     {'title': 'Parle G Biscuit', 'price': 5, 'qty': 2},
//     {'title': 'Fresh Onion', 'price': 20, 'qty': 1},
//     {'title': 'Lime', 'price': 20, 'qty': 5},
//     {'title': 'Maggi', 'price': 10, 'qty': 5},
//     {'title': 'coke', 'price': 10, 'qty': 5},
//     {'title': 'wata', 'price': 10, 'qty': 5},
//   ];

//   final NumberFormat f = NumberFormat("\$###,###.00", "en_US");

//   HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     int total = data
//         .map((e) => e['price'] * e['qty'])
//         .reduce((value, element) => value + element);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter - Thermal Printer'),
//         backgroundColor: Colors.redAccent,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                     data[index]['title'].toString(),
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                       "${f.format(data[index]['price'])} x ${data[index]['qty']}"),
//                   trailing:
//                       Text(f.format(data[index]['price'] * data[index]['qty'])),
//                 );
//               },
//             ),
//           ),
//           Container(
//             color: Colors.grey[200],
//             padding: const EdgeInsets.all(20),
//             child: Row(
//               children: [
//                 Text(
//                   "Total: ${f.format(total)}",
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(width: 80),
//                 Expanded(
//                   child: TextButton.icon(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => PrintPage(data),
//                         ),
//                       );
//                     },
//                     icon: const Icon(Icons.print),
//                     label: const Text('Print'),
//                     style: TextButton.styleFrom(
//                       foregroundColor: Colors.white,
//                       backgroundColor: Colors.green,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
