import 'package:flutter/material.dart';
import 'package:tcc_mireli/utils/hexcolor.dart';
import 'package:tcc_mireli/widgets/button1.dart';
import 'package:tcc_mireli/widgets/button3.dart';
import 'package:tcc_mireli/widgets/error_dialog.dart';
import 'package:tcc_mireli/widgets/form_question.dart';

class Tela03 extends StatefulWidget {
  Tela03({Key? key}) : super(key: key);

  final pageController = PageController(initialPage: 0);
  var actual_page = 0;

  var respostas = {};

  @override
  State<Tela03> createState() => _Tela03State();
}

class _Tela03State extends State<Tela03> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: HexColor("#252525"),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Por favor, responda:",
              style: TextStyle(
                color: HexColor("#F8E436"),
                fontSize: 38,
              ),
            ),
            const Spacer(),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: widget.pageController,
                children: List.generate(
                  perguntas().length,
                  (index) => FormQuestion(pergunta: perguntas()[index]),
                ),
                onPageChanged: (page) => setState(
                  () => widget.actual_page = page,
                ),
              ),
            ),
            const Spacer(),
            widget.actual_page == 0 ? const SizedBox.shrink() : botao()
          ],
        ),
      ),
    );
  }

  botao() {
    if (widget.actual_page == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Button1(
            text: "Próxima",
            size: 1,
            callback: () {
              final resposta = widget.respostas[widget.actual_page];
              if (resposta == -1 || resposta == "" || resposta == null) {
                showDialog(
                  context: context,
                  builder: (_) => ErrorDialog(
                    message: "Por favor, selecione pelo menos uma opção!",
                  ),
                );
              } else {
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCirc,
                );
              }
            },
          ),
        ],
      );
    } else if ((widget.actual_page > 1) &&
        (widget.actual_page < perguntas().length - 1)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Button3(
            text: "Anterior",
            size: 1,
            callback: () {
              widget.pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCirc,
              );
            },
          ),
          Button1(
            text: "Próxima",
            size: 1,
            callback: () {
              final resposta = widget.respostas[widget.actual_page];
              if (resposta == -1 || resposta == "" || resposta == null) {
                showDialog(
                  context: context,
                  builder: (_) => ErrorDialog(
                    message: "Por favor, preencha o campo!",
                  ),
                );
              } else {
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCirc,
                );
              }
            },
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Button3(
            text: "Anterior",
            size: 1,
            callback: () {
              widget.pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
              );
            },
          ),
          Button1(
            text: "Finalizar",
            size: 1,
            callback: () {
              final resposta = widget.respostas[widget.actual_page];
              if (resposta == -1 || resposta == "" || resposta == null) {
                showDialog(
                  context: context,
                  builder: (_) => ErrorDialog(
                    message: "Por favor, preencha o campo!",
                  ),
                );
              } else {
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCirc,
                );
              }
            },
          )
        ],
      );
    }
  }

  perguntas() {
    return {
      0: {
        "titulo": "01 - Possui a localização do empreendimento?",
        "type": "button",
        "options": ["Sim", "Não"],
        "callback": [
          () {
            widget.pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic,
            );
          },
          () {
            print("saaaaaaaaaaaaaaaiiiii");
          }
        ]
      },
      1: {
        "titulo": "02 - Qual o grau de incomodidade do seu empreendimento?",
        "type": "radio",
        "options": ["Baixíssimo", "Baixo", "Médio", "Alto", "Altíssimo"],
        "callback": (value) {
          widget.respostas[1] = value;
        }
      },
      2: {
        "titulo": "03 -  Qual a área total, em metros quadrados, do lote?",
        "type": "escrever",
        "unidade": "m²",
        "callback": (value) {
          widget.respostas[2] = value;
        }
      },
      3: {
        "titulo": "04 -  Qual a menor cota altimétrica, em metros, da área?",
        "type": "escrever",
        "unidade": "m",
        "callback": (value) {
          widget.respostas[3] = value;
        }
      },
      4: {
        "titulo": "05 -  Qual o Coeficiente de Aproveitamento da edificação?",
        "type": "escrever",
        "unidade": "",
        "callback": (value) {
          widget.respostas[4] = value;
        }
      },
      5: {
        "titulo": "06 -  Qual a taxa de ocupação da edificação?",
        "type": "escrever",
        "unidade": "%",
        "callback": (value) {
          widget.respostas[5] = value;
        }
      },
      6: {
        "titulo": "07 -  Qual a taxa de permeabilidade do solo?",
        "type": "escrever",
        "unidade": "%",
        "callback": (value) {
          widget.respostas[6] = value;
        }
      },
      7: {
        "titulo": "08 -  Qual o recuo frontal da edificação?",
        "type": "escrever",
        "unidade": "m",
        "callback": (value) {
          widget.respostas[7] = value;
        }
      },
      8: {
        "titulo": "09 -  Qual o recuo de fundo da edificação?",
        "type": "escrever",
        "unidade": "m",
        "callback": (value) {
          widget.respostas[8] = value;
        }
      },
      9: {
        "titulo": "10 -  Qual o recuo da lateral leste/sul da edificação?",
        "type": "escrever",
        "unidade": "m",
        "callback": (value) {
          widget.respostas[9] = value;
        }
      },
      10: {
        "titulo": "11 -  Qual o recuo da lateral oeste/norte da edificação?",
        "type": "escrever",
        "unidade": "m",
        "callback": (value) {
          widget.respostas[10] = value;
        }
      },
      11: {
        "titulo": "12 -  Qual o recuo da lateral de esquina da edificação?",
        "type": "escrever",
        "unidade": "m",
        "callback": (value) {
          widget.respostas[11] = value;
        }
      },
      12: {
        "titulo": "13 -  Qual a altura máxima da edificação?",
        "type": "escrever",
        "unidade": "m",
        "callback": (value) {
          widget.respostas[12] = value;
        }
      },
    };
  }
}
