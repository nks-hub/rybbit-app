// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => 'ë¹ê³µì';

  @override
  String get cancel => 'ì·¨ì';

  @override
  String get delete => 'ì­ì ';

  @override
  String get save => 'ì ì¥';

  @override
  String get update => 'ìë°ì´í¸';

  @override
  String get create => 'ìì±';

  @override
  String get retry => 'ë¤ì ìë';

  @override
  String get add => 'ì¶ê°';

  @override
  String get edit => 'í¸ì§';

  @override
  String get clear => 'ì§ì°ê¸°';

  @override
  String get apply => 'ì ì©';

  @override
  String get goBack => 'ë¤ë¡ ê°ê¸°';

  @override
  String get noData => 'ë°ì´í° ìì';

  @override
  String get loading => 'ë¡ë© ì¤';

  @override
  String get logout => 'ë¡ê·¸ìì';

  @override
  String get close => 'ë«ê¸°';

  @override
  String get serverUrl => 'ìë² URL';

  @override
  String get serverUrlHint => 'https://your-rybbit-instance.com';

  @override
  String get email => 'ì´ë©ì¼';

  @override
  String get apiKey => 'API í¤';

  @override
  String get password => 'ë¹ë°ë²í¸';

  @override
  String get connect => 'ì°ê²°';

  @override
  String get organizations => 'ì¡°ì§';

  @override
  String get noSitesFound => 'ì¬ì´í¸ë¥¼ ì°¾ì ì ììµëë¤';

  @override
  String get noSitesHint =>
      'ììíë ¤ë©´ ì¹ ëìë³´ëìì ì¬ì´í¸ë¥¼ ì¶ê°íì¸ì.';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countê° ì¬ì´í¸',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return 'ë©¤ë² ($count)';
  }

  @override
  String get failedToLoadOrganizations =>
      'ì¡°ì§ì ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noOrganizations => 'ì¡°ì§ ìì';

  @override
  String get noOrganizationsHint =>
      'ì¹ ëìë³´ëìì ì¡°ì§ì ìì±í  ì ììµëë¤';

  @override
  String get failedToLoadMembers => 'ë©¤ë²ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get failedToLoadSites => 'ì¬ì´í¸ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get failedToLoadAnalytics =>
      'ë¶ì ë°ì´í°ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noDataAvailable => 'ì¬ì© ê°ë¥í ë°ì´í°ê° ììµëë¤';

  @override
  String get users => 'ì¬ì©ì';

  @override
  String get sessions => 'ì¸ì';

  @override
  String get pageviews => 'íì´ì§ë·°';

  @override
  String get pagesPerSession => 'íì´ì§/ì¸ì';

  @override
  String get bounceRate => 'ì´íë¥ ';

  @override
  String get duration => 'ì²´ë¥ ìê°';

  @override
  String get metrics => 'ì§í';

  @override
  String get pages => 'íì´ì§';

  @override
  String get referrers => 'ì ì ê²½ë¡';

  @override
  String get countries => 'êµ­ê°';

  @override
  String get devices => 'ê¸°ê¸°';

  @override
  String get performance => 'ì±ë¥';

  @override
  String get goals => 'ëª©í';

  @override
  String get funnels => 'í¼ë';

  @override
  String get replay => 'ë¦¬íë ì´';

  @override
  String get config => 'ì¤ì ';

  @override
  String usersOnline(int count) {
    return '$countëª ì¨ë¼ì¸';
  }

  @override
  String get events => 'ì´ë²¤í¸';

  @override
  String get eventsOverTime => 'ìê°ë³ ì´ë²¤í¸';

  @override
  String get eventNames => 'ì´ë²¤í¸ ì´ë¦';

  @override
  String get noCustomEventsTracked =>
      'ì¶ì ë ì»¤ì¤í ì´ë²¤í¸ê° ììµëë¤';

  @override
  String get failedToLoadProperties => 'ìì±ì ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noProperties => 'ìì± ìì';

  @override
  String get outboundLinks => 'ì¸ë¶ ë§í¬';

  @override
  String get noOutboundLinksTracked =>
      'ì¶ì ë ì¸ë¶ ë§í¬ê° ììµëë¤';

  @override
  String get failedToLoadChart => 'ì°¨í¸ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get errors => 'ì¤ë¥';

  @override
  String get failedToLoadErrors => 'ì¤ë¥ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noErrorsFound => 'ì¤ë¥ë¥¼ ì°¾ì ì ììµëë¤';

  @override
  String get everythingLooksGood => 'ëª¨ë  ê²ì´ ì ììëë¤!';

  @override
  String get occurrences => 'ë°ì íì';

  @override
  String get sessionsAffected => 'ìí¥ë°ì ì¸ì';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'ì´ë²¤í¸ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤: $error';
  }

  @override
  String get noEventsFound => 'ì´ë²¤í¸ë¥¼ ì°¾ì ì ììµëë¤';

  @override
  String get failedToLoadFunnels => 'í¼ëì ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noFunnelsSaved => 'ì ì¥ë í¼ëì´ ììµëë¤';

  @override
  String get createFunnelsHint =>
      'ì¹ ëìë³´ëìì í¼ëì ìì±íì¸ì';

  @override
  String get deleteFunnel => 'í¼ë ì­ì ';

  @override
  String deleteFunnelConfirm(String name) {
    return '\"$name\"ì(ë¥¼) ì­ì íìê² ìµëê¹?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'í¼ë ì­ì  ì¤í¨: $error';
  }

  @override
  String get noStepsDefined => 'ì´ í¼ëì ì ìë ë¨ê³ê° ììµëë¤';

  @override
  String failedToAnalyze(String error) {
    return 'ë¶ì ì¤í¨: $error';
  }

  @override
  String get overallConversion => 'ì ì²´ ì íì¨';

  @override
  String dropoff(String value) {
    return 'ì´í: $value';
  }

  @override
  String get createGoal => 'ëª©í ìì±';

  @override
  String get failedToLoadGoals => 'ëª©íë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noGoalsConfigured => 'ì¤ì ë ëª©íê° ììµëë¤';

  @override
  String get noGoalsHint => '+ ë²í¼ì ëë¬ ì ëª©íë¥¼ ìì±íì¸ì';

  @override
  String get conversions => 'ì í';

  @override
  String get rate => 'ë¹ì¨';

  @override
  String get editGoal => 'ëª©í í¸ì§';

  @override
  String get createGoalTitle => 'ëª©í ìì±';

  @override
  String get name => 'ì´ë¦';

  @override
  String get type => 'ì í';

  @override
  String get path => 'ê²½ë¡';

  @override
  String get event => 'ì´ë²¤í¸';

  @override
  String get pathPattern => 'ê²½ë¡ í¨í´';

  @override
  String get eventName => 'ì´ë²¤í¸ ì´ë¦';

  @override
  String get deleteGoal => 'ëª©í ì­ì ';

  @override
  String deleteGoalConfirm(String name) {
    return '\"$name\"ì(ë¥¼) ì­ì íìê² ìµëê¹?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'ëª©í ì­ì  ì¤í¨: $error';
  }

  @override
  String get failedToLoadPerformanceData =>
      'ì±ë¥ ë°ì´í°ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String metricOverTime(String metric) {
    return 'ìê°ë³ $metric';
  }

  @override
  String get byDimension => 'ì°¨ìë³';

  @override
  String get failedToLoadDimensionData =>
      'ì°¨ì ë°ì´í°ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get good => 'ìí¸';

  @override
  String get needsImprovement => 'ê°ì  íì';

  @override
  String get poor => 'ëì¨';

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
  String get dimPages => 'íì´ì§';

  @override
  String get dimCountries => 'êµ­ê°';

  @override
  String get dimDevices => 'ê¸°ê¸°';

  @override
  String get dimBrowsers => 'ë¸ë¼ì°ì ';

  @override
  String get dimOS => 'OS';

  @override
  String get sessionFilters => 'ì¸ì íí°';

  @override
  String get minPageviews => 'ìµì íì´ì§ë·°';

  @override
  String get minEvents => 'ìµì ì´ë²¤í¸';

  @override
  String get minDurationSeconds => 'ìµì ì²´ë¥ ìê° (ì´)';

  @override
  String get failedToLoadSessions => 'ì¸ìì ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noSessionsFound => 'ì¸ìì ì°¾ì ì ììµëë¤';

  @override
  String get filterSessions => 'ì¸ì íí°ë§';

  @override
  String get loadingMoreSessions => 'ë ë§ì ì¸ì ë¡ë© ì¤';

  @override
  String entryPage(String page) {
    return 'ì§ì íì´ì§: $page';
  }

  @override
  String nPages(int count) {
    return '$countê° íì´ì§';
  }

  @override
  String get sessionReplays => 'ì¸ì ë¦¬íë ì´';

  @override
  String get failedToLoadReplays =>
      'ë¦¬íë ì´ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noReplaysFound => 'ë¦¬íë ì´ë¥¼ ì°¾ì ì ììµëë¤';

  @override
  String get noReplaysHint =>
      'ì¸ì ë¦¬íë ì´ê° íì±íëë©´ ì¬ê¸°ì íìë©ëë¤.';

  @override
  String get previousPage => 'ì´ì  íì´ì§';

  @override
  String get nextPage => 'ë¤ì íì´ì§';

  @override
  String pageNumber(int number) {
    return '$number íì´ì§';
  }

  @override
  String get unknownBrowser => 'ì ì ìë ë¸ë¼ì°ì ';

  @override
  String get unknownCountry => 'ì ì ìë êµ­ê°';

  @override
  String get sortUsers => 'ì¬ì©ì ì ë ¬';

  @override
  String get showAllUsers => 'ëª¨ë  ì¬ì©ì íì';

  @override
  String get showIdentifiedOnly => 'ìë³ë ì¬ì©ìë§ íì';

  @override
  String get searchUsers => 'ì¬ì©ì ê²ì';

  @override
  String get searchUsersHint => 'ì¬ì©ì ê²ì...';

  @override
  String get clearSearch => 'ê²ì ì§ì°ê¸°';

  @override
  String get failedToLoadUsers => 'ì¬ì©ìë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noUsersFound => 'ì¬ì©ìë¥¼ ì°¾ì ì ììµëë¤';

  @override
  String get noIdentifiedUsers => 'ìë³ë ì¬ì©ìê° ììµëë¤';

  @override
  String get usersWillAppear =>
      'ì¬ì©ìê° ìë³ëë©´ ì¬ê¸°ì íìë©ëë¤';

  @override
  String get tryDifferentSearch => 'ë¤ë¥¸ ê²ìì´ë¥¼ ìëí´ ë³´ì¸ì';

  @override
  String get sortedBy => 'ì ë ¬ ê¸°ì¤';

  @override
  String get loadingMoreUsers => 'ë ë§ì ì¬ì©ì ë¡ë© ì¤';

  @override
  String get lastSeen => 'ë§ì§ë§ ë°©ë¬¸';

  @override
  String get firstSeen => 'ì²« ë°©ë¬¸';

  @override
  String nUsers(String count) {
    return '$countëªì ì¬ì©ì';
  }

  @override
  String nSessions(int count) {
    return '$countê° ì¸ì';
  }

  @override
  String lastPrefix(String value) {
    return 'ì´ì : $value';
  }

  @override
  String get failedToLoadSiteConfig =>
      'ì¬ì´í¸ ì¤ì ì ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get failedToLoadMetrics => 'ì§íë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get loadingMoreMetrics => 'ë ë§ì ì§í ë¡ë© ì¤';

  @override
  String noMetricData(String metric) {
    return '$metric ë°ì´í° ìì';
  }

  @override
  String get settings => 'ì¤ì ';

  @override
  String get connection => 'ì°ê²°';

  @override
  String get notConfigured => 'ì¤ì ëì§ ìì';

  @override
  String get authMethod => 'ì¸ì¦ ë°©ì';

  @override
  String get sessionCookie => 'ì¸ì ì¿ í¤';

  @override
  String get loggedInAs => 'ë¡ê·¸ì¸ ê³ì ';

  @override
  String get unknown => 'ì ì ìì';

  @override
  String get appearance => 'ì¸ê´';

  @override
  String get theme => 'íë§';

  @override
  String get dark => 'ë¤í¬';

  @override
  String get light => 'ë¼ì´í¸';

  @override
  String get auto => 'ìë';

  @override
  String get about => 'ì ë³´';

  @override
  String get appVersion => 'ì± ë²ì ';

  @override
  String get openSourceAnalytics => 'ì¤í ìì¤ ì¹ ë¶ì ëêµ¬';

  @override
  String get logoutConfirm => 'ì ë§ ë¡ê·¸ììíìê² ìµëê¹?';

  @override
  String get siteSettings => 'ì¬ì´í¸ ì¤ì ';

  @override
  String get siteInformation => 'ì¬ì´í¸ ì ë³´';

  @override
  String get domain => 'ëë©ì¸';

  @override
  String get siteId => 'ì¬ì´í¸ ID';

  @override
  String get created => 'ìì±ì¼';

  @override
  String get trackingSettings => 'ì¶ì  ì¤ì ';

  @override
  String get publicDashboard => 'ê³µê° ëìë³´ë';

  @override
  String get publicDashboardDesc => 'ë¶ì ë°ì´í°ì ê³µê° ì ê·¼ íì©';

  @override
  String get sessionReplay => 'ì¸ì ë¦¬íë ì´';

  @override
  String get sessionReplayDesc => 'ì¬ì©ì ì¸ì ê¸°ë¡';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Core Web Vitals ì¶ì ';

  @override
  String get trackErrors => 'ì¤ë¥ ì¶ì ';

  @override
  String get trackErrorsDesc => 'JavaScript ì¤ë¥ ìº¡ì²';

  @override
  String get outboundLinksTracking => 'ì¸ë¶ ë§í¬';

  @override
  String get outboundLinksDesc => 'ì¸ë¶ ë§í¬ í´ë¦­ ì¶ì ';

  @override
  String get excludedIps => 'ì ì¸ë IP';

  @override
  String get excludedCountries => 'ì ì¸ë êµ­ê°';

  @override
  String get settingsSaved => 'ì¤ì ì´ ì ì¥ëììµëë¤';

  @override
  String failedToSave(String error) {
    return 'ì ì¥ ì¤í¨: $error';
  }

  @override
  String get timeRange => 'ê¸°ê°';

  @override
  String get today => 'ì¤ë';

  @override
  String get yesterday => 'ì´ì ';

  @override
  String get last7Days => 'ìµê·¼ 7ì¼';

  @override
  String get last30Days => 'ìµê·¼ 30ì¼';

  @override
  String get thisWeek => 'ì´ë² ì£¼';

  @override
  String get thisMonth => 'ì´ë² ë¬';

  @override
  String get thisYear => 'ì¬í´';

  @override
  String get customRange => 'ì¬ì©ì ì§ì  ê¸°ê°';

  @override
  String get filter => 'íí°';

  @override
  String get addFilter => 'íí° ì¶ê°';

  @override
  String get parameter => 'ë§¤ê°ë³ì';

  @override
  String get value => 'ê°';

  @override
  String get enterFilterValue => 'íí° ê°ì ìë ¥íì¸ì';

  @override
  String get requestTimedOut =>
      'ìì²­ ìê°ì´ ì´ê³¼ëììµëë¤. ë¤ì ìëí´ ì£¼ì¸ì.';

  @override
  String get networkError =>
      'ë¤í¸ìí¬ ì¤ë¥ìëë¤. ì°ê²°ì íì¸í´ ì£¼ì¸ì.';

  @override
  String get sessionExpired =>
      'ì¸ìì´ ë§ë£ëììµëë¤. ë¤ì ë¡ê·¸ì¸í´ ì£¼ì¸ì.';

  @override
  String get accessDenied => 'ì ê·¼ì´ ê±°ë¶ëììµëë¤.';

  @override
  String get dataNotFound => 'ë°ì´í°ë¥¼ ì°¾ì ì ììµëë¤.';

  @override
  String get serverError =>
      'ìë² ì¤ë¥ìëë¤. ëì¤ì ë¤ì ìëí´ ì£¼ì¸ì.';

  @override
  String get failedToLoadGeneric =>
      'ë°ì´í°ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤. ë¤ì ìëí´ ì£¼ì¸ì.';

  @override
  String chartDataPoints(int count) {
    return '$countê°ì ë°ì´í° í¬ì¸í¸ê° ìë ì°¨í¸';
  }

  @override
  String previousPrefix(String value) {
    return 'ì´ì : $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'ì±ë¥ ë±ê¸: $rating';
  }

  @override
  String get loadingContent => 'ì½íì¸  ë¡ë© ì¤';

  @override
  String get language => 'ì¸ì´';

  @override
  String get selectLanguage => 'ì¸ì´ ì í';

  @override
  String get failedToLoadUserDetails =>
      'ì¬ì©ì ì¸ë¶ ì ë³´ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String lastSeenPrefix(String value) {
    return 'ë§ì§ë§ ì ì: $value';
  }

  @override
  String get traits => 'ìì±';

  @override
  String get noTraits => 'ì´ ì¬ì©ìì ìì±ì´ ììµëë¤';

  @override
  String get sessionDetail => 'ì¸ì ìì¸';

  @override
  String get failedToLoadSession => 'ì¸ìì ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get entryPageLabel => 'ì§ì íì´ì§';

  @override
  String get exitPage => 'ì´í íì´ì§';

  @override
  String get browserAndDevice => 'ë¸ë¼ì°ì  ë° ê¸°ê¸°';

  @override
  String get browser => 'ë¸ë¼ì°ì ';

  @override
  String get os => 'OS';

  @override
  String get device => 'ê¸°ê¸°';

  @override
  String get sourceLabel => 'ìì¤';

  @override
  String get referrer => 'ë¦¬í¼ë¬';

  @override
  String eventTimelineCount(int count) {
    return 'ì´ë²¤í¸ íìë¼ì¸ ($count)';
  }

  @override
  String get noEvents => 'ì´ë²¤í¸ ìì';

  @override
  String get replayEventsTitle => 'ë¦¬íë ì´ ì´ë²¤í¸';

  @override
  String get failedToLoadReplay =>
      'ë¦¬íë ì´ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noReplayEvents => 'ë¦¬íë ì´ ì´ë²¤í¸ ìì';

  @override
  String get totalEvents => 'ì ì²´ ì´ë²¤í¸';

  @override
  String get userActionsLabel => 'ì¬ì©ì ëì';

  @override
  String eventTimelineActions(int count) {
    return 'ì´ë²¤í¸ íìë¼ì¸ ($countê° ëì)';
  }

  @override
  String get eventLog => 'ì´ë²¤í¸ ë¡ê·¸';

  @override
  String get viewEventLog => 'ì´ë²¤í¸ ë¡ê·¸ ë³´ê¸°';

  @override
  String get failedToLoadEventLog =>
      'ì´ë²¤í¸ ë¡ê·¸ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get activityHeatmap => 'íí¸ë§µ';

  @override
  String get heatmapLast4Weeks => 'ìµê·¼ 4ì£¼';

  @override
  String get less => 'ì ì';

  @override
  String get more => 'ë§ì';

  @override
  String get peakActivity => 'ìµê³  íë';

  @override
  String peakHour(String day, String time) {
    return '$day $time';
  }

  @override
  String busiestDay(String day) {
    return 'ê°ì¥ ë°ì ë : $day';
  }

  @override
  String get dayMon => 'ì';

  @override
  String get dayTue => 'í';

  @override
  String get dayWed => 'ì';

  @override
  String get dayThu => 'ëª©';

  @override
  String get dayFri => 'ê¸';

  @override
  String get daySat => 'í ';

  @override
  String get daySun => 'ì¼';

  @override
  String get searchEvents => 'ì´ë²¤í¸ ê²ì...';

  @override
  String get allTypes => 'ì ì²´';

  @override
  String get noMatchingEvents => 'ì¼ì¹íë ì´ë²¤í¸ ìì';

  @override
  String get liveView => 'ë¼ì´ë¸';

  @override
  String get autoRefresh => 'ìë ìë¡ê³ ì¹¨';

  @override
  String get usersOnlineNow => 'íì¬ ì¨ë¼ì¸ ì¬ì©ì';

  @override
  String lastUpdatedAt(String time) {
    return '$timeì ìë°ì´í¸ë¨';
  }

  @override
  String get last30Minutes => 'ìµê·¼ 30ë¶';

  @override
  String get last5Minutes => 'ìµê·¼ 5ë¶';

  @override
  String get recentEvents => 'ìµê·¼ ì´ë²¤í¸';

  @override
  String get noRecentEvents => 'ìµê·¼ ì´ë²¤í¸ ìì';

  @override
  String get retention => 'ë¦¬íì';

  @override
  String get weekly => 'ì£¼ê°';

  @override
  String get daily => 'ì¼ê°';

  @override
  String get retentionRange => 'ë²ì';

  @override
  String retentionDays(int count) {
    return '$countì¼';
  }

  @override
  String get failedToLoadRetention =>
      'ë¦¬íì ë°ì´í°ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noRetentionData => 'ë¦¬íì ë°ì´í° ìì';

  @override
  String get cohort => 'ì½í¸í¸';

  @override
  String get retentionWeekPrefix => 'W';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => 'ì¬ì©ì ê²½ë¡';

  @override
  String get journeySteps => 'ë¨ê³';

  @override
  String get failedToLoadJourneys =>
      'ì¬ì©ì ê²½ë¡ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noJourneysFound => 'ì¬ì©ì ê²½ë¡ê° ììµëë¤';

  @override
  String journeySessions(String count) {
    return '$count ì¸ì';
  }

  @override
  String get locations => 'ìì¹';

  @override
  String get locationCities => 'ëì';

  @override
  String get failedToLoadLocations => 'ìì¹ë¥¼ ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noLocationsFound => 'ìì¹ê° ììµëë¤';

  @override
  String get coreFeatures => 'íµì¬';

  @override
  String get insights => 'ì¸ì¬ì´í¸';

  @override
  String get tools => 'ëêµ¬';

  @override
  String get userTraits => 'í¹ì±';

  @override
  String get failedToLoadUserTraits =>
      'ì¬ì©ì í¹ì±ì ë¶ë¬ì¤ì§ ëª»íìµëë¤';

  @override
  String get noUserTraits => 'í¹ì±ì´ ììµëë¤';

  @override
  String get noUserTraitsHint =>
      'ì¬ì©ìê° ì¬ì©ì ì ì ìì±ì¼ë¡ ìë³ëë©´ íìë©ëë¤';

  @override
  String traitUsersCount(String count) {
    return '$countëª ì¬ì©ì';
  }

  @override
  String get dashboard => '대시보드';

  @override
  String get analytics => '분석';

  @override
  String get noSiteSelected => '선택된 사이트 없음';

  @override
  String selectSiteFromDashboard(String tabName) {
    return '$tabName을(를) 보려면 대시보드 탭에서 사이트를 선택하세요.';
  }

  @override
  String get goToDashboard => '대시보드로 이동';

  @override
  String todayVisitors(int count) {
    return '오늘 $count명';
  }

  @override
  String get entryPages => '진입 페이지';

  @override
  String get exitPages => '이탈 페이지';

  @override
  String get browsers => '브라우저';

  @override
  String get operatingSystems => 'OS';

  @override
  String get utmSource => 'UTM 소스';

  @override
  String get channel => '채널';

  @override
  String get pageTitles => '페이지 제목';

  @override
  String get sources => '소스';

  @override
  String get cities => '도시';

  @override
  String get languages => '언어';

  @override
  String get hostnames => '호스트명';

  @override
  String get vpn => 'VPN';

  @override
  String get crawlers => '크롤러';

  @override
  String get datacenters => '데이터센터';

  @override
  String get companies => '회사';

  @override
  String get companyType => '회사 유형';

  @override
  String get companyDomain => '회사 도메인';

  @override
  String get asnOrg => 'ASN 조직';

  @override
  String get asnType => 'ASN 유형';

  @override
  String get asnDomain => 'ASN 도메인';

  @override
  String get utmMedium => 'UTM 매체';

  @override
  String get utmCampaign => 'UTM 캠페인';

  @override
  String nMoreItems(int count) {
    return '+$count개 더';
  }

  @override
  String sessionsWithPercentage(String count, String percentage) {
    return '$count 세션 ($percentage%)';
  }

  @override
  String errorGeneric(String error) {
    return '오류: $error';
  }

  @override
  String get replayPageSnapshot => '페이지 스냅샷';

  @override
  String get replayPageLoad => '페이지 로드';

  @override
  String get replayCustomEvent => '커스텀 이벤트';

  @override
  String get replayPluginEvent => '플러그인 이벤트';

  @override
  String get replayInteraction => '인터랙션';

  @override
  String get replayScroll => '스크롤';

  @override
  String get replayResize => '크기 조절';

  @override
  String get replayInput => '입력';

  @override
  String get replayUpdate => '업데이트';

  @override
  String get url => 'URL';

  @override
  String get searchSites => '사이트 검색...';

  @override
  String get sortSites => '사이트 정렬';

  @override
  String get sortAlphabetically => '알파벳순';

  @override
  String get sortByCount => '개수순 정렬';

  @override
  String get sortByVisitors => '오늘 방문자순';

  @override
  String get sortByLiveUsers => '온라인 사용자순';

  @override
  String get noMatchingSites => '일치하는 사이트 없음';

  @override
  String get utmTerm => 'UTM 용어';

  @override
  String get utmContent => 'UTM 콘텐츠';

  @override
  String get browserVersions => '브라우저 버전';

  @override
  String get osVersions => 'OS 버전';

  @override
  String get screenDimensions => '화면 크기';

  @override
  String get relativeNow => '지금';

  @override
  String relativeMinutes(int count) {
    return '$count분';
  }

  @override
  String relativeHours(int count) {
    return '$count시간';
  }

  @override
  String relativeDays(int count) {
    return '$count일';
  }

  @override
  String relativeWeeks(int count) {
    return '$count주';
  }

  @override
  String get emptyValue => '(비어있음)';
}
