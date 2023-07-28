import 'package:flutter/material.dart';

class TouchDailItem extends StatefulWidget {
  final String e;
  final Function? value;
  final BuildContext? context;
  const TouchDailItem({super.key, this.e = '', this.value, this.context});

  @override
  State<TouchDailItem> createState() => _TouchDailItemState();
}

class _TouchDailItemState extends State<TouchDailItem> {
  final Color _fontColor = const Color.fromARGB(255, 79, 79, 79);
  Widget animatedWidget = const Placeholder();
  int i = 0;
  @override
  Widget build(BuildContext context) {
    String e = widget.e;

    if (i == 0) {
      animatedWidget = Container(
        key: const ValueKey('first'),
        height: 70,
        color: Colors.white,
        child: Center(
          child: Text(
            e,
            style: TextStyle(
              color: _fontColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    i++;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            animatedWidget = Container(
              key: const ValueKey('second'),
              height: 70,
              color: const Color.fromARGB(255, 255, 175, 75),
              child: Center(
                child: Text(
                  e,
                  style: TextStyle(
                    color: _fontColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          });

          Future.delayed(const Duration(milliseconds: 70), () {
            setState(() {
              animatedWidget = Container(
                key: const ValueKey('first'),
                height: 70,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Center(
                  child: Text(
                    e,
                    style: TextStyle(
                      color: _fontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            });

            widget.value!(e);
          });
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: animatedWidget,
        ),
      ),
    );
  }
}
