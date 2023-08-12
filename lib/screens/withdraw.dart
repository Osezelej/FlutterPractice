// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:agric_fresh_app/components/touchDailComp.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:agric_fresh_app/main.dart';
import 'package:dio/dio.dart';
import 'package:agric_fresh_app/config.dart';

class Widthdraw extends StatefulWidget {
  final User_ appuser;
  const Widthdraw({super.key, required this.appuser});

  @override
  State<Widthdraw> createState() => _WidthdrawState();
}

class _WidthdrawState extends State<Widthdraw> with TickerProviderStateMixin {
  final GlobalKey<SliverAnimatedListState> _key = GlobalKey();
  List<Map> data = [];
  late List<Map<String, String>> transactionData = [
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'debit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'debit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'debit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'debit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    },
    {
      'id': 'Psld-4536-cnjhfsh48i',
      'status': 'credit',
      'amount': '2500',
      'date': '12, jul, 2023',
      'time': '12:00AM'
    }
  ];
  List<String> touchDail = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '*',
    '0',
    '#'
  ];
  final dio = Dio();
  late User_ appuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      for (Map item in appuser.transactionData) {
        if (item['status'] == 'debit') {
          data.add(item);
          _key.currentState!.insertItem(
            data.length - 1,
          );
        }

        await Future.delayed(Duration(milliseconds: 30));
      }

      fetchAcctdetails(appuser);
    });
  }

  int i = 0;
  Widget _animatedAcctName = Placeholder();
  Widget _animatedAcctNumber = Placeholder();
  Widget _animatedBankName = Placeholder();
  Widget _firstvalidComp = Placeholder();
  Widget _secondvalidComp = Placeholder();
  Widget _thirdvalidComp = Placeholder();
  Widget _fourthvalidComp = Placeholder();

  late String value;
  String _accountName = 'enter your acount name';
  String _accountNumber = 'Enter your account number';
  String _bankName = 'enter your bank name';

  fetchAcctdetails(User_ appuser) async {
    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
              elevation: 24,
              backgroundColor: Colors.white,
              content: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    SpinKitDualRing(
                      size: 30,
                      lineWidth: 3.0,
                      color: Color.fromARGB(255, 255, 175, 75),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Geting acctount details...')
                  ],
                ),
              ),
            ));
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      final response = await dio.get('$baseUrl/getacctDetails',
          queryParameters: {'email': appuser.email});

      if (response.statusCode == 200) {
        if (response.data != 0) {
          print(response.data);
          appuser.acctName = response.data[0]['acct name'];
          appuser.acctNumber = response.data[0]['acct number'];
          appuser.bankName = response.data[0]['bank name'];
          setState(() {
            _animatedAcctName = Text(
              appuser.acctName,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 15,
                fontWeight: FontWeight.w900,
              ),
            );
            _animatedAcctNumber = Text(
              appuser.acctNumber,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 15,
                  fontWeight: FontWeight.w900),
            );
            _animatedBankName = Text(
              appuser.bankName,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 15,
                fontWeight: FontWeight.w900,
              ),
            );
          });
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Warning!!'),
                  content: Text(
                      'You have not registered any Bank Account details to this account, please ensure you register a valid bank account details to this to this account.'),
                );
              });
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(
                    'Sorry, an error occured Geting your Account details, leave this Screen and try again'),
              );
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(
                  'Sorry, an error occured Geting your Account details, leave this Screen and try again'),
            );
          });
    }
  }

  insertacct(acctName, acctNumber, bankName) async {
    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
              elevation: 24,
              backgroundColor: Colors.white,
              content: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    SpinKitDualRing(
                      size: 30,
                      lineWidth: 3.0,
                      color: Color.fromARGB(255, 255, 175, 75),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Registering Account Details...')
                  ],
                ),
              ),
            ));
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      final Response response = await dio.post('$baseUrl/registerAcct', data: {
        'email': appuser.email,
        'acct_name': acctName,
        'acct_no': acctNumber,
        'bank_name': bankName,
      });
      if (response.statusCode == 200) {
        if (response.data != 0) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Successful!!'),
                  content: Text(
                      'Your Account details have been registered successfully.'),
                );
              });
        } else {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(
                      'Sorry, an error occured Registerig your Account details, try again Latter.'),
                );
              });
        }
      } else {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(
                    'Sorry, an error occured Registerig your Account details, try again Latter.'),
              );
            });
      }
    } catch (e) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(
                  'Sorry, an error occured Registerig your Account details, try again Latter.'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    appuser = widget.appuser;

    if (i == 0) {
      _firstvalidComp = Container(
        key: const ValueKey('1'),
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
      );
      _secondvalidComp = Container(
        key: const ValueKey('2'),
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
      );

      _thirdvalidComp = Container(
        key: const ValueKey('3'),
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
      );

      _fourthvalidComp = Container(
        key: const ValueKey('4'),
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
      );

      _animatedAcctName = Text(
        _accountName,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 15,
          fontWeight: FontWeight.w900,
        ),
      );
      _animatedAcctNumber = Text(
        _accountNumber,
        style: TextStyle(
            color: Colors.grey[400], fontSize: 15, fontWeight: FontWeight.w900),
      );
      _animatedBankName = Text(
        _bankName,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 15,
          fontWeight: FontWeight.w900,
        ),
      );

      // fetchAcctdetails(appuser);
    }
    i++;
    String value = '';
    void setAnimatedStates(
        String nameInput, String acctNumber, String bankName) {
      // former data inputed
      String prevnameInput = nameInput;
      String prevacctNumber = acctNumber;
      String prevBankname = bankName;

      String nameInput_ = nameInput;
      String numberInput = acctNumber;
      String bankName_ = bankName;

      FocusNode acctNameFN = FocusNode();
      FocusNode acctBankFN = FocusNode();
      setState(() {
        _animatedAcctName = TextField(
          focusNode: acctNameFN,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.newline,
          onChanged: (value) {
            nameInput_ = value;
          },
          onEditingComplete: () {
            if (nameInput.isNotEmpty) {
              setState(() {
                _animatedAcctName = Text(
                  nameInput_,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                );
              });
              acctBankFN.requestFocus();
            }
          },
          controller: TextEditingController(text: nameInput_),
          decoration: InputDecoration(
            labelText: 'Account Name',
            floatingLabelStyle:
                TextStyle(color: Color.fromARGB(255, 255, 175, 74)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 175, 74)),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
        _animatedAcctNumber = TextField(
          autofocus: true,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.newline,
          controller: TextEditingController(text: numberInput),
          onChanged: (value) {
            numberInput = value;
          },
          onEditingComplete: () {
            if (nameInput.isNotEmpty) {
              setState(() {
                _animatedAcctNumber = Text(
                  numberInput,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                );
              });
              acctNameFN.requestFocus();
            }
          },
          decoration: InputDecoration(
            labelText: 'Account Number',
            floatingLabelStyle:
                TextStyle(color: Color.fromARGB(255, 255, 175, 74)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 175, 74)),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
        _animatedBankName = TextField(
          focusNode: acctBankFN,
          keyboardType: TextInputType.name,
          onChanged: (value) {
            bankName_ = value;
          },
          onEditingComplete: () async {
            if (nameInput.isNotEmpty) {
              setState(() {
                _animatedBankName = Text(
                  bankName_,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                );
              });
              if (prevnameInput == nameInput_ ||
                  prevBankname == bankName_ ||
                  prevacctNumber == numberInput) {
                print('invalid acct');
              } else {
                await insertacct(nameInput_, numberInput, bankName_);
              }

              print('completed');
            }
          },
          controller: TextEditingController(text: bankName_),
          decoration: InputDecoration(
            labelText: 'Bank Name',
            floatingLabelStyle:
                TextStyle(color: Color.fromARGB(255, 255, 175, 74)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 175, 74)),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      });
    }

    void successful() {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Card(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'checked.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Withdrawal logged successfully')
                      ],
                    )));
          });
    }

    void verifybottomModal() {
      String text = 'Verifying User';
      Future ft = Future(() {});

      showCupertinoModalPopup(
        context: context,
        builder: ((context) {
          return StatefulBuilder(
            builder: (context, modalsetState) {
              ft.then((value) async {
                await Future.delayed(Duration(milliseconds: 2000), () {
                  modalsetState(() {
                    text = 'Verifying Amount';
                  });
                });
                await Future.delayed(Duration(milliseconds: 3000), () {
                  modalsetState(() {
                    text = 'Verifying Transaction';
                  });
                });
                await Future.delayed(Duration(milliseconds: 2000), () {
                  Navigator.of(context).pop();
                });
                await Future.delayed(Duration(milliseconds: 500), () {
                  successful();
                });
              });

              return Card(
                child: SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    child: Row(
                      children: [
                        SpinKitRing(
                          color: Color.fromARGB(255, 255, 175, 75),
                          lineWidth: 5,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(text)
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      );
    }

    void addFunction(String e, BuildContext context, StateSetter modalsetState,
        String from) async {
      if (value.length < 4) {
        if (value.isEmpty) {
          modalsetState(() {
            _firstvalidComp = Container(
              key: const ValueKey('sec'),
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
                color: Color.fromARGB(255, 255, 175, 25),
                borderRadius: BorderRadius.circular(40),
              ),
            );
          });
          setState(() {
            i++;
          });
        } else if (value.length == 1) {
          modalsetState(() {
            _secondvalidComp = Container(
              key: const ValueKey('sec'),
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
                color: Color.fromARGB(255, 255, 175, 25),
                borderRadius: BorderRadius.circular(40),
              ),
            );
          });
        } else if (value.length == 2) {
          modalsetState(() {
            _thirdvalidComp = Container(
              key: const ValueKey('sec'),
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
                color: Color.fromARGB(255, 255, 175, 25),
                borderRadius: BorderRadius.circular(40),
              ),
            );
          });
        } else if (value.length == 3) {
          modalsetState(() {
            _fourthvalidComp = Container(
              key: const ValueKey('sec'),
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
                color: Color.fromARGB(255, 255, 175, 25),
                borderRadius: BorderRadius.circular(40),
              ),
            );
          });
        }

        value += e;
        print(value);
      }
      if (value.length == 4) {
        modalsetState(() {
          _fourthvalidComp = Container(
            key: const ValueKey('sec'),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
              color: Color.fromARGB(255, 255, 175, 25),
              borderRadius: BorderRadius.circular(40),
            ),
          );
        });
        if (appuser.trxPin == value) {
          await Future.delayed(Duration(milliseconds: 300), () async {
            Navigator.of(context).pop();
            switch (from) {
              case 'editwallet':
                setAnimatedStates(_accountName, _accountNumber, _bankName);
                break;
              case 'withdraw':
                showCupertinoModalPopup(
                    context: context,
                    builder: ((context) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 50),
                          child: TextField(
                              textInputAction: TextInputAction.done,
                              onEditingComplete: () {
                                print('completed');
                                Future.delayed(Duration(milliseconds: 300),
                                    () async {
                                  Navigator.of(context).pop();
                                  await Future.delayed(
                                      Duration(milliseconds: 300), () {
                                    verifybottomModal();
                                  });
                                });
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'amount',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 175, 75)),
                                ),
                                floatingLabelStyle: TextStyle(
                                    color: Color.fromARGB(255, 255, 175, 75)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        ),
                      );
                    }));
                break;
            }
          });
        } else {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Wrong Transaction pin'),
                  content: Text(
                      'Sorry, You have entered thhe wrong transaction pin'),
                );
              });
        }
        setState(() {
          _firstvalidComp = Container(
            key: const ValueKey('1'),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          );
          _secondvalidComp = Container(
            key: const ValueKey('2'),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          );

          _thirdvalidComp = Container(
            key: const ValueKey('3'),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          );

          _fourthvalidComp = Container(
            key: const ValueKey('4'),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 255, 175, 74)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          );
        });
        value = '';
      }
    }

    void showmodal(from) async {
      await showModalBottomSheet(
        transitionAnimationController: AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 300),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter modalSetState) {
            return Container(
              height: 380,
              color: Colors.white,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(
                    children: [
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _firstvalidComp),
                      const SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _secondvalidComp),
                      const SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _thirdvalidComp),
                      const SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _fourthvalidComp),
                      const SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Enter Confirmation password'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: touchDail
                          .sublist(0, 3)
                          .map((e) => TouchDailItem(
                                e: e,
                                context: context,
                                value: (String e) {
                                  addFunction(e, context, modalSetState, from);
                                },
                              ))
                          .toList(),
                    )),
                Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: touchDail
                          .sublist(3, 6)
                          .map((e) => TouchDailItem(
                                e: e,
                                context: context,
                                value: (String e) {
                                  addFunction(e, context, modalSetState, from);
                                },
                              ))
                          .toList(),
                    )),
                Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: touchDail
                          .sublist(6, 9)
                          .map((e) => TouchDailItem(
                                e: e,
                                context: context,
                                value: (String e) {
                                  addFunction(e, context, modalSetState, from);
                                },
                              ))
                          .toList(),
                    )),
                Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: touchDail
                          .sublist(9)
                          .map((e) => TouchDailItem(
                                e: e,
                                context: context,
                                value: (String e) {
                                  addFunction(e, context, modalSetState, from);
                                },
                              ))
                          .toList(),
                    )),
              ]),
            );
          });
        },
      );
    }

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text(
            'Withdrawal',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 5,
          foregroundColor: Color.fromARGB(255, 255, 175, 74),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            height: 210,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(15),
              child: DottedBorder(
                strokeWidth: 0.5,
                color: Color.fromARGB(100, 255, 175, 75),
                dashPattern: [16, 7],
                radius: Radius.circular(15),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Account Number',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child: _animatedAcctNumber),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Account Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child: _animatedAcctName),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Bank Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child: _animatedBankName),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Positioned(
                          top: -2,
                          right: -2,
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit_rounded,
                              color: Color.fromARGB(255, 255, 175, 75),
                              size: 19,
                            ),
                            onPressed: () async {
                              showmodal('editwallet');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: TextButton.icon(
              onPressed: () {
                showmodal('withdraw');
              },
              icon: Icon(
                Icons.wallet_rounded,
                size: 21,
                color: Colors.black,
              ),
              label: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Withdraw',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 255, 175, 74)),
                  elevation: MaterialStatePropertyAll(10)),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                color: Colors.white,
                child: Text(
                  'Withdrawals',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ])),
        SliverAnimatedList(
            key: _key,
            initialItemCount: data.isEmpty ? 1 : data.length,
            itemBuilder: (context, index, animation) {
              return index < 1
                  ? ListTile(
                      title: Text(
                        'There is no withdrawal',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : SlideTransition(
                      position: animation.drive(
                        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Colors.white,
                        child: ListTile(
                          title: Text(data[index - 1]['amount']),
                          trailing: Text(data[index - 1]['time']),
                          subtitle: Text(data[index - 1]['date']),
                        ),
                      ));
            })
      ],
    ));
  }
}
