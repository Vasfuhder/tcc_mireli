import 'package:flutter/material.dart';
import 'package:tcc_mireli/screens/loading_screen.dart';
import 'package:tcc_mireli/utils/hexcolor.dart';
import 'package:tcc_mireli/widgets/button1.dart';
import 'package:tcc_mireli/widgets/button3.dart';
import 'package:tcc_mireli/widgets/error_dialog.dart';
import 'package:tcc_mireli/widgets/form_question.dart';

class Tela03 extends StatefulWidget {
  Tela03({Key? key}) : super(key: key);

  final pageController = PageController(initialPage: 7);
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
                  (index) => FormQuestion(
                    pergunta: perguntas()[index],
                    question: perguntas()[index]["texto_apoio"] != null
                        ? true
                        : false,
                  ),
                ),
                onPageChanged: (page) => setState(
                  () => widget.actual_page = page,
                ),
              ),
            ),
            const Spacer(),
            botao()
          ],
        ),
      ),
    );
  }

  botao() {
    if (widget.actual_page == 0) {
      return proxima();
    } else if (widget.actual_page > 0 && widget.actual_page <= 1) {
      return anterior();
    } else if (widget.actual_page == 2) {
      return proxima();
    } else if (widget.actual_page > 2 &&
        widget.actual_page < perguntas().length - 1) {
      return anteriorProxima();
    } else {
      return anteriorFinalizar();
    }
  }

  Row anteriorProxima() {
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
        )
      ],
    );
  }

  Row anterior() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
        )
      ],
    );
  }

  Row proxima() {
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

  Row anteriorFinalizar() {
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
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoadingScreen(),
                ),
              );
            }
          },
        )
      ],
    );
  }

  onSubmitted(String value) {
    if (value.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => ErrorDialog(
          message: "Por favor, preencha o campo!",
        ),
      );
    } else {
      if (widget.actual_page >= perguntas().length - 1) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoadingScreen(),
          ),
        );
      } else {
        widget.pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCirc,
        );
      }
    }
  }

  perguntas() {
    return {
      0: {
        "titulo": "01 - Insira o nome do empreendimento:",
        "type": "escrever",
        "callback": (value) {
          widget.respostas[widget.actual_page] = value;
        },
        "on_submitted": onSubmitted
      },
      1: {
        "titulo": "02 - Possui a localização do empreendimento?",
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
      2: {
        "titulo": "03 - Localização:",
        "type": "selecionar",
        "options": [
          "Zona Urbana, em um dos Núcleos",
          "Zona Urbana, em uma Zona de Expansão Urbana",
          "Zona Urbana, em uma Vila Sede",
          "Zona Rural, fora de uma Vila Sede"
        ],
        "callback": (value) {
          widget.respostas[widget.actual_page] = value;
        },
        "texto_apoio":
            "As Zonas Urbanas de Marabá correspondem ao Distrito Sede Municipal e às Vilas Sede dos Distritos Rurais, enquanto que as Zonas Rurais são as áreas dos Distritos Rurais fora das Vilas Sede, conforme apresentam os Mapas 02 e 04 do Plano Diretor.",
        "hasImagem": true,
        "imagens": ["assets/mapa02.jpg", "assets/mapa04.jpg"],
        "nome_imagem": ["Mapa 02", "Mapa 04"]
      },
      3: {
        "titulo": "04 - Setor de Uso:",
        "type": "selecionar",
        "options": [
          "Setor Consolidado",
          "Setor em Consolidação",
          "Setor de Uso Controlado",
          "Setor de Recuperação e Qualificação"
        ],
        "callback": (value) {
          widget.respostas[widget.actual_page] = value;
        },
        "texto_apoio":
            "O Zoneamento Municipal delimita os Setores de Uso considerando as características da ocupação do solo e a qualidade da infraestrutura, sendo definidos conforme o Mapa 03 do Plano Diretor.",
        "hasImagem": true,
        // TODO alterar o mapa
        "imagens": ["assets/mapa02.jpg"],
        "nome_imagem": ["Mapa 03"]
      },
      4: {
        "titulo": "05 - Zona de Uso:",
        "type": "selecionar",
        "options": [
          "Zona Mista Residencial",
          "Zona Especial de Interesse Social",
          "Zona Especial de Interesse Ambiental",
          "Zona Especial de Proteção do Patrimônio Histórico",
          "Zona Especial de Segurança Alimentar",
          "Zona Especial Industrial",
          "Zona Especial de Comércio e Serviços",
          "Zona Especial de Interesse Turístico",
          "Zona Especial de Interesse Urbanístico"
        ],
        "callback": (value) {
          widget.respostas[widget.actual_page] = value;
        },
        "texto_apoio":
            "O Zoneamento Municipal delimita as Zonas de Uso considerando os usos permitidos e os parâmetros de ocupação do solo, sendo definidas conforme o Mapa 06 do Plano Diretor. ",
        "hasImagem": true,
        "imagens": ["assets/mapa06.jpg"],
        "nome_imagem": ["Mapa 06"]
      },
      5: {
        "titulo": "06 - O empreendimento se encontra em uma Zona de Outorga?",
        "type": "selecionar",
        "options": ["Sim", "Não"],
        "callback": (value) {
          widget.respostas[widget.actual_page] = value;
        },
        "texto_apoio":
            "As Zonas de Outorga são as áreas delimitadas pelo Mapa 05 do Plano Diretor e as áreas correspondentes aos Setores Consolidados, delimitados pelo Mapa 03 (exceto no Núcleo Marabá Pioneira e fora do Distrito Sede Municipal).",
        "hasImagem": true,
        // TODO alterar o mapa
        "imagens": ["assets/mapa02.jpg", "assets/mapa05.jpg"],
        "nome_imagem": ["Mapa 03", "Mapa 05"]
      },
      6: {
        "titulo": "07 - Classificação do Uso do Solo:",
        "type": "selecionar",
        "options": [
          "Residencial Unifamiliar",
          "Residencial Multifamiliar",
          "Comercial",
          "Institucional",
          "Prestação de serviços",
          "Industrial",
          "Misto",
          "Rural",
        ],
        "callback": (value) {
          widget.respostas[widget.actual_page] = value;
        },
        "texto_apoio":
            "O uso residencial é destinado somente à moradia. O uso não-residencial envolve as atividades de produção industrial, comércio em geral, prestação de serviços, atividades institucionais, atividades agrícolas e pecuárias. O uso misto é quando na mesma edificação existe o uso residencial e não-residencial.",
        "hasImagem": false,
        "imagens": [],
        "nome_imagem": []
      },
      7: {
        "titulo": "08 - Atividades que se pretendem instalar:",
        "type": "escrever",
        "callback": (value) {
          widget.respostas[widget.actual_page] = value;
        },
        "on_submitted": onSubmitted,
        "texto_apoio":
            "Elenque as atividades residenciais, não-residenciais ou mistas que se pretende instalar no empreendimento. Por exemplo: venda por atacado/varejo; produção de ferro-gusa; serviços de hotelaria; revenda de combustíveis; Estação de Rádio Base; transportadora; galpão de armazenamento; etc.",
        "hasImagem": false,
        "imagens": [],
        "nome_imagem": []
      },
      8: {
        "titulo": "09 - Grau de Incomodidade:",
        "type": "selecionar",
        "options": [
          "Grau 1 - Baixíssimo",
          "Grau 2 - Baixo",
          "Grau 3 - Médio",
          "Grau 4 - Alto",
          "Grau 5 - Altíssimo",
        ],
        "callback": (value) {
          widget.respostas[widget.actual_page] = value;
        },
        "texto_apoio":
            "É um parâmetro que indica a capacidade de uma atividade de gerar incômodos relacionados à poluição ambiental e que estabelece a localização que tal atividade pode ser instalada. Os Graus de Incomodidade vão de 1 a 5, sendo:\n\nGrau 1 – Baixíssimo: A sua capacidade de gerar incômodos, poluição e nocividade a população, fauna e flora é consideravelmente baixíssima, podendo localizar-se na macrozona estritamente residencial urbana, ou de hospitais ou de escolas;\n\nGrau 2 – Baixo: A sua capacidade de gerar incômodos, poluição e nocividade a população, fauna e flora é consideravelmente baixa, podendo localizar-se na macrozona em área mista, predominantemente residencial;\n\nGrau 3 – Médio: A sua capacidade de gerar incômodos, poluição e nocividade a população, fauna e flora é consideravelmente média, devendo assim instalar-se nos principais corredores de tráfego da zona urbana, respeitando assim as legislações e normas municipais, estaduais e federais;\n\nGrau 4 – Alto: A sua capacidade de gerar incômodos, poluição e nocividade a população, fauna e flora é consideravelmente alta, devendo assim instalar-se nas Zonas de Expansão da Cidade Nova, Zona de Expansão da Nova Marabá e Zonas Especiais Industriais, respeitando assim as legislações e normas municipais, estaduais e federais;\n\nGrau 5 – Altíssimo: A sua capacidade de gerar incômodos, poluição e nocividade a população, fauna e flora é consideravelmente alta, devendo assim instalar-se nas Zonas Especiais Industriais e Zona Rural, respeitando assim as legislações e normas municipais, estaduais e federais.",
        "hasImagem": false,
        "imagens": [],
        "nome_imagem": []
      },
      9: {
        "titulo":
            "10 - Classificação das atividades quanto aos Usos Geradores de Interferência no Tráfego:",
        "type": "selecionar",
        "options": [
          "Geradoras de carga e descarga",
          "Geradoras de embarque e desembarque",
          "Geradoras de tráfego de pedestres",
          "Geradoras de viagens",
          "Nenhuma das anteriores ",
        ],
        "callback": (value) {
          widget.respostas[widget.actual_page] = value;
        },
        "texto_apoio":
            "Para qualquer dessas atividades, o empreendimento é considerado como Uso Gerador de Interferência no Tráfego.",
        "hasImagem": false,
        "imagens": [],
        "nome_imagem": []
      },
    };
  }
}
