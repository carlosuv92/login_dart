import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MyHomePage(title: 'ExpansionTileCard Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ExpansionTileCardState> card1 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card2 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card3 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card4 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card5 = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> card6 = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            expandedTextColor: Color.fromRGBO(255, 199, 0, 1),
            key: card1,
            leading: CircleAvatar(
              child: Text(
                '1',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Color.fromRGBO(255, 199, 0, 1),
            ),
            title: Text(
              'Paso 1',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Evitar multiples aplicaciones.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: "No aplicar por credito ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'cada aplicación '),
                        TextSpan(
                            text:
                                "descuenta cinco puntos (05 ptos.) de su SCORE",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ', aprobada o no.'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            expandedTextColor: Color.fromRGBO(255, 199, 0, 1),
            key: card2,
            leading: CircleAvatar(
              child: Text(
                '2',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Color.fromRGBO(255, 199, 0, 1),
            ),
            title: Text(
              'Paso 2',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Comunicación con el asesor.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(text: 'De recibir cartas de parte de '),
                        TextSpan(
                            text: "COLECCIONES ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                ' debe enviarlas al número de su asesor personalizado para que la información sea verificada.'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            expandedTextColor: Color.fromRGBO(255, 199, 0, 1),
            key: card3,
            leading: CircleAvatar(
              child: Text(
                '3',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Color.fromRGBO(255, 199, 0, 1),
            ),
            title: Text(
              'Paso 3',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Evitar conversaciones.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(text: 'Evite contestar llamadas de '),
                        TextSpan(
                            text: "COLECCIONES. ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'NO Brindar ninguna información personal, ni mucho menos admitir deudas.'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            expandedTextColor: Color.fromRGBO(255, 199, 0, 1),
            key: card4,
            leading: CircleAvatar(
              child: Text(
                '4',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Color.fromRGBO(255, 199, 0, 1),
            ),
            title: Text(
              'Paso 4',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Balance de tarjeta.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(text: 'Mantener un balance del'),
                        TextSpan(
                            text: "30% ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'de deuda en sus tarjetas en base a la línea de crédito.'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            expandedTextColor: Color.fromRGBO(255, 199, 0, 1),
            key: card5,
            leading: CircleAvatar(
              child: Text(
                '5',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Color.fromRGBO(255, 199, 0, 1),
            ),
            title: Text(
              'Paso 5',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Inconvenientes.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'De prestar algun inconveniente personal que impida continuar con el proceso,'),
                        TextSpan(
                            text: "indicarlo a su asesor ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'para que se mantenga informado y se conversen soluciones.\nRecuerde que la comunicacion es vital para obtener resultados satisfactorios.'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            expandedTextColor: Color.fromRGBO(255, 199, 0, 1),
            key: card6,
            leading: CircleAvatar(
              child: Text(
                '6',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Color.fromRGBO(255, 199, 0, 1),
            ),
            title: Text(
              'Paso 6',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Cumplimiento de pagos.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                'Cumplir puntualmente con sus pagos, ya que cada pago tarde descuenta entre '),
                        TextSpan(
                            text: "30 - 40 ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'puntos de su SCORE y eso no solo le afecta a usted, sino que puede perjudicar el trabajo que se esta realizando '),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
