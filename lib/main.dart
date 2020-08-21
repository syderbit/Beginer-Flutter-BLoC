import 'package:bloc_state_management/city_location.dart';
import 'package:bloc_state_management/cubit/prosesb_cubit.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'bloc/prosesa_bloc.dart';
import 'bloc/timerbloc_bloc.dart';
import 'package:get/src/navigation/routes/transitions_type.dart' as transisi;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ProsesaBloc>(
            create: (context) => ProsesaBloc(),
          ),
          BlocProvider<ProsesbCubit>(
            create: (context) => ProsesbCubit(),
          ),
          BlocProvider<TimerblocBloc>(
            create: (context) => TimerblocBloc(ticker: Ticker()),
          ),
        ],
        child: MyHomePage(title: 'Block State Management'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final txtblocProvider = TextEditingController();
  FocusNode txtblocProviderFocusNode = FocusNode();

  final txtCubitProvider = TextEditingController();
  FocusNode txtCubitProviderFocus = FocusNode();

  String timerBtnText = 'Start Timer';

  final txtblocCuaca = TextEditingController();
  FocusNode txtblocCuacaFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TimerblocState currentState = context.bloc<TimerblocBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Parent(
            style: ParentStyle()..padding(all: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Txt(
                  'BLoC Provider',
                  style: TxtStyle()
                    ..fontSize(18)
                    ..margin(bottom: 10),
                ),
                TextField(
                  focusNode: txtblocProviderFocusNode,
                  controller: txtblocProvider,
                  style: TextStyle(color: Colors.amber[900], fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                    //helperText: 'helperText',
                    //errorText: 'Error Text',
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'String to Output Bloc Provider',
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Parent(
                      child: Row(
                        children: <Widget>[
                          Txt(
                            'Bloc Provider',
                            style: TxtStyle()..fontSize(12),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
                          )
                        ],
                      ),
                      style: ParentStyle()
                        ..border(all: 1, color: Colors.amber[700])
                        ..padding(all: 5)
                        ..borderRadius(all: 5)
                        ..background.color(Colors.amber[400])
                        ..elevation(1)
                        ..ripple(true, splashColor: Colors.amber[900]),
                      gesture: Gestures()
                        ..onTap(() async {
                          //TODO: Bloc Provider Process
                          txtblocProvider.text == null || txtblocProvider.text == ''
                              ? txtblocProviderFocusNode.requestFocus()
                              : txtblocProviderFocusNode.unfocus();
                          //print('txtblocProvider.text');
                          context.bloc<ProsesaBloc>().add(ProcesaDataInput(txtblocProvider.text));
                        }),
                    ),
                    Parent(
                      style: ParentStyle()
                        ..overflow.hidden(true)
                        ..width(MediaQuery.of(context).size.width / 2),
                      child: BlocBuilder<ProsesaBloc, ProsesaState>(
                        builder: (_, state) {
                          //TODO Bloc Provider Return
                          return (state is ProsesaDataAOutput)
                              ? Txt(
                                  state.output,
                                  style: TxtStyle()
                                    ..fontSize(12)
                                    ..alignment.centerRight(true)
                                    ..textAlign.right(true),
                                )
                              : Txt(
                                  '--',
                                  style: TxtStyle()
                                    ..fontSize(12)
                                    ..alignment.centerRight(true)
                                    ..textAlign.right(true),
                                );
                        },
                      ),
                    )
                  ],
                ),
                //==>>
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 5),
                //==>>
                Txt(
                  'Cubit Provider',
                  style: TxtStyle()
                    ..fontSize(18)
                    ..margin(bottom: 10),
                ),
                TextField(
                  focusNode: txtCubitProviderFocus,
                  controller: txtCubitProvider,
                  style: TextStyle(color: Colors.amber[900], fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'String to Output Cubit Provider',
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Parent(
                      child: Row(
                        children: <Widget>[
                          Txt(
                            'Cubit Provider',
                            style: TxtStyle()..fontSize(12),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
                          )
                        ],
                      ),
                      style: ParentStyle()
                        ..border(all: 1, color: Colors.amber[700])
                        ..padding(all: 5)
                        ..borderRadius(all: 5)
                        ..background.color(Colors.amber[400])
                        ..elevation(1)
                        ..ripple(true, splashColor: Colors.amber[900]),
                      gesture: Gestures()
                        ..onTap(() async {
                          txtCubitProvider.text == null || txtCubitProvider.text == ''
                              ? txtCubitProviderFocus.requestFocus()
                              : txtCubitProviderFocus.unfocus();

                          //TODO: Cubit Process
                          context.bloc<ProsesbCubit>().prosesBInput(txtCubitProvider.text);
                        }),
                    ),
                    Parent(
                      style: ParentStyle()
                        ..overflow.hidden(true)
                        ..width(MediaQuery.of(context).size.width / 2),
                      child: BlocBuilder<ProsesbCubit, ProsesbState>(
                        //cubit: ProsesbCubit(),
                        builder: (_, stateCubit) {
                          print(stateCubit);
                          //TODO: Cubit Return
                          return (stateCubit is ProsesaDataBOutput)
                              ? Txt(
                                  stateCubit.outputCubit,
                                  style: TxtStyle()
                                    ..fontSize(12)
                                    ..alignment.centerRight(true)
                                    ..textAlign.right(true),
                                )
                              : Txt(
                                  '--',
                                  style: TxtStyle()
                                    ..fontSize(12)
                                    ..alignment.centerRight(true)
                                    ..textAlign.right(true),
                                );
                        },
                      ),
                    )
                  ],
                ),
                //==>>
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 5),
                //==>>
                Txt(
                  'BLoC Provider Timer',
                  style: TxtStyle()
                    ..fontSize(18)
                    ..margin(bottom: 10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Parent(
                          child: Row(
                            children: <Widget>[
                              BlocListener<TimerblocBloc, TimerblocState>(
                                listener: (context, state) {
                                  if (state is TimerRunComplete) {
                                    Future.delayed(Duration(seconds: 2), () {
                                      context.bloc<TimerblocBloc>().add(TimerReset());
                                      setState(() {
                                        timerBtnText = "Start Timer";
                                      });

                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text('Timer Restarted..'),
                                        ),
                                      );
                                    });
                                  }
                                },
                                child: Txt(
                                  timerBtnText,
                                  style: TxtStyle()..fontSize(12),
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.play_arrow,
                                size: 13,
                              )
                            ],
                          ),
                          style: ParentStyle()
                            ..border(all: 1, color: Colors.amber[700])
                            ..padding(all: 5)
                            ..borderRadius(all: 5)
                            ..background.color(Colors.amber[400])
                            ..elevation(1)
                            ..ripple(true, splashColor: Colors.amber[900]),
                          gesture: Gestures()
                            ..onTap(() async {
                              //TODO: Bloc Timer

                              if (currentState is TimerInitial) {
                                setState(() {
                                  timerBtnText = "Pause";
                                });
                                context
                                    .bloc<TimerblocBloc>()
                                    .add(TimerStarted(duration: currentState.duration));
                              } else if (currentState is TimerRunInProgress) {
                                setState(() {
                                  timerBtnText = "Reset";
                                });
                                context.bloc<TimerblocBloc>().add(TimerPaused());
                              } else if (currentState is TimerRunPause) {
                                setState(() {
                                  timerBtnText = "Start Timer";
                                });
                                context.bloc<TimerblocBloc>().add(TimerReset());
                              } else if (currentState is TimerRunComplete) {
                                setState(() {
                                  timerBtnText = "Pause";
                                });
                                context
                                    .bloc<TimerblocBloc>()
                                    .add(TimerStarted(duration: currentState.duration));
                              }
                            }),
                        ),
                        Parent(
                          style: ParentStyle()
                            ..overflow.hidden(true)
                            ..width(MediaQuery.of(context).size.width / 2),
                          child: BlocBuilder<TimerblocBloc, TimerblocState>(
                            //cubit: ProsesbCubit(),
                            builder: (_, stateTimer) {
                              print(stateTimer);

                              final String minutesStr = ((stateTimer.duration / 60) % 60)
                                  .floor()
                                  .toString()
                                  .padLeft(2, '0');
                              final String secondsStr =
                                  (stateTimer.duration % 60).floor().toString().padLeft(2, '0');

                              //TODO: Block Timer Return
                              return Txt(
                                '$minutesStr:$secondsStr',
                                style: TxtStyle()
                                  ..fontSize(12)
                                  ..alignment.centerRight(true)
                                  ..textAlign.right(true),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Txt(
                  '- With BlocListener used.',
                  style: TxtStyle()
                    ..padding(top: 5, bottom: 5)
                    ..margin(all: 2.5)
                    ..fontSize(11)
                    ..italic(true)
                    ..textColor(Colors.grey),
                ),
                Divider(height: 5),
                SizedBox(height: 5),
                Txt(
                  'BLoC Provider Weather',
                  style: TxtStyle()
                    ..fontSize(18)
                    ..margin(bottom: 10),
                ),
                TextField(
                  focusNode: txtblocCuacaFocusNode,
                  controller: txtblocCuaca,
                  style: TextStyle(color: Colors.amber[900], fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Masukkan Nama Kota',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Parent(
                          child: Txt(
                            'Open Weather Location',
                            style: TxtStyle()..fontSize(12),
                          ),
                          style: ParentStyle()
                            ..border(all: 1, color: Colors.amber[700])
                            ..padding(all: 5)
                            ..borderRadius(all: 5)
                            ..background.color(Colors.amber[400])
                            ..elevation(1)
                            ..ripple(true, splashColor: Colors.amber[900]),
                          gesture: Gestures()
                            ..onTap(() async {
                              //FIXME: Page cuaca
                              final city = Get.to(
                                CityLocation(),
                                arguments: txtblocCuaca.text,
                                transition: transisi.Transition.rightToLeftWithFade,
                              );
                            }),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    txtblocProvider.dispose();
    txtblocProviderFocusNode.dispose();
    //==>>
    txtCubitProvider.dispose();
    txtCubitProviderFocus.dispose();
    super.dispose();
  }
}
