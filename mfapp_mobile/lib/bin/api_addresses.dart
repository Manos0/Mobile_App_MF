class ApiProvider {
  static const baseUrl = 'https://giveamemorialgift.com';
  static const loginCall = '/DesktopModules/JwtAuth/API/mobile/login';
  static const getFeatured = '/DesktopModules/sff/api/Mobile/GetFeatured';
  static const takeFirst5 =
      '/DesktopModules/sff/api/Mobile/UserPagedOrdered?take=';
  static const takeNext5 =
      '/DesktopModules/sff/api/Mobile/UserPaged?take=5&skip=5&closed=false&draft=false';
  static const activeCounter =
      '/DesktopModules/sff/api/Mobile/Count?closed=false';
  static const userDetails = '/DesktopModules/sff/api/Mobile/GetUserDetails';
  static const userStats = '/DesktopModules/sff/api/Mobile/GetUsertats';
  static const fundDetails =
      '/DesktopModules/sff/api/Mobile/GetFundraiser?fundraiserId=';
  static const searchFund =
      '/DesktopModules/sff/api/Mobile/FindFundraiser?text=';
  static const userData =
      '/DesktopModules/sff/api/Mobile/GetUserStats?fundraiserCount=';
  static const locations = '/DesktopModules/sff/api/Mobile/GetUserLocations';
  static const getStats = '/DesktopModules/sff/api/Mobile/GetStats';
  static const createNewFundraiser = '/DesktopModules/sff/API/Fundraisers';
  static const editExistingFundraiser =
      '/DesktopModules/sff/api/Mobile/UpdateFundraiser';
  static const createPayout = '/DesktopModules/sff/api/Mobile/CreatePayout';
  static const renewTokenUrl = 'DesktopModules/JwtAuth/API/mobile/extendtoken';
  static const payoutAndCloseFund =
      '/DesktopModules/sff/API/Admin/CloseFundraiser?fundraiserId=';
}
