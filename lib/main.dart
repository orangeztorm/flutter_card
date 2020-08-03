import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation cardAnimation, delayedCardAnimation, fabButtonanim, infoAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    cardAnimation = Tween(begin: 0.0, end: -0.025).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));
    delayedCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
        CurvedAnimation(
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            parent: animationController));
    fabButtonanim = Tween(begin: 1.0, end: -0.0008).animate(CurvedAnimation(
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));
    infoAnimation = Tween(begin: 0.0, end: 0.025).animate(CurvedAnimation(
        curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));
  }

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery
        .of(context)
        .size
        .height;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              'Near by',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
              color: Colors.black,
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: FlutterLogo(
                  colors: Colors.blue,
                  size: 40.0,
                ),
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      left: 20.0,
                      child: Container(
                        transform: Matrix4.translationValues(
                            0.0, delayedCardAnimation.value * devHeight, 0.0),
                        width: 260,
                        height: 400,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    Positioned(
                      left: 10.0,
                      child: Container(
                        transform: Matrix4.translationValues(
                            0.0, cardAnimation.value * devHeight, 0.0),
                        width: 280,
                        height: 400,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    Container(
                      width: 300.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('assets/girl.jpg'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Positioned(
                      top: 320.0,
                      left: 15.0,
                      child: Container(
                        transform: Matrix4.translationValues(
                            0.0, infoAnimation.value * devHeight, 0.0),
                        width: 270.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.0,
                                color: Colors.black12,
                                spreadRadius: 2.0,
                              )
                            ]),
                        child: Container(
                          padding: EdgeInsets.all(7.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Kayla',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Image.asset(
                                    'assets/simbolo.jpg',
                                    height: 20.0,
                                    width: 20.0,
                                  ),
                                  SizedBox(
                                    width: 110.0,
                                  ),
                                  Text(
                                    '5.8km',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.0,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Fate is wonderful.',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                    Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          border: Border.all(
                            color: Colors.transparent,
                            style: BorderStyle.solid,
                            width: 2.0,
                          )),
                      child: Container(
                        transform: Matrix4.translationValues(
                            0.0, fabButtonanim.value * devHeight, 0.0),
                        child: Center(
                          child: IconButton(
                            icon: Image.asset('assets/chat_bubble.jpg'),
                            onPressed: () {},
                            color: Colors.lightBlueAccent[300],
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}