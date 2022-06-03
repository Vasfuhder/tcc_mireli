import 'package:flutter/material.dart';
import 'package:tcc_mireli/analise.dart';
import 'package:tcc_mireli/screens/tela01.dart';
import 'package:tcc_mireli/utils/hexcolor.dart';

class Tela03 extends StatelessWidget {
  Map data;

  Tela03({Key? key, required this.data}) : super(key: key);

  final lorem =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  @override
  Widget build(BuildContext context) {
    resultado(data);
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
                    "A partir das respostas inseridas nesta verificação prévia, o empreendimento se mostrou adequado ao Plano Diretor de Marabá. Solicite as Diretrizes Urbanísticas junto ao Conselho Gestor do Plano Diretor para que seja feita a verificação completa.",
                color: HexColor("#686868"),
                fontSize: 24,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 84),
              questaoGenerica(
                  "O nome de identificação do empreendimento é:", data[0]),
              questaoGenerica(
                  "A localização do empreendimento é:",
                  data["option1"] != ""
                      ? "${data[2]}: ${data["option1"]}"
                      : data[2]),
              questaoGenerica(
                  "O Setor de Uso da localização do empreendimento é:",
                  data[3]),
              questaoGenerica(
                "A Zona de Uso da localização do empreendimento é:",
                resultadoZona(data[4]),
              ),
              questaoGenerica(
                  "A classificação do uso do solo do empreendimento é:",
                  resultadoUso(data[4], data[6], data[2])),
              questaoGenerica(
                  "As atividades que se pretende instalar no empreendimento são:",
                  data[7]),
              questaoGenerica(
                  "A classificação do empreendimento quanto aos Usos Geradores de Interferência no Tráfego é:",
                  data[9]),
              questaoGenerica(
                  "A classificação do empreendimento quanto aos Usos Geradores de Impacto de Vizinhança é:",
                  data["option2"] != ""
                      ? "${data[10]} ${data["option2"]}"
                      : data[10]),
              const SizedBox(height: 52),
              Align(
                alignment: Alignment.centerLeft,
                child: Texto(
                  text:
                      "Os resultados da verificação dos parâmetros urbanísticos do empreendimento foram:",
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
              const SizedBox(height: 42),
              Align(
                alignment: Alignment.centerLeft,
                child: Texto(
                  text:
                      "O grau de incomodidade do seu empreendimento é ${data[8].substring(5, 6)}, os requisitos que você deve cumprir são:",
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
                children: [
                  const TableRow(
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
                        text: "Poluição sonora",
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
                        text: "Geração de resíduos",
                        fontWeight: FontWeight.bold,
                      ),
                      Celula(
                        text: "Vibração",
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Celula(
                        text: getGrauIncomodidade(data[8]),
                        fontWeight: FontWeight.normal,
                      ),
                      Celula(
                        text: getLocalizacao(data[8]),
                        fontWeight: FontWeight.normal,
                      ),
                      Celula(
                        text: getPoluicaoSonora(data[8]),
                        fontWeight: FontWeight.normal,
                      ),
                      Celula(
                        text: getPoluicaoAtmosferica(data[8]),
                        fontWeight: FontWeight.normal,
                      ),
                      Celula(
                        text: getPoluicaoHidrica(data[8]),
                        fontWeight: FontWeight.normal,
                      ),
                      Celula(
                        text: getGeracaoDeResiduos(data[8]),
                        fontWeight: FontWeight.normal,
                      ),
                      Celula(
                        text: getVibracao(data[8]),
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 52),
              Texto(
                text: "Observações:",
                color: HexColor("#7C7C7C"),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Texto(
                  text:
                      "O Plano Diretor Participativo de Marabá proíbe o parcelamento do solo em cinco situações. Será permitido o parcelamento se a área pretendida para se instalar o empreendimento não apresentar os seguintes casos:",
                  color: HexColor("#B8B8B8"),
                  fontSize: 18,
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 32),
              WContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texto(
                      text:
                          "I - Em terrenos alagadiços e sujeitos a inundações, antes de tomadas as providencias para assegurar o escoamento das águas;",
                      color: HexColor("#9C9A9A"),
                      fontSize: 18,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    Texto(
                      text:
                          "II - Em terrenos que tenham sido aterrados com material nocivo a saúde pública, sem que sejam previamente saneados;",
                      color: HexColor("#9C9A9A"),
                      fontSize: 18,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    Texto(
                      text:
                          "III - Em terrenos com declividade igual ou superior a 30% (trinta por cento), salvos se atendidas as exigências específicas das autoridades competentes;",
                      color: HexColor("#9C9A9A"),
                      fontSize: 18,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    Texto(
                      text:
                          "IV - Em terrenos onde as condições geológicas não aconselhem a edificação;",
                      color: HexColor("#9C9A9A"),
                      fontSize: 18,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    Texto(
                      text:
                          "V - Em áreas de preservação ecológica ou naquelas onde a poluição impeça condições sanitárias suportáveis, até a sua correção.",
                      color: HexColor("#9C9A9A"),
                      fontSize: 18,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Texto(
                  text:
                      "Os empreendimentos enquadrados como Usos Geradores de Interferência no Tráfego deverão apresentar a previsão de vagas de estacionamento em conformidade com a Lei Municipal Nº 17.873/2018, bem como as medidas de mitigação dos impactos através do Estudo Prévio de Impacto de Vizinhança e do Estudo de Interferência de Tráfego.",
                  color: HexColor("#9C9A9A"),
                  textAlign: TextAlign.justify,
                  fontSize: 18,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Texto(
                  text:
                      "Os empreendimentos enquadrados como Usos Geradores de Impacto à Vizinhança só terão seu licenciamento junto ao Poder Público Municipal após serem aprovados pelo Conselho Gestor do Plano Diretor (CGPD).",
                  color: HexColor("#9C9A9A"),
                  textAlign: TextAlign.justify,
                  fontSize: 18,
                ),
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
        // TODO implementar o download do formulario
        // TODO implementar a troca entre tema claro e escuro
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

  questaoGenerica(titulo, texto) {
    return Column(
      children: [
        const SizedBox(height: 52),
        Align(
          alignment: Alignment.centerLeft,
          child: Texto(
            text: titulo,
            fontSize: 24,
            color: HexColor("#7C7C7C"),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 29),
        WContainer(
          child: Texto(
            text: texto,
            color: HexColor("#B8B8B8"),
            fontSize: 18,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
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
