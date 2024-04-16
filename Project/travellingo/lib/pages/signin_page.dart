import "package:travellingo/component/change_language_component.dart";
import "package:travellingo/component/check_component.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_localization/flutter_localization.dart";
import "package:local_auth/local_auth.dart";
import "package:provider/provider.dart";
import "package:rxdart/rxdart.dart";
import "package:rxdart/subjects.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:travellingo/bloc/auth_bloc/auth_bloc.dart";
import "package:travellingo/bloc/auth_bloc/auth_state.dart";
import "package:travellingo/component/oauth_button_component.dart";
import "package:travellingo/component/snackbar_component.dart";
import "package:travellingo/pages/home_page.dart";
import "package:travellingo/bloc/preferences/save_preferences.dart";
import "package:travellingo/pages/register_page.dart";
import "package:dio/dio.dart";

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final bloc = AuthBloc();
  final FlutterLocalization localization = FlutterLocalization.instance;
  final auth = LocalAuthentication();
  final globalKey = GlobalKey<FormState>();
  final dio = Dio();
  final emailregex = RegExp(r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');
  bool _isObscure = true;
  final _isTicked = BehaviorSubject<bool>();
  bool _biometrics = false;
  bool _haveLoggedIn = false;
  BiometricType? _biometricType;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      email.text = value.getString('email') ?? "";
      password.text = value.getString('password') ?? "";
      _isTicked.add(value.getBool('isTicked') ?? false);
      _haveLoggedIn = value.getBool('haveLoggedIn') ?? false;
    });
    auth.getAvailableBiometrics().then((value) {
      if (value.contains(BiometricType.strong)) {
        _biometrics = true;
        _biometricType = BiometricType.fingerprint;
        setState(() {});
      }
      if (value.contains(BiometricType.face)) {
        _biometrics = true;
        _biometricType = BiometricType.face;
        setState(() {});
      }
      if (value.contains(BiometricType.fingerprint)) {
        _biometrics = true;
        _biometricType = BiometricType.fingerprint;
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    bloc.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<bool>.value(
            value: _isTicked,
            initialData: _isTicked.hasValue ? _isTicked.value : false),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "changeLanguage".getString(context),
              style: const TextStyle(color: Colors.black26),
            ),
            scrolledUnderElevation: 0,
            centerTitle: true,
            actions: const [ChangeLanguageComponent()],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: 500,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/Signin.png'),
                        width: 200,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      StreamBuilder<AuthState>(
                          stream: bloc.controller.stream,
                          builder: (context, snapshot) {
                            if (snapshot.data?.receivedToken?.isNotEmpty ??
                                false) {
                              SavePreferences.saveLoginPreferences(
                                      context.watch<bool>(),
                                      email.text,
                                      password.text)
                                  .then((e) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                    (route) => false);
                              });
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("email".getString(context),
                                    style: const TextStyle(
                                        fontSize: 10,
                                        letterSpacing: 1.1,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1B1446)),
                                    textScaler: const TextScaler.linear(1.1)),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: email,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value == "") {
                                      return "fieldmustbefilled"
                                          .getString(context);
                                    }
                                    if (!emailregex.hasMatch(value)) {
                                      return "emailformatwrong"
                                          .getString(context);
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[a-zA-Z@.0-9]'))
                                  ],
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      color: !(snapshot.data?.isSubmitting ??
                                              false)
                                          ? const Color(0xFF1B1446)
                                          : Colors.grey,
                                      fontSize: 14,
                                      letterSpacing: 1.1,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    enabled:
                                        !(snapshot.data?.isSubmitting ?? false),
                                    prefixIcon: const Icon(
                                      Icons.account_circle,
                                      color: Color.fromARGB(255, 62, 132, 168),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text("password".getString(context),
                                    style: const TextStyle(
                                        fontSize: 10,
                                        letterSpacing: 1.1,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1B1446)),
                                    textScaler: const TextScaler.linear(1.1)),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: password,
                                  style: TextStyle(
                                      color: !(snapshot.data?.isSubmitting ??
                                              false)
                                          ? const Color(0xFF1B1446)
                                          : Colors.grey,
                                      fontSize: 14,
                                      letterSpacing: 1.1,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    enabled:
                                        !(snapshot.data?.isSubmitting ?? false),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Color.fromARGB(255, 62, 132, 168),
                                    ),
                                    suffixIcon: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Icon(
                                          _isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: const Color.fromARGB(
                                              255, 245, 209, 97),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        }),
                                  ),
                                  obscureText: _isObscure,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    CircleCheckboxComponent(
                                      onClickFunction: changeRememberMeState,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          changeRememberMeState();
                                        },
                                        overlayColor:
                                            const MaterialStatePropertyAll(
                                                Colors.transparent),
                                        child: Text(
                                          "rememberme".getString(context),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 245, 209, 97)),
                                          textScaler:
                                              const TextScaler.linear(1.1),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                          onPressed:
                                              !(snapshot.data?.isSubmitting ??
                                                      false)
                                                  ? () async {
                                                      await bloc.signIn(
                                                          context,
                                                          email.text,
                                                          password.text);
                                                    }
                                                  : () {},
                                          style: OutlinedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 245, 209, 97),
                                              side: const BorderSide(
                                                  color: Colors.transparent),
                                              minimumSize:
                                                  const Size.fromHeight(52),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15))),
                                          child: !(snapshot
                                                      .data?.isSubmitting ??
                                                  false)
                                              ? Text(
                                                  "signin".getString(context),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11.5,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1.1),
                                                  textScaler:
                                                      const TextScaler.linear(
                                                          1.1),
                                                )
                                              : const CircularProgressIndicator()),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    if (_biometrics == true &&
                                        _haveLoggedIn == true)
                                      OutlinedButton(
                                          onPressed: () => handleBiometrics,
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.white,
                                            minimumSize: const Size(40, 52),
                                            side: BorderSide(
                                                color: Colors.grey.shade300,
                                                width: 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: _biometricType ==
                                                  BiometricType.face
                                              ? Image.asset("assets/Faceid.png")
                                              : _biometricType ==
                                                      BiometricType.fingerprint
                                                  ? const Icon(
                                                      Icons.fingerprint,
                                                      color: Color(0xFFF5D161),
                                                      size: 35,
                                                    )
                                                  : const Icon(Icons.password,
                                                      color: Color(0xFFF5D161),
                                                      size: 35)),
                                  ],
                                ),
                              ],
                            );
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                            height: 2,
                            color: const Color(0xFFF6F8FB),
                          )),
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "orsigninwith".getString(context).toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 9,
                                    letterSpacing: 1.1,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xAA1B1446)),
                                textScaler: const TextScaler.linear(1.1),
                              )),
                          Expanded(
                              child: Container(
                            height: 2,
                            color: const Color(0xFFF6F8FB),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OAuthButtonComponent(content: "Facebook"),
                          SizedBox(
                            width: 30,
                          ),
                          OAuthButtonComponent(content: "Google"),
                          SizedBox(
                            width: 30,
                          ),
                          OAuthButtonComponent(content: "Apple")
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "donthaveaccount".getString(context),
                              style: const TextStyle(color: Colors.black26),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage()),
                                  );
                                },
                                child: Text(
                                  "signup".getString(context),
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 245, 209, 97),
                                  ),
                                ))
                          ])
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void changeRememberMeState() {
    _isTicked.add(!_isTicked.value);
  }

  void handleBiometrics(context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (!context.mounted) return;
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: "authenticateToLogin".getString(context));
      if (didAuthenticate) {
        if (context.mounted) {
          await bloc.signIn(context, prefs.getString('email_authenticate')!,
              prefs.getString('password_authenticate')!);
        }
      }
    } on PlatformException {
      if (!context.mounted) return;
      showMySnackBar(
          context, "somethingWrongWithAuthentication".getString(context));
      return;
    }
  }
}
