import 'dart:developer';

import 'package:flutter/material.dart';

final N = _Navi();

class _Navi {
  final key = GlobalKey<NavigatorState>();

  NavigatorState get navigator => key.currentState!;
  Future<T?> to<T>(Widget page) async {
    log('[con][navigator] to => ${page.runtimeType}');
    return navigator.push<T>(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> replace<T extends Object, TO extends Object>(Widget page) async {
    log('[con][navigator] replace with => ${page.runtimeType}');
    return navigator.pushReplacement<T, TO>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Future<T?> replaceAll<T extends Object>(Widget page) async {
    log('[con][navigator] replaceAll with => ${page.runtimeType}');
    log(navigator.toString());
    return navigator.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (_) => false,
    );
  }

  Future<void> back<T>([T? data]) async {
    log('[con][navigator] pop');
    return navigator.pop<T>(data);
  }
}
