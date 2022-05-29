import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:tcc_mireli/utils/hexcolor.dart';
import 'package:tcc_mireli/widgets/form_button.dart';

class FormQuestion extends StatefulWidget {
  var pergunta;
  dynamic valores = -1;

  FormQuestion({Key? key, required this.pergunta}) : super(key: key);

  @override
  State<FormQuestion> createState() => _FormQuestionState();
}

class _FormQuestionState extends State<FormQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor("#383838"),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 3,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Text(
            widget.pergunta["titulo"],
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const Spacer(flex: 1),
          getWidget(widget.pergunta),
          const Spacer(flex: 1),
        ],
      ),
    );
  }

  getWidget(pergunta) {
    switch (pergunta["type"]) {
      case "button":
        return button(pergunta);
      case "radio":
        return radio(pergunta);
      case "escrever":
        return escrever(pergunta);
    }
    return const Text("Error");
  }

  button(pergunta) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pergunta["options"].length,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FormButton(
              text: pergunta["options"][index],
              preenchido: pergunta["options"][index].toLowerCase() == "sim"
                  ? true
                  : false,
              callback: pergunta["callback"][index],
            ),
          );
        },
      ),
    );
  }

  radio(pergunta) {
    return Row(
      children: List.generate(pergunta["options"].length, (index) {
        return Expanded(
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              pergunta["options"][index],
              style: TextStyle(color: HexColor("#B8B8B8")),
            ),
            leading: Radio(
              value: index,
              groupValue: widget.valores,
              onChanged: (value) => setState(
                () {
                  widget.valores = value;
                  pergunta["callback"](value);
                },
              ),
              activeColor: HexColor("#B8B8B8"),
            ),
          ),
        );
      }),
    );
  }

  escrever(pergunta) {
    return Container(
      width: 200,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: HexColor("#5F5B5B"),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              onChanged: pergunta["callback"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              controller: MoneyMaskedTextController(
                decimalSeparator: '.',
                thousandSeparator: '',
              ),
              decoration: InputDecoration(
                counterStyle: TextStyle(color: HexColor("#F3F3F3")),
                fillColor: HexColor("#5F5B5B"),
                filled: false,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#383838")),
                ),
                suffixText: pergunta["unidade"],
                suffixStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
