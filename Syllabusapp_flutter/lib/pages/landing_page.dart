import 'package:flutter/material.dart';
import 'package:info_app/branches/cse';
import 'package:info_app/branches/ece';
import 'package:info_app/branches/chem';
import 'package:info_app/branches/mech';
import 'package:info_app/branches/cvl';
import 'package:info_app/branches/mme';
import 'package:info_app/sidebar/goto.dart';
import 'dart:async';
import 'dart:io';

//Screen1 : page which shows up and dissappear in 3 seconds
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  @override
  void navigationToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Welcome()),
    );
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 3);                 //time to dissappear : 3seconds
    return new Timer(_duration, navigationToNextPage);        //after 3 seconds it navigate to main page
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }
  @override
  Widget build(BuildContext context) {                   //components of splash screen
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.brown),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.account_balance,                 //building icon in splash screen
                          color: Colors.brown,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'RGUKT BASAR',
                        style: TextStyle(
                            color: Colors.white,                      //text
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      'Loading...',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
class Welcome extends StatefulWidget {
  @override
  WelcomeState createState() => WelcomeState();
}
class WelcomeState extends State<Welcome> {
  Future<bool> _onBackPressed(){
    return showDialog(context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you Sure?'),
        content: new Text('Do you want to Exit?'),
        actions: <Widget>[
          new GestureDetector(
            onTap: ()=> Navigator.of(context).pop(false),
            child: roundedButton('No', const Color(0xFFFFFFFF), const Color(0xFF795548)),
          ),
    new GestureDetector(
    onTap: ()=> exit(0),
    child: roundedButton ('Yes', const Color(0xFFFFFFFF), const Color(0xFF795548)),)
        ],
      )
    );
  }
  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF6D4C41),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child:new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
         title: Text("RGUKTB"),
      ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("RGUKT"),
                accountEmail: new Text("enquires@rgukt.ac.in"),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/Raj.jpg"),
                  ),
                ),
              ),
              new ListTile(
                title:new Text("PUC"),
                trailing: new Icon(Icons.book),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context )=> new goto())),
              ),
              new ListTile(
                title:new Text("ENGINEERING"),
                trailing: new Icon(Icons.book),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context )=> new MainActivity())),
              ),
              new ListTile(
                title:new Text("VISIT US"),
                trailing: new Icon(Icons.account_circle),
              ),
              new ListTile(
                title:new Text("CREDITS"),
                trailing: new Icon(Icons.add_circle),
              ),
            ],
          ),
        ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new  Card(
              child: new Container(
        child: new  Column(
              children: <Widget>[
                Text("WELCOME TO RAJIV GANDHI UNIVERSITY OF KNOWLEDGE TECHNOLOGIES  BASAR",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                      color: const Color.fromRGBO(102, 0, 0, 1),
                  fontWeight: FontWeight.bold,
                fontSize: 32.0),
              ),
                Text("   "),
                Text("SYLLABUS APPLICATION",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
              Text("  "),
              Text("RGUKTB is an autonomous educational University which offers a Six-year Integrated Course which includes a two-year Pre University(PUC) and a four-year B.Tech Degree.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.0),
              ),
        Text("  "),
        Text("The following application provides students with the syllabus of all academical years.",
          style: TextStyle(
              color: Colors.black,
              fontSize: 19.0),),
                Text(" "),
                Text("REVISE,RISE AND SHINE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                      fontSize: 30.0),),
      ],),
             decoration: new BoxDecoration(
             color: Colors.white,
            image: new DecorationImage(
    fit: BoxFit.cover,
    colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.2),BlendMode.dstATop),
    image: AssetImage("assets/logo.png"),
    ),
    ),
            ),
    ),
    ],
      ),
    ),
    onWillPop: _onBackPressed);
  }
}

