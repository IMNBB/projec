import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  // properties
  final VoidCallback selectHandler;
  final String answer;
  final Color color;
  final Color textColor;

  // constructor
  Answer(this.selectHandler, this.answer, this.color, this.textColor);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: _isHovered ? Colors.black : widget.color,
            onPrimary: _isHovered ? Colors.white : widget.textColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: widget.selectHandler,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.answer,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
