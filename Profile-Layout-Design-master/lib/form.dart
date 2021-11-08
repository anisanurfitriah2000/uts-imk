import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final sekolahController = TextEditingController();
  final agamaController = TextEditingController();
  final statusController = TextEditingController();
  final emailController = TextEditingController();
  
  
  
 // sendSimpleProfile(nama, alamat, email, sekolah, agama, status) async {
  sendSimpleProfile() async {
    print("v23 konselor status  = " +
        namaController.text +
        "=>" +
        alamatController.text.toString() +
        "=>" +
        sekolahController.text.toString() +
        "=>" +
        agamaController.text.toString() +
        "=>" +
        statusController.text.toString()
        );

    final response = await http.post(
        Uri.parse('http://10.0.2.2/' + "/profile/setProfile.php?alamat="+alamatController.text.toString()),
        body: <String, String>{
          'nama': namaController.text.toString(),
          'alamat': alamatController.text.toString(),
          'sekolah': sekolahController.text.toString(),
          'agama': agamaController.text.toString(),
          'status': statusController.text.toString(),
          'email':emailController.text.toString()

        });

        print("res = " + response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulir"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              // TextField(),
              TextFormField(
                controller: namaController,
                decoration: new InputDecoration(
                  hintText: "contoh: nafisya kayla",
                  labelText: "Nama Lengkap",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: new InputDecoration(
                  hintText: "contoh: nafisya@kayla.com",
                  labelText: "Nama Email",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: alamatController,
                decoration: new InputDecoration(
                  hintText: "contoh: Bantul Jogja",
                  labelText: "Alamat",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
               SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: sekolahController,
                decoration: new InputDecoration(
                  hintText: "contoh: stitek",
                  labelText: "sekolah",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'sekolah tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: agamaController,
                decoration: new InputDecoration(
                  hintText: "contoh: islam",
                  labelText: "agama",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'agama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: statusController,
                decoration: new InputDecoration(
                  hintText: "contoh: belum menikah",
                  labelText: "status",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'status tidak boleh kosong';
                  }
                  return null;
                },
              ),

              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    sendSimpleProfile();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
