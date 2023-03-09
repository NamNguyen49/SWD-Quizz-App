import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/home_screen.dart';
import 'package:flutter_quiz_app/screens/register_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  // GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: [
  //     'email',
  //     'https://www.googleapis.com/auth/contacts.readonly',
  //   ],
  // );
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      'https://www.googleapis.com/auth/calendar',
      'https://www.googleapis.com/auth/gmail.readonly',
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF447077), // màu gradient từ trái sang phải
        title: Text('FUS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 23.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Nhập email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email không được để trống';
                  } else if (!value.contains('@')) {
                    return 'Email không hợp lệ';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  hintText: 'Nhập mật khẩu',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Mật khẩu không được để trống';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.email),
                label: Text(' Google'),
                onPressed: () async {
                  try {
                    final GoogleSignIn googleSignIn = GoogleSignIn();
                    final GoogleSignInAccount? googleSignInAccount =
                        await googleSignIn.signIn();
                    final GoogleSignInAuthentication
                        googleSignInAuthentication =
                        await googleSignInAccount!.authentication;
                    final AuthCredential credential =
                        GoogleAuthProvider.credential(
                      idToken: googleSignInAuthentication.idToken,
                      accessToken: googleSignInAuthentication.accessToken,
                    );
                    final UserCredential authResult = await FirebaseAuth
                        .instance
                        .signInWithCredential(credential);
                    final User? user = authResult.user;
                    print("Signed in with Google: ${user?.displayName}");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } catch (error) {
                    print(error);
                  }
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF447077), // màu gradient từ trái sang phải
                  shadowColor: Colors.grey.withOpacity(0.5),
                  elevation: 5,
                ),
                child: Text('Đăng nhập'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    try {
                      // Gọi hàm đăng nhập qua Firebase Auth
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      );
                      // Nếu đăng nhập thành công, chuyển sang trang chính
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } on FirebaseAuthException catch (e) {
                      // Nếu đăng nhập thất bại, hiển thị thông báo lỗi
                      if (e.code == 'user-not-found') {
                        print(
                            'Không tìm thấy người dùng với địa chỉ email này.');
                      } else if (e.code == 'wrong-password') {
                        print('Sai mật khẩu.');
                      }
                    }
                  }
                },
              ),
              TextButton(
                child: Text('Chưa có tài khoản? Đăng ký ngay'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
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
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   late String _email;
//   late String _password;

//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<void> _handleGoogleSignIn() async {
//     try {
//       await _googleSignIn.signIn();
//       // TODO: Handle successful Google sign-in
//     } catch (error) {
//       print('Error during Google sign-in: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF447077), // màu gradient từ trái sang phải
//         title: Text('Đăng nhập'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               SizedBox(
//                 height: 16.0,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   hintText: 'Nhập email',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Email không được để trống';
//                   } else if (!value.contains('@')) {
//                     return 'Email không hợp lệ';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _email = value!;
//                 },
//               ),
//               SizedBox(
//                 height: 16.0,
//               ),
//               TextFormField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Mật khẩu',
//                   hintText: 'Nhập mật khẩu',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Mật khẩu không được để trống';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _password = value!;
//                 },
//               ),
//               SizedBox(
//                 height: 32.0,
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Color(0xFF447077), // màu gradient từ trái sang phải
//                   shadowColor: Colors.grey.withOpacity(0.5),
//                   elevation: 5,
//                 ),
//                 child: Text('Đăng nhập'),
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     //TODO: Xử lý đăng nhập
//                   }
//                 },
//               ),
//               SizedBox(
//                 height: 16.0,
//               ),
//               OutlinedButton.icon(
//                 icon: Icon(Icons.email),
//                 label: Text('Đăng nhập bằng Email Google'),
//                 onPressed: _handleGoogleSignIn,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
