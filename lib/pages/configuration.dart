import 'package:examen1p/widgets/button_widget.dart';
import 'package:examen1p/widgets/textifled_widget.dart';
import 'package:flutter/material.dart';
import 'package:examen1p/shared/responsive.dart';
import 'package:examen1p/utilities/global.dart';

class Configuration extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerUsuario = TextEditingController();
  final TextEditingController _controllerCorreo = TextEditingController();
  final TextEditingController _controllerContrasenia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 29, 29),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Configuración"),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, left: 8.0, right: 8.0, bottom: 5.0),
              child: TextFieldWidget(
                color: Color.fromARGB(255, 211, 214, 216),
                hintText: 'Nombre*',
                controller: _controllerName,
                isMyControllerActivate: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, left: 8.0, right: 8.0, bottom: 5.0),
              child: TextFieldWidget(
                color: Color.fromARGB(255, 211, 214, 216),
                hintText: 'Usuario*',
                controller: _controllerUsuario,
                isMyControllerActivate: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, left: 8.0, right: 8.0, bottom: 5.0),
              child: TextFieldWidget(
                color: Color.fromARGB(255, 211, 214, 216),
                hintText: 'Correo*',
                controller: _controllerCorreo,
                isMyControllerActivate: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, left: 8.0, right: 8.0, bottom: 5.0),
              child: TextFieldWidget(
                color: Color.fromARGB(255, 211, 214, 216),
                hintText: 'Contraseña*',
                controller: _controllerContrasenia,
                isMyControllerActivate: true,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 200.0, left: 8.0, right: 8.0, bottom: 5.0),
                child: ButtonWidget(
                  height: 50.0,
                  title: 'Guardar',
                  otherColor: true,
                  hasColor: false,
                  colorButton: Color.fromARGB(255, 54, 229, 86),
                  fontSize: 10.0,
                   onPressed: () {
                          if (_controllerName.text.isEmpty || _controllerUsuario.text.isEmpty || _controllerCorreo.text.isEmpty || _controllerContrasenia.text.isEmpty ) {
                            Global.mensaje(context, 'ERROR', 'Ingesa todos los datos');
                            return;
                          } else {
                            Global.mensaje(context, '${_controllerName.text}, ${_controllerUsuario.text}, ${_controllerCorreo.text}, ${_controllerContrasenia.text}', 'Registrado con éxito',backgroundColorCustom: Colors.green);
                            print('${_controllerName.text}, ${_controllerUsuario.text}, ${_controllerCorreo.text}, ${_controllerContrasenia.text}');
                          }
                        },
                )),
          ],
        )),
      ),
    );
  }
}
