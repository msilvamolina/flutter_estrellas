import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class Links {
  Links._();

  static openHelpWhatsApp() {
    sendMessage("+573228212789", "¿Necesitas ayuda?");
  }

  static void sendMessage(String phoneNumber, String message) async {
    final whatsappUrl =
        "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw "Could not launch $whatsappUrl";
    }
  }
}
