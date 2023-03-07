import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF447077), // màu gradient từ trái sang phải
        title: Text('Đăng nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 16.0,
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
                onPressed: () {
                  //TODO: Xử lý đăng nhập bằng Google
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF447077), // màu gradient từ trái sang phải
                  shadowColor: Colors.grey.withOpacity(0.5),
                  elevation: 5,
                ),
                child: Text('Đăng nhập'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    //TODO: Xử lý đăng nhập
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
