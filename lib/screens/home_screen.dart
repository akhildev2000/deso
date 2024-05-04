import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import '../controllers/permission_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final permissionProvider = Provider.of<PermissionProvider>(context);
    final audioQuery = OnAudioQuery();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<List<SongModel>>(
        future: permissionProvider.isPermissionGranted
            ? audioQuery.querySongs(
                sortType: null,
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL,
                ignoreCase: true,
              )
            : Future.value([]),
        builder: (context, item) {
          if (item.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (item.hasError) {
            return Center(
              child: Text('Error: ${item.error}'),
            );
          } else if (item.data == null || item.data!.isEmpty) {
            return Center(
              child: Text(
                'No Songs Found',
                style: GoogleFonts.poppins(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              // print(item.data![index].displayNameWOExt);
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: ListTile(
                  tileColor: const Color.fromARGB(221, 240, 227, 182),
                  leading: const Icon(
                    Icons.music_note,
                    color: Color.fromARGB(255, 130, 60, 10),
                  ),
                  title: Text(
                    item.data![index].displayNameWOExt,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 130, 60, 10),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
            itemCount: item.data!.length,
          );
        },
      ),
    );
  }
}
