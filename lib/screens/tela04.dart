import 'package:flutter/material.dart';
import 'package:tcc_mireli/screens/tela01.dart';
import 'package:tcc_mireli/utils/hexcolor.dart';

class Tela04 extends StatelessWidget {
  const Tela04({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: HexColor("#252525"),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              header(context),
              const SizedBox(height: 70),
              Icon(
                Icons.check_circle_outline_rounded,
                color: HexColor("#5DC03A"),
                size: 250,
              ),
              Texto(
                text: "A instalação do seu empreendimento é viável",
                color: HexColor("#5DC03A"),
                fontSize: 36,
              ),
              const SizedBox(height: 22),
              Texto(
                text:
                    "A partir da verificação realizada, o empreendimento se mostra adequado ao Plano Diretor de Marabá.",
                color: HexColor("#686868"),
                fontSize: 24,
              ),
              const SizedBox(height: 84),
              Align(
                alignment: Alignment.centerLeft,
                child: Texto(
                  text:
                      "As atividades que serão instaladas no empreendimento: ",
                  fontSize: 24,
                  color: HexColor("#7C7C7C"),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 29),
              WContainer(
                child: Texto(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  color: HexColor("#B8B8B8"),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 52),
              Align(
                alignment: Alignment.centerLeft,
                child: Texto(
                  text: "Os dados estão dentro dos limites:",
                  color: HexColor("#7C7C7C"),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 29),
              WContainer(
                child: Column(
                  children: List.generate(
                    4,
                    (index) => ListTile(
                      leading: Icon(
                        Icons.check_rounded,
                        color: HexColor("#5DC03A"),
                      ),
                      title: Texto(
                          color: HexColor("#5DC03A"),
                          fontSize: 18,
                          text:
                              "A área total do empreendimento é: {area_total} m^2"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 52),
              Align(
                alignment: Alignment.centerLeft,
                child: Texto(
                  text:
                      "As limitações do seu terreno condizem com  a zona e uso determinada: ",
                  fontSize: 24,
                  color: HexColor("#7C7C7C"),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 29),
              WContainer(
                child: Column(
                  children: List.generate(
                    7,
                    (index) => ListTile(
                      leading: Icon(
                        Icons.check_rounded,
                        color: HexColor("#5DC03A"),
                      ),
                      title: Texto(
                          color: HexColor("#5DC03A"),
                          fontSize: 18,
                          text:
                              "A área total do empreendimento é: {area_total} m^2"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 42),
              Align(
                alignment: Alignment.centerLeft,
                child: Texto(
                  text:
                      "O grau de incomodidade do seu empreendimento é {x}, os requisitos que você deve cumprir são:",
                  fontSize: 24,
                  color: HexColor("#7C7C7C"),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 22),
              Table(
                border: TableBorder.all(
                  borderRadius: BorderRadius.circular(16),
                  color: HexColor("#7C7C7C"),
                  width: 2,
                ),
                children: const [
                  TableRow(
                    children: [
                      Celula(
                        text: "Grau de incomodidade",
                        fontWeight: FontWeight.bold,
                      ),
                      Celula(
                        text: "Localização",
                        fontWeight: FontWeight.bold,
                      ),
                      Celula(
                        text: "Poluícão sonora",
                        fontWeight: FontWeight.bold,
                      ),
                      Celula(
                        text: "Poluícão Atmosférica",
                        fontWeight: FontWeight.bold,
                      ),
                      Celula(
                        text: "Poluícão Hídrica",
                        fontWeight: FontWeight.bold,
                      ),
                      Celula(
                        text: "Geração de resídios",
                        fontWeight: FontWeight.bold,
                      ),
                      Celula(
                        text: "Vibração",
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  TableRow(children: [
                    Celula(
                      text: "4",
                      fontWeight: FontWeight.normal,
                    ),
                    Celula(
                      text:
                          "Zona de Expansão da Nova Marabá, Zona de Expansão da Cidade Nova e Zonas Especiais Industriais",
                      fontWeight: FontWeight.normal,
                    ),
                    Celula(
                      text: "Diurna 65 dB\nNoturna 65 dB",
                      fontWeight: FontWeight.normal,
                    ),
                    Celula(
                      text:
                          "Emissão de substâncias odoríferas e de fumaça conforme legislação ambiental",
                      fontWeight: FontWeight.normal,
                    ),
                    Celula(
                      text: "ConForme legislação ambiental",
                      fontWeight: FontWeight.normal,
                    ),
                    Celula(
                      text: "Classes I e II",
                      fontWeight: FontWeight.normal,
                    ),
                    Celula(
                      text: "Conforme legislação",
                      fontWeight: FontWeight.normal,
                    ),
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Botao(
          text: "Refazer relatório",
          icon: Icons.replay_rounded,
          callback: () => _refazerRelatorioAction(context),
          preenchido: false,
        ),
        const SizedBox(width: 50),
        Botao(
          text: "Baixar",
          icon: Icons.file_download_outlined,
          callback: () {},
          preenchido: true,
        )
      ],
    );
  }

  _refazerRelatorioAction(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Tela01(),
      ),
    );
  }
}

class Celula extends StatelessWidget {
  const Celula({Key? key, required this.text, required this.fontWeight})
      : super(key: key);

  final text;
  final fontWeight;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text(
          text,
          style: TextStyle(
            color: HexColor("#9C9A9A"),
            fontSize: 18,
            fontWeight: fontWeight,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class WContainer extends StatelessWidget {
  const WContainer({Key? key, required this.child}) : super(key: key);

  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: HexColor("#383838"), borderRadius: BorderRadius.circular(5)),
      child: child,
    );
  }
}

class Texto extends StatelessWidget {
  const Texto(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.color,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  final text;
  final fontSize;
  final color;
  final fontWeight;
  final textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}

class Botao extends StatelessWidget {
  const Botao({
    Key? key,
    required this.text,
    required this.icon,
    required this.callback,
    required this.preenchido,
  }) : super(key: key);

  final text;
  final icon;
  final callback;
  final preenchido;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          primary: preenchido ? HexColor("#090808") : HexColor("#252525"),
          side: BorderSide(
            width: 2,
            color:
                preenchido ? Colors.transparent : Colors.grey.withOpacity(0.8),
          ),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: HexColor("#A1A1A1"),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              icon,
              color: HexColor("#A1A1A1"),
            )
          ],
        ),
      ),
    );
  }
}
