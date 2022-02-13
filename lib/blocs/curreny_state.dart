part of 'curreny_cubit.dart';

@immutable
abstract class CurrencyStates {}

class CurrencyInitial extends CurrencyStates {}
class CurrencyLoadingState extends CurrencyStates {}
class CurrencyErrorState extends CurrencyStates {}
class CurrencySuccessState extends CurrencyStates {}


