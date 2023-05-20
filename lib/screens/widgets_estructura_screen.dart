import 'package:flutter/material.dart';

class WidgetsEstructuraScreen extends StatelessWidget {
  const WidgetsEstructuraScreen({super.key});

  static String route = '/widgets_estructura';

  @override
  Widget build(BuildContext context) {
    bool _disable = true;

    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets de Estructura'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimerRow(),
          SegundoRow(),
          TercerRow(),
          Center(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.cyan,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Hola',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {print("me dio click")},
                    child: Text('Button'),
                  ),
                  ElevatedButton(
                    onPressed: _disable ? null : () => {print('Click boton 2')},
                    child: Text('Button2'),
                  ),
                  /*
                    if(_disable == true){
                      return null;
                    }else{
                      return ()=>{}
                    }
                  */
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Hola Mario'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                color: Colors.redAccent,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Hola Mario'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                color: Colors.deepOrange,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
                  child: Text('Hola Fernanda'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                color: Colors.deepPurple,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 80, right: 100, top: 10, bottom: 20),
                  child: Text('Hola Maria'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TercerRow extends StatelessWidget {
  const TercerRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
          child: Icon(
            Icons.add,
            size: 50,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class SegundoRow extends StatelessWidget {
  const SegundoRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.green,
            boxShadow: [
              BoxShadow(
                spreadRadius: 0.1, blurRadius: 5, offset: Offset(2, 2),
                //color: Colors.black45
              ),
            ],
          ),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.purple,
          child: Text('Data'),
        )
      ],
    );
  }
}

class PrimerRow extends StatelessWidget {
  const PrimerRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.brown,
        )
      ],
    );
  }
}
