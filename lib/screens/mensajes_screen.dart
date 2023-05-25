import 'package:flutter/material.dart';

class MensajesScreen extends StatelessWidget {
  const MensajesScreen({super.key});

  static String route = "mensajes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensajes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Mensaje de alerta'),
                      content: Text(
                          'Mensaje que nosotros queremos colocar en el alerta'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK')),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cerrar'))
                      ],
                    );
                  },
                );
              },
              child: Text('Alerta'),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    elevation: 10,
                    duration: const Duration(milliseconds: 4000),
                    behavior: SnackBarBehavior.floating,
                    content: const Text('Mostrando mensaje!'),
                    action: SnackBarAction(
                      label: 'Action',
                      onPressed: () {
                        // Code to execute.
                      },
                    ),
                  ),
                );
              },
              child: Text('Snackbar'),
            ),
          ],
        ),
      ),
    );
  }
}
