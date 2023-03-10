// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Color.fromARGB(255, 68, 103, 119),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 68, 103, 119),
//               Color.fromARGB(255, 144, 191, 230),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: 20.0),
//             CircleAvatar(
//               radius: 50.0,
//               backgroundImage: AssetImage('assets/images/profile.png'),
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               'John Doe',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               'Software Developer',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 color: Colors.grey,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     Text(
//                       'Posts',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10.0),
//                     Text(
//                       '100',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: <Widget>[
//                     Text(
//                       'Followers',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10.0),
//                     Text(
//                       '500',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: <Widget>[
//                     Text(
//                       'Following',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10.0),
//                     Text(
//                       '200',
//                       style: TextStyle(
//                         fontSize: 16.0,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               child: Text('Edit Profile'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.transparent,
//                 onPrimary: Colors.white,
//                 elevation: 0.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                   side: BorderSide(
//                     color: Colors.white,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 103, 119),
        title: Text('Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 68, 103, 119),
              Color.fromARGB(255, 144, 191, 230),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome, ${user?.displayName ?? 'Anonymous'}!',
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 16.0),
              Text('Email: ${user?.email ?? ''}',
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Sign out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 68, 103, 119),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName(Navigator.defaultRouteName),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
