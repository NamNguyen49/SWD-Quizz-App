import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/utils/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  bool _showPassword = false;
  bool _showRePassword = false;

  // firebase
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF447077), // màu gradient từ trái sang phải
        title: Text('Đăng ký'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Họ tên',
                  hintText: 'Nhập họ tên',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateName(value),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Nhập email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validateEmail(value),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _passwordController,
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  hintText: 'Nhập mật khẩu',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
                validator: (value) => validatePassword(value),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _rePasswordController,
                obscureText: !_showRePassword,
                decoration: InputDecoration(
                  labelText: 'Nhập lại mật khẩu',
                  hintText: 'Nhập lại mật khẩu',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showRePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _showRePassword = !_showRePassword;
                      });
                    },
                  ),
                ),
                validator: (value) =>
                    validateRePassword(value, _passwordController.text),
              ),
              SizedBox(height: 15.0),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor:
              //         Color(0xFF447077), // màu gradient từ trái sang phải
              //     shadowColor: Colors.grey.withOpacity(0.5),
              //     elevation: 5,
              //   ),
              //   child: Text('Đăng ký'),
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       //TODO: Xử lý đăng ký
              //     }
              //   },

              // ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor:
              //         Color(0xFF447077), // màu gradient từ trái sang phải
              //     shadowColor: Colors.grey.withOpacity(0.5),
              //     elevation: 5,
              //   ),
              //   child: Text('Đăng ký'),
              //   onPressed: () async {
              //     if (_formKey.currentState!.validate()) {
              //       _auth.createUserWithEmailAndPassword(
              //           email: _emailController.text.toString(),
              //           password: _passwordController.text.toString());
              //     }
              //   },
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF447077),
                  shadowColor: Colors.grey.withOpacity(0.5),
                  elevation: 5,
                ),
                child: Text('Đăng ký'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await _auth.createUserWithEmailAndPassword(
                          email: _emailController.text.toString(),
                          password: _passwordController.text.toString());
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Đăng ký thành công'),
                          content: Text('Register successfully'),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    } catch (e) {
                      print(e.toString());
                    }
                  }
                },
              ),

              InkWell(
                child: Text(
                  'Đã có tài khoản? Đăng nhập',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
