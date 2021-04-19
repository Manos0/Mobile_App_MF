import 'package:flutter/material.dart';

//Ta teloi apo ta API tha prepei na einai dynamic

const loginCall = '/DesktopModules/JwtAuth/API/mobile/login';
const getFeatured = '/DesktopModules/sff/api/Mobile/GetFeatured';
const takeFirst = '/DesktopModules/sff/api/Mobile/UserPagedOrdered?take=';
const takeNext5 =
    '/DesktopModules/sff/api/Mobile/UserPaged?take=5&skip=5&closed=false&draft=false';
const activeCounter = '/DesktopModules/sff/api/Mobile/Count?closed=false';
const userDetails = '/DesktopModules/sff/api/Mobile/GetUserDetails';
const userStats = '/DesktopModules/sff/api/Mobile/GetUsertats';

String getTakeFirstAPI(take) {
  return takeFirst + take;
}
