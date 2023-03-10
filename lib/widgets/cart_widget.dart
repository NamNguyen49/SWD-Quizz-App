import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  final String title;

  CartWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 68, 103, 119),
            Color.fromARGB(255, 144, 191, 230),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }
}

// class CartWidget extends StatelessWidget {
//   final String title;
//   final int index;
//   final bool isFavorite;
//   final Function(int) addToFavorites;

//   CartWidget({required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(title),
//         Spacer(),
//         IconButton(
//           onPressed: () => addToFavorites(index),
//           icon: Icon(
//             isFavorite ? Icons.favorite : Icons.favorite_border,
//             color: isFavorite ? Colors.red : Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class CartWidget extends StatelessWidget {
//   final String title;

//   const CartWidget({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color.fromARGB(255, 68, 103, 119),
//             Color.fromARGB(255, 144, 191, 230),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             blurRadius: 5,
//             spreadRadius: 2,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
