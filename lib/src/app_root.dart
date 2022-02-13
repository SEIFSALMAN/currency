import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thirteen_two/blocs/curreny_cubit.dart';
import 'package:thirteen_two/views/currency_changer_view.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => CurrencyCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:CurrencyChangerView(),
      ),
    );
  }
}
