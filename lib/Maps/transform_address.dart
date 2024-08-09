// void _showDistanceBottomSheet(double distance, double time) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//                 height: 5,
//                 width: 70,
//                 decoration: const BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.all(Radius.circular(10)))),
//             SizedBox(
//               height: 20,
//             ),
//             Text('Driving to Destination ...', style: TextStyle(fontSize: 16)),
//             ListTile(
//               leading: CircleAvatar(
//                   // backgroundImage:Image.asset(''),
//                   ),
//               title: Text('Ahmed'),
//               subtitle: Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.yellow, size: 16.0),
//                   Icon(Icons.star, color: Colors.yellow, size: 16.0),
//                   Icon(Icons.star, color: Colors.yellow, size: 16.0),
//                   Icon(Icons.star, color: Colors.yellow, size: 16.0),
//                   Icon(Icons.star_border, color: Colors.yellow, size: 16.0),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: <Widget>[
//                     Text('Arrival in', style: TextStyle(color: Colors.grey)),
//                     SizedBox(height: 5),
//                     Text('${time.toStringAsFixed(0)} min'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text('Distance', style: TextStyle(color: Colors.grey)),
//                     SizedBox(height: 5),
//                     Text('${distance.toStringAsFixed(2)} km'),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text('Fare', style: TextStyle(color: Colors.grey)),
//                     SizedBox(height: 5),
//                     Text('40\$'),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black,
//                     backgroundColor:
//                         const Color.fromARGB(255, 200, 181, 6), // Text color
//                   ),
//                   child: Text('Change Destination'),
//                 ),
//                 OutlinedButton(
//                   onPressed: () {
//                     Navigator.pop(context); // Close the bottom sheet
//                     // Add your cancel logic here
//                   },
//                   child: Text('Cancel'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
