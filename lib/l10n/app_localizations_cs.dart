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
  String get appSubtitle => 'Neoficiální';

  @override
  String get cancel => 'Zrušit';

  @override
  String get delete => 'Smazat';

  @override
  String get save => 'Uložit';

  @override
  String get update => 'Aktualizovat';

  @override
  String get create => 'Vytvořit';

  @override
  String get retry => 'Zkusit znovu';

  @override
  String get add => 'Přidat';

  @override
  String get edit => 'Upravit';

  @override
  String get clear => 'Vymazat';

  @override
  String get apply => 'Použít';

  @override
  String get goBack => 'Zpět';

  @override
  String get noData => 'Žádná data';

  @override
  String get loading => 'Načítání';

  @override
  String get logout => 'Odhlásit se';

  @override
  String get close => 'Zavřít';

  @override
  String get serverUrl => 'URL serveru';

  @override
  String get serverUrlHint => 'https://vase-rybbit-instance.com';

  @override
  String get email => 'E-mail';

  @override
  String get apiKey => 'API klíč';

  @override
  String get password => 'Heslo';

  @override
  String get showPassword => 'Zobrazit heslo';

  @override
  String get hidePassword => 'Skrýt heslo';

  @override
  String get connect => 'Připojit';

  @override
  String get invalidUrl => 'Zadejte platnou URL (https://...)';

  @override
  String get connectionFailed => 'Připojení selhalo. Zkontrolujte URL serveru.';

  @override
  String get invalidApiKey => 'Neplatný API klíč';

  @override
  String get connectionFailedApiKey =>
      'Připojení selhalo. Zkontrolujte URL serveru a API klíč.';

  @override
  String get organizations => 'Organizace';

  @override
  String get noSitesFound => 'Žádné weby nenalezeny';

  @override
  String get noSitesHint => 'Pro začátek přidejte web ve webovém rozhraní.';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count webů',
      few: '$count weby',
      one: '1 web',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return 'Členové ($count)';
  }

  @override
  String get failedToLoadOrganizations => 'Nepodařilo se načíst organizace';

  @override
  String get noOrganizations => 'Žádné organizace';

  @override
  String get noOrganizationsHint =>
      'Organizace lze vytvořit ve webovém rozhraní';

  @override
  String get failedToLoadMembers => 'Nepodařilo se načíst členy';

  @override
  String get failedToLoadSites => 'Nepodařilo se načíst weby';

  @override
  String get failedToLoadAnalytics => 'Nepodařilo se načíst analytiku';

  @override
  String get noDataAvailable => 'Žádná data k dispozici';

  @override
  String get users => 'Uživatelé';

  @override
  String get sessions => 'Relace';

  @override
  String get pageviews => 'Zobrazení stránek';

  @override
  String get pagesPerSession => 'Stránky/relace';

  @override
  String get bounceRate => 'Míra okamžitého opuštění';

  @override
  String get duration => 'Doba trvání';

  @override
  String get metrics => 'Metriky';

  @override
  String get pages => 'Stránky';

  @override
  String get referrers => 'Odkazující';

  @override
  String get countries => 'Země';

  @override
  String get devices => 'Zařízení';

  @override
  String get performance => 'Výkon';

  @override
  String get goals => 'Cíle';

  @override
  String get funnels => 'Trychtýře';

  @override
  String get replay => 'Přehrávání';

  @override
  String get config => 'Nastavení';

  @override
  String usersOnline(int count) {
    return '$count uživatelů online';
  }

  @override
  String get events => 'Události';

  @override
  String get eventsOverTime => 'Události v čase';

  @override
  String get eventNames => 'Názvy událostí';

  @override
  String get noCustomEventsTracked =>
      'Žádné vlastní události nebyly zaznamenány';

  @override
  String get failedToLoadProperties => 'Nepodařilo se načíst vlastnosti';

  @override
  String get noProperties => 'Žádné vlastnosti';

  @override
  String get outboundLinks => 'Odchozí odkazy';

  @override
  String get noOutboundLinksTracked =>
      'Žádné odchozí odkazy nebyly zaznamenány';

  @override
  String get failedToLoadChart => 'Nepodařilo se načíst graf';

  @override
  String get errors => 'Chyby';

  @override
  String get failedToLoadErrors => 'Nepodařilo se načíst chyby';

  @override
  String get noErrorsFound => 'Žádné chyby nenalezeny';

  @override
  String get everythingLooksGood => 'Vše vypadá v pořádku!';

  @override
  String get occurrences => 'výskytů';

  @override
  String get sessionsAffected => 'dotčených relací';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'Nepodařilo se načíst události: $error';
  }

  @override
  String get noEventsFound => 'Žádné události nenalezeny';

  @override
  String get failedToLoadFunnels => 'Nepodařilo se načíst trychtýře';

  @override
  String get noFunnelsSaved => 'Žádné uložené trychtýře';

  @override
  String get createFunnelsHint => 'Trychtýře lze vytvořit ve webovém rozhraní';

  @override
  String get deleteFunnel => 'Smazat trychtýř';

  @override
  String deleteFunnelConfirm(String name) {
    return 'Smazat \"$name\"?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'Nepodařilo se smazat trychtýř: $error';
  }

  @override
  String get noStepsDefined =>
      'Pro tento trychtýř nejsou definovány žádné kroky';

  @override
  String failedToAnalyze(String error) {
    return 'Analýza se nezdařila: $error';
  }

  @override
  String get overallConversion => 'Celková konverze';

  @override
  String dropoff(String value) {
    return 'Odpad: $value';
  }

  @override
  String get createGoal => 'Vytvořit cíl';

  @override
  String get failedToLoadGoals => 'Nepodařilo se načíst cíle';

  @override
  String get noGoalsConfigured => 'Žádné cíle nejsou nastaveny';

  @override
  String get noGoalsHint => 'Klepněte na + pro vytvoření nového cíle';

  @override
  String get conversions => 'Konverze';

  @override
  String get rate => 'Míra';

  @override
  String get editGoal => 'Upravit cíl';

  @override
  String get createGoalTitle => 'Vytvořit cíl';

  @override
  String get name => 'Název';

  @override
  String get type => 'Typ';

  @override
  String get path => 'Cesta';

  @override
  String get event => 'Událost';

  @override
  String get pathPattern => 'Vzor cesty';

  @override
  String get eventName => 'Název události';

  @override
  String get deleteGoal => 'Smazat cíl';

  @override
  String deleteGoalConfirm(String name) {
    return 'Smazat \"$name\"?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'Nepodařilo se smazat cíl: $error';
  }

  @override
  String get failedToLoadPerformanceData =>
      'Nepodařilo se načíst data o výkonu';

  @override
  String metricOverTime(String metric) {
    return '$metric v čase';
  }

  @override
  String get byDimension => 'Podle dimenze';

  @override
  String get failedToLoadDimensionData => 'Nepodařilo se načíst data dimenze';

  @override
  String get good => 'Dobré';

  @override
  String get needsImprovement => 'Vyžaduje zlepšení';

  @override
  String get poor => 'Špatné';

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
  String get dimPages => 'Stránky';

  @override
  String get dimCountries => 'Země';

  @override
  String get dimDevices => 'Zařízení';

  @override
  String get dimBrowsers => 'Prohlížeče';

  @override
  String get dimOS => 'OS';

  @override
  String get sessionFilters => 'Filtry relací';

  @override
  String get minPageviews => 'Min. zobrazení stránek';

  @override
  String get minEvents => 'Min. událostí';

  @override
  String get minDurationSeconds => 'Min. doba trvání (sekundy)';

  @override
  String get failedToLoadSessions => 'Nepodařilo se načíst relace';

  @override
  String get noSessionsFound => 'Žádné relace nenalezeny';

  @override
  String get filterSessions => 'Filtrovat relace';

  @override
  String get loadingMoreSessions => 'Načítání dalších relací';

  @override
  String entryPage(String page) {
    return 'Vstupní stránka: $page';
  }

  @override
  String nPages(int count) {
    return '$count stránek';
  }

  @override
  String get sessionReplays => 'Přehrávání relací';

  @override
  String get failedToLoadReplays => 'Nepodařilo se načíst přehrávání';

  @override
  String get noReplaysFound => 'Žádná přehrávání nenalezena';

  @override
  String get noReplaysHint =>
      'Přehrávání relací se zde zobrazí, jakmile budou povolena.';

  @override
  String get previousPage => 'Předchozí stránka';

  @override
  String get nextPage => 'Další stránka';

  @override
  String pageNumber(int number) {
    return 'Stránka $number';
  }

  @override
  String get unknownBrowser => 'Neznámý prohlížeč';

  @override
  String get unknownCountry => 'Neznámá země';

  @override
  String get sortUsers => 'Řadit uživatele';

  @override
  String get showAllUsers => 'Zobrazit všechny uživatele';

  @override
  String get showIdentifiedOnly => 'Zobrazit pouze identifikované';

  @override
  String get searchUsers => 'Hledat uživatele';

  @override
  String get searchUsersHint => 'Hledat uživatele...';

  @override
  String get clearSearch => 'Vymazat hledání';

  @override
  String get failedToLoadUsers => 'Nepodařilo se načíst uživatele';

  @override
  String get noUsersFound => 'Žádní uživatelé nenalezeni';

  @override
  String get noIdentifiedUsers => 'Žádní identifikovaní uživatelé';

  @override
  String get usersWillAppear => 'Uživatelé se zobrazí po jejich identifikaci';

  @override
  String get tryDifferentSearch => 'Zkuste jiný vyhledávací výraz';

  @override
  String get sortedBy => 'Řazeno podle';

  @override
  String get loadingMoreUsers => 'Načítání dalších uživatelů';

  @override
  String get lastSeen => 'Naposledy viděn';

  @override
  String get firstSeen => 'Poprvé viděn';

  @override
  String nUsers(String count) {
    return '$count uživatelů';
  }

  @override
  String nSessions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count relací',
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
  String get failedToLoadSiteConfig => 'Nepodařilo se načíst nastavení webu';

  @override
  String get failedToLoadMetrics => 'Nepodařilo se načíst metriky';

  @override
  String get loadingMoreMetrics => 'Načítání dalších metrik';

  @override
  String noMetricData(String metric) {
    return 'Žádná data pro $metric';
  }

  @override
  String get settings => 'Nastavení';

  @override
  String get connection => 'Připojení';

  @override
  String get notConfigured => 'Nenastaveno';

  @override
  String get authMethod => 'Metoda ověření';

  @override
  String get sessionCookie => 'Cookie relace';

  @override
  String get loggedInAs => 'Přihlášen jako';

  @override
  String get unknown => 'Neznámé';

  @override
  String get appearance => 'Vzhled';

  @override
  String get theme => 'Motiv';

  @override
  String get dark => 'Tmavý';

  @override
  String get light => 'Světlý';

  @override
  String get auto => 'Auto';

  @override
  String get about => 'O aplikaci';

  @override
  String get appVersion => 'Verze aplikace';

  @override
  String get openSourceAnalytics => 'Open source webová analytika';

  @override
  String get developer => 'Vývojář';

  @override
  String get sourceCode => 'Zdrojový kód';

  @override
  String get originalProject => 'Původní projekt';

  @override
  String get viewOnGitHub => 'Zobrazit na GitHubu';

  @override
  String get unofficialClient =>
      'Neoficiální mobilní klient pro analytickou platformu Rybbit';

  @override
  String get madeBy => 'Vytvořil NKS Hub';

  @override
  String get mobileAppDeveloper => 'Vývojář mobilní aplikace';

  @override
  String get logoutConfirm => 'Opravdu se chcete odhlásit?';

  @override
  String get siteSettings => 'Nastavení webu';

  @override
  String get siteInformation => 'Informace o webu';

  @override
  String get domain => 'Doména';

  @override
  String get siteId => 'ID webu';

  @override
  String siteLabel(String id) {
    return 'Web $id';
  }

  @override
  String get created => 'Vytvořeno';

  @override
  String get trackingSettings => 'Nastavení sledování';

  @override
  String get publicDashboard => 'Veřejný dashboard';

  @override
  String get publicDashboardDesc => 'Povolit veřejný přístup k analytice';

  @override
  String get sessionReplay => 'Přehrávání relací';

  @override
  String get sessionReplayDesc => 'Zaznamenávat uživatelské relace';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Sledovat Core Web Vitals';

  @override
  String get trackErrors => 'Sledování chyb';

  @override
  String get trackErrorsDesc => 'Zachytávat JavaScript chyby';

  @override
  String get outboundLinksTracking => 'Odchozí odkazy';

  @override
  String get outboundLinksDesc => 'Sledovat kliknutí na odchozí odkazy';

  @override
  String get excludedIps => 'Vyloučené IP adresy';

  @override
  String get excludedCountries => 'Vyloučené země';

  @override
  String get settingsSaved => 'Nastavení uloženo';

  @override
  String failedToSave(String error) {
    return 'Nepodařilo se uložit: $error';
  }

  @override
  String get timeRange => 'Časové období';

  @override
  String get today => 'Dnes';

  @override
  String get yesterday => 'Včera';

  @override
  String get last7Days => 'Posledních 7 dní';

  @override
  String get last30Days => 'Posledních 30 dní';

  @override
  String get thisWeek => 'Tento týden';

  @override
  String get thisMonth => 'Tento měsíc';

  @override
  String get thisYear => 'Tento rok';

  @override
  String get customRange => 'Vlastní období';

  @override
  String get allTime => 'Celé období';

  @override
  String lastMinutes(int count) {
    return 'Posledních $count min';
  }

  @override
  String get notSet => '(nenastaveno)';

  @override
  String get bouncePrefix => 'Míra odrazu';

  @override
  String get timePrefix => 'Čas';

  @override
  String get eventTypePageview => 'Zobrazení stránky';

  @override
  String get eventTypeCustom => 'Vlastní';

  @override
  String get eventTypeOutbound => 'Odchozí';

  @override
  String get eventTypeClick => 'Kliknutí';

  @override
  String get eventTypeForm => 'Formulář';

  @override
  String get eventTypeInput => 'Vstup';

  @override
  String get eventTypeCopy => 'Kopírování';

  @override
  String get filter => 'Filtr';

  @override
  String get addFilter => 'Přidat filtr';

  @override
  String get parameter => 'Parametr';

  @override
  String get value => 'Hodnota';

  @override
  String get enterFilterValue => 'Zadejte hodnotu filtru';

  @override
  String get filterBrowser => 'Prohlížeč';

  @override
  String get filterOs => 'Operační systém';

  @override
  String get filterLanguage => 'Jazyk';

  @override
  String get filterCountry => 'Země';

  @override
  String get filterRegion => 'Region';

  @override
  String get filterCity => 'Město';

  @override
  String get filterDeviceType => 'Typ zařízení';

  @override
  String get filterReferrer => 'Odkazující stránka';

  @override
  String get filterHostname => 'Hostname';

  @override
  String get filterPathname => 'Cesta';

  @override
  String get filterPageTitle => 'Název stránky';

  @override
  String get filterQuerystring => 'Querystring';

  @override
  String get filterEventName => 'Název události';

  @override
  String get filterChannel => 'Kanál';

  @override
  String get filterUtmSource => 'UTM Zdroj';

  @override
  String get filterUtmMedium => 'UTM Médium';

  @override
  String get filterUtmCampaign => 'UTM Kampaň';

  @override
  String get filterUtmTerm => 'UTM Výraz';

  @override
  String get filterUtmContent => 'UTM Obsah';

  @override
  String get filterEntryPage => 'Vstupní stránka';

  @override
  String get filterExitPage => 'Výstupní stránka';

  @override
  String get requestTimedOut => 'Požadavek vypršel. Zkuste to prosím znovu.';

  @override
  String get networkError => 'Chyba sítě. Zkontrolujte připojení.';

  @override
  String get sessionExpired => 'Relace vypršela. Přihlaste se prosím znovu.';

  @override
  String get accessDenied => 'Přístup odepřen.';

  @override
  String get dataNotFound => 'Data nenalezena.';

  @override
  String get serverError => 'Chyba serveru. Zkuste to prosím později.';

  @override
  String get failedToLoadGeneric =>
      'Nepodařilo se načíst data. Zkuste to prosím znovu.';

  @override
  String chartDataPoints(int count) {
    return 'Graf s $count datovými body';
  }

  @override
  String previousPrefix(String value) {
    return 'Předchozí: $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'Hodnocení výkonu: $rating';
  }

  @override
  String get loadingContent => 'Načítání obsahu';

  @override
  String get language => 'Jazyk';

  @override
  String get selectLanguage => 'Vyberte jazyk';

  @override
  String get failedToLoadUserDetails =>
      'Nepodařilo se načíst detaily uživatele';

  @override
  String lastSeenPrefix(String value) {
    return 'Naposledy viděn: $value';
  }

  @override
  String get traits => 'Vlastnosti';

  @override
  String get noTraits => 'Žádné vlastnosti pro tohoto uživatele';

  @override
  String get sessionDetail => 'Detail relace';

  @override
  String get failedToLoadSession => 'Nepodařilo se načíst relaci';

  @override
  String get entryPageLabel => 'Vstupní stránka';

  @override
  String get exitPage => 'Výstupní stránka';

  @override
  String get browserAndDevice => 'Prohlížeč a zařízení';

  @override
  String get browser => 'Prohlížeč';

  @override
  String get os => 'OS';

  @override
  String get device => 'Zařízení';

  @override
  String get sourceLabel => 'Zdroj';

  @override
  String get referrer => 'Odkazující stránka';

  @override
  String eventTimelineCount(int count) {
    return 'Časová osa událostí ($count)';
  }

  @override
  String get noEvents => 'Žádné události';

  @override
  String get replayEventsTitle => 'Události záznamu';

  @override
  String get failedToLoadReplay => 'Nepodařilo se načíst záznam';

  @override
  String get noReplayEvents => 'Žádné události záznamu';

  @override
  String get totalEvents => 'Celkem událostí';

  @override
  String get userActionsLabel => 'Akce uživatele';

  @override
  String eventTimelineActions(int count) {
    return 'Časová osa událostí ($count akcí)';
  }

  @override
  String get eventLog => 'Protokol událostí';

  @override
  String get viewEventLog => 'Zobrazit protokol událostí';

  @override
  String get failedToLoadEventLog => 'Nepodařilo se načíst protokol událostí';

  @override
  String get activityHeatmap => 'Teplotní mapa';

  @override
  String get heatmapLast4Weeks => 'Posledních 4 týdnů';

  @override
  String get less => 'Méně';

  @override
  String get more => 'Více';

  @override
  String get peakActivity => 'Špičková aktivita';

  @override
  String peakHour(String day, String time) {
    return '$day v $time';
  }

  @override
  String busiestDay(String day) {
    return 'Nejvytíženější den: $day';
  }

  @override
  String get dayMon => 'Po';

  @override
  String get dayTue => 'Út';

  @override
  String get dayWed => 'St';

  @override
  String get dayThu => 'Čt';

  @override
  String get dayFri => 'Pá';

  @override
  String get daySat => 'So';

  @override
  String get daySun => 'Ne';

  @override
  String get searchEvents => 'Hledat události...';

  @override
  String get allTypes => 'Vše';

  @override
  String get allOrganizations => 'Všechny organizace';

  @override
  String get noMatchingEvents => 'Žádné odpovídající události';

  @override
  String get liveView => 'Živě';

  @override
  String get autoRefresh => 'Automatická aktualizace';

  @override
  String get usersOnlineNow => 'Uživatelé online';

  @override
  String lastUpdatedAt(String time) {
    return 'Aktualizováno v $time';
  }

  @override
  String get last30Minutes => 'Posledních 30 minut';

  @override
  String get last5Minutes => 'Posledních 5 min';

  @override
  String get recentEvents => 'Nedávné události';

  @override
  String get noRecentEvents => 'Žádné nedávné události';

  @override
  String get retention => 'Retence';

  @override
  String get weekly => 'Týdně';

  @override
  String get daily => 'Denně';

  @override
  String get retentionRange => 'Rozsah';

  @override
  String retentionDays(int count) {
    return '$count dní';
  }

  @override
  String get failedToLoadRetention => 'Nepodařilo se načíst data retence';

  @override
  String get noRetentionData => 'Žádná data retence';

  @override
  String get cohort => 'Kohorta';

  @override
  String get retentionWeekPrefix => 'T';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => 'Cesty uživatelů';

  @override
  String get journeySteps => 'Kroky';

  @override
  String get failedToLoadJourneys => 'Nepodařilo se načíst cesty';

  @override
  String get noJourneysFound => 'Žádné cesty nenalezeny';

  @override
  String journeySessions(String count) {
    return '$count relací';
  }

  @override
  String get locations => 'Lokace';

  @override
  String get locationCities => 'Města';

  @override
  String get failedToLoadLocations => 'Nepodařilo se načíst lokace';

  @override
  String get noLocationsFound => 'Žádné lokace nenalezeny';

  @override
  String get coreFeatures => 'Hlavní';

  @override
  String get insights => 'Přehledy';

  @override
  String get tools => 'Nástroje';

  @override
  String get userTraits => 'Vlastnosti';

  @override
  String get failedToLoadUserTraits =>
      'Nepodařilo se načíst vlastnosti uživatelů';

  @override
  String get noUserTraits => 'Žádné vlastnosti nenalezeny';

  @override
  String get noUserTraitsHint =>
      'Vlastnosti se zobrazí po identifikaci uživatelů s vlastními atributy';

  @override
  String traitUsersCount(String count) {
    return '$count uživatelů';
  }

  @override
  String get dashboard => 'Přehled';

  @override
  String get analytics => 'Analytika';

  @override
  String get noSiteSelected => 'Žádný web nevybrán';

  @override
  String selectSiteFromDashboard(String tabName) {
    return 'Pro zobrazení $tabName vyberte web na kartě Přehled.';
  }

  @override
  String get goToDashboard => 'Přejít na přehled';

  @override
  String todayVisitors(int count) {
    return '$count dnes';
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

  @override
  String get cities => 'Města';

  @override
  String get languages => 'Jazyky';

  @override
  String get hostnames => 'Hostitelé';

  @override
  String get vpn => 'VPN';

  @override
  String get crawlers => 'Roboti';

  @override
  String get datacenters => 'Datová centra';

  @override
  String get companies => 'Společnosti';

  @override
  String get companyType => 'Typ společnosti';

  @override
  String get companyDomain => 'Doména společnosti';

  @override
  String get asnOrg => 'ASN organizace';

  @override
  String get asnType => 'ASN typ';

  @override
  String get asnDomain => 'ASN doména';

  @override
  String get utmMedium => 'UTM Médium';

  @override
  String get utmCampaign => 'UTM Kampaň';

  @override
  String nMoreItems(int count) {
    return '+$count dalších';
  }

  @override
  String sessionsWithPercentage(String count, String percentage) {
    return '$count relací ($percentage %)';
  }

  @override
  String errorGeneric(String error) {
    return 'Chyba: $error';
  }

  @override
  String get replayPageSnapshot => 'Snímek stránky';

  @override
  String get replayPageLoad => 'Načtení stránky';

  @override
  String get replayCustomEvent => 'Vlastní událost';

  @override
  String get replayPluginEvent => 'Událost pluginu';

  @override
  String get replayInteraction => 'Interakce';

  @override
  String get replayScroll => 'Posouvání';

  @override
  String get replayResize => 'Změna velikosti';

  @override
  String get replayInput => 'Vstup';

  @override
  String get replayUpdate => 'Aktualizace';

  @override
  String get url => 'URL';

  @override
  String get searchSites => 'Hledat weby...';

  @override
  String get sortSites => 'Seřadit weby';

  @override
  String get sortAlphabetically => 'Abecedně';

  @override
  String get sortByCount => 'Řadit podle počtu';

  @override
  String get sortByVisitors => 'Podle návštěvníků dnes';

  @override
  String get sortByLiveUsers => 'Podle online uživatelů';

  @override
  String get noMatchingSites => 'Žádné odpovídající weby';

  @override
  String get utmTerm => 'UTM Termín';

  @override
  String get utmContent => 'UTM Obsah';

  @override
  String get browserVersions => 'Verze prohlížečů';

  @override
  String get osVersions => 'Verze OS';

  @override
  String get screenDimensions => 'Rozlišení obrazovky';

  @override
  String get relativeNow => 'teď';

  @override
  String relativeMinutes(int count) {
    return '${count}m';
  }

  @override
  String relativeHours(int count) {
    return '${count}h';
  }

  @override
  String relativeDays(int count) {
    return '${count}d';
  }

  @override
  String relativeWeeks(int count) {
    return '${count}t';
  }

  @override
  String get emptyValue => '(prázdné)';

  @override
  String get screenviews => 'Zobrazení obrazovek';

  @override
  String get screensPerSession => 'Obrazovky/Relace';

  @override
  String get screens => 'Obrazovky';

  @override
  String get entryScreens => 'Vstupní obrazovky';

  @override
  String get exitScreens => 'Výstupní obrazovky';

  @override
  String get deviceModel => 'Model zařízení';

  @override
  String get appVersions => 'Verze aplikace';

  @override
  String get sdkInfo => 'Informace o SDK';
}
