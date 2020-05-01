import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  
  AnimationController animationController;
  Animation logoAnimation,screenColorAnimation;
  @override
  void initState() {

    super.initState();
    
    animationController = new AnimationController(vsync: this,duration: Duration(seconds: 1));

    screenColorAnimation = ColorTween(begin: Colors.lightBlueAccent,end: Colors.white).animate(animationController);
    logoAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);

    animationController.forward(from: 0.0);
    animationController.addListener((){

      setState(() {

      });

    });

    animationController.addStatusListener((status){

      if(status==AnimationStatus.completed){
        animationController.reverse(from: 1.0);
      }
      else if(status == AnimationStatus.dismissed){
        animationController.forward(from: 0.0);
      }
    });
    

  }
  @override
  void dispose() {

    animationController.dispose();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColorAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0*logoAnimation.value,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(color: Colors.lightBlueAccent,title: 'Log In',onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);//Go to login screen.
            }),
            RoundedButton(color: Colors.blueAccent,title: 'Register',onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);//Go to login screen.
            }),
          ],
        ),
      ),
    );
  }
}


