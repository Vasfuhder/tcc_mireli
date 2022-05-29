import 'package:flutter/material.dart';
import 'package:tcc_mireli/screens/tela2.dart';
import 'package:tcc_mireli/utils/hexcolor.dart';
import 'package:tcc_mireli/widgets/button2.dart';

class InitDialog extends StatelessWidget {
  const InitDialog({Key? key}) : super(key: key);

  final double borderRadius = 10;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Container(
        padding: const EdgeInsets.all(24),
        width: 803,
        height: 600,
        decoration: BoxDecoration(
          color: HexColor("#252525"),
          border: Border.all(
            color: HexColor("#FBFEDC"),
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close_rounded,
                  color: HexColor("#797979"),
                  size: 30,
                ),
              ),
            ),
            Text(
              "Realizar a verificação é simples, basta ter os seguintes dados do empreendimento e responder as questões:",
              style: TextStyle(color: HexColor("#F5FF84"), fontSize: 30),
            ),
            const SizedBox(height: 24),
            texto(
                "Localização da área que se pretende instalar o empreendimento"),
            const SizedBox(height: 16),
            texto("Atividades que se pretende instalar"),
            const SizedBox(height: 16),
            texto("Área total do lote"),
            const SizedBox(height: 16),
            texto("Curvas de nível da área"),
            const SizedBox(height: 16),
            texto("Largura da via de acesso ao lote"),
            const SizedBox(height: 16),
            texto("Coeficiente de Aproveitamento"),
            const SizedBox(height: 16),
            texto("Taxa de Ocupação"),
            const SizedBox(height: 16),
            texto("Taxa de Permeabilidade do Solo"),
            const SizedBox(height: 16),
            texto("Recuos em relação aos limites do lote"),
            const SizedBox(height: 16),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Button2(
                  text: "OK",
                  size: 1.5,
                  callback: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Tela02(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text texto(String text) {
    return Text(
      text,
      style: TextStyle(
        color: HexColor("#ECECEC"),
        fontSize: 18,
      ),
    );
  }
}
