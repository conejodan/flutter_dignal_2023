import 'package:flutter/material.dart';

class FormulariosScreen extends StatelessWidget {
  const FormulariosScreen({super.key});

  static String route = "formulario";

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey<FormState>();

    String nombre = '';

    void enviarFormulario() {
      print('Enviando formulario');
      if (_key.currentState!.validate()) {
        print('Formulario Valido');
        _key.currentState!.save();
        print("Nombre de la persona $nombre");
      } else {
        print('Formulario No Valido');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            elevation: 10,
            duration: const Duration(milliseconds: 4000),
            behavior: SnackBarBehavior.floating,
            content: const Text('Formulario no Valido!'),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      //label: Text('Nombre'),
                      icon: Icon(Icons.person),
                      labelText: 'Nombre',
                      hintText: 'Coloca tu nombre'),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Debes de colocar tu nombre';
                    }
                  },
                  onSaved: (newValue) {
                    print("Nombre: $newValue");
                    nombre = newValue!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    //label: Text('Nombre'),
                    icon: Icon(Icons.person),
                    labelText: 'Edad',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    print('Numero: $value');
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    //label: Text('Nombre'),
                    icon: Icon(Icons.phone),
                    labelText: 'Telefono',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    //label: Text('Nombre'),
                    icon: Icon(Icons.email),
                    labelText: 'Correo',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.percent),
                    labelText: 'Contraseña',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: enviarFormulario,
                    child: Text('Enviar'),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
