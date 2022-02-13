import 'package:flutter/material.dart';
import 'package:thirteen_two/src/app_root.dart';

import 'dio/dio_services.dart';

main(){

  DioHelper.init();
  runApp(AppRoot());
}