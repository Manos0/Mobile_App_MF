import 'package:flutter/material.dart';

import '../bin/api_addresses.dart';

fundDetailImage(image) {
  if (image != null && image.length > 0) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        baseUrl + image,
        height: 100,
        width: 100,
        fit: BoxFit.fill,
      ),
    );
  } else {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.asset(
        'assets/images/helperImage.png',
        height: 100,
        width: 100,
      ),
    );
  }
}

double fundPercentage(fundRaised, goalAmount) {
  double percentage = 0;
  if (fundRaised > 0 && goalAmount > 0) {
    if (fundRaised <= goalAmount) {
      percentage = ((fundRaised * 100) / goalAmount) / 100;
    } else {
      percentage = 1;
    }
  } else {
    percentage = 0;
  }
  return percentage = num.parse(percentage.toStringAsFixed(4));
}

fundImage(image) {
  if (image != null && image.length > 0) {
    return NetworkImage(baseUrl + image);
  } else {
    return AssetImage('assets/images/helperImage.png');
  }
}

yourfundImage(image) {
  if (image != null && image.length > 0) {
    return NetworkImage(baseUrl + image);
  } else {
    return AssetImage('assets/images/helperImage.png');
  }
}

myFundImage(image) {
  if (image != null && image.length > 0) {
    return NetworkImage(baseUrl + image);
  } else {
    return AssetImage('assets/images/helperImage.png');
  }
}
