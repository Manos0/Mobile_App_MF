const baseUrl = 'https://mfdev.t-worxsites.com/';
const loginCall = '/DesktopModules/JwtAuth/API/mobile/login';
const getFeatured = '/DesktopModules/sff/api/Mobile/GetFeatured';
const takeFirst5 = '/DesktopModules/sff/api/Mobile/UserPagedOrdered?take=';
const takeNext5 =
    '/DesktopModules/sff/api/Mobile/UserPaged?take=5&skip=5&closed=false&draft=false';
const activeCounter = '/DesktopModules/sff/api/Mobile/Count?closed=false';
const userDetails = '/DesktopModules/sff/api/Mobile/GetUserDetails';
const userStats = '/DesktopModules/sff/api/Mobile/GetUsertats';
const fundDetails =
    '/DesktopModules/sff/api/Mobile/GetFundraiser?fundraiserId=';
const searchFund = '/DesktopModules/sff/api/Mobile/FindFundraiser?text=';
const userData = '/DesktopModules/sff/api/Mobile/GetUserStats?fundraiserCount=';
const locations = '/DesktopModules/sff/API/Locations';
const getStats = '/DesktopModules/sff/api/Mobile/GetStats';
const createNewFundraiser = '/DesktopModules/sff/API/Fundraisers';
const renewTokenUrl = 'DesktopModules/JwtAuth/API/mobile/extendtoken';
