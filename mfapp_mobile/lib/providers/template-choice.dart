import 'package:flutter/material.dart';

enum template {
  defaultTemplate,
  fromTheFamily,
  fromTheDeceased,
  suddenPassing,
  ATE
}

class TemplateChoice with ChangeNotifier {
  static String selectedTemplate;

  void selectTemplate(
      String time,
      String date,
      String firstName,
      String nickName,
      String middleName,
      String lastName,
      String locationName,
      String gender,
      String gender2,
      String singPlural,
      String singPlural2,
      String singPlural3,
      String singPlural4,
      template type) {
    if (type == template.defaultTemplate) {
      selectedTemplate =
          'The $lastName family is deeply saddened to announce the passing of $firstName and offers a special way to honor $gender.\n\nIn lieu of flowers, food, sympathy cards or charitable donations the family is requesting donations by clicking on the \'Donate Now\' button in order to allow those who loved and knew $gender the answer to the question...\“Is there anything I can do?\”.\n\nWhile donating you will be able to offer your condolences by writing a message which will appear below as well as choose to remain anonymous.\n\nAll donations are directly deposited to $locationName for complete transparency & security.\n\n$locationName has been entrusted with funeral arrangements.';
    } else if (type == template.fromTheFamily) {
      selectedTemplate =
          '$singPlural deeply saddened to announce the passing of my beloved $firstName $lastName and have decided to honor $gender by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and $singPlural2 thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\nIf you are unable to donate then $singPlural2 ask that you please click and \"Share this Fundraiser\" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n$singPlural3';
    } else if (type == template.fromTheDeceased) {
      selectedTemplate =
          '"Hello Family and Friends. I want to thank everyone for their thoughts and prayers. I know my family and friends will miss me dearly, but this is not goodbye, this is... ‘we will meet again’. Until then, I would truly appreciate, and ask in lieu of flowers, food or charitable donations, that a contribution be made to my fundraiser and... I thank you in advance. In order to donate, please click on the \'Donate\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences as well as choose to have your name or contribution amount remain anonymous.\n\nIf you are unable to donate then I ask that you please click on the ‘Share This Fundraiser’ button located under the ‘Donate Now’ button. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nMay my smile forever stay within your heart.\n\n$firstName${nickName == null ? '' : ' ' + nickName}${middleName == null ? '' : ' ' + middleName} $lastName';
    } else if (type == template.suddenPassing) {
      selectedTemplate =
          '$singPlural deeply saddened to announce the sudden passing of our beloved $firstName $lastName. With this passing being so sudden, $singPlural2 $firstName by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and $singPlural3 thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\nIf you are unable to donate then $singPlural3 ask that you please click and "Share this Fundraiser" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n$singPlural4';
    } else {
      selectedTemplate =
          'In the $time of $date my family and I suffered a major loss. $firstName was an amazing $gender loved by many and will be missed by all. $gender2 untimely passing has left us with many unexpected financial burdens. $singPlural have decided to honor my $firstName by having a memorial fundraiser. In lieu of flowers, food or charitable donations, your contribution will be greatly appreciated and $singPlural thank you in advance. In order to donate, please click on the \'Donate Now\' button. All donations are directly deposited to the funeral home for complete transparency & security. While donating you will be able to write a message, offer your condolences, as well as choose to have your name or contribution anonymous.\n\n If you are unable to donate then $singPlural ask that you please click and "Share this Fundraiser" located under the Donate section. The success of the fundraiser depends on how well it is shared to all social media platforms, email and text.\n\nWarmest Regards and Greatly Appreciated,\n\n$singPlural2';
    }
    notifyListeners();
  }
}