// end of screen 1
//Screen 2 page of selecting branches
//components of popupmenu (the 3 dots in right corner)
class Constants{
 // static const String Default= 'Default';
  static const String Credits= 'credits';
  static const List<String> choices=<String>[
 //   Default,
    Credits
  ];
}
class MainActivity extends StatefulWidget {
  @override
  MainActivityState createState() => MainActivityState();
}
class MainActivityState extends State<MainActivity> {
 /* Future<bool> _onBackPressed(){
    return showDialog(context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you Sure?'),
        content: new Text('Do you want to Exit?'),
        actions: <Widget>[
          new GestureDetector(
            onTap: ()=> Navigator.of(context).pop(false),
            child: roundedButton('No', const Color(0xFFFFFFFF), const Color(0xFF795548)),
          ),
    new GestureDetector(
    onTap: ()=> exit(0),
    child: roundedButton ('Yes', const Color(0xFFFFFFFF), const Color(0xFF795548)),)
        ],
      )
    );
  }*/
  /*Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF6D4C41),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }*/
  @override
  Widget build(BuildContext context) {
  return new Container(child: new Scaffold(
      appBar: AppBar(
        title: Text("RGUKTB SYLLABUS"),
        backgroundColor: Colors.brown,
      /*  actions: <Widget>[
          PopupMenuButton<String>(
            onSelected:choiceAction ,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value:choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],*/
      ),

      body: Branch(),
      backgroundColor: Colors.brown,
  ),
    );// onWillPop: _onBackPressed);
  }
  String ss1,ss2,ss3;
 /* void choiceAction(String choice)
  {
    if(choice==Constants.Credits) {
      //credits();
    }
    else
      print('working');

  }*/
}
//selecting branch using dropdown buttons
class Branch extends StatefulWidget{
  @override
  State<StatefulWidget> createState()
  {
    return Branchname();
  }
}
class Branchname extends State<Branch> {
  var branches=['select','cse','ece','cvl','mech','chem','mme','eee'];
  var years=['select','1','2','3','4'];
  var sem=['select','sem1','sem2'];
  String s1,s2,s3;
  var current1 = 'select';
  var current = 'select';
  var current2 = 'select';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            color: Colors.white,
            padding:new EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  Text(
                  "Name of the branch::",
                  textDirection:TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 25.0,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold
                  ),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  items: branches.map((String dropDownStringItem){
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected)
                  {
                    s1=newValueSelected;
                    setState(() {
                      this.current=newValueSelected;
                    });
                  },
                  value: current,
                ),
             Text(
                  "Choose year::",
                  textDirection:TextDirection.ltr,
                   style: TextStyle(
                       decoration: TextDecoration.none,
                       fontSize: 25.0,
                       color: Colors.brown,
                       fontWeight: FontWeight.bold
                  ),
             ),
                DropdownButton<String>(
                  isExpanded: true,
                  items: years.map((String dropDownStringItem){
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected)
                  {
                    s2=newValueSelected;
                    setState(() {
                      this.current1=newValueSelected;
                    });
                  },
                  value:current1,
                ),
        Text(
          "Choose Semester::",
          textDirection:TextDirection.ltr,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 25.0,
              color: Colors.brown,
              fontWeight: FontWeight.bold
          ),
        ),
                DropdownButton<String>(
                  items: sem.map((String dropDownStringItem){
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected)
                  {
                    s3=newValueSelected;
                    setState(() {
                      this.current2=newValueSelected;
                    });

                  },
                  value:current2,
                ),
                RaisedButton(
                  onPressed: (){
                    go(s1,s2,s3);
                  },
                  child: Text("Go")
                )
              ],
            ),
      ),
    );
  }
  Widget go(String s1,String s2,String s3){
    if((s1=='cse')&&(s2=='1')&&(s3=='sem1'))
    {
      print('cse1sem1');
      Navigator.push(                                 //navigating to the page of branch cseyear1sem1
        context,
        MaterialPageRoute(builder: (context) => Cse1sem1()),
      );
    }
    else if((s1=='cse')&&(s2=='1')&&(s3=='sem2'))
    {
      print('cse1sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cse1sem2()),
      );
    }
    else if((s1=='cse')&&(s2=='2')&&(s3=='sem1'))
    {
      print('cse2sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cse2sem1()),
      );
    }
    else if((s1=='cse')&&(s2=='2')&&(s3=='sem2'))
    {
      print('cse2sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cse2sem2()),
      );
    }
    else if((s1=='cse')&&(s2=='3')&&(s3=='sem1'))
    {
      print('cse3sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cse3sem1()),
      );
    }
    else if((s1=='cse')&&(s2=='3')&&(s3=='sem2'))
    {
      print('cse3sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cse3sem2()),
      );
    }
    else if((s1=='cse')&&(s2=='4')&&(s3=='sem1'))
    {
      print('cse1sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cse4sem1()),
      );
    }
    else if((s1=='cse')&&(s2=='4')&&(s3=='sem2'))
    {
      print('cse4sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cse4sem2()),
      );
    }
    else if((s1=='ece')&&(s2=='1')&&(s3=='sem1'))
    {
      print('ece1sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Ece1sem1()),
      );
    }
    else if((s1=='ece')&&(s2=='1')&&(s3=='sem2'))
    {
      print('ece1sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Ece1sem2()),
      );
    }
    else if((s1=='ece')&&(s2=='2')&&(s3=='sem1'))
    {
      print('ece2sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Ece2sem1()),
      );
    }
    else if((s1=='ece')&&(s2=='2')&&(s3=='sem2'))
    {
      print('ece2sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Ece2sem2()),
      );
    }
    else if((s1=='ece')&&(s2=='3')&&(s3=='sem1'))
    {
      print('ece3sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Ece3sem1()),
      );
    }
    else if((s1=='ece')&&(s2=='3')&&(s3=='sem2'))
    {
      print('ece3sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Ece3sem2()),
      );
    }
    else if((s1=='ece')&&(s2=='4')&&(s3=='sem1'))
    {
      print('ece4sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Ece4sem1()),
      );
    }
    else if((s1=='ece')&&(s2=='4')&&(s3=='sem2'))
    {
      print('ece4sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Ece4sem2()),
      );
    }
    /*else if((s1=='eee')&&(s2=='1')&&(s3=='sem1'))
                    {
                      print('eee1sem1');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Eee1sem1()),
                      );
                    }
                    else if((s1=='eee')&&(s2=='1')&&(s3=='sem2'))
                    {
                      print('eee1sem2');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Eee1sem2()),
                      );
                    }
                    else if((s1=='eee')&&(s2=='2')&&(s3=='sem1'))
                    {
                      print('eee2sem1');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Eee2sem1()),
                      );
                    }
                    else if((s1=='eee')&&(s2=='2')&&(s3=='sem2'))
                    {
                      print('eee2sem2');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Eee2sem2()),
                      );
                    }
                    else if((s1=='eee')&&(s2=='3')&&(s3=='sem1'))
                    {
                      print('eee3sem1');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Eee3sem1()),
                      );
                    }
                    else if((s1=='eee')&&(s2=='3')&&(s3=='sem2'))
                    {
                      print('eee3sem2');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Eee3sem2()),
                      );
                    }
                    else if((s1=='eee')&&(s2=='4')&&(s3=='sem1'))
                    {
                      print('eee4sem1');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Eee4sem1()),
                      );
                    }
                    else if((s1=='eee')&&(s2=='4')&&(s3=='sem2'))
                    {
                      print('eee4sem2');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Eee4sem2()),
                      );
                    }*/
    else if((s1=='mech')&&(s2=='1')&&(s3=='sem1'))
    {
      print('mech1sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mech1sem1()),
      );
    }
    else if((s1=='mech')&&(s2=='1')&&(s3=='sem2'))
    {
      print('mech1sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mech1sem2()),
      );
    }
    else if((s1=='mech')&&(s2=='2')&&(s3=='sem1'))
    {
      print('mech2sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mech2sem1()),
      );
    }
    else if((s1=='mech')&&(s2=='2')&&(s3=='sem2'))
    {
      print('mech2sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mech2sem2()),
      );
    }
    else if((s1=='mech')&&(s2=='3')&&(s3=='sem1'))
    {
      print('mech3sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mech3sem1()),
      );
    }
    else if((s1=='mech')&&(s2=='3')&&(s3=='sem2'))
    {
      print('mech3sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mech3sem2()),
      );
    }
    else if((s1=='mech')&&(s2=='4')&&(s3=='sem1'))
    {
      print('mech4sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mech4sem1()),
      );
    }
    else if((s1=='mech')&&(s2=='4')&&(s3=='sem2'))
    {
      print('mech4sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mech4sem2()),
      );
    }
    else if((s1=='cvl')&&(s2=='1')&&(s3=='sem1'))
    {
      print('cvl1sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cvl1sem1()),
      );
    }
    else if((s1=='cvl')&&(s2=='1')&&(s3=='sem2'))
    {
      print('cvl1sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Cvl1sem2()),
      );
    }
    else if((s1=='cvl')&&(s2=='2')&&(s3=='sem1'))
    {
      print('cvl2sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Cvl2sem1()),
      );
    }
    else if((s1=='cvl')&&(s2=='2')&&(s3=='sem2'))
    {
      print('cvl2sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Cvl2sem2()),
      );
    }
    else if((s1=='cvl')&&(s2=='3')&&(s3=='sem1'))
    {
      print('cvl3sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cvl3sem1()),
      );
    }
    else if((s1=='cvl')&&(s2=='3')&&(s3=='sem2'))
    {
      print('cvl3sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Cvl3sem2()),
      );
    }
    else if((s1=='cvl')&&(s2=='4')&&(s3=='sem1'))
    {
      print('cvl4sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Cvl4sem1()),
      );
    }
    else if((s1=='cvl')&&(s2=='4')&&(s3=='sem2'))
    {
      print('cvl4sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Cvl4sem2()),
      );
    }
    else if((s1=='chem')&&(s2=='1')&&(s3=='sem1'))
    {
      print('chem1sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Chem1sem1()),
      );
    }
    else if((s1=='chem')&&(s2=='1')&&(s3=='sem2'))
    {
      print('chem1sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Chem1sem2()),
      );
    }
    else if((s1=='chem')&&(s2=='2')&&(s3=='sem1'))
    {
      print('chem2sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Chem2sem1()),
      );
    }
    else if((s1=='chem')&&(s2=='2')&&(s3=='sem2'))
    {
      print('chem2sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Chem2sem2()),
      );
    }
    else if((s1=='chem')&&(s2=='3')&&(s3=='sem1'))
    {
      print('chem3sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Chem3sem1()),
      );
    }
    else if((s1=='chem')&&(s2=='3')&&(s3=='sem2'))
    {
      print('chem3em2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Chem3sem2()),
      );
    }
    else if((s1=='chem')&&(s2=='4')&&(s3=='sem1'))
    {
      print('chem4sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Chem4sem1()),
      );
    }
    else if((s1=='chem')&&(s2=='4')&&(s3=='sem2'))
    {
      print('chem4sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Chem4sem2()),
      );
    }
    else if((s1=='mme')&&(s2=='1')&&(s3=='sem1'))
    {
      print('mme1sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mme1sem1()),
      );
    }
    else if((s1=='mme')&&(s2=='1')&&(s3=='sem2'))
    {
      print('mme2sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mme1sem2()),
      );
    }
    else if((s1=='mme')&&(s2=='2')&&(s3=='sem1'))
    {
      print('mme3sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mme2sem1()),
      );
    }
    else if((s1=='mme')&&(s2=='2')&&(s3=='sem2'))
    {
      print('mme2sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mme2sem2()),
      );
    }
    else if((s1=='mme')&&(s2=='3')&&(s3=='sem1'))
    {
      print('mme3sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mme3sem1()),
      );
    }
    else if((s1=='mme')&&(s2=='3')&&(s3=='sem2'))
    {
      print('mme3sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mme3sem2()),
      );
    }
    else if((s1=='mme')&&(s2=='4')&&(s3=='sem1'))
    {
      print('mme4sem1');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mme4sem1()),
      );
    }
    else if((s1=='mme')&&(s2=='4')&&(s3=='sem2'))
    {
      print('mme4sem2');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Mme4sem2()),
      );
    }
    else
    {
      print('cse:year1:sem1');

    }
  }
}