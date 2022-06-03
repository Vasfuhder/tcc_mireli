bool resultado(Map data) {
  return true;
}

String resultadoZona(String entrada) {
  if (entrada == "Zona Especial de Interesse Ambiental" ||
      entrada == "Zona de Segurança do Aeroporto") {
    return "$entrada, não sendo permitida a localização";
  }
  return "$entrada, sendo permitida a localização";
}

String resultadoUso(String zona, String uso, String localizacao) {
  if (zona == "Zona Especial Industrial" &&
      (uso == "Residencial Unifamiliar" ||
          uso == "Residencial Multifamiliar" ||
          uso == "Misto")) {
    return "$uso, não sendo permitido o uso do solo na localização.";
  }

  if (uso == "Industrial" && zona != "Zona Especial Industrial") {
    return "$uso, não sendo permitido o uso do solo na localização.";
  }

  if (uso == "Rural" && localizacao != "Zona Rural, fora de uma Vila Sede") {
    return "$uso, não sendo permitido o uso do solo na localização.";
  }

  return "$uso, sendo permitido o uso do solo na localização.";
}

String getGrauIncomodidade(String entrada) {
  if (entrada == "Grau 1 - Baixíssimo") return "1";
  if (entrada == "Grau 2 - Baixo") return "2";
  if (entrada == "Grau 3 - Médio") return "3";
  if (entrada == "Grau 4 - Alto") return "4";
  if (entrada == "Grau 5 - Altíssimo") return "5";
  return "";
}

String getLocalizacao(String entrada) {
  if (entrada == "Grau 1 - Baixíssimo") return "Zona Urbana e Zona Rural";
  if (entrada == "Grau 2 - Baixo") {
    return "Zona Urbana e Zona Rural, exceto perto de hospitais e escolas";
  }
  if (entrada == "Grau 3 - Médio") {
    return "Principais corredores de tráfego (Avenidas e Vias Principais)";
  }
  if (entrada == "Grau 4 - Alto") {
    return "Zona de Expansão da Nova Marabá, Zona de Expansão da Cidade Nova e Zonas Especiais Industriais";
  }
  if (entrada == "Grau 5 - Altíssimo") {
    return "Zonas Especiais Industriais e Zona Rural";
  }
  return "";
}

String getPoluicaoSonora(String entrada) {
  if (entrada == "Grau 1 - Baixíssimo") return "Diurna 50 dB\nNoturna 45 dB";
  if (entrada == "Grau 2 - Baixo") return "Diurna 55 dB\nNoturna 50 dB";
  if (entrada == "Grau 3 - Médio") return "Diurna 60 dB\nNoturna 55 dB";
  if (entrada == "Grau 4 - Alto") return "Diurna 65 dB\nNoturna 60 dB";
  if (entrada == "Grau 5 - Altíssimo") return "70 dB";
  return "";
}

String getPoluicaoAtmosferica(String entrada) {
  if (entrada == "Grau 1 - Baixíssimo") return "Emissão de fumaça";
  if (entrada == "Grau 2 - Baixo") return "Emissão de fumaça";
  if (entrada == "Grau 3 - Médio") {
    return "Emissão de substâncias odoríferas e de fumaça conforme legislação ambiental";
  }
  if (entrada == "Grau 4 - Alto") {
    return "Emissão de substâncias odoríferas e de fumaça conforme legislação ambiental";
  }
  if (entrada == "Grau 5 - Altíssimo") {
    return "Emissão de substâncias odoríferas e de fumaça conforme legislação ambiental";
  }
  return "";
}

String getPoluicaoHidrica(String entrada) {
  if (entrada == "Grau 1 - Baixíssimo") return "Inócuo";
  if (entrada == "Grau 2 - Baixo") return "Inócuo";
  if (entrada == "Grau 3 - Médio") return "Conforme legislação ambiental";
  if (entrada == "Grau 4 - Alto") return "Conforme legislação ambiental";
  if (entrada == "Grau 5 - Altíssimo") return "Conforme legislação ambiental";
  return "";
}

String getGeracaoDeResiduos(String entrada) {
  if (entrada == "Grau 1 - Baixíssimo") return "Classe III";
  if (entrada == "Grau 2 - Baixo") return "Classe III";
  if (entrada == "Grau 3 - Médio") return "Classes II e III";
  if (entrada == "Grau 4 - Alto") return "Classes I e II";
  if (entrada == "Grau 5 - Altíssimo") return "Classe I";
  return "";
}

String getVibracao(String entrada) {
  if (entrada == "Grau 1 - Baixíssimo") return "Não produz";
  if (entrada == "Grau 2 - Baixo") return "Resolve dentro do lote";
  if (entrada == "Grau 3 - Médio") return "Resolve dentro do lote";
  if (entrada == "Grau 4 - Alto") return "Conforme legislação";
  if (entrada == "Grau 5 - Altíssimo") return "Conforme legislação";
  return "";
}
