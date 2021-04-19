import 'package:flutter/material.dart';

//Ta teloi apo ta API tha prepei na einai dynamic

const loginCall =
    'https://mfdev.t-worxsites.com/DesktopModules/JwtAuth/API/mobile/login';
const getFeatured =
    'https://mfdev.t-worxsites.com/DesktopModules/sff/api/Mobile/GetFeatured';
const takeFirst =
    'https://mfdev.t-worxsites.com/DesktopModules/sff/api/Mobile/UserPagedOrdered?take=';
const takeNext5 =
    'https://mfdev.t-worxsites.com/DesktopModules/sff/api/Mobile/UserPaged?take=5&skip=5&closed=false&draft=false';
const activeCounter =
    'https://mfdev.t-worxsites.com/DesktopModules/sff/api/Mobile/Count?closed=false';
const userDetails =
    'https://mfdev.t-worxsites.com/DesktopModules/sff/api/Mobile/GetUserDetails';
const userStats =
    'https://mfdev.t-worxsites.com/DesktopModules/sff/api/Mobile/GetUsertats';

String getTakeFirstAPI(take) {
  return takeFirst + take;
}
