import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:sarrc_app/backend/supabase/database/database.dart';

export 'database/database.dart';

const _kSupabaseUrl = 'https://ifrqymdgbbkvqztndmog.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmcnF5bWRnYmJrdnF6dG5kbW9nIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTE4ODczMjYsImV4cCI6MjAwNzQ2MzMyNn0.g2lX93EDzRMK-pUmSDsWzC4PylooNNQYXYV7FTKqed0';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;
}
