import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool? _rememberMe = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          height: 50.0,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Enter Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 50.0,
          child: const TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () => debugPrint('Forgot Password Button Pressed'),
        child: const Text(
          'FORGOT PASSWORD?',
          style: kLabelStyleHighLight,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: 20.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: _rememberMe,
                checkColor: Colors.white,
                activeColor: Colors.orange,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value;
                  });
                },
              ),
            ),
            const Text(
              'Remember Password',
              style: kLabelStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {debugPrint('GET STARTED Button Pressed')},
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: const Text(
          'GET STARTED',
          style: TextStyle(
            color: Color(0xFFEF2461),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: const <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => debugPrint('Login with Facebook'),
            const AssetImage(
              'assets/logos/ic_fb.png',
            ),
          ),
          _buildSocialBtn(
            () => debugPrint('Login with Twitter'),
            const AssetImage(
              'assets/logos/ic_tw.png',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return Container(
      width: double.infinity,
      height: 60.0,
      color: Colors.black.withOpacity(0.3),
      child: GestureDetector(
        onTap: () => debugPrint('Sign Up Button Pressed'),
        child: Center(
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'DON\'T HAVE AN ACCOUNT? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffff7b4d), Color(0xfffc326f)],
                    stops: [0.1, 0.9],
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Image(
                          image: AssetImage(
                        'assets/logos/logo.png',
                      )),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Find and Meet people around\nyou to find LOVE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      _buildEmailTF(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildSocialBtnRow(),
                      _buildForgotPasswordBtn()
                    ],
                  ),
                ),
              ),
              Positioned(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: _buildSignupBtn()))
            ],
          ),
        ),
      ),
    );
  }
}
