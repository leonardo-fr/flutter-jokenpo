import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var aleatorioMaquina = 0;
  var imagemApp = Image.asset("images/padrao.png", height: 120,);
  var resultado = 'Escolha um opção abaixo';
  var escolhaUser = 'null';

  List auxResultado = [
    "Você perdeu! :(",
    "Houve um empate! :|",
    "Você venceu! :)"

  ];

  EscolhaDaMaquina(String escolhaUser){
    aleatorioMaquina = Random().nextInt(3);
    if (aleatorioMaquina == 0){
      this.escolhaUser = escolhaUser;
      if (escolhaUser == 'pedra')
        resultado = auxResultado[1];
      else if (escolhaUser == 'papel')
        resultado = auxResultado[2];
      else if(escolhaUser == 'tesoura')
        resultado = auxResultado[0];
       return Image.asset("images/pedra.png", height: 120);
    } else if(aleatorioMaquina == 1){
      if (escolhaUser == 'papel')
        resultado = auxResultado[1];
      else if (escolhaUser == 'pedra')
        resultado = auxResultado[0];
      else if(escolhaUser == 'tesoura')
        resultado = auxResultado[2];
      return Image.asset("images/papel.png", height: 120);
    }else{
      if (escolhaUser == 'papel')
        resultado = auxResultado[0];
      else if (escolhaUser == 'pedra')
        resultado = auxResultado[2];
      else if(escolhaUser == 'tesoura')
        resultado = auxResultado[1];
      return Image.asset("images/tesoura.png", height: 120);
    }
  }

  void alteraMaquina(){
    setState(() {
      resultado;

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          //text
          //imagem
          //text resultado
          //linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          GestureDetector(
            child: imagemApp,
            onTap: (){

            },
          ),

          Padding(
            padding: EdgeInsets.only( bottom: 16),
            child: Text(
              resultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Image.asset("images/pedra.png",height: 100),
                onTap: (){
                  imagemApp = EscolhaDaMaquina('pedra');
                  alteraMaquina();
                  print("Leo = Pedra");
                },
              ),
              GestureDetector(
                child: Image.asset("images/papel.png",height: 100),
                onTap: (){
                  imagemApp = EscolhaDaMaquina('papel');
                  alteraMaquina();
                  print("Leo = Papel");
                },
              ),
              GestureDetector(
                child: Image.asset("images/tesoura.png",height: 100),
                onTap: (){
                  imagemApp = EscolhaDaMaquina('tesoura');
                  alteraMaquina();
                  print("Leo = Tesoura");
                },
              ),
            ],
          )

        ],
      ),
    );
  }
}
