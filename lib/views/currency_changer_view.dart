import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thirteen_two/blocs/curreny_cubit.dart';

class CurrencyChangerView extends StatefulWidget {
  const CurrencyChangerView({Key? key}) : super(key: key);

  @override
  State<CurrencyChangerView> createState() => _CurrencyChangerViewState();
}

class _CurrencyChangerViewState extends State<CurrencyChangerView> {
  final items1 = ['EGP', 'USD'];
  final items2 = ['EGP', 'USD'];
  String? value1;
  String? value2;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

  @override
  Widget build(BuildContext context) {
    var amountController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<CurrencyCubit, CurrencyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var currencyCubit = CurrencyCubit.get(context);
        return SafeArea(
          top: true,
          child: Scaffold(
            backgroundColor: Colors.white,

            body: Padding(
              padding: const EdgeInsets.only(top:29.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                          child: Text('Help!',style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    SizedBox(height: 19,),
                    Padding(
                      padding: const EdgeInsets.only(left:29.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                          child: Text('Currency\nConverter' ,style: TextStyle(color: Colors.blue , fontSize: 30 , fontWeight: FontWeight.bold),  )),
                    ),
                      SizedBox(
                        height: 65,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                        '     From',
                        style: TextStyle(color: Colors.black, fontSize: 29),
                    ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: DropdownButtonHideUnderline(
                        child: Container(
                          width: width*0.8,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 19.0, right: 10.0),
                            child: DropdownButton<String>(
                              value: value1,
                              iconSize: 36,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              items: items1.map(buildMenuItem).toList(),
                              onChanged: (value) => setState(
                                () => this.value1 = value,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '     To',
                        style: TextStyle(color: Colors.black, fontSize: 29),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: DropdownButtonHideUnderline(
                        child: Container(
                          width: width*0.8,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 19.0, right: 10.0),
                            child: DropdownButton<String>(
                              value: value2,
                              iconSize: 36,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              items: items2.map(buildMenuItem).toList(),
                              onChanged: (value) => setState(
                                    () => this.value2 = value,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(60,15,60,30),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        decoration: BoxDecoration(

                            borderRadius:BorderRadius.circular(10) ,
                            color: Colors.grey[100]
                        ),
                        child: TextFormField(
                          controller: amountController,
                          keyboardType: TextInputType.number ,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter amount';
                            }
                            return null;
                          },
                          cursorColor: Colors.black,

                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: 'Please enter amount!',


                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: height*0.07,
                      width: width*0.6,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black,
                          primary: Colors.green, // background (button) color
                          onPrimary: Colors.white, // foreground (text) color
                        ),
                        onPressed: () {
                          currencyCubit.getAllCurrency(value1!,double.parse(amountController.text), value2!);
                        },
                        child: const Text('Result!',style: TextStyle(fontWeight: FontWeight.w400 , fontSize: 25),),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '     Result',
                        style: TextStyle(color: Colors.black, fontSize: 29),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Center(child: Text(currencyCubit.currencyHub?.approxResult == null? '0' : currencyCubit.currencyHub!.approxResult.toString())),
                      height: height*0.06,
                      width: width*0.5,
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(10) ,
                          color: Colors.grey[100]
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
