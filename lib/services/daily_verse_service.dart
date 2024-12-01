import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';

class DailyVerseService {
  static Future<String> getDailyVerse() async {
    final random = Random();
    final surahNumber = random.nextInt(114) + 1;

    final String response =
        await rootBundle.loadString('assets/list-surah.json');
    final List<dynamic> data = json.decode(response);

    final surah = data[surahNumber - 1]; // Surah is indexed by surahNumber - 1
    final ayahs = surah['ayahs'] as List<dynamic>;
    final ayahNumber = random.nextInt(ayahs.length);

    return ayahs[ayahNumber]['text'];
  }
}
