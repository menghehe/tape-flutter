import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 490,
            decoration: BoxDecoration(
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    offset: new Offset(0.0, 2.0),
                    blurRadius: 25.0,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32))),
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(16),
                      child: FlatButton(
                        onPressed: () {dispatch(LoginActionCreator.onSignInTab());},
                        child: Text(
                          '登 录',
                          style: TextStyle(
                            fontSize: 20,
                            color: state.signInTabColor,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: FlatButton(
                        onPressed: () {dispatch(LoginActionCreator.onSignUpTab());},
                        child: Text(
                          '注 册',
                          style: TextStyle(
                            fontSize: 20,
                            color: state.signUpTabColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: state.pageController,
                    onPageChanged: (i){dispatch(LoginActionCreator.onPageChanged());},
                    children: <Widget>[
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildSignIn(dispatch,state),
                      ),
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildSignUp(dispatch,state),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ));

}

Widget _buildSignIn(Dispatch dispatch,LoginState state){
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 16, top: 8),
        child: Text(
          'Welcome to Tape',
          style:
          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 16, top: 8),
        child: Text(
          'Let\'s get started',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: 16, right: 16, top: 32, bottom: 8),
        child: TextField(
          style: TextStyle(fontSize: 18),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          controller: state.usernameEditController,
          focusNode: state.focusNodeUsername,
          decoration: InputDecoration(
            hintText: '用户名',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
      ),
      Padding(
        padding:
        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: TextField(
          obscureText: true,
          style: TextStyle(fontSize: 18),
          keyboardType: TextInputType.text,
          controller: state.passwordEditController,
          focusNode: state.focusNodePassword,
          decoration: InputDecoration(
            hintText: '密码',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child: IconButton(
              color: Colors.white,
              onPressed: () {dispatch(LoginActionCreator.onLogin());},
              icon: Icon(Icons.arrow_forward),
            ),
          )),
    ],
  );
}

Widget _buildSignUp(Dispatch dispatch,LoginState state){
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 16, top: 8),
        child: Text(
          'Welcome to Tape',
          style:
          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 16, top: 8),
        child: Text(
          'Let\'s get started',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: 16, right: 16, top: 32, bottom: 8),
        child: TextField(
          style: TextStyle(fontSize: 18),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          controller: state.newUsernameEditController,
          focusNode: state.focusNodeNewUsername,
          decoration: InputDecoration(
            hintText: '用户名',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
      ),
      Padding(
        padding:
        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(fontSize: 18),
          controller: state.newPasswordEditController,
          focusNode: state.focusNodeNewPassword,
          decoration: InputDecoration(
            hintText: '密码',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child: IconButton(
              color: Colors.white,
              onPressed: () {
                dispatch(LoginActionCreator.onSignUp());
              },
              icon: Icon(Icons.arrow_forward),
            ),
          )),
    ],
  );
}
