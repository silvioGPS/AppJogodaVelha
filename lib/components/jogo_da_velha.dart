import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:jogo_da_velha/components/control_JogoVelha.dart';
import 'control.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageJogo extends StatefulWidget {
  const HomePageJogo({super.key, required this.title});

  final String title;

  @override
  State<HomePageJogo> createState() => _HomeJogoState();
}

class _HomeJogoState extends State<HomePageJogo> {
  var roxoLabel = Colors
      .deepPurple; // variavel criada para mudar as cores de fundo do label no menu

  //Função criada para abrir a URL do Repositório.
  void openURL() async {
    final Uri url = Uri.parse("https://github.com/silvioGPS/AppJogodaVelha");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }

  void openUrlYT() async {
    final Uri url = Uri.parse("https://youtu.be/8reoHDXUHxk");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }

  void openZap() async {
    final Uri url = Uri.parse("https://web.whatsapp.com/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }

  ThemeData temaClaro = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white, brightness: Brightness.light),
    appBarTheme: const AppBarTheme(color: Colors.deepPurple),
    useMaterial3: true,
  );

  ThemeData temaEscuro = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white, brightness: Brightness.dark),
    appBarTheme: const AppBarTheme(color: Colors.indigo),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Control.instance.mudaTema ? temaClaro : temaEscuro,
      home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => {
                  setState(() {
                    Control.instance.MudaTema();
                  }),
                },
                icon: Icon(Control.instance.mudaTema
                    ? Icons.dark_mode
                    : Icons.light_mode),
                color: Colors.white,
              ),
            ],
            title: Text(
              'Jogo da Velha',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Container()),
                Expanded(
                    flex: 9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.purple,
                                    width: 2,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 10,
                                      offset: Offset(5, 5),
                                    )
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: ControlJogovelha(),
                              )),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    )),
                Expanded(flex: 3, child: Container()),
              ],
            ),
          ),
          floatingActionButton: SpeedDial(
            childMargin: EdgeInsets.all(5),
            elevation: 15.0,
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: Colors.deepPurple,
            overlayColor: Colors.grey,
            overlayOpacity: 0.6,
            foregroundColor: Colors.white,
            children: [
              SpeedDialChild(
                child: ImageIcon(
                  AssetImage('assets/zap.png'),
                  size: 30,
                ),
                label: 'Abrir WhatsApp',
                labelBackgroundColor: roxoLabel,
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                backgroundColor: roxoLabel,
                onTap: () => {
                  setState(() {
                    openZap();
                  }),
                },
                foregroundColor: Colors.white,
              ),
              SpeedDialChild(
                child: ImageIcon(
                  AssetImage('assets/youtube.png'),
                  size: 30,
                ),
                label: 'Vídeo do projeto no Youtube',
                labelBackgroundColor: roxoLabel,
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                backgroundColor: roxoLabel,
                onTap: () => {
                  setState(() {
                    openUrlYT();
                  }),
                },
                foregroundColor: Colors.white,
              ),
              SpeedDialChild(
                  child: ImageIcon(
                    AssetImage('assets/gthub.png'),
                    size: 30,
                  ),
                  label: 'Visualizar projeto no GitHub',
                  labelBackgroundColor: roxoLabel,
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  onTap: () => {
                        setState(() {
                          openURL();
                        }),
                      }),
            ],
          ) // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
