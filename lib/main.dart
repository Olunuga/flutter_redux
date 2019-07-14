import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/Redux/AuthenticationRdx/AuthActions.dart';
import 'package:flutter_redux_app/Redux/ResourceMiddleware.dart';
import 'package:flutter_redux_app/Redux/CounterRdx/CounterActions.dart';
import 'package:flutter_redux_app/Resources/Api/Api.dart';
import 'package:flutter_redux_app/Resources/Api/RequestModel/LoginRequestModel.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_app/Redux/AppRdx.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Store<AppState> store = new Store(appReducer,
      initialState: new AppState.initial(),
      middleware: [ResourceMiddleware(api: Api())]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(
            title: 'Flutter Demo Home Page',
            store: store,
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.store}) : super(key: key);

  final String title;
  final Store store;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    widget.store.dispatch(AddCounterAction());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            FlatButton(
              child: Text("Simulate Login"),
              onPressed: () {
                widget.store.dispatch(LoginAction(
                    data: LoginRequestModel(
                        username: ""
                            "myorh",
                        password: "olunuga")));
              },
            ),
            StoreConnector<AppState, int>(
              converter: (store) => store.state.counterState.count,
              builder: (context, count) {
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 80,
              width: 80,
              child: StoreConnector<AppState, bool>(
                  converter: (store) => store.state.authState.loginLoading,
                  builder: (context, status) {
                    return status ? CircularProgressIndicator() : Container();
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
