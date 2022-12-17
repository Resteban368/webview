// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, unnecessary_const

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'check_internet_connection.dart';
import 'connection_status_change_notifier.dart';

class WarningWidgetChangeNotifier extends StatelessWidget {
  const WarningWidgetChangeNotifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _controller =
        Completer<WebViewController>();
    return ChangeNotifierProvider(
      create: (context) => ConnectionStatusChangeNotifier(),
      child: Consumer<ConnectionStatusChangeNotifier>(
          builder: (context, value, child) {
        return Visibility(
          child: (value.status != ConnectionStatus.online)
              ? const MensajeNoInternetScreen()
              : WebView(
                  initialUrl: 'https://plataforma.jginvest.tech/auth/login',
                  javascriptMode: JavascriptMode.unrestricted,
                  //desabilitar el zoom
                  zoomEnabled: false,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                  //mostrar cargando mientras carga la pagina
                  backgroundColor: const Color.fromARGB(255, 21, 26, 44),
                ),
        );
      }),
    );
  }
}

class MensajeNoInternetScreen extends StatelessWidget {
  const MensajeNoInternetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        _FondoBox(),
        // const Center(child: _HeaderIcon())
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.35,
              ),
              Container(
                width: 350,
                height: 90,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icono.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'No hay conexión a internet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class _FondoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration:
          const BoxDecoration(color: const Color.fromARGB(255, 21, 26, 44)),
    );
  }
}
