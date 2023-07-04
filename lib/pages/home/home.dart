import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/helpers/shared_prefrences_provider.dart';
import 'package:test1/providers/posts_provider.dart';

import '../../repo/http_posts_repo.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final postsPV = ref.watch(postsProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  final prefs = await ref.read(sharedPrefrencesProvider);
                  prefs.setString('name', 'Mohammad');
                  print(prefs.getString('name'));
                },
                child: Text('Save token')),
            postsPV.when(
              data: (data) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async =>
                        await ref.refresh(postsProvider.future),
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) =>
                            Text(data[index].title)),
                  ),
                );
              },
              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),
              loading: () => const CircularProgressIndicator(),
            ),
            // ElevatedButton(
            //   child: Text('go to profile'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.amberAccent,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            //   onPressed: () {
            //     context.go('/login');
            //   },
            // ),
            // Expanded(
            //     child: Container(
            //   width: double.infinity,
            //   color: Colors.pink,
            // )),
          ],
        ),
      ),
    );
  }
}
