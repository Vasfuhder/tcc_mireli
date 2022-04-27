import 'package:flutter/material.dart';
import 'package:tcc_mireli/widgets/button1.dart';
import 'utils/HexColor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        color: HexColor("#252525"),
        child: Stack(
          children: [
            Positioned(
              child: Image.asset(
                'assets/estado.png',
                scale: 1,
                fit: BoxFit.cover,
              ),
              right: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 154, left: 61),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          "Ferramenta de verificação da viabilidade urbanística de um empreendimento.",
                          style: TextStyle(
                            fontSize: 38,
                            color: HexColor("#F5FF84"),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Este site foi criado a partir de um Trabalho de Conclusão de Curso para que qualquer pessoa possa realizar uma verificação prévia da viabilidade de se instalar um empreendimento de impacto segundo o Plano Diretor de Marabá.",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(height: 74),
                        Button1("Iniciar questionário", 2)
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  Expanded(child: Container(), flex: 2)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
