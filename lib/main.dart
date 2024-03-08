import 'package:flutter/material.dart';
import 'package:btk_odev/models/student.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String mesaj = "Öğrenci Takip Sistemi";
  List<Student> students = [
    Student("Nihan", "Ertuğ", 88),
    Student("Demir", "Savaş", 36),
    Student("Kerim", "Yılmaz", 41)
  ];

  var ogrenciler = [
    "Nihan Ertuğ",
    "Deniz Mercan",
    "Ayşegül Tatilde",
    "Selim Hayat"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50) {
      mesaj = "Geçti";
    } else if (puan >= 40) {
      mesaj = "Bütünlemeye kaldı";
    } else {
      mesaj = "Kaldı";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2017/08/16/11/39/aurora-borealis-2647474_960_720.jpg"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not : " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      print(students[index].firstName +
                          " " +
                          students[index].lastName);
                    },
                  );
                })),
        Center(
          child: ElevatedButton(
            child: Text("Sonucu Gör!!!!"),
            onPressed: () {
              var mesaj = sinavHesapla(85);
              mesajGoster(context, mesaj);
            },
          ),
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
