import 'package:home_widget/home_widget.dart';
import '../models/hadith_models.dart';

class WidgetService {
  WidgetService._();

  static const String _androidWidgetName = 'WirdiWidgetProvider';
  static const String _iosWidgetName = 'WirdiWidget';

  static Future<void> updateHadith(HadithModel hadith) async {
    try {
      await HomeWidget.saveWidgetData<String>('hadith_text', hadith.translatedText);
      await HomeWidget.saveWidgetData<String>('hadith_arabic', hadith.arabicText);
      await HomeWidget.updateWidget(
        androidName: _androidWidgetName,
        iOSName: _iosWidgetName,
      );
    } catch (e) {
      // Silent fail for widgets
    }
  }
}
