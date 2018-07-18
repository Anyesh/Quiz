import "package:flutter/material.dart";

class AnswerButton extends StatelessWidget {
  bool answer;
  VoidCallback _onTap;

  AnswerButton(this.answer, this._onTap);

  @override
  Widget build(BuildContext ctx) {
    return Expanded(
        child: Material(
            color: answer == true ? Colors.greenAccent : Colors.redAccent,
            child: new InkWell(
                onTap: () => _onTap(),
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5.0)),
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    answer == true ? "True" : "False",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                )))));
  }
}
