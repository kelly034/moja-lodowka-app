import 'package:url_launcher/url_launcher.dart';

Future<void> openInBrowser(String urlString) async {
  final Uri url = Uri.parse(urlString);

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw "Nie można otworzyć strony";
  }
}
