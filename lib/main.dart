import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hanflix/example/widget/statefull-app.dart';
import 'package:hanflix/example/widget/button.dart';
import 'package:hanflix/pomodoro/pomodoro-app.dart';
import 'package:hanflix/webtoon/service/api-service.dart';
import 'package:hanflix/webtoon/service/supabase-service.dart';
import 'package:hanflix/webtoon/stateless-home-screen.dart';
import 'package:hanflix/webtoon/webtoon-app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  SupabaseService().getSomething();
  runApp(WebtoonApp());
}