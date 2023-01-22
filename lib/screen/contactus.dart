library contactus;

import 'package:cardoctor/res/color.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  final ImageProvider? logo;
  final Image? image;
  final String? phoneNumber;
  final String? phoneNumberText;
  final String? website;
  final String? websiteText;
  final String email;
  final String? emailText;
  final String? twitterHandle;
  final String? facebookHandle;
  final String? linkedinURL;
  final String? githubUserName;
  final String companyName;
  final double? companyFontSize;
  final String? tagLine;
  final String? instagram;
  final Color textColor;
  final Color cardColor;
  final Color companyColor;
  final Color taglineColor;
  final String? textFont;
  final String? companyFont;
  final String? taglineFont;
  final Color? dividerColor;
  final double? dividerThickness;
  final FontWeight? companyFontWeight;
  final FontWeight? taglineFontWeight;
  final double? avatarRadius;

  ContactUs({
    required this.companyName,
    required this.textColor,
    required this.cardColor,
    required this.companyColor,
    required this.taglineColor,
    required this.email,
    this.emailText,
    this.logo,
    this.image,
    this.phoneNumber,
    this.phoneNumberText,
    this.website,
    this.websiteText,
    this.twitterHandle,
    this.facebookHandle,
    this.linkedinURL,
    this.githubUserName,
    this.tagLine,
    this.instagram,
    this.companyFontSize,
    this.textFont,
    this.companyFont,
    this.taglineFont,
    this.dividerColor,
    this.companyFontWeight,
    this.taglineFontWeight,
    this.avatarRadius,
    this.dividerThickness,
  });

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 8.0,
          contentPadding: EdgeInsets.all(18.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => launch('tel:' + phoneNumber!),
                  child: Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    child: Text('Call'),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () => launch('sms:' + phoneNumber!),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Text('Message'),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () => launch('https://wa.me/' + phoneNumber!),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Text('WhatsApp'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            Positioned(
                top: 20,
                left: 15,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    visible: logo != null,
                    child: CircleAvatar(
                      radius: avatarRadius ?? 50.0,
                      backgroundImage: logo,
                    ),
                  ),
                  Visibility(
                      visible: image != null,
                      child: image ?? SizedBox.shrink()),
                  Text(
                    companyName,
                    style: TextStyle(
                      fontFamily: companyFont ?? 'Pacifico',
                      fontSize: companyFontSize ?? 40.0,
                      color: companyColor,
                      fontWeight: companyFontWeight ?? FontWeight.bold,
                    ),
                  ),
                  Visibility(
                    visible: tagLine != null,
                    child: Text(
                      tagLine ?? "",
                      style: TextStyle(
                        fontFamily: taglineFont ?? 'Pacifico',
                        color: taglineColor,
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        fontWeight: taglineFontWeight ?? FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    color: dividerColor ?? Colors.teal[200],
                    thickness: dividerThickness ?? 4.0,
                    indent: 50.0,
                    endIndent: 50.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Visibility(
                    visible: website != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: cardColor,
                      child: ListTile(
                        leading: Icon(Typicons.link),
                        title: Text(
                          websiteText ?? 'Website',
                          style: TextStyle(
                            color: textColor,
                            fontFamily: textFont,
                          ),
                        ),
                        onTap: () => launch(website!),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: phoneNumber != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: cardColor,
                      child: ListTile(
                        leading: Icon(Typicons.phone),
                        title: Text(
                          phoneNumberText ?? 'Phone Number',
                          style: TextStyle(
                            color: textColor,
                            fontFamily: textFont,
                          ),
                        ),
                        onTap: () => showAlert(context),
                      ),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: cardColor,
                    child: ListTile(
                      leading: Icon(Typicons.mail),
                      title: Text(
                        emailText ?? 'Email ID',
                        style: TextStyle(
                          color: textColor,
                          fontFamily: textFont,
                        ),
                      ),
                      onTap: () => launch('mailto:' + email),
                    ),
                  ),
                  Visibility(
                    visible: twitterHandle != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: cardColor,
                      child: ListTile(
                        leading: Icon(Typicons.social_twitter),
                        title: Text(
                          'Twitter',
                          style: TextStyle(
                            color: textColor,
                            fontFamily: textFont,
                          ),
                        ),
                        onTap: () =>
                            launch('https://twitter.com/' + twitterHandle!),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: facebookHandle != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: cardColor,
                      child: ListTile(
                        leading: Icon(Typicons.social_facebook),
                        title: Text(
                          'Facebook',
                          style: TextStyle(
                            color: textColor,
                            fontFamily: textFont,
                          ),
                        ),
                        onTap: () => launch(
                            'https://www.facebook.com/' + facebookHandle!),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: instagram != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: cardColor,
                      child: ListTile(
                        leading: Icon(Typicons.social_instagram),
                        title: Text(
                          'Instagram',
                          style: TextStyle(
                            color: textColor,
                            fontFamily: textFont,
                          ),
                        ),
                        onTap: () =>
                            launch('https://instagram.com/' + instagram!),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: githubUserName != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: cardColor,
                      child: ListTile(
                        leading: Icon(Typicons.social_github),
                        title: Text(
                          'Github',
                          style: TextStyle(
                            color: textColor,
                            fontFamily: textFont,
                          ),
                        ),
                        onTap: () =>
                            launch('https://github.com/' + githubUserName!),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: linkedinURL != null,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: cardColor,
                      child: ListTile(
                        leading: Icon(Typicons.social_linkedin),
                        title: Text(
                          'Linkedin',
                          style: TextStyle(
                            color: textColor,
                            fontFamily: textFont,
                          ),
                        ),
                        onTap: () => launch(linkedinURL!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

///Class for adding contact details of the developer in your bottomNavigationBar in your flutter app.
class ContactUsBottomAppBar extends StatelessWidget {
  ///Color of the text which will be displayed in the bottomNavigationBar
  final Color textColor;

  ///Color of the background of the bottomNavigationBar
  final Color backgroundColor;

  ///Email ID Of the company/developer on which, when clicked by the user, the respective mail app will be opened.
  final String email;

  ///Name of the company or the developer
  final String companyName;

  ///Size of the font in bottomNavigationBar
  final double fontSize;

  /// font of text
  final String? textFont;

  ContactUsBottomAppBar({
    required this.textColor,
    required this.backgroundColor,
    required this.email,
    required this.companyName,
    this.fontSize = 15.0,
    this.textFont,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        onSurface: Colors.grey,
        shadowColor: Colors.transparent,
      ),
      child: Text(
        'Designed and Developed by $companyName 💙\nWant to contact?',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontFamily: textFont),
      ),
      onPressed: () => launch('mailto:$email'),
    );
  }
}
