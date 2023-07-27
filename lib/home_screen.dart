
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_filex/open_filex.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

      Future <void>createPDF()async{
        final pdf = pw.Document();
         print("------------------------>>>1");
        pdf.addPage(
     pw.Page(
      build: (pw.Context context)=>pw.Center(
      child: pw.Text('hello '))
        )
        );


        Directory root = await getTemporaryDirectory(); 
        final file= File(root.path + '/example.pdf');
        await file.writeAsBytes(await pdf.save());
        print("------------------------>>>");
        print(file.path);

        OpenFilex.open(file.path);


      }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
             Colors.red,
          Colors.blue,
          
         
        ]),
      ),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:ElevatedButton(
              onPressed: (){
              createPDF();
            }, 
            child: Row(
               children: [
                Text('Upload File'),
                Icon(Icons.file_copy)
               ],
            ))
            ,
          )
        ],
      ),
    ),
      ),
    );
  }
}