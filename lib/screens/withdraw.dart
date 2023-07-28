// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:agric_fresh_app/components/touchDailComp.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Widthdraw extends StatefulWidget {
  const Widthdraw({super.key});

  @override
  State<Widthdraw> createState() => _WidthdrawState();
}

class _WidthdrawState extends State<Widthdraw> with TickerProviderStateMixin {
  final GlobalKey<SliverAnimatedListState> _key = GlobalKey();
  List<Map> data = [];
  List<Map<String, String>> transactionData = [
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      for (Map item in transactionData) {
        data.add(item);
        _key.currentState!.insertItem(
          data.length - 1,
        );
        await Future.delayed(Duration(milliseconds: 100));
      }
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
  final String _accountName = 'Anubahimendo Osezele Joseph';
  final String _accountNumber = '0789601012';
  final String _bankName = 'ACCESS BANK';

  @override
  Widget build(BuildContext context) {
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
    }
    i++;
    String value = '';
    void setAnimatedStates(
        String nameInput, String acctNumber, String bankName) {
      late String nameInput_ = nameInput;
      late String numberInput = acctNumber;
      late String bankName_ = bankName;
      FocusNode _acctNameFN = FocusNode();
      FocusNode _acctBankFN = FocusNode();
      setState(() {
        _animatedAcctName = TextField(
          focusNode: _acctNameFN,
          keyboardType: TextInputType.name,
          onChanged: (value) {
            nameInput = value;
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
              _acctBankFN.requestFocus();
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
              _acctNameFN.requestFocus();
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
          focusNode: _acctBankFN,
          keyboardType: TextInputType.name,
          onChanged: (value) {
            bankName_ = value;
          },
          onEditingComplete: () {
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
      String _text = 'Verifying User';
      int i = 0;
      Future ft = Future(() {});

      showCupertinoModalPopup(
        context: context,
        builder: ((context) {
          return StatefulBuilder(
            builder: (context, modalsetState) {
              ft.then((value) async {
                await Future.delayed(Duration(milliseconds: 2000), () {
                  modalsetState(() {
                    _text = 'Verifying Amount';
                  });
                });
                await Future.delayed(Duration(milliseconds: 3000), () {
                  modalsetState(() {
                    _text = 'Verifying Transaction';
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
                child: Container(
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
                        Text(_text)
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
        if (value.length == 0) {
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 50),
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
        });
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
                margin: EdgeInsets.symmetric(vertical: 15),
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
            initialItemCount: data.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: ListTile(
                      title: Text(data[index]['amount']),
                      trailing: Text(data[index]['time']),
                      subtitle: Text(data[index]['date']),
                    ),
                  ));
            })
      ],
    ));
  }
}
