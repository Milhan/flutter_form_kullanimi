import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var formKey = GlobalKey<FormState>();
  var txtKullaniciAdi = TextEditingController();
  var txtSifre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Flutter Form Kullanımı")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: txtKullaniciAdi,
                          decoration: InputDecoration(
                            hintText: "Kullanıcı Adı",
                          ),
                          validator: (tfgirdisi) {
                            if (tfgirdisi!.isEmpty) {
                              return "Kullanıcı Adını Giriniz";
                            }
                            return null;
                          }),
                      TextFormField(
                          controller: txtSifre,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Şifre",
                          ),
                          validator: (tfgirdisi) {
                            if (tfgirdisi!.isEmpty) {
                              return "Şifre Giriniz";
                            }
                            if (tfgirdisi.length < 5) {
                              return "Lütfen 5 Karekterden Fazla Giriniz";
                            }
                            return null;
                          }),
                      ElevatedButton.icon(
                          onPressed: () {
                            bool kontolSonucu =
                                formKey.currentState!.validate();
                            if (kontolSonucu == true) {
                              String adi = txtKullaniciAdi.text;
                              String sifre = txtSifre.text;
                              print("Kullanıcı Adı: $adi - Şifre: $sifre");
                            }
                          },
                          icon: Icon(Icons.login),
                          label: Text("GİRİŞ"))
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
