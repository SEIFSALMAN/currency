import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:thirteen_two/dio/dio_services.dart';
import 'package:thirteen_two/models/currency.dart';

part 'curreny_state.dart';

class CurrencyCubit extends Cubit<CurrencyStates> {
  CurrencyCubit() : super(CurrencyInitial());


  static CurrencyCubit get(context) => BlocProvider.of(context);



  CurrencyHub? currencyHub;


  getAllCurrency(String from , double amount ,String to){
    emit(CurrencyLoadingState());
    DioHelper.getData(
        query:
    {

      'from':from,
      'amount':amount,
      'to': to
    }
    ).then((value) {
      currencyHub = CurrencyHub.fromJson(value.data);
      print(currencyHub!.approxResult);
      emit(CurrencySuccessState());

    }).catchError((error){
      print(error.toString());
      emit(CurrencyErrorState());
    });
  }


}
