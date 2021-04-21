import 'package:flutter/material.dart';

const baseUrl = 'https://mfdev.t-worxsites.com';
const loginCall = '/DesktopModules/JwtAuth/API/mobile/login';
const getFeatured = '/DesktopModules/sff/api/Mobile/GetFeatured';
const takeFirst5 = '/DesktopModules/sff/api/Mobile/UserPagedOrdered?take=5';
const takeNext5 =
    '/DesktopModules/sff/api/Mobile/UserPaged?take=5&skip=5&closed=false&draft=false';
const activeCounter = '/DesktopModules/sff/api/Mobile/Count?closed=false';
const userDetails = '/DesktopModules/sff/api/Mobile/GetUserDetails';
const userStats = '/DesktopModules/sff/api/Mobile/GetUsertats';
const fundDetails =
    '/DesktopModules/sff/api/Mobile/GetFundraiser?fundraiserId=';
