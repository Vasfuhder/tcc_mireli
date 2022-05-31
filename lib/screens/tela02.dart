import 'package:flutter/material.dart';
import 'package:tcc_mireli/screens/tela03.dart';
import 'package:tcc_mireli/utils/hexcolor.dart';
import 'package:tcc_mireli/widgets/button1.dart';
import 'package:tcc_mireli/widgets/error_dialog.dart';

class Tela02 extends StatefulWidget {
  const Tela02({Key? key}) : super(key: key);

  @override
  State<Tela02> createState() => _Tela02State();
}

class _Tela02State extends State<Tela02> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: HexColor("#252525"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Dados necessários para a verificação do empreendimento.",
            style: TextStyle(
              color: HexColor("#F8E436"),
              fontSize: 38,
            ),
          ),
          const SizedBox(height: 38),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Flexible(
                flex: 1,
                child: Localizacao(),
              ),
              Flexible(
                flex: 1,
                child: Zona(),
              ),
              Flexible(
                flex: 1,
                child: Uso(),
              )
            ],
          ),
          const Atividades(),
          const SizedBox(height: 50),
          Button1(
            text: "Próxima",
            size: 1.5,
            callback: () {
              if (Atividades.textController.text.isNotEmpty &&
                  _LocalizacaoState._val != -1 &&
                  _ZonaState.itemSelecionado != null &&
                  _UsoState.itemSelecionado != null) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: ((context) => Tela03()),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => ErrorDialog(
                    message: "Por favor, preencha todos os campos!",
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class Atividades extends StatelessWidget {
  const Atividades({
    Key? key,
  }) : super(key: key);

  static TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1125,
      height: 207,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: HexColor("#383838"),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Atividades",
            style: TextStyle(
              color: HexColor("#F3F3F3"),
              fontSize: 24,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: textController,
              maxLines: 8,
              maxLength: 256,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                counterStyle: TextStyle(color: HexColor("#F3F3F3")),
                fillColor: HexColor("#5F5B5B"),
                filled: true,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor("#383838")),
                ),
                hintText: "Escreva aqui...",
                hintStyle: TextStyle(
                  color: HexColor("#B8B8B8"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Localizacao extends StatefulWidget {
  const Localizacao({
    Key? key,
  }) : super(key: key);

  @override
  State<Localizacao> createState() => _LocalizacaoState();
}

class _LocalizacaoState extends State<Localizacao> {
  final botoes = ["Zona urbana", "Zona rural"];

  static dynamic _val = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        height: 120,
        width: 364,
        decoration: BoxDecoration(
          color: HexColor("#383838"),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Localização",
              style: TextStyle(color: HexColor("#F3F3F3"), fontSize: 24),
            ),
            Row(
              children: List.generate(
                botoes.length,
                (index) => Expanded(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      botoes[index],
                      style: TextStyle(color: HexColor("#B8B8B8")),
                    ),
                    leading: Radio(
                      value: index,
                      groupValue: _val,
                      onChanged: (value) => setState(() => _val = value),
                      activeColor: HexColor("#B8B8B8"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class Zona extends StatefulWidget {
  const Zona({
    Key? key,
  }) : super(key: key);

  @override
  State<Zona> createState() => _ZonaState();
}

class _ZonaState extends State<Zona> {
  var valores = ["Zona 1", "Zona 2", "Zona 3"];

  static var itemSelecionado;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      height: 120,
      width: 364,
      decoration: BoxDecoration(
        color: HexColor("#383838"),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Zona",
            style: TextStyle(color: HexColor("#F3F3F3"), fontSize: 24),
          ),
          const SizedBox(height: 10),
          Container(
            height: 35,
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              color: HexColor("#5F5B5B"),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Theme(
              data:
                  Theme.of(context).copyWith(canvasColor: HexColor("#5F5B5B")),
              child: DropdownButton(
                style: TextStyle(color: HexColor("#B8B8B8")),
                isExpanded: true,
                hint: Text(
                  "Selecione a zona",
                  style: TextStyle(color: HexColor("#B8B8B8")),
                ),
                value: itemSelecionado,
                items: List.generate(
                  valores.length,
                  (index) => DropdownMenuItem(
                    value: valores[index],
                    child: Text(valores[index]),
                  ),
                ),
                onChanged: (value) => setState(() => itemSelecionado = value),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: HexColor("#9D9898"),
                ),
                iconSize: 42,
                underline: const SizedBox(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Uso extends StatefulWidget {
  const Uso({
    Key? key,
  }) : super(key: key);

  @override
  State<Uso> createState() => _UsoState();
}

class _UsoState extends State<Uso> {
  var valores = ["Uso 1", "Uso 2", "Uso 3"];

  static var itemSelecionado;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      height: 120,
      width: 364,
      decoration: BoxDecoration(
        color: HexColor("#383838"),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Uso",
            style: TextStyle(color: HexColor("#F3F3F3"), fontSize: 24),
          ),
          const SizedBox(height: 10),
          Container(
            height: 35,
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              color: HexColor("#5F5B5B"),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Theme(
              data:
                  Theme.of(context).copyWith(canvasColor: HexColor("#5F5B5B")),
              child: DropdownButton(
                style: TextStyle(color: HexColor("#B8B8B8")),
                isExpanded: true,
                hint: Text(
                  "Selecione o uso",
                  style: TextStyle(color: HexColor("#B8B8B8")),
                ),
                value: itemSelecionado,
                items: List.generate(
                  valores.length,
                  (index) => DropdownMenuItem(
                    value: valores[index],
                    child: Text(valores[index]),
                  ),
                ),
                onChanged: (value) => setState(() => itemSelecionado = value),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: HexColor("#9D9898"),
                ),
                iconSize: 42,
                underline: const SizedBox(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
