import 'package:flutter/material.dart';
import 'CampoTexto.dart';
import 'EntradaRatioButton.dart';
import 'EntradaSwitch.dart';
import 'login_page.dart';


void main() {
  runApp(MaterialApp(home: TelaCadastro(), debugShowCheckedModeBanner: false));
}

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create an account"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(leading: Icon(Icons.person), title: Text('Profile')),
            ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CampoTexto(
              label: "Nome",
              keyboard: TextInputType.text,
              maxLength: 20,
            ),
            CampoTexto(
              label: "Data de nascimento",
              keyboard: TextInputType.datetime,
              maxLength: 10,
            ),
            CampoTexto(label: "E-mail", keyboard: TextInputType.emailAddress),
            CampoTexto(
              label: "Senha",
              keyboard: TextInputType.text,
              isPassword: true,
              maxLength: 20,
            ),
            SizedBox(height: 10),
            EntradaRadioButton(),
            SizedBox(height: 10),
            EntradaSwitch(),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text("Register"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onPressed: () {
                print("Cadastro concluído!");
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => TelaCadastro()),
            );
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
        ],
      ),
    );
  }
}
