// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => 'éå®æ¹';

  @override
  String get cancel => 'åæ¶';

  @override
  String get delete => 'å é¤';

  @override
  String get save => 'ä¿å­';

  @override
  String get update => 'æ´æ°';

  @override
  String get create => 'åå»º';

  @override
  String get retry => 'éè¯';

  @override
  String get add => 'æ·»å ';

  @override
  String get edit => 'ç¼è¾';

  @override
  String get clear => 'æ¸é¤';

  @override
  String get apply => 'åºç¨';

  @override
  String get goBack => 'è¿å';

  @override
  String get noData => 'ææ æ°æ®';

  @override
  String get loading => 'å è½½ä¸­';

  @override
  String get logout => 'éåºç»å½';

  @override
  String get close => 'å³é­';

  @override
  String get serverUrl => 'æå¡å¨ URL';

  @override
  String get serverUrlHint => 'https://your-rybbit-instance.com';

  @override
  String get email => 'é®ç®±';

  @override
  String get apiKey => 'API å¯é¥';

  @override
  String get password => 'å¯ç ';

  @override
  String get connect => 'è¿æ¥';

  @override
  String get connectionFailed => '连接失败。请检查服务器 URL。';

  @override
  String get invalidApiKey => '无效的 API 密钥';

  @override
  String get connectionFailedApiKey => '连接失败。请检查服务器 URL 和 API 密钥。';

  @override
  String get organizations => 'ç»ç»';

  @override
  String get noSitesFound => 'æªæ¾å°ç«ç¹';

  @override
  String get noSitesHint =>
      'å¨ Web ä»ªè¡¨æ¿ä¸­æ·»å ç«ç¹ä»¥å¼å§ä½¿ç¨ã';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ä¸ªç«ç¹',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return 'æå ($count)';
  }

  @override
  String get failedToLoadOrganizations => 'å è½½ç»ç»å¤±è´¥';

  @override
  String get noOrganizations => 'ææ ç»ç»';

  @override
  String get noOrganizationsHint => 'å¯ä»¥å¨ Web ä»ªè¡¨æ¿ä¸­åå»ºç»ç»';

  @override
  String get failedToLoadMembers => 'å è½½æåå¤±è´¥';

  @override
  String get failedToLoadSites => 'å è½½ç«ç¹å¤±è´¥';

  @override
  String get failedToLoadAnalytics => 'å è½½åææ°æ®å¤±è´¥';

  @override
  String get noDataAvailable => 'ææ å¯ç¨æ°æ®';

  @override
  String get users => 'ç¨æ·';

  @override
  String get sessions => 'ä¼è¯';

  @override
  String get pageviews => 'é¡µé¢æµè§é';

  @override
  String get pagesPerSession => 'é¡µé¢/ä¼è¯';

  @override
  String get bounceRate => 'è·³åºç';

  @override
  String get duration => 'æ¶é¿';

  @override
  String get metrics => 'ææ ';

  @override
  String get pages => 'é¡µé¢';

  @override
  String get referrers => 'å¼èæ¥æº';

  @override
  String get countries => 'å½å®¶/å°åº';

  @override
  String get devices => 'è®¾å¤';

  @override
  String get performance => 'æ§è½';

  @override
  String get goals => 'ç®æ ';

  @override
  String get funnels => 'æ¼æ';

  @override
  String get replay => 'åæ¾';

  @override
  String get config => 'éç½®';

  @override
  String usersOnline(int count) {
    return '$count ä½ç¨æ·å¨çº¿';
  }

  @override
  String get events => 'äºä»¶';

  @override
  String get eventsOverTime => 'äºä»¶è¶å¿';

  @override
  String get eventNames => 'äºä»¶åç§°';

  @override
  String get noCustomEventsTracked => 'æªè·è¸ªèªå®ä¹äºä»¶';

  @override
  String get failedToLoadProperties => 'å è½½å±æ§å¤±è´¥';

  @override
  String get noProperties => 'ææ å±æ§';

  @override
  String get outboundLinks => 'å¤é¨é¾æ¥';

  @override
  String get noOutboundLinksTracked => 'æªè·è¸ªå¤é¨é¾æ¥';

  @override
  String get failedToLoadChart => 'å è½½å¾è¡¨å¤±è´¥';

  @override
  String get errors => 'éè¯¯';

  @override
  String get failedToLoadErrors => 'å è½½éè¯¯å¤±è´¥';

  @override
  String get noErrorsFound => 'æªåç°éè¯¯';

  @override
  String get everythingLooksGood => 'ä¸åæ­£å¸¸ï¼';

  @override
  String get occurrences => 'åçæ¬¡æ°';

  @override
  String get sessionsAffected => 'åå½±åçä¼è¯';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'å è½½äºä»¶å¤±è´¥ï¼$error';
  }

  @override
  String get noEventsFound => 'æªæ¾å°äºä»¶';

  @override
  String get failedToLoadFunnels => 'å è½½æ¼æå¤±è´¥';

  @override
  String get noFunnelsSaved => 'ææ å·²ä¿å­çæ¼æ';

  @override
  String get createFunnelsHint => 'å¨ Web ä»ªè¡¨æ¿ä¸­åå»ºæ¼æ';

  @override
  String get deleteFunnel => 'å é¤æ¼æ';

  @override
  String deleteFunnelConfirm(String name) {
    return 'å é¤\"$name\"ï¼';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'å é¤æ¼æå¤±è´¥ï¼$error';
  }

  @override
  String get noStepsDefined => 'æ­¤æ¼ææªå®ä¹æ­¥éª¤';

  @override
  String failedToAnalyze(String error) {
    return 'åæå¤±è´¥ï¼$error';
  }

  @override
  String get overallConversion => 'æ´ä½è½¬åç';

  @override
  String dropoff(String value) {
    return 'æµå¤±ï¼$value';
  }

  @override
  String get createGoal => 'åå»ºç®æ ';

  @override
  String get failedToLoadGoals => 'å è½½ç®æ å¤±è´¥';

  @override
  String get noGoalsConfigured => 'ææ å·²éç½®çç®æ ';

  @override
  String get noGoalsHint => 'ç¹å» + åå»ºæ°ç®æ ';

  @override
  String get conversions => 'è½¬å';

  @override
  String get rate => 'æ¯ç';

  @override
  String get editGoal => 'ç¼è¾ç®æ ';

  @override
  String get createGoalTitle => 'åå»ºç®æ ';

  @override
  String get name => 'åç§°';

  @override
  String get type => 'ç±»å';

  @override
  String get path => 'è·¯å¾';

  @override
  String get event => 'äºä»¶';

  @override
  String get pathPattern => 'è·¯å¾æ¨¡å¼';

  @override
  String get eventName => 'äºä»¶åç§°';

  @override
  String get deleteGoal => 'å é¤ç®æ ';

  @override
  String deleteGoalConfirm(String name) {
    return 'å é¤\"$name\"ï¼';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'å é¤ç®æ å¤±è´¥ï¼$error';
  }

  @override
  String get failedToLoadPerformanceData => 'å è½½æ§è½æ°æ®å¤±è´¥';

  @override
  String metricOverTime(String metric) {
    return '$metricè¶å¿';
  }

  @override
  String get byDimension => 'æç»´åº¦';

  @override
  String get failedToLoadDimensionData => 'å è½½ç»´åº¦æ°æ®å¤±è´¥';

  @override
  String get good => 'è¯å¥½';

  @override
  String get needsImprovement => 'éè¦æ¹è¿';

  @override
  String get poor => 'è¾å·®';

  @override
  String get largestContentfulPaint => 'æå¤§åå®¹ç»å¶';

  @override
  String get cumulativeLayoutShift => 'ç´¯è®¡å¸å±åç§»';

  @override
  String get firstContentfulPaint => 'é¦æ¬¡åå®¹ç»å¶';

  @override
  String get timeToFirstByte => 'é¦å­èæ¶é´';

  @override
  String get interactionToNextPaint => 'äº¤äºå°ä¸ä¸æ¬¡ç»å¶';

  @override
  String get dimPages => 'é¡µé¢';

  @override
  String get dimCountries => 'å½å®¶/å°åº';

  @override
  String get dimDevices => 'è®¾å¤';

  @override
  String get dimBrowsers => 'æµè§å¨';

  @override
  String get dimOS => 'æä½ç³»ç»';

  @override
  String get sessionFilters => 'ä¼è¯ç­é';

  @override
  String get minPageviews => 'æå°é¡µé¢æµè§é';

  @override
  String get minEvents => 'æå°äºä»¶æ°';

  @override
  String get minDurationSeconds => 'æç­æ¶é¿ï¼ç§ï¼';

  @override
  String get failedToLoadSessions => 'å è½½ä¼è¯å¤±è´¥';

  @override
  String get noSessionsFound => 'æªæ¾å°ä¼è¯';

  @override
  String get filterSessions => 'ç­éä¼è¯';

  @override
  String get loadingMoreSessions => 'æ­£å¨å è½½æ´å¤ä¼è¯';

  @override
  String entryPage(String page) {
    return 'å¥å£é¡µé¢ï¼$page';
  }

  @override
  String nPages(int count) {
    return '$count ä¸ªé¡µé¢';
  }

  @override
  String get sessionReplays => 'ä¼è¯åæ¾';

  @override
  String get failedToLoadReplays => 'å è½½åæ¾å¤±è´¥';

  @override
  String get noReplaysFound => 'æªæ¾å°åæ¾';

  @override
  String get noReplaysHint => 'å¯ç¨åï¼ä¼è¯åæ¾å°æ¾ç¤ºå¨æ­¤å¤ã';

  @override
  String get previousPage => 'ä¸ä¸é¡µ';

  @override
  String get nextPage => 'ä¸ä¸é¡µ';

  @override
  String pageNumber(int number) {
    return 'ç¬¬ $number é¡µ';
  }

  @override
  String get unknownBrowser => 'æªç¥æµè§å¨';

  @override
  String get unknownCountry => 'æªç¥å½å®¶/å°åº';

  @override
  String get sortUsers => 'æåºç¨æ·';

  @override
  String get showAllUsers => 'æ¾ç¤ºææç¨æ·';

  @override
  String get showIdentifiedOnly => 'ä»æ¾ç¤ºå·²è¯å«ç¨æ·';

  @override
  String get searchUsers => 'æç´¢ç¨æ·';

  @override
  String get searchUsersHint => 'æç´¢ç¨æ·â¦';

  @override
  String get clearSearch => 'æ¸é¤æç´¢';

  @override
  String get failedToLoadUsers => 'å è½½ç¨æ·å¤±è´¥';

  @override
  String get noUsersFound => 'æªæ¾å°ç¨æ·';

  @override
  String get noIdentifiedUsers => 'ææ å·²è¯å«ç¨æ·';

  @override
  String get usersWillAppear => 'ç¨æ·è¢«è¯å«åå°æ¾ç¤ºå¨æ­¤å¤';

  @override
  String get tryDifferentSearch => 'å°è¯å¶ä»æç´¢è¯';

  @override
  String get sortedBy => 'æåºæ¹å¼';

  @override
  String get loadingMoreUsers => 'æ­£å¨å è½½æ´å¤ç¨æ·';

  @override
  String get lastSeen => 'æåå¨çº¿';

  @override
  String get firstSeen => 'é¦æ¬¡å¨çº¿';

  @override
  String nUsers(String count) {
    return '$count ä½ç¨æ·';
  }

  @override
  String nSessions(int count) {
    return '$count ä¸ªä¼è¯';
  }

  @override
  String lastPrefix(String value) {
    return 'ä¸æ¬¡ï¼$value';
  }

  @override
  String get failedToLoadSiteConfig => 'å è½½ç«ç¹éç½®å¤±è´¥';

  @override
  String get failedToLoadMetrics => 'å è½½ææ å¤±è´¥';

  @override
  String get loadingMoreMetrics => 'æ­£å¨å è½½æ´å¤ææ ';

  @override
  String noMetricData(String metric) {
    return 'ææ $metricæ°æ®';
  }

  @override
  String get settings => 'è®¾ç½®';

  @override
  String get connection => 'è¿æ¥';

  @override
  String get notConfigured => 'æªéç½®';

  @override
  String get authMethod => 'è®¤è¯æ¹å¼';

  @override
  String get sessionCookie => 'ä¼è¯ Cookie';

  @override
  String get loggedInAs => 'ç»å½èº«ä»½';

  @override
  String get unknown => 'æªç¥';

  @override
  String get appearance => 'å¤è§';

  @override
  String get theme => 'ä¸»é¢';

  @override
  String get dark => 'æ·±è²';

  @override
  String get light => 'æµè²';

  @override
  String get auto => 'èªå¨';

  @override
  String get about => 'å³äº';

  @override
  String get appVersion => 'åºç¨çæ¬';

  @override
  String get openSourceAnalytics => 'å¼æº Web åæå·¥å·';

  @override
  String get logoutConfirm => 'ç¡®å®è¦éåºç»å½åï¼';

  @override
  String get siteSettings => 'ç«ç¹è®¾ç½®';

  @override
  String get siteInformation => 'ç«ç¹ä¿¡æ¯';

  @override
  String get domain => 'åå';

  @override
  String get siteId => 'ç«ç¹ ID';

  @override
  String siteLabel(String id) {
    return '站点 $id';
  }

  @override
  String get created => 'åå»ºæ¶é´';

  @override
  String get trackingSettings => 'è·è¸ªè®¾ç½®';

  @override
  String get publicDashboard => 'å¬å¼ä»ªè¡¨æ¿';

  @override
  String get publicDashboardDesc => 'åè®¸å¬å¼è®¿é®åææ°æ®';

  @override
  String get sessionReplay => 'ä¼è¯åæ¾';

  @override
  String get sessionReplayDesc => 'å½å¶ç¨æ·ä¼è¯';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'è·è¸ªæ ¸å¿ Web ææ ';

  @override
  String get trackErrors => 'éè¯¯è·è¸ª';

  @override
  String get trackErrorsDesc => 'æè· JavaScript éè¯¯';

  @override
  String get outboundLinksTracking => 'å¤é¨é¾æ¥';

  @override
  String get outboundLinksDesc => 'è·è¸ªå¤é¨é¾æ¥ç¹å»';

  @override
  String get excludedIps => 'æé¤ç IP';

  @override
  String get excludedCountries => 'æé¤çå½å®¶/å°åº';

  @override
  String get settingsSaved => 'è®¾ç½®å·²ä¿å­';

  @override
  String failedToSave(String error) {
    return 'ä¿å­å¤±è´¥ï¼$error';
  }

  @override
  String get timeRange => 'æ¶é´èå´';

  @override
  String get today => 'ä»å¤©';

  @override
  String get yesterday => 'æ¨å¤©';

  @override
  String get last7Days => 'è¿å» 7 å¤©';

  @override
  String get last30Days => 'è¿å» 30 å¤©';

  @override
  String get thisWeek => 'æ¬å¨';

  @override
  String get thisMonth => 'æ¬æ';

  @override
  String get thisYear => 'ä»å¹´';

  @override
  String get customRange => 'èªå®ä¹èå´';

  @override
  String get allTime => '所有时间';

  @override
  String lastMinutes(int count) {
    return '最近$count分钟';
  }

  @override
  String get notSet => '(未设置)';

  @override
  String get bouncePrefix => '跳出率';

  @override
  String get timePrefix => '时间';

  @override
  String get eventTypePageview => '页面浏览';

  @override
  String get eventTypeCustom => '自定义';

  @override
  String get eventTypeOutbound => '外部';

  @override
  String get eventTypeClick => '点击';

  @override
  String get eventTypeForm => '表单';

  @override
  String get eventTypeInput => '输入';

  @override
  String get eventTypeCopy => '复制';

  @override
  String get filter => 'ç­é';

  @override
  String get addFilter => 'æ·»å ç­é';

  @override
  String get parameter => 'åæ°';

  @override
  String get value => 'å¼';

  @override
  String get enterFilterValue => 'è¾å¥ç­éå¼';

  @override
  String get filterBrowser => '浏览器';

  @override
  String get filterOs => '操作系统';

  @override
  String get filterLanguage => '语言';

  @override
  String get filterCountry => '国家';

  @override
  String get filterRegion => '地区';

  @override
  String get filterCity => '城市';

  @override
  String get filterDeviceType => '设备类型';

  @override
  String get filterReferrer => '来源页';

  @override
  String get filterHostname => '主机名';

  @override
  String get filterPathname => '路径';

  @override
  String get filterPageTitle => '页面标题';

  @override
  String get filterQuerystring => '查询字符串';

  @override
  String get filterEventName => '事件名称';

  @override
  String get filterChannel => '渠道';

  @override
  String get filterUtmSource => 'UTM来源';

  @override
  String get filterUtmMedium => 'UTM媒介';

  @override
  String get filterUtmCampaign => 'UTM活动';

  @override
  String get filterUtmTerm => 'UTM术语';

  @override
  String get filterUtmContent => 'UTM内容';

  @override
  String get filterEntryPage => '入口页';

  @override
  String get filterExitPage => '出口页';

  @override
  String get requestTimedOut => 'è¯·æ±è¶æ¶ï¼è¯·éè¯ã';

  @override
  String get networkError => 'ç½ç»éè¯¯ï¼è¯·æ£æ¥æ¨çè¿æ¥ã';

  @override
  String get sessionExpired => 'ä¼è¯å·²è¿æï¼è¯·éæ°ç»å½ã';

  @override
  String get accessDenied => 'è®¿é®è¢«æç»ã';

  @override
  String get dataNotFound => 'æªæ¾å°æ°æ®ã';

  @override
  String get serverError => 'æå¡å¨éè¯¯ï¼è¯·ç¨åéè¯ã';

  @override
  String get failedToLoadGeneric => 'å è½½æ°æ®å¤±è´¥ï¼è¯·éè¯ã';

  @override
  String chartDataPoints(int count) {
    return 'å¾è¡¨åå« $count ä¸ªæ°æ®ç¹';
  }

  @override
  String previousPrefix(String value) {
    return 'ä¸æï¼$value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'æ§è½è¯çº§ï¼$rating';
  }

  @override
  String get loadingContent => 'æ­£å¨å è½½åå®¹';

  @override
  String get language => 'è¯­è¨';

  @override
  String get selectLanguage => 'éæ©è¯­è¨';

  @override
  String get failedToLoadUserDetails => 'å è½½ç¨æ·è¯¦æå¤±è´¥';

  @override
  String lastSeenPrefix(String value) {
    return 'æåå¨çº¿ï¼$value';
  }

  @override
  String get traits => 'ç¨æ·å±æ§';

  @override
  String get noTraits => 'è¯¥ç¨æ·æ²¡æè®¾ç½®å±æ§';

  @override
  String get sessionDetail => 'ä¼è¯è¯¦æ';

  @override
  String get failedToLoadSession => 'å è½½ä¼è¯å¤±è´¥';

  @override
  String get entryPageLabel => 'å¥å£é¡µé¢';

  @override
  String get exitPage => 'åºå£é¡µé¢';

  @override
  String get browserAndDevice => 'æµè§å¨åè®¾å¤';

  @override
  String get browser => 'æµè§å¨';

  @override
  String get os => 'æä½ç³»ç»';

  @override
  String get device => 'è®¾å¤';

  @override
  String get sourceLabel => 'æ¥æº';

  @override
  String get referrer => 'å¼èæ¥æº';

  @override
  String eventTimelineCount(int count) {
    return 'äºä»¶æ¶é´çº¿ ($count)';
  }

  @override
  String get noEvents => 'ææ äºä»¶';

  @override
  String get replayEventsTitle => 'åæ¾äºä»¶';

  @override
  String get failedToLoadReplay => 'å è½½åæ¾å¤±è´¥';

  @override
  String get noReplayEvents => 'ææ åæ¾äºä»¶';

  @override
  String get totalEvents => 'äºä»¶æ»è®¡';

  @override
  String get userActionsLabel => 'ç¨æ·æä½';

  @override
  String eventTimelineActions(int count) {
    return 'äºä»¶æ¶é´çº¿ï¼$count ä¸ªæä½ï¼';
  }

  @override
  String get eventLog => 'äºä»¶æ¥å¿';

  @override
  String get viewEventLog => 'æ¥çäºä»¶æ¥å¿';

  @override
  String get failedToLoadEventLog => 'æ æ³å è½½äºä»¶æ¥å¿';

  @override
  String get activityHeatmap => 'ç­åå¾';

  @override
  String get heatmapLast4Weeks => 'æè¿4å¨';

  @override
  String get less => 'è¾å°';

  @override
  String get more => 'è¾å¤';

  @override
  String get peakActivity => 'å³°å¼æ´»å¨';

  @override
  String peakHour(String day, String time) {
    return '$day $time';
  }

  @override
  String busiestDay(String day) {
    return 'æç¹å¿çä¸å¤©ï¼$day';
  }

  @override
  String get dayMon => 'å¨ä¸';

  @override
  String get dayTue => 'å¨äº';

  @override
  String get dayWed => 'å¨ä¸';

  @override
  String get dayThu => 'å¨å';

  @override
  String get dayFri => 'å¨äº';

  @override
  String get daySat => 'å¨å­';

  @override
  String get daySun => 'å¨æ¥';

  @override
  String get searchEvents => 'æç´¢äºä»¶...';

  @override
  String get allTypes => 'å¨é¨';

  @override
  String get noMatchingEvents => 'æ²¡æå¹éçäºä»¶';

  @override
  String get liveView => 'å®æ¶';

  @override
  String get autoRefresh => 'èªå¨å·æ°';

  @override
  String get usersOnlineNow => 'å½åå¨çº¿ç¨æ·';

  @override
  String lastUpdatedAt(String time) {
    return 'æ´æ°äº $time';
  }

  @override
  String get last30Minutes => 'æè¿30åé';

  @override
  String get last5Minutes => 'æè¿5åé';

  @override
  String get recentEvents => 'æè¿äºä»¶';

  @override
  String get noRecentEvents => 'æ²¡ææè¿çäºä»¶';

  @override
  String get retention => 'çå­ç';

  @override
  String get weekly => 'æå¨';

  @override
  String get daily => 'æå¤©';

  @override
  String get retentionRange => 'èå´';

  @override
  String retentionDays(int count) {
    return '$countå¤©';
  }

  @override
  String get failedToLoadRetention => 'å è½½çå­æ°æ®å¤±è´¥';

  @override
  String get noRetentionData => 'æ çå­æ°æ®';

  @override
  String get cohort => 'éå';

  @override
  String get retentionWeekPrefix => 'W';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => 'ç¨æ·è·¯å¾';

  @override
  String get journeySteps => 'æ­¥éª¤';

  @override
  String get failedToLoadJourneys => 'å è½½ç¨æ·è·¯å¾å¤±è´¥';

  @override
  String get noJourneysFound => 'æªæ¾å°ç¨æ·è·¯å¾';

  @override
  String journeySessions(String count) {
    return '$countä¸ªä¼è¯';
  }

  @override
  String get locations => 'ä½ç½®';

  @override
  String get locationCities => 'åå¸';

  @override
  String get failedToLoadLocations => 'å è½½ä½ç½®æ°æ®å¤±è´¥';

  @override
  String get noLocationsFound => 'æªæ¾å°ä½ç½®æ°æ®';

  @override
  String get coreFeatures => 'æ ¸å¿';

  @override
  String get insights => 'æ´å¯';

  @override
  String get tools => 'å·¥å·';

  @override
  String get userTraits => 'ç¨æ·ç¹å¾';

  @override
  String get failedToLoadUserTraits => 'å è½½ç¨æ·ç¹å¾å¤±è´¥';

  @override
  String get noUserTraits => 'æªæ¾å°ç¨æ·ç¹å¾';

  @override
  String get noUserTraitsHint =>
      'å½ç¨æ·ä½¿ç¨èªå®ä¹å±æ§æ è¯æ¶å°æ¾ç¤ºç¹å¾';

  @override
  String traitUsersCount(String count) {
    return '$countä¸ªç¨æ·';
  }

  @override
  String get dashboard => '仪表板';

  @override
  String get analytics => '分析';

  @override
  String get noSiteSelected => '未选择站点';

  @override
  String selectSiteFromDashboard(String tabName) {
    return '从仪表板选项卡中选择一个站点以查看$tabName。';
  }

  @override
  String get goToDashboard => '前往仪表板';

  @override
  String todayVisitors(int count) {
    return '今天$count人';
  }

  @override
  String get entryPages => '入口页面';

  @override
  String get exitPages => '出口页面';

  @override
  String get browsers => '浏览器';

  @override
  String get operatingSystems => '操作系统';

  @override
  String get utmSource => 'UTM来源';

  @override
  String get channel => '渠道';

  @override
  String get pageTitles => '页面标题';

  @override
  String get sources => '来源';

  @override
  String get cities => '城市';

  @override
  String get languages => '语言';

  @override
  String get hostnames => '主机名';

  @override
  String get vpn => 'VPN';

  @override
  String get crawlers => '爬虫';

  @override
  String get datacenters => '数据中心';

  @override
  String get companies => '公司';

  @override
  String get companyType => '公司类型';

  @override
  String get companyDomain => '公司域名';

  @override
  String get asnOrg => 'ASN组织';

  @override
  String get asnType => 'ASN类型';

  @override
  String get asnDomain => 'ASN域名';

  @override
  String get utmMedium => 'UTM媒介';

  @override
  String get utmCampaign => 'UTM活动';

  @override
  String nMoreItems(int count) {
    return '+$count个更多';
  }

  @override
  String sessionsWithPercentage(String count, String percentage) {
    return '$count个会话 ($percentage%)';
  }

  @override
  String errorGeneric(String error) {
    return '错误: $error';
  }

  @override
  String get replayPageSnapshot => '页面快照';

  @override
  String get replayPageLoad => '页面加载';

  @override
  String get replayCustomEvent => '自定义事件';

  @override
  String get replayPluginEvent => '插件事件';

  @override
  String get replayInteraction => '交互';

  @override
  String get replayScroll => '滚动';

  @override
  String get replayResize => '调整大小';

  @override
  String get replayInput => '输入';

  @override
  String get replayUpdate => '更新';

  @override
  String get url => 'URL';

  @override
  String get searchSites => '搜索站点...';

  @override
  String get sortSites => '排序站点';

  @override
  String get sortAlphabetically => '按字母顺序';

  @override
  String get sortByCount => '按数量排序';

  @override
  String get sortByVisitors => '按今日访客';

  @override
  String get sortByLiveUsers => '按在线用户';

  @override
  String get noMatchingSites => '没有匹配的站点';

  @override
  String get utmTerm => 'UTM术语';

  @override
  String get utmContent => 'UTM内容';

  @override
  String get browserVersions => '浏览器版本';

  @override
  String get osVersions => '操作系统版本';

  @override
  String get screenDimensions => '屏幕尺寸';

  @override
  String get relativeNow => '现在';

  @override
  String relativeMinutes(int count) {
    return '$count分钟';
  }

  @override
  String relativeHours(int count) {
    return '$count小时';
  }

  @override
  String relativeDays(int count) {
    return '$count天';
  }

  @override
  String relativeWeeks(int count) {
    return '$count周';
  }

  @override
  String get emptyValue => '(空)';
}
