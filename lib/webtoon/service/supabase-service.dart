import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  void getSomething() async {
    await Supabase.initialize(
        url: dotenv.get("SUPABASE_URL"), anonKey: dotenv.get("SUPABASE_KEY"));
    var response =
        await Supabase.instance.client.from('flutter_test').select("*");
    print(response);
  }
}
