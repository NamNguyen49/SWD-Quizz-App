import 'package:flutter/services.dart';

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Họ tên không được bỏ trống';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email không được bỏ trống';
  }
  final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$');
  if (!emailRegExp.hasMatch(value)) {
    return 'Email không hợp lệ';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Mật khẩu không được bỏ trống';
  }
  final passwordRegExp = RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.*?[0-9]).{8,}$');
  if (!passwordRegExp.hasMatch(value)) {
    return 'Mật khẩu không hợp lệ. Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường và số';
  }
  return null;
}

String? validateRePassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Nhập lại mật khẩu không được bỏ trống';
  }
  if (value != password) {
    return 'Nhập lại mật khẩu không trùng khớp';
  }
  return null;
}
