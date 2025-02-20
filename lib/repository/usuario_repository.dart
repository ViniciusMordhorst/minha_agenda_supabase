import 'package:minha_agenda_supabase/model/usuario.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UsuarioRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<AuthResponse> criarUsuario(Usuario usuario) async {
    return await supabase.auth.signUp(
      email:usuario.email,
      password: usuario.senha!,
      data: {
        'display_name': usuario.nome,

      },
    );
  }

bool isLogado(){
  return supabase.auth.currentSession != null ? true : false;


} 
}