import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressProvider{
  Future<String>getAddress()async{
    await Future.delayed(Duration(seconds: 2));
    return "new add 45";
  }

}