import 'package:examen1p/pages/configuration.dart';
import 'package:examen1p/pages/notifications.dart';
import 'package:examen1p/pages/recents.dart';
import 'package:examen1p/widgets/textifled_widget.dart';
import 'package:flutter/material.dart';
import 'package:examen1p/shared/responsive.dart';
import 'package:examen1p/services/api_service.dart';

class Principal extends StatefulWidget {
  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  ApiService lugarService = ApiService();
  var busqueda = "Luis Miguel";
  bool cargando = true;

  final TextEditingController _controllerBuscador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 30, 29, 29),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Spotify_logo_without_text.svg/252px-Spotify_logo_without_text.svg.png',
                          fit: BoxFit.cover,
                          height: 40,
                        ),
                      ),
                      const Text(
                        'Spotify',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notificaciones()),
                          );
                        },
                        child: const Icon(Icons.notifications),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Resents()),
                          );
                        },
                        child: const Icon(Icons.access_time),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Configuration()),
                          );
                        },
                        child: const Icon(Icons.settings),
                      ),
                    ]),
                  )
                ],
              )
            ],
          ),
        ),
        body: Column(
          children: [
            TextFieldWidget(
              color: Color.fromARGB(255, 211, 214, 216),
              hintText: 'Buscar',
              isPrefixIcon: true,
              prefixIconData: Icons.search,
              controller: _controllerBuscador,
              onFieldSubmitted: (){
                setState(() {
                busqueda = _controllerBuscador.text;
                  
                });
              },
              isMyControllerActivate: true,
            ),
            Expanded(
              child: ListView(shrinkWrap: true, children: [
                Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height - 20,
                    child: FutureBuilder(
                      future: lugarService.obtenerApi(busqueda),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        print('*********************************************');
                        print('********                       **************');
                        print('********   *****************   **************');
                        print('********   *****************   **************');
                        print('********   *****************   **************');
                        print('********                       **************');
                        print('********   **********************************');
                        print('********   **********************************');
                        print('********   **********************************');
                        print('********   **********************************');
                        print('********   **********************************');
                        print('********   **********************************');
                        print('*********************************************');
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text("Cargando..."),
                          );
                        }

                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          print(
                                              '${snapshot.data[index]['data']['name']}');
                                        },
                                        child: Image.network(snapshot
                                                .data[index]['data']['coverArt']
                                            ['sources'][0]['url']),
                                      )),
                                  Text(
                                    (snapshot.data[index]['data']['name']),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    )),
              ]),
            )
          ],
        ));
  }
}
