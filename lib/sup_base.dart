import 'package:supabase/supabase.dart';

class SupBase {
  static getPosts() async {
    final client = SupabaseClient('https://inixuaheiqtqmdubnnpy.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMDYzOTI5MiwiZXhwIjoxOTQ2MjE1MjkyfQ.2IrKmKz49DkKKXxrYrP6Xc8KrenfxFInq_3XM4IKLVw');

    final res = await client.from('news').select().execute();

    return res;
  }

  static addPost(
      {required String title,
      required String post,
      required String? image,
      required String dir}) async {
    final client = SupabaseClient('https://inixuaheiqtqmdubnnpy.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMDYzOTI5MiwiZXhwIjoxOTQ2MjE1MjkyfQ.2IrKmKz49DkKKXxrYrP6Xc8KrenfxFInq_3XM4IKLVw');

    final res = await client.from('news').insert(
        {'title': title, 'post': post, 'dir': dir, 'img': image}).execute();
  }
}
