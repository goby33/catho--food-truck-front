import 'package:catho_app_food_truck/client/entity/session_Object.dart';
import 'package:catho_app_food_truck/client/repository/sessionRepository.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() {
    return _LoginState();
  }
}

final _channel = WebSocketChannel.connect(
  Uri.parse('wss://echo.websocket.org'),
);

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loader = false;
  bool erreur = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Connexion"),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            'images/logo_2.png',
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.only(
                              top: 70, bottom: 0, left: 20, right: 20),
                          child: TextField(
                            autofocus: true,
                            controller: nameController,
                            style: TextStyle(
                                fontSize: 22.0, color: Color(0xFFbdc6cf)),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'User Name',
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.all(20),
                          child: TextField(
                            obscureText: true,
                            autofocus: false,
                            controller: passwordController,
                            style: TextStyle(
                                fontSize: 22.0, color: Color(0xFFbdc6cf)),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 370,
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                            ),
                            child: const Text('Login'),
                            onPressed: () {
                              //TODO
                              print("connect");
                              setState(() {
                                loader = true;
                                erreur = false;
                              });
                              fetchConnexion(nameController.text,
                                      passwordController.text)
                                  .then((value) => {
                                        setState(() {
                                          loader = false;
                                        }),
                                        if (value)
                                          {
                                            Navigator.pushNamed(context, "/dashboard"),
                                          }
                                        else
                                          {erreur = true}
                                      });
                            },
                          ),
                        ),
                        if (erreur)
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Erreur password',
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 20),
                            ),
                          ),
                        if (loader)
                          SizedBox(
                            child: CircularProgressIndicator(
                              color: Colors.greenAccent,
                            ),
                            height: 100.0,
                            width: 100.0,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
