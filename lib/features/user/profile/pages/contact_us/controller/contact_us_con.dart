import 'package:url_launcher/url_launcher.dart';

class ContactUsCon{
  void launchDialer() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: "+918623072648",
    );

    // Check if the device can launch the dialer
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $launchUri';
    }
  }
  void launchEmail() async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: "mhmarkethub@gmail.com",
      query: Uri.encodeQueryComponent('subject=FeedBack'),
    );

    // Check if the device can launch the email client
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $launchUri';
    }
  }
}