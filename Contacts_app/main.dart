import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var total = 3;
  List<Contact> name = [];
  var likes = [0,0,0];

  void addPerson(){
    setState(() {});
  }


  getPermission() async{
    var status = await Permission.contacts.status;
    if(status.isGranted){
      print("granted!");
      var contacts = await ContactsService.getContacts();
      //print(contacts[0].familyName);

      setState(() {
        name = contacts;
      });

    }
    else if(status.isDenied){
      print("denied!");
      Permission.contacts.request();
      openAppSettings();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text("버튼"),
          onPressed: (){
            showDialog(context: context, builder: (context){
              return DialogUI(addPerson: addPerson);
            });
          }
        ),
        appBar: AppBar(
          title: Text("$total"),
          actions: [
            IconButton(onPressed: getPermission, icon: Icon(Icons.camera_alt),),
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context,i){
            return ListTile(
              leading: Image.asset("assets/pepe.png"),
              title: Text(name[i].givenName ?? "이름없어요"),
              trailing: IconButton(
                onPressed: (){
                  setState(() {
                    name.removeAt(i);
                  });
                },
                icon: Icon(Icons.remove_circle_outline),
              ),
            );
          },
          itemCount: name.length,
        ),
      );
  }
}



class DialogUI extends StatelessWidget {
  DialogUI({
    super.key,
    this.addPerson,
  });

  var addPerson;

  var inputData = TextEditingController();

  var a = Contact();


  @override
  Widget build(BuildContext context) {
    return Dialog(child: Container(
      height: 300,
      width: 350,
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact", style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 50,),
          TextField(
            controller: inputData,
            style: TextStyle(fontSize: 20),
          ),
          Container(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancle")),
                TextButton(onPressed: (){
                  if(inputData.text=="") Navigator.pop(context);
                  else{
                    a.givenName = inputData.text;
                    ContactsService.addContact(a);
                    addPerson();
                    Navigator.pop(context);
                  }
                },
                    child: Text("OK")),
              ],
            ),
          )
        ],
      ),
    ));
  }
}


