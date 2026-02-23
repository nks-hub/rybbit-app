// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => 'NeoficiÃ¡lnÃ­';

  @override
  String get cancel => 'ZruÅ¡it';

  @override
  String get delete => 'Smazat';

  @override
  String get save => 'UloÅ¾it';

  @override
  String get update => 'Aktualizovat';

  @override
  String get create => 'VytvoÅit';

  @override
  String get retry => 'Zkusit znovu';

  @override
  String get add => 'PÅidat';

  @override
  String get edit => 'Upravit';

  @override
  String get clear => 'Vymazat';

  @override
  String get apply => 'PouÅ¾Ã­t';

  @override
  String get goBack => 'ZpÄt';

  @override
  String get noData => 'Å½Ã¡dnÃ¡ data';

  @override
  String get loading => 'NaÄÃ­tÃ¡nÃ­';

  @override
  String get logout => 'OdhlÃ¡sit se';

  @override
  String get close => 'ZavÅÃ­t';

  @override
  String get serverUrl => 'URL serveru';

  @override
  String get serverUrlHint => 'https://vase-rybbit-instance.com';

  @override
  String get email => 'E-mail';

  @override
  String get apiKey => 'API klÃ­Ä';

  @override
  String get password => 'Heslo';

  @override
  String get connect => 'PÅipojit';

  @override
  String get organizations => 'Organizace';

  @override
  String get noSitesFound => 'Å½Ã¡dnÃ© weby nenalezeny';

  @override
  String get noSitesHint =>
      'Pro zaÄÃ¡tek pÅidejte web ve webovÃ©m rozhranÃ­.';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count webÅ¯',
      few: '$count weby',
      one: '1 web',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return 'ÄlenovÃ© ($count)';
  }

  @override
  String get failedToLoadOrganizations => 'NepodaÅilo se naÄÃ­st organizace';

  @override
  String get noOrganizations => 'Å½Ã¡dnÃ© organizace';

  @override
  String get noOrganizationsHint =>
      'Organizace lze vytvoÅit ve webovÃ©m rozhranÃ­';

  @override
  String get failedToLoadMembers => 'NepodaÅilo se naÄÃ­st Äleny';

  @override
  String get failedToLoadSites => 'NepodaÅilo se naÄÃ­st weby';

  @override
  String get failedToLoadAnalytics => 'NepodaÅilo se naÄÃ­st analytiku';

  @override
  String get noDataAvailable => 'Å½Ã¡dnÃ¡ data k dispozici';

  @override
  String get users => 'UÅ¾ivatelÃ©';

  @override
  String get sessions => 'Relace';

  @override
  String get pageviews => 'ZobrazenÃ­ strÃ¡nek';

  @override
  String get pagesPerSession => 'StrÃ¡nky/relace';

  @override
  String get bounceRate => 'MÃ­ra okamÅ¾itÃ©ho opuÅ¡tÄnÃ­';

  @override
  String get duration => 'Doba trvÃ¡nÃ­';

  @override
  String get metrics => 'Metriky';

  @override
  String get pages => 'StrÃ¡nky';

  @override
  String get referrers => 'OdkazujÃ­cÃ­';

  @override
  String get countries => 'ZemÄ';

  @override
  String get devices => 'ZaÅÃ­zenÃ­';

  @override
  String get performance => 'VÃ½kon';

  @override
  String get goals => 'CÃ­le';

  @override
  String get funnels => 'TrychtÃ½Åe';

  @override
  String get replay => 'PÅehrÃ¡vÃ¡nÃ­';

  @override
  String get config => 'NastavenÃ­';

  @override
  String usersOnline(int count) {
    return '$count uÅ¾ivatelÅ¯ online';
  }

  @override
  String get events => 'UdÃ¡losti';

  @override
  String get eventsOverTime => 'UdÃ¡losti v Äase';

  @override
  String get eventNames => 'NÃ¡zvy udÃ¡lostÃ­';

  @override
  String get noCustomEventsTracked =>
      'Å½Ã¡dnÃ© vlastnÃ­ udÃ¡losti nebyly zaznamenÃ¡ny';

  @override
  String get failedToLoadProperties => 'NepodaÅilo se naÄÃ­st vlastnosti';

  @override
  String get noProperties => 'Å½Ã¡dnÃ© vlastnosti';

  @override
  String get outboundLinks => 'OdchozÃ­ odkazy';

  @override
  String get noOutboundLinksTracked =>
      'Å½Ã¡dnÃ© odchozÃ­ odkazy nebyly zaznamenÃ¡ny';

  @override
  String get failedToLoadChart => 'NepodaÅilo se naÄÃ­st graf';

  @override
  String get errors => 'Chyby';

  @override
  String get failedToLoadErrors => 'NepodaÅilo se naÄÃ­st chyby';

  @override
  String get noErrorsFound => 'Å½Ã¡dnÃ© chyby nenalezeny';

  @override
  String get everythingLooksGood => 'VÅ¡e vypadÃ¡ v poÅÃ¡dku!';

  @override
  String get occurrences => 'vÃ½skytÅ¯';

  @override
  String get sessionsAffected => 'dotÄenÃ½ch relacÃ­';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'NepodaÅilo se naÄÃ­st udÃ¡losti: $error';
  }

  @override
  String get noEventsFound => 'Å½Ã¡dnÃ© udÃ¡losti nenalezeny';

  @override
  String get failedToLoadFunnels => 'NepodaÅilo se naÄÃ­st trychtÃ½Åe';

  @override
  String get noFunnelsSaved => 'Å½Ã¡dnÃ© uloÅ¾enÃ© trychtÃ½Åe';

  @override
  String get createFunnelsHint =>
      'TrychtÃ½Åe lze vytvoÅit ve webovÃ©m rozhranÃ­';

  @override
  String get deleteFunnel => 'Smazat trychtÃ½Å';

  @override
  String deleteFunnelConfirm(String name) {
    return 'Smazat \"$name\"?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'NepodaÅilo se smazat trychtÃ½Å: $error';
  }

  @override
  String get noStepsDefined =>
      'Pro tento trychtÃ½Å nejsou definovÃ¡ny Å¾Ã¡dnÃ© kroky';

  @override
  String failedToAnalyze(String error) {
    return 'AnalÃ½za se nezdaÅila: $error';
  }

  @override
  String get overallConversion => 'CelkovÃ¡ konverze';

  @override
  String dropoff(String value) {
    return 'Odpad: $value';
  }

  @override
  String get createGoal => 'VytvoÅit cÃ­l';

  @override
  String get failedToLoadGoals => 'NepodaÅilo se naÄÃ­st cÃ­le';

  @override
  String get noGoalsConfigured => 'Å½Ã¡dnÃ© cÃ­le nejsou nastaveny';

  @override
  String get noGoalsHint => 'KlepnÄte na + pro vytvoÅenÃ­ novÃ©ho cÃ­le';

  @override
  String get conversions => 'Konverze';

  @override
  String get rate => 'MÃ­ra';

  @override
  String get editGoal => 'Upravit cÃ­l';

  @override
  String get createGoalTitle => 'VytvoÅit cÃ­l';

  @override
  String get name => 'NÃ¡zev';

  @override
  String get type => 'Typ';

  @override
  String get path => 'Cesta';

  @override
  String get event => 'UdÃ¡lost';

  @override
  String get pathPattern => 'Vzor cesty';

  @override
  String get eventName => 'NÃ¡zev udÃ¡losti';

  @override
  String get deleteGoal => 'Smazat cÃ­l';

  @override
  String deleteGoalConfirm(String name) {
    return 'Smazat \"$name\"?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'NepodaÅilo se smazat cÃ­l: $error';
  }

  @override
  String get failedToLoadPerformanceData =>
      'NepodaÅilo se naÄÃ­st data o vÃ½konu';

  @override
  String metricOverTime(String metric) {
    return '$metric v Äase';
  }

  @override
  String get byDimension => 'Podle dimenze';

  @override
  String get failedToLoadDimensionData =>
      'NepodaÅilo se naÄÃ­st data dimenze';

  @override
  String get good => 'DobrÃ©';

  @override
  String get needsImprovement => 'VyÅ¾aduje zlepÅ¡enÃ­';

  @override
  String get poor => 'Å patnÃ©';

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
  String get dimPages => 'StrÃ¡nky';

  @override
  String get dimCountries => 'ZemÄ';

  @override
  String get dimDevices => 'ZaÅÃ­zenÃ­';

  @override
  String get dimBrowsers => 'ProhlÃ­Å¾eÄe';

  @override
  String get dimOS => 'OS';

  @override
  String get sessionFilters => 'Filtry relacÃ­';

  @override
  String get minPageviews => 'Min. zobrazenÃ­ strÃ¡nek';

  @override
  String get minEvents => 'Min. udÃ¡lostÃ­';

  @override
  String get minDurationSeconds => 'Min. doba trvÃ¡nÃ­ (sekundy)';

  @override
  String get failedToLoadSessions => 'NepodaÅilo se naÄÃ­st relace';

  @override
  String get noSessionsFound => 'Å½Ã¡dnÃ© relace nenalezeny';

  @override
  String get filterSessions => 'Filtrovat relace';

  @override
  String get loadingMoreSessions => 'NaÄÃ­tÃ¡nÃ­ dalÅ¡Ã­ch relacÃ­';

  @override
  String entryPage(String page) {
    return 'VstupnÃ­ strÃ¡nka: $page';
  }

  @override
  String nPages(int count) {
    return '$count strÃ¡nek';
  }

  @override
  String get sessionReplays => 'PÅehrÃ¡vÃ¡nÃ­ relacÃ­';

  @override
  String get failedToLoadReplays => 'NepodaÅilo se naÄÃ­st pÅehrÃ¡vÃ¡nÃ­';

  @override
  String get noReplaysFound => 'Å½Ã¡dnÃ¡ pÅehrÃ¡vÃ¡nÃ­ nenalezena';

  @override
  String get noReplaysHint =>
      'PÅehrÃ¡vÃ¡nÃ­ relacÃ­ se zde zobrazÃ­, jakmile budou povolena.';

  @override
  String get previousPage => 'PÅedchozÃ­ strÃ¡nka';

  @override
  String get nextPage => 'DalÅ¡Ã­ strÃ¡nka';

  @override
  String pageNumber(int number) {
    return 'StrÃ¡nka $number';
  }

  @override
  String get unknownBrowser => 'NeznÃ¡mÃ½ prohlÃ­Å¾eÄ';

  @override
  String get unknownCountry => 'NeznÃ¡mÃ¡ zemÄ';

  @override
  String get sortUsers => 'Åadit uÅ¾ivatele';

  @override
  String get showAllUsers => 'Zobrazit vÅ¡echny uÅ¾ivatele';

  @override
  String get showIdentifiedOnly => 'Zobrazit pouze identifikovanÃ©';

  @override
  String get searchUsers => 'Hledat uÅ¾ivatele';

  @override
  String get searchUsersHint => 'Hledat uÅ¾ivatele...';

  @override
  String get clearSearch => 'Vymazat hledÃ¡nÃ­';

  @override
  String get failedToLoadUsers => 'NepodaÅilo se naÄÃ­st uÅ¾ivatele';

  @override
  String get noUsersFound => 'Å½Ã¡dnÃ­ uÅ¾ivatelÃ© nenalezeni';

  @override
  String get noIdentifiedUsers => 'Å½Ã¡dnÃ­ identifikovanÃ­ uÅ¾ivatelÃ©';

  @override
  String get usersWillAppear =>
      'UÅ¾ivatelÃ© se zobrazÃ­ po jejich identifikaci';

  @override
  String get tryDifferentSearch => 'Zkuste jinÃ½ vyhledÃ¡vacÃ­ vÃ½raz';

  @override
  String get sortedBy => 'Åazeno podle';

  @override
  String get loadingMoreUsers => 'NaÄÃ­tÃ¡nÃ­ dalÅ¡Ã­ch uÅ¾ivatelÅ¯';

  @override
  String get lastSeen => 'Naposledy vidÄn';

  @override
  String get firstSeen => 'PoprvÃ© vidÄn';

  @override
  String nUsers(String count) {
    return '$count uÅ¾ivatelÅ¯';
  }

  @override
  String nSessions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count relacÃ­',
      few: '$count relace',
      one: '1 relace',
    );
    return '$_temp0';
  }

  @override
  String lastPrefix(String value) {
    return 'Posl.: $value';
  }

  @override
  String get failedToLoadSiteConfig =>
      'NepodaÅilo se naÄÃ­st nastavenÃ­ webu';

  @override
  String get failedToLoadMetrics => 'NepodaÅilo se naÄÃ­st metriky';

  @override
  String get loadingMoreMetrics => 'NaÄÃ­tÃ¡nÃ­ dalÅ¡Ã­ch metrik';

  @override
  String noMetricData(String metric) {
    return 'Å½Ã¡dnÃ¡ data pro $metric';
  }

  @override
  String get settings => 'NastavenÃ­';

  @override
  String get connection => 'PÅipojenÃ­';

  @override
  String get notConfigured => 'Nenastaveno';

  @override
  String get authMethod => 'Metoda ovÄÅenÃ­';

  @override
  String get sessionCookie => 'Cookie relace';

  @override
  String get loggedInAs => 'PÅihlÃ¡Å¡en jako';

  @override
  String get unknown => 'NeznÃ¡mÃ©';

  @override
  String get appearance => 'Vzhled';

  @override
  String get theme => 'Motiv';

  @override
  String get dark => 'TmavÃ½';

  @override
  String get light => 'SvÄtlÃ½';

  @override
  String get auto => 'AutomatickÃ½';

  @override
  String get about => 'O aplikaci';

  @override
  String get appVersion => 'Verze aplikace';

  @override
  String get openSourceAnalytics => 'Open source webovÃ¡ analytika';

  @override
  String get logoutConfirm => 'Opravdu se chcete odhlÃ¡sit?';

  @override
  String get siteSettings => 'NastavenÃ­ webu';

  @override
  String get siteInformation => 'Informace o webu';

  @override
  String get domain => 'DomÃ©na';

  @override
  String get siteId => 'ID webu';

  @override
  String get created => 'VytvoÅeno';

  @override
  String get trackingSettings => 'NastavenÃ­ sledovÃ¡nÃ­';

  @override
  String get publicDashboard => 'VeÅejnÃ½ dashboard';

  @override
  String get publicDashboardDesc => 'Povolit veÅejnÃ½ pÅÃ­stup k analytice';

  @override
  String get sessionReplay => 'PÅehrÃ¡vÃ¡nÃ­ relacÃ­';

  @override
  String get sessionReplayDesc => 'ZaznamenÃ¡vat uÅ¾ivatelskÃ© relace';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Sledovat Core Web Vitals';

  @override
  String get trackErrors => 'SledovÃ¡nÃ­ chyb';

  @override
  String get trackErrorsDesc => 'ZachytÃ¡vat JavaScript chyby';

  @override
  String get outboundLinksTracking => 'OdchozÃ­ odkazy';

  @override
  String get outboundLinksDesc => 'Sledovat kliknutÃ­ na odchozÃ­ odkazy';

  @override
  String get excludedIps => 'VylouÄenÃ© IP adresy';

  @override
  String get excludedCountries => 'VylouÄenÃ© zemÄ';

  @override
  String get settingsSaved => 'NastavenÃ­ uloÅ¾eno';

  @override
  String failedToSave(String error) {
    return 'NepodaÅilo se uloÅ¾it: $error';
  }

  @override
  String get timeRange => 'ÄasovÃ© obdobÃ­';

  @override
  String get today => 'Dnes';

  @override
  String get yesterday => 'VÄera';

  @override
  String get last7Days => 'PoslednÃ­ch 7 dnÃ­';

  @override
  String get last30Days => 'PoslednÃ­ch 30 dnÃ­';

  @override
  String get thisWeek => 'Tento tÃ½den';

  @override
  String get thisMonth => 'Tento mÄsÃ­c';

  @override
  String get thisYear => 'Tento rok';

  @override
  String get customRange => 'VlastnÃ­ obdobÃ­';

  @override
  String get filter => 'Filtr';

  @override
  String get addFilter => 'PÅidat filtr';

  @override
  String get parameter => 'Parametr';

  @override
  String get value => 'Hodnota';

  @override
  String get enterFilterValue => 'Zadejte hodnotu filtru';

  @override
  String get requestTimedOut => 'PoÅ¾adavek vyprÅ¡el. Zkuste to prosÃ­m znovu.';

  @override
  String get networkError => 'Chyba sÃ­tÄ. Zkontrolujte pÅipojenÃ­.';

  @override
  String get sessionExpired => 'Relace vyprÅ¡ela. PÅihlaste se prosÃ­m znovu.';

  @override
  String get accessDenied => 'PÅÃ­stup odepÅen.';

  @override
  String get dataNotFound => 'Data nenalezena.';

  @override
  String get serverError => 'Chyba serveru. Zkuste to prosÃ­m pozdÄji.';

  @override
  String get failedToLoadGeneric =>
      'NepodaÅilo se naÄÃ­st data. Zkuste to prosÃ­m znovu.';

  @override
  String chartDataPoints(int count) {
    return 'Graf s $count datovÃ½mi body';
  }

  @override
  String previousPrefix(String value) {
    return 'PÅedchozÃ­: $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'HodnocenÃ­ vÃ½konu: $rating';
  }

  @override
  String get loadingContent => 'NaÄÃ­tÃ¡nÃ­ obsahu';

  @override
  String get language => 'Jazyk';

  @override
  String get selectLanguage => 'Vyberte jazyk';

  @override
  String get failedToLoadUserDetails =>
      'NepodaÅilo se naÄÃ­st detaily uÅ¾ivatele';

  @override
  String lastSeenPrefix(String value) {
    return 'Naposledy vidÄn: $value';
  }

  @override
  String get traits => 'Vlastnosti';

  @override
  String get noTraits => 'Å½Ã¡dnÃ© vlastnosti pro tohoto uÅ¾ivatele';

  @override
  String get sessionDetail => 'Detail relace';

  @override
  String get failedToLoadSession => 'NepodaÅilo se naÄÃ­st relaci';

  @override
  String get entryPageLabel => 'VstupnÃ­ strÃ¡nka';

  @override
  String get exitPage => 'VÃ½stupnÃ­ strÃ¡nka';

  @override
  String get browserAndDevice => 'ProhlÃ­Å¾eÄ a zaÅÃ­zenÃ­';

  @override
  String get browser => 'ProhlÃ­Å¾eÄ';

  @override
  String get os => 'OS';

  @override
  String get device => 'ZaÅÃ­zenÃ­';

  @override
  String get sourceLabel => 'Zdroj';

  @override
  String get referrer => 'OdkazujÃ­cÃ­ strÃ¡nka';

  @override
  String eventTimelineCount(int count) {
    return 'ÄasovÃ¡ osa udÃ¡lostÃ­ ($count)';
  }

  @override
  String get noEvents => 'Å½Ã¡dnÃ© udÃ¡losti';

  @override
  String get replayEventsTitle => 'UdÃ¡losti zÃ¡znamu';

  @override
  String get failedToLoadReplay => 'NepodaÅilo se naÄÃ­st zÃ¡znam';

  @override
  String get noReplayEvents => 'Å½Ã¡dnÃ© udÃ¡losti zÃ¡znamu';

  @override
  String get totalEvents => 'Celkem udÃ¡lostÃ­';

  @override
  String get userActionsLabel => 'Akce uÅ¾ivatele';

  @override
  String eventTimelineActions(int count) {
    return 'ÄasovÃ¡ osa udÃ¡lostÃ­ ($count akcÃ­)';
  }

  @override
  String get eventLog => 'Protokol udÃ¡lostÃ­';

  @override
  String get viewEventLog => 'Zobrazit protokol udÃ¡lostÃ­';

  @override
  String get failedToLoadEventLog =>
      'NepodaÅilo se naÄÃ­st protokol udÃ¡lostÃ­';

  @override
  String get activityHeatmap => 'TeplotnÃ­ mapa';

  @override
  String get heatmapLast4Weeks => 'PoslednÃ­ch 4 tÃ½dnÅ¯';

  @override
  String get less => 'MÃ©nÄ';

  @override
  String get more => 'VÃ­ce';

  @override
  String get peakActivity => 'Å piÄkovÃ¡ aktivita';

  @override
  String peakHour(String day, String time) {
    return '$day v $time';
  }

  @override
  String busiestDay(String day) {
    return 'NejvytÃ­Å¾enÄjÅ¡Ã­ den: $day';
  }

  @override
  String get dayMon => 'Po';

  @override
  String get dayTue => 'Ãt';

  @override
  String get dayWed => 'St';

  @override
  String get dayThu => 'Ät';

  @override
  String get dayFri => 'PÃ¡';

  @override
  String get daySat => 'So';

  @override
  String get daySun => 'Ne';

  @override
  String get searchEvents => 'Hledat udÃ¡losti...';

  @override
  String get allTypes => 'VÅ¡e';

  @override
  String get noMatchingEvents => 'Å½Ã¡dnÃ© odpovÃ­dajÃ­cÃ­ udÃ¡losti';

  @override
  String get liveView => 'Å½ivÄ';

  @override
  String get autoRefresh => 'AutomatickÃ¡ aktualizace';

  @override
  String get usersOnlineNow => 'UÅ¾ivatelÃ© online';

  @override
  String lastUpdatedAt(String time) {
    return 'AktualizovÃ¡no v $time';
  }

  @override
  String get last30Minutes => 'PoslednÃ­ch 30 minut';

  @override
  String get last5Minutes => 'PoslednÃ­ch 5 min';

  @override
  String get recentEvents => 'NedÃ¡vnÃ© udÃ¡losti';

  @override
  String get noRecentEvents => 'Å½Ã¡dnÃ© nedÃ¡vnÃ© udÃ¡losti';

  @override
  String get retention => 'Retence';

  @override
  String get weekly => 'TÃ½dnÄ';

  @override
  String get daily => 'DennÄ';

  @override
  String get retentionRange => 'Rozsah';

  @override
  String retentionDays(int count) {
    return '$count dnÃ­';
  }

  @override
  String get failedToLoadRetention => 'NepodaÅilo se naÄÃ­st data retence';

  @override
  String get noRetentionData => 'Å½Ã¡dnÃ¡ data retence';

  @override
  String get cohort => 'Kohorta';

  @override
  String get retentionWeekPrefix => 'T';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => 'Cesty uÅ¾ivatelÅ¯';

  @override
  String get journeySteps => 'Kroky';

  @override
  String get failedToLoadJourneys => 'NepodaÅilo se naÄÃ­st cesty';

  @override
  String get noJourneysFound => 'Å½Ã¡dnÃ© cesty nenalezeny';

  @override
  String journeySessions(String count) {
    return '$count relacÃ­';
  }

  @override
  String get locations => 'Lokace';

  @override
  String get locationCities => 'MÄsta';

  @override
  String get failedToLoadLocations => 'NepodaÅilo se naÄÃ­st lokace';

  @override
  String get noLocationsFound => 'Å½Ã¡dnÃ© lokace nenalezeny';

  @override
  String get coreFeatures => 'HlavnÃ­';

  @override
  String get insights => 'PÅehledy';

  @override
  String get tools => 'NÃ¡stroje';

  @override
  String get userTraits => 'Vlastnosti';

  @override
  String get failedToLoadUserTraits =>
      'NepodaÅilo se naÄÃ­st vlastnosti uÅ¾ivatelÅ¯';

  @override
  String get noUserTraits => 'Å½Ã¡dnÃ© vlastnosti nenalezeny';

  @override
  String get noUserTraitsHint =>
      'Vlastnosti se zobrazÃ­ po identifikaci uÅ¾ivatelÅ¯ s vlastnÃ­mi atributy';

  @override
  String traitUsersCount(String count) {
    return '$count uÅ¾ivatelÅ¯';
  }

  @override
  String get entryPages => 'Vstupní stránky';

  @override
  String get exitPages => 'Výstupní stránky';

  @override
  String get browsers => 'Prohlížeče';

  @override
  String get operatingSystems => 'OS';

  @override
  String get utmSource => 'UTM Zdroj';

  @override
  String get channel => 'Kanál';

  @override
  String get pageTitles => 'Názvy stránek';

  @override
  String get sources => 'Zdroje';
}
