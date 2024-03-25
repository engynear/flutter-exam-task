import 'package:flutter/material.dart';

class ButtonBarWidget extends StatefulWidget {
  final String title;
  final List<String> buttonTexts;
  final Function(int) onSelected;
  final int? highlightedIndex;

  const ButtonBarWidget({
    Key? key,
    required this.title,
    required this.buttonTexts,
    required this.onSelected,
    this.highlightedIndex,
  }) : super(key: key);

  @override
  _ButtonBarWidgetState createState() => _ButtonBarWidgetState();
}

class _ButtonBarWidgetState extends State<ButtonBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(widget.title, style: const TextStyle(fontSize: 24)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.buttonTexts.length, (index) {
            return Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: widget.highlightedIndex == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                widget.buttonTexts[index],
                style: TextStyle(
                    color: widget.highlightedIndex == index
                        ? Colors.black
                        : Colors.white),
              ),
            );
          }),
        ),
      ],
    );
  }
}
