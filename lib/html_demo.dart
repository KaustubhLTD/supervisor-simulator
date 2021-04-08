import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/image_render.dart';
import 'package:flutter_html/style.dart';

class HTMLDEMO extends StatefulWidget {
  @override
  _HTMLDEMOState createState() => _HTMLDEMOState();
}


const htmlData = 

"""
 <h1>Table support:</h1>
    <table>
    <colgroup>
    <col width="50%" />
    <col span="2" width="25%" />
    </colgroup>
    <thead>
    <tr><th>One</th><th>Two</th><th>Three</th></tr>
    </thead>
    <tbody>
    <tr>
    <td rowspan='2'>Rowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan\nRowspan</td><td>Data</td><td>Data</td>
    </tr>
    <tr>
    <td colspan="2"><img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /></td>
    </tr>
    </tbody>
    <tfoot>
    <tr><td>fData</td><td>fData</td><td>fData</td></tr>
    </tfoot>
    </table>


""";


class _HTMLDEMOState extends State<HTMLDEMO> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('flutter_html Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Html(
          data: htmlData,

         style: {
    // tables will have the below background color
    "table": Style(
      backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
    ),
    // some other granular customizations are also possible
    "tr": Style(
      border: Border(bottom: BorderSide(color: Colors.grey)),
    ),
    "th": Style(
      padding: EdgeInsets.all(6),
      backgroundColor: Colors.grey,
    ),
    "td": Style(
      padding: EdgeInsets.all(6),
      alignment: Alignment.topLeft,
    ),
    // text that renders h1 elements will be red
    "h1": Style(color: Colors.red),
  }
          //Optional parameters:
         
        ),
      ),
    );
  }
}