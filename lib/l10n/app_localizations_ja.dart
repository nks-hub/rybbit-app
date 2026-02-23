// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => 'éå¬å¼';

  @override
  String get cancel => 'ã­ã£ã³ã»ã«';

  @override
  String get delete => 'åé¤';

  @override
  String get save => 'ä¿å­';

  @override
  String get update => 'æ´æ°';

  @override
  String get create => 'ä½æ';

  @override
  String get retry => 'åè©¦è¡';

  @override
  String get add => 'è¿½å ';

  @override
  String get edit => 'ç·¨é';

  @override
  String get clear => 'ã¯ãªã¢';

  @override
  String get apply => 'é©ç¨';

  @override
  String get goBack => 'æ»ã';

  @override
  String get noData => 'ãã¼ã¿ãªã';

  @override
  String get loading => 'èª­ã¿è¾¼ã¿ä¸­';

  @override
  String get logout => 'ã­ã°ã¢ã¦ã';

  @override
  String get close => 'éãã';

  @override
  String get serverUrl => 'ãµã¼ãã¼URL';

  @override
  String get serverUrlHint => 'https://your-rybbit-instance.com';

  @override
  String get email => 'ã¡ã¼ã«ã¢ãã¬ã¹';

  @override
  String get apiKey => 'APIã­ã¼';

  @override
  String get password => 'ãã¹ã¯ã¼ã';

  @override
  String get connect => 'æ¥ç¶';

  @override
  String get connectionFailed => '接続に失敗しました。サーバーURLを確認してください。';

  @override
  String get invalidApiKey => '無効なAPIキー';

  @override
  String get connectionFailedApiKey => '接続に失敗しました。サーバーURLとAPIキーを確認してください。';

  @override
  String get organizations => 'çµç¹';

  @override
  String get noSitesFound => 'ãµã¤ããè¦ã¤ããã¾ãã';

  @override
  String get noSitesHint =>
      'Webããã·ã¥ãã¼ãã§ãµã¤ããè¿½å ãã¦å§ãã¾ãããã';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countãµã¤ã',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return 'ã¡ã³ãã¼ ($count)';
  }

  @override
  String get failedToLoadOrganizations =>
      'çµç¹ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noOrganizations => 'çµç¹ãããã¾ãã';

  @override
  String get noOrganizationsHint =>
      'çµç¹ã¯Webããã·ã¥ãã¼ãã§ä½æã§ãã¾ã';

  @override
  String get failedToLoadMembers =>
      'ã¡ã³ãã¼ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get failedToLoadSites =>
      'ãµã¤ãã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get failedToLoadAnalytics =>
      'ã¢ããªãã£ã¯ã¹ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noDataAvailable => 'å©ç¨å¯è½ãªãã¼ã¿ãããã¾ãã';

  @override
  String get users => 'ã¦ã¼ã¶ã¼';

  @override
  String get sessions => 'ã»ãã·ã§ã³';

  @override
  String get pageviews => 'ãã¼ã¸ãã¥ã¼';

  @override
  String get pagesPerSession => 'ãã¼ã¸/ã»ãã·ã§ã³';

  @override
  String get bounceRate => 'ç´å¸°ç';

  @override
  String get duration => 'æ»å¨æé';

  @override
  String get metrics => 'ææ¨';

  @override
  String get pages => 'ãã¼ã¸';

  @override
  String get referrers => 'ãªãã¡ã©ã¼';

  @override
  String get countries => 'å½';

  @override
  String get devices => 'ããã¤ã¹';

  @override
  String get performance => 'ããã©ã¼ãã³ã¹';

  @override
  String get goals => 'ç®æ¨';

  @override
  String get funnels => 'ãã¡ãã«';

  @override
  String get replay => 'ãªãã¬ã¤';

  @override
  String get config => 'è¨­å®';

  @override
  String usersOnline(int count) {
    return '$countäººã®ã¦ã¼ã¶ã¼ããªã³ã©ã¤ã³';
  }

  @override
  String get events => 'ã¤ãã³ã';

  @override
  String get eventsOverTime => 'ã¤ãã³ãã®æ¨ç§»';

  @override
  String get eventNames => 'ã¤ãã³ãå';

  @override
  String get noCustomEventsTracked =>
      'ã«ã¹ã¿ã ã¤ãã³ãã¯è¨é²ããã¦ãã¾ãã';

  @override
  String get failedToLoadProperties =>
      'ãã­ããã£ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noProperties => 'ãã­ããã£ãããã¾ãã';

  @override
  String get outboundLinks => 'å¤é¨ãªã³ã¯';

  @override
  String get noOutboundLinksTracked =>
      'å¤é¨ãªã³ã¯ã¯è¨é²ããã¦ãã¾ãã';

  @override
  String get failedToLoadChart =>
      'ãã£ã¼ãã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get errors => 'ã¨ã©ã¼';

  @override
  String get failedToLoadErrors =>
      'ã¨ã©ã¼ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noErrorsFound => 'ã¨ã©ã¼ã¯è¦ã¤ããã¾ããã§ãã';

  @override
  String get everythingLooksGood => 'ãã¹ã¦æ­£å¸¸ã§ãï¼';

  @override
  String get occurrences => 'çºçåæ°';

  @override
  String get sessionsAffected => 'å½±é¿ãåããã»ãã·ã§ã³';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'ã¤ãã³ãã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã: $error';
  }

  @override
  String get noEventsFound => 'ã¤ãã³ããè¦ã¤ããã¾ãã';

  @override
  String get failedToLoadFunnels =>
      'ãã¡ãã«ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noFunnelsSaved => 'ä¿å­ããããã¡ãã«ã¯ããã¾ãã';

  @override
  String get createFunnelsHint =>
      'Webããã·ã¥ãã¼ãã§ãã¡ãã«ãä½æãã¦ãã ãã';

  @override
  String get deleteFunnel => 'ãã¡ãã«ãåé¤';

  @override
  String deleteFunnelConfirm(String name) {
    return 'ã$nameããåé¤ãã¾ããï¼';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'ãã¡ãã«ã®åé¤ã«å¤±æãã¾ãã: $error';
  }

  @override
  String get noStepsDefined =>
      'ãã®ãã¡ãã«ã«ã¯ã¹ããããå®ç¾©ããã¦ãã¾ãã';

  @override
  String failedToAnalyze(String error) {
    return 'åæã«å¤±æãã¾ãã: $error';
  }

  @override
  String get overallConversion => 'å¨ä½ã®ã³ã³ãã¼ã¸ã§ã³';

  @override
  String dropoff(String value) {
    return 'é¢è±: $value';
  }

  @override
  String get createGoal => 'ç®æ¨ãä½æ';

  @override
  String get failedToLoadGoals => 'ç®æ¨ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noGoalsConfigured => 'ç®æ¨ãè¨­å®ããã¦ãã¾ãã';

  @override
  String get noGoalsHint =>
      'ï¼ãã¿ãããã¦æ°ããç®æ¨ãä½æãã¦ãã ãã';

  @override
  String get conversions => 'ã³ã³ãã¼ã¸ã§ã³';

  @override
  String get rate => 'ç';

  @override
  String get editGoal => 'ç®æ¨ãç·¨é';

  @override
  String get createGoalTitle => 'ç®æ¨ãä½æ';

  @override
  String get name => 'åå';

  @override
  String get type => 'ã¿ã¤ã';

  @override
  String get path => 'ãã¹';

  @override
  String get event => 'ã¤ãã³ã';

  @override
  String get pathPattern => 'ãã¹ãã¿ã¼ã³';

  @override
  String get eventName => 'ã¤ãã³ãå';

  @override
  String get deleteGoal => 'ç®æ¨ãåé¤';

  @override
  String deleteGoalConfirm(String name) {
    return 'ã$nameããåé¤ãã¾ããï¼';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'ç®æ¨ã®åé¤ã«å¤±æãã¾ãã: $error';
  }

  @override
  String get failedToLoadPerformanceData =>
      'ããã©ã¼ãã³ã¹ãã¼ã¿ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String metricOverTime(String metric) {
    return '$metricã®æ¨ç§»';
  }

  @override
  String get byDimension => 'ãã£ã¡ã³ã·ã§ã³å¥';

  @override
  String get failedToLoadDimensionData =>
      'ãã£ã¡ã³ã·ã§ã³ãã¼ã¿ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get good => 'è¯å¥½';

  @override
  String get needsImprovement => 'æ¹åãå¿è¦';

  @override
  String get poor => 'ä¸è¯';

  @override
  String get largestContentfulPaint => 'Largest Contentful Paint';

  @override
  String get cumulativeLayoutShift => 'Cumulative Layout Shift';

  @override
  String get firstContentfulPaint => 'First Contentful Paint';

  @override
  String get timeToFirstByte => 'Time to First Byte';

  @override
  String get interactionToNextPaint => 'Interaction to Next Paint';

  @override
  String get dimPages => 'ãã¼ã¸';

  @override
  String get dimCountries => 'å½';

  @override
  String get dimDevices => 'ããã¤ã¹';

  @override
  String get dimBrowsers => 'ãã©ã¦ã¶';

  @override
  String get dimOS => 'OS';

  @override
  String get sessionFilters => 'ã»ãã·ã§ã³ãã£ã«ã¿ã¼';

  @override
  String get minPageviews => 'æå°ãã¼ã¸ãã¥ã¼æ°';

  @override
  String get minEvents => 'æå°ã¤ãã³ãæ°';

  @override
  String get minDurationSeconds => 'æå°æ»å¨æéï¼ç§ï¼';

  @override
  String get failedToLoadSessions =>
      'ã»ãã·ã§ã³ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noSessionsFound => 'ã»ãã·ã§ã³ãè¦ã¤ããã¾ãã';

  @override
  String get filterSessions => 'ã»ãã·ã§ã³ããã£ã«ã¿ã¼';

  @override
  String get loadingMoreSessions => 'ã»ãã·ã§ã³ãè¿½å èª­ã¿è¾¼ã¿ä¸­';

  @override
  String entryPage(String page) {
    return 'å¥å£ãã¼ã¸: $page';
  }

  @override
  String nPages(int count) {
    return '$countãã¼ã¸';
  }

  @override
  String get sessionReplays => 'ã»ãã·ã§ã³ãªãã¬ã¤';

  @override
  String get failedToLoadReplays =>
      'ãªãã¬ã¤ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noReplaysFound => 'ãªãã¬ã¤ãè¦ã¤ããã¾ãã';

  @override
  String get noReplaysHint =>
      'ã»ãã·ã§ã³ãªãã¬ã¤ãæå¹ã«ãªãã¨ãããã«è¡¨ç¤ºããã¾ãã';

  @override
  String get previousPage => 'åã®ãã¼ã¸';

  @override
  String get nextPage => 'æ¬¡ã®ãã¼ã¸';

  @override
  String pageNumber(int number) {
    return '$numberãã¼ã¸';
  }

  @override
  String get unknownBrowser => 'ä¸æãªãã©ã¦ã¶';

  @override
  String get unknownCountry => 'ä¸æãªå½';

  @override
  String get sortUsers => 'ã¦ã¼ã¶ã¼ãä¸¦ã³æ¿ã';

  @override
  String get showAllUsers => 'ãã¹ã¦ã®ã¦ã¼ã¶ã¼ãè¡¨ç¤º';

  @override
  String get showIdentifiedOnly => 'è­å¥æ¸ã¿ã®ã¿è¡¨ç¤º';

  @override
  String get searchUsers => 'ã¦ã¼ã¶ã¼ãæ¤ç´¢';

  @override
  String get searchUsersHint => 'ã¦ã¼ã¶ã¼ãæ¤ç´¢...';

  @override
  String get clearSearch => 'æ¤ç´¢ãã¯ãªã¢';

  @override
  String get failedToLoadUsers =>
      'ã¦ã¼ã¶ã¼ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noUsersFound => 'ã¦ã¼ã¶ã¼ãè¦ã¤ããã¾ãã';

  @override
  String get noIdentifiedUsers => 'è­å¥æ¸ã¿ã¦ã¼ã¶ã¼ããã¾ãã';

  @override
  String get usersWillAppear =>
      'ã¦ã¼ã¶ã¼ãè­å¥ãããã¨ãããã«è¡¨ç¤ºããã¾ã';

  @override
  String get tryDifferentSearch =>
      'å¥ã®æ¤ç´¢ã­ã¼ã¯ã¼ãããè©¦ããã ãã';

  @override
  String get sortedBy => 'ä¸¦ã³é ';

  @override
  String get loadingMoreUsers => 'ã¦ã¼ã¶ã¼ãè¿½å èª­ã¿è¾¼ã¿ä¸­';

  @override
  String get lastSeen => 'æçµç¢ºèª';

  @override
  String get firstSeen => 'ååç¢ºèª';

  @override
  String nUsers(String count) {
    return '$countäººã®ã¦ã¼ã¶ã¼';
  }

  @override
  String nSessions(int count) {
    return '$countã»ãã·ã§ã³';
  }

  @override
  String lastPrefix(String value) {
    return 'åå: $value';
  }

  @override
  String get failedToLoadSiteConfig =>
      'ãµã¤ãè¨­å®ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get failedToLoadMetrics =>
      'ææ¨ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get loadingMoreMetrics => 'ææ¨ãè¿½å èª­ã¿è¾¼ã¿ä¸­';

  @override
  String noMetricData(String metric) {
    return '$metricã®ãã¼ã¿ãããã¾ãã';
  }

  @override
  String get settings => 'è¨­å®';

  @override
  String get connection => 'æ¥ç¶';

  @override
  String get notConfigured => 'æªè¨­å®';

  @override
  String get authMethod => 'èªè¨¼æ¹å¼';

  @override
  String get sessionCookie => 'ã»ãã·ã§ã³Cookie';

  @override
  String get loggedInAs => 'ã­ã°ã¤ã³ä¸­';

  @override
  String get unknown => 'ä¸æ';

  @override
  String get appearance => 'å¤è¦³';

  @override
  String get theme => 'ãã¼ã';

  @override
  String get dark => 'ãã¼ã¯';

  @override
  String get light => 'ã©ã¤ã';

  @override
  String get auto => 'èªå';

  @override
  String get about => 'æå ±';

  @override
  String get appVersion => 'ã¢ããªãã¼ã¸ã§ã³';

  @override
  String get openSourceAnalytics =>
      'ãªã¼ãã³ã½ã¼ã¹ã®ã¦ã§ãã¢ããªãã£ã¯ã¹';

  @override
  String get logoutConfirm =>
      'ã­ã°ã¢ã¦ããã¦ãããããã§ããï¼';

  @override
  String get siteSettings => 'ãµã¤ãè¨­å®';

  @override
  String get siteInformation => 'ãµã¤ãæå ±';

  @override
  String get domain => 'ãã¡ã¤ã³';

  @override
  String get siteId => 'Ã£ÂÂµÃ£ÂÂ¤Ã£ÂÂID';

  @override
  String siteLabel(String id) {
    return 'サイト $id';
  }

  @override
  String get created => 'ä½ææ¥';

  @override
  String get trackingSettings => 'ãã©ãã­ã³ã°è¨­å®';

  @override
  String get publicDashboard => 'å¬éããã·ã¥ãã¼ã';

  @override
  String get publicDashboardDesc =>
      'ã¢ããªãã£ã¯ã¹ã¸ã®å¬éã¢ã¯ã»ã¹ãè¨±å¯ãã¾ã';

  @override
  String get sessionReplay => 'ã»ãã·ã§ã³ãªãã¬ã¤';

  @override
  String get sessionReplayDesc =>
      'ã¦ã¼ã¶ã¼ã»ãã·ã§ã³ãè¨é²ãã¾ã';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Core Web Vitalsãè¨æ¸¬ãã¾ã';

  @override
  String get trackErrors => 'ã¨ã©ã¼è¿½è·¡';

  @override
  String get trackErrorsDesc =>
      'JavaScriptã¨ã©ã¼ãã­ã£ããã£ãã¾ã';

  @override
  String get outboundLinksTracking => 'å¤é¨ãªã³ã¯';

  @override
  String get outboundLinksDesc =>
      'å¤é¨ãªã³ã¯ã®ã¯ãªãã¯ãè¿½è·¡ãã¾ã';

  @override
  String get excludedIps => 'é¤å¤IP';

  @override
  String get excludedCountries => 'é¤å¤ããå½';

  @override
  String get settingsSaved => 'è¨­å®ãä¿å­ãã¾ãã';

  @override
  String failedToSave(String error) {
    return 'ä¿å­ã«å¤±æãã¾ãã: $error';
  }

  @override
  String get timeRange => 'æé';

  @override
  String get today => 'ä»æ¥';

  @override
  String get yesterday => 'æ¨æ¥';

  @override
  String get last7Days => 'éå»7æ¥é';

  @override
  String get last30Days => 'éå»30æ¥é';

  @override
  String get thisWeek => 'ä»é±';

  @override
  String get thisMonth => 'ä»æ';

  @override
  String get thisYear => 'ä»å¹´';

  @override
  String get customRange => 'ã«ã¹ã¿ã æé';

  @override
  String get allTime => '全期間';

  @override
  String lastMinutes(int count) {
    return '過去$count分';
  }

  @override
  String get notSet => '(未設定)';

  @override
  String get bouncePrefix => '直帰率';

  @override
  String get timePrefix => '時間';

  @override
  String get eventTypePageview => 'ページビュー';

  @override
  String get eventTypeCustom => 'カスタム';

  @override
  String get eventTypeOutbound => 'アウトバウンド';

  @override
  String get eventTypeClick => 'クリック';

  @override
  String get eventTypeForm => 'フォーム';

  @override
  String get eventTypeInput => '入力';

  @override
  String get eventTypeCopy => 'コピー';

  @override
  String get filter => 'ãã£ã«ã¿ã¼';

  @override
  String get addFilter => 'ãã£ã«ã¿ã¼ãè¿½å ';

  @override
  String get parameter => 'ãã©ã¡ã¼ã¿ã¼';

  @override
  String get value => 'å¤';

  @override
  String get enterFilterValue =>
      'ãã£ã«ã¿ã¼ã®å¤ãå¥åãã¦ãã ãã';

  @override
  String get filterBrowser => 'ブラウザ';

  @override
  String get filterOs => 'OS';

  @override
  String get filterLanguage => '言語';

  @override
  String get filterCountry => '国';

  @override
  String get filterRegion => '地域';

  @override
  String get filterCity => '都市';

  @override
  String get filterDeviceType => 'デバイスタイプ';

  @override
  String get filterReferrer => 'リファラー';

  @override
  String get filterHostname => 'ホスト名';

  @override
  String get filterPathname => 'パス';

  @override
  String get filterPageTitle => 'ページタイトル';

  @override
  String get filterQuerystring => 'クエリ文字列';

  @override
  String get filterEventName => 'イベント名';

  @override
  String get filterChannel => 'チャネル';

  @override
  String get filterUtmSource => 'UTMソース';

  @override
  String get filterUtmMedium => 'UTMメディア';

  @override
  String get filterUtmCampaign => 'UTMキャンペーン';

  @override
  String get filterUtmTerm => 'UTM用語';

  @override
  String get filterUtmContent => 'UTMコンテンツ';

  @override
  String get filterEntryPage => 'エントリーページ';

  @override
  String get filterExitPage => '離脱ページ';

  @override
  String get requestTimedOut =>
      'ãªã¯ã¨ã¹ããã¿ã¤ã ã¢ã¦ããã¾ãããååº¦ãè©¦ããã ããã';

  @override
  String get networkError =>
      'ãããã¯ã¼ã¯ã¨ã©ã¼ã§ããæ¥ç¶ãç¢ºèªãã¦ãã ããã';

  @override
  String get sessionExpired =>
      'ã»ãã·ã§ã³ã®æå¹æéãåãã¾ãããååº¦ã­ã°ã¤ã³ãã¦ãã ããã';

  @override
  String get accessDenied => 'ã¢ã¯ã»ã¹ãæå¦ããã¾ããã';

  @override
  String get dataNotFound => 'ãã¼ã¿ãè¦ã¤ããã¾ããã';

  @override
  String get serverError =>
      'ãµã¼ãã¼ã¨ã©ã¼ã§ãããã°ãããã¦ããååº¦ãè©¦ããã ããã';

  @override
  String get failedToLoadGeneric =>
      'ãã¼ã¿ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãããååº¦ãè©¦ããã ããã';

  @override
  String chartDataPoints(int count) {
    return '$countãã¼ã¿ãã¤ã³ãã®ãã£ã¼ã';
  }

  @override
  String previousPrefix(String value) {
    return 'åå: $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'ããã©ã¼ãã³ã¹è©ä¾¡: $rating';
  }

  @override
  String get loadingContent => 'ã³ã³ãã³ããèª­ã¿è¾¼ã¿ä¸­';

  @override
  String get language => 'è¨èª';

  @override
  String get selectLanguage => 'è¨èªãé¸æ';

  @override
  String get failedToLoadUserDetails =>
      'ã¦ã¼ã¶ã¼è©³ç´°ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String lastSeenPrefix(String value) {
    return 'æçµé²è¦§: $value';
  }

  @override
  String get traits => 'å±æ§';

  @override
  String get noTraits => 'ãã®ã¦ã¼ã¶ã¼ã®å±æ§ã¯ããã¾ãã';

  @override
  String get sessionDetail => 'ã»ãã·ã§ã³è©³ç´°';

  @override
  String get failedToLoadSession =>
      'ã»ãã·ã§ã³ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get entryPageLabel => 'å¥å£ãã¼ã¸';

  @override
  String get exitPage => 'åºå£ãã¼ã¸';

  @override
  String get browserAndDevice => 'ãã©ã¦ã¶ã¨ããã¤ã¹';

  @override
  String get browser => 'ãã©ã¦ã¶';

  @override
  String get os => 'OS';

  @override
  String get device => 'ããã¤ã¹';

  @override
  String get sourceLabel => 'ã½ã¼ã¹';

  @override
  String get referrer => 'ãªãã¡ã©ã¼';

  @override
  String eventTimelineCount(int count) {
    return 'ã¤ãã³ãã¿ã¤ã ã©ã¤ã³ ($count)';
  }

  @override
  String get noEvents => 'ã¤ãã³ããªã';

  @override
  String get replayEventsTitle => 'ãªãã¬ã¤ã¤ãã³ã';

  @override
  String get failedToLoadReplay =>
      'ãªãã¬ã¤ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noReplayEvents => 'ãªãã¬ã¤ã¤ãã³ããªã';

  @override
  String get totalEvents => 'ã¤ãã³ãåè¨';

  @override
  String get userActionsLabel => 'ã¦ã¼ã¶ã¼ã¢ã¯ã·ã§ã³';

  @override
  String eventTimelineActions(int count) {
    return 'ã¤ãã³ãã¿ã¤ã ã©ã¤ã³ ($countã¢ã¯ã·ã§ã³)';
  }

  @override
  String get eventLog => 'ã¤ãã³ãã­ã°';

  @override
  String get viewEventLog => 'ã¤ãã³ãã­ã°ãè¡¨ç¤º';

  @override
  String get failedToLoadEventLog =>
      'ã¤ãã³ãã­ã°ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get activityHeatmap => 'ãã¼ãããã';

  @override
  String get heatmapLast4Weeks => 'éå»4é±é';

  @override
  String get less => 'å°ãªã';

  @override
  String get more => 'å¤ã';

  @override
  String get peakActivity => 'ãã¼ã¯ã¢ã¯ãã£ããã£';

  @override
  String peakHour(String day, String time) {
    return '$day $time';
  }

  @override
  String busiestDay(String day) {
    return 'æãå¿ããæ¥: $day';
  }

  @override
  String get dayMon => 'æ';

  @override
  String get dayTue => 'ç«';

  @override
  String get dayWed => 'æ°´';

  @override
  String get dayThu => 'æ¨';

  @override
  String get dayFri => 'é';

  @override
  String get daySat => 'å';

  @override
  String get daySun => 'æ¥';

  @override
  String get searchEvents => 'ã¤ãã³ããæ¤ç´¢...';

  @override
  String get allTypes => 'ãã¹ã¦';

  @override
  String get noMatchingEvents => 'ä¸è´ããã¤ãã³ããããã¾ãã';

  @override
  String get liveView => 'ã©ã¤ã';

  @override
  String get autoRefresh => 'èªåæ´æ°';

  @override
  String get usersOnlineNow => 'ç¾å¨ãªã³ã©ã¤ã³ã®ã¦ã¼ã¶ã¼';

  @override
  String lastUpdatedAt(String time) {
    return '$time ã«æ´æ°';
  }

  @override
  String get last30Minutes => 'éå»30å';

  @override
  String get last5Minutes => 'éå»5å';

  @override
  String get recentEvents => 'æè¿ã®ã¤ãã³ã';

  @override
  String get noRecentEvents => 'æè¿ã®ã¤ãã³ãã¯ããã¾ãã';

  @override
  String get retention => 'ãªãã³ã·ã§ã³';

  @override
  String get weekly => 'é±æ¬¡';

  @override
  String get daily => 'æ¥æ¬¡';

  @override
  String get retentionRange => 'ç¯å²';

  @override
  String retentionDays(int count) {
    return '$countæ¥é';
  }

  @override
  String get failedToLoadRetention =>
      'ãªãã³ã·ã§ã³ãã¼ã¿ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noRetentionData => 'ãªãã³ã·ã§ã³ãã¼ã¿ãªã';

  @override
  String get cohort => 'ã³ãã¼ã';

  @override
  String get retentionWeekPrefix => 'W';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => 'ã¸ã£ã¼ãã¼';

  @override
  String get journeySteps => 'ã¹ããã';

  @override
  String get failedToLoadJourneys =>
      'ã¸ã£ã¼ãã¼ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noJourneysFound => 'ã¸ã£ã¼ãã¼ãè¦ã¤ããã¾ãã';

  @override
  String journeySessions(String count) {
    return '$countã»ãã·ã§ã³';
  }

  @override
  String get locations => 'ã­ã±ã¼ã·ã§ã³';

  @override
  String get locationCities => 'é½å¸';

  @override
  String get failedToLoadLocations =>
      'ã­ã±ã¼ã·ã§ã³ã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noLocationsFound => 'ã­ã±ã¼ã·ã§ã³ãè¦ã¤ããã¾ãã';

  @override
  String get coreFeatures => 'ã³ã¢';

  @override
  String get insights => 'ã¤ã³ãµã¤ã';

  @override
  String get tools => 'ãã¼ã«';

  @override
  String get userTraits => 'ãã¬ã¤ã';

  @override
  String get failedToLoadUserTraits =>
      'ã¦ã¼ã¶ã¼ãã¬ã¤ãã®èª­ã¿è¾¼ã¿ã«å¤±æãã¾ãã';

  @override
  String get noUserTraits => 'ãã¬ã¤ããè¦ã¤ããã¾ãã';

  @override
  String get noUserTraitsHint =>
      'ã«ã¹ã¿ã ãã­ããã£ã§ã¦ã¼ã¶ã¼ãè­å¥ãããã¨è¡¨ç¤ºããã¾ã';

  @override
  String traitUsersCount(String count) {
    return '$countã¦ã¼ã¶ã¼';
  }

  @override
  String get dashboard => 'ダッシュボード';

  @override
  String get analytics => 'アナリティクス';

  @override
  String get noSiteSelected => 'サイトが選択されていません';

  @override
  String selectSiteFromDashboard(String tabName) {
    return '$tabNameを表示するにはダッシュボードタブからサイトを選択してください。';
  }

  @override
  String get goToDashboard => 'ダッシュボードへ';

  @override
  String todayVisitors(int count) {
    return '今日$count人';
  }

  @override
  String get entryPages => '入口ページ';

  @override
  String get exitPages => '出口ページ';

  @override
  String get browsers => 'ブラウザ';

  @override
  String get operatingSystems => 'OS';

  @override
  String get utmSource => 'UTMソース';

  @override
  String get channel => 'チャネル';

  @override
  String get pageTitles => 'ページタイトル';

  @override
  String get sources => 'ソース';

  @override
  String get cities => '都市';

  @override
  String get languages => '言語';

  @override
  String get hostnames => 'ホスト名';

  @override
  String get vpn => 'VPN';

  @override
  String get crawlers => 'クローラー';

  @override
  String get datacenters => 'データセンター';

  @override
  String get companies => '企業';

  @override
  String get companyType => '企業タイプ';

  @override
  String get companyDomain => '企業ドメイン';

  @override
  String get asnOrg => 'ASN組織';

  @override
  String get asnType => 'ASNタイプ';

  @override
  String get asnDomain => 'ASNドメイン';

  @override
  String get utmMedium => 'UTMメディア';

  @override
  String get utmCampaign => 'UTMキャンペーン';

  @override
  String nMoreItems(int count) {
    return '+$count件';
  }

  @override
  String sessionsWithPercentage(String count, String percentage) {
    return '$countセッション ($percentage%)';
  }

  @override
  String errorGeneric(String error) {
    return 'エラー: $error';
  }

  @override
  String get replayPageSnapshot => 'ページスナップショット';

  @override
  String get replayPageLoad => 'ページ読み込み';

  @override
  String get replayCustomEvent => 'カスタムイベント';

  @override
  String get replayPluginEvent => 'プラグインイベント';

  @override
  String get replayInteraction => 'インタラクション';

  @override
  String get replayScroll => 'スクロール';

  @override
  String get replayResize => 'リサイズ';

  @override
  String get replayInput => '入力';

  @override
  String get replayUpdate => '更新';

  @override
  String get url => 'URL';

  @override
  String get searchSites => 'サイトを検索...';

  @override
  String get sortSites => 'サイトを並べ替え';

  @override
  String get sortAlphabetically => 'アルファベット順';

  @override
  String get sortByCount => '件数順';

  @override
  String get sortByVisitors => '今日の訪問者数順';

  @override
  String get sortByLiveUsers => 'オンラインユーザー数順';

  @override
  String get noMatchingSites => '該当するサイトがありません';

  @override
  String get utmTerm => 'UTMターム';

  @override
  String get utmContent => 'UTMコンテンツ';

  @override
  String get browserVersions => 'ブラウザバージョン';

  @override
  String get osVersions => 'OSバージョン';

  @override
  String get screenDimensions => '画面サイズ';

  @override
  String get relativeNow => '今';

  @override
  String relativeMinutes(int count) {
    return '$count分';
  }

  @override
  String relativeHours(int count) {
    return '$count時間';
  }

  @override
  String relativeDays(int count) {
    return '$count日';
  }

  @override
  String relativeWeeks(int count) {
    return '$count週';
  }

  @override
  String get emptyValue => '(空)';
}
