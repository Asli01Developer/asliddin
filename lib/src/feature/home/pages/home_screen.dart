import 'package:flutter/material.dart';
import 'package:skool/src/common/style/icons/app_icons.dart';

import '../../../common/service/db_service.dart';
import '../../../common/widgets/app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(
                height: 26,
                width: 85,
                child: Image(
                  image: AssetImage(AppIcons.skool),
                )),
            SizedBox(width: 10),
            SizedBox(
                height: 26,
                width: 26,
                child: Image(
                  image: AssetImage(AppIcons.arrow),
                )),
          ],
        ),
          actions: [
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Choose language'),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        context.findAncestorStateOfType<AppState>()?.changeLocale(const Locale('en'));
                        await $storage.setString(StorageKeys.language.key, 'en');
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('English'),
                    ),
                    TextButton(
                      onPressed: () async {
                        context.findAncestorStateOfType<AppState>()?.changeLocale(const Locale('uz'));
                        await $storage.setString(StorageKeys.language.key, 'uz');
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('O`zbekcha'),
                    ),
                  ],
                ),
              ),
              icon: const Icon(Icons.language),
            ),
          ],
      ),
      body: const CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: TextField(),
            ),
          ),
        ],
      ),
    );
  }
}
