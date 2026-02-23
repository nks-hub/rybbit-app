// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => 'Nieoficjalna';

  @override
  String get cancel => 'Anuluj';

  @override
  String get delete => 'UsuÅ';

  @override
  String get save => 'Zapisz';

  @override
  String get update => 'Aktualizuj';

  @override
  String get create => 'UtwÃ³rz';

  @override
  String get retry => 'PonÃ³w';

  @override
  String get add => 'Dodaj';

  @override
  String get edit => 'Edytuj';

  @override
  String get clear => 'WyczyÅÄ';

  @override
  String get apply => 'Zastosuj';

  @override
  String get goBack => 'WrÃ³Ä';

  @override
  String get noData => 'Brak danych';

  @override
  String get loading => 'Åadowanie';

  @override
  String get logout => 'Wyloguj';

  @override
  String get close => 'Zamknij';

  @override
  String get serverUrl => 'URL serwera';

  @override
  String get serverUrlHint => 'https://twoja-instancja-rybbit.com';

  @override
  String get email => 'E-mail';

  @override
  String get apiKey => 'Klucz API';

  @override
  String get password => 'HasÅo';

  @override
  String get connect => 'PoÅÄcz';

  @override
  String get organizations => 'Organizacje';

  @override
  String get noSitesFound => 'Nie znaleziono witryn';

  @override
  String get noSitesHint =>
      'Dodaj witrynÄ w panelu internetowym, aby rozpoczÄÄ.';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count witryn',
      one: '1 witryna',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return 'CzÅonkowie ($count)';
  }

  @override
  String get failedToLoadOrganizations =>
      'Nie udaÅo siÄ zaÅadowaÄ organizacji';

  @override
  String get noOrganizations => 'Brak organizacji';

  @override
  String get noOrganizationsHint =>
      'Organizacje moÅ¼na tworzyÄ w panelu internetowym';

  @override
  String get failedToLoadMembers => 'Nie udaÅo siÄ zaÅadowaÄ czÅonkÃ³w';

  @override
  String get failedToLoadSites => 'Nie udaÅo siÄ zaÅadowaÄ stron';

  @override
  String get failedToLoadAnalytics => 'Nie udaÅo siÄ zaÅadowaÄ analityki';

  @override
  String get noDataAvailable => 'Brak dostÄpnych danych';

  @override
  String get users => 'UÅ¼ytkownicy';

  @override
  String get sessions => 'Sesje';

  @override
  String get pageviews => 'OdsÅony';

  @override
  String get pagesPerSession => 'Strony/Sesja';

  @override
  String get bounceRate => 'WspÃ³Åczynnik odrzuceÅ';

  @override
  String get duration => 'Czas trwania';

  @override
  String get metrics => 'Metryki';

  @override
  String get pages => 'Strony';

  @override
  String get referrers => 'Strony odsyÅajÄce';

  @override
  String get countries => 'Kraje';

  @override
  String get devices => 'UrzÄdzenia';

  @override
  String get performance => 'WydajnoÅÄ';

  @override
  String get goals => 'Cele';

  @override
  String get funnels => 'Lejki';

  @override
  String get replay => 'Odtwarzanie';

  @override
  String get config => 'Konfiguracja';

  @override
  String usersOnline(int count) {
    return '$count uÅ¼ytkownikÃ³w online';
  }

  @override
  String get events => 'Zdarzenia';

  @override
  String get eventsOverTime => 'Zdarzenia w czasie';

  @override
  String get eventNames => 'Nazwy zdarzeÅ';

  @override
  String get noCustomEventsTracked => 'Nie Åledzono niestandardowych zdarzeÅ';

  @override
  String get failedToLoadProperties =>
      'Nie udaÅo siÄ zaÅadowaÄ wÅaÅciwoÅci';

  @override
  String get noProperties => 'Brak wÅaÅciwoÅci';

  @override
  String get outboundLinks => 'Linki wychodzÄce';

  @override
  String get noOutboundLinksTracked => 'Nie Åledzono linkÃ³w wychodzÄcych';

  @override
  String get failedToLoadChart => 'Nie udaÅo siÄ zaÅadowaÄ wykresu';

  @override
  String get errors => 'BÅÄdy';

  @override
  String get failedToLoadErrors => 'Nie udaÅo siÄ zaÅadowaÄ bÅÄdÃ³w';

  @override
  String get noErrorsFound => 'Nie znaleziono bÅÄdÃ³w';

  @override
  String get everythingLooksGood => 'Wszystko wyglÄda dobrze!';

  @override
  String get occurrences => 'wystÄpienia';

  @override
  String get sessionsAffected => 'dotkniÄte sesje';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'Nie udaÅo siÄ zaÅadowaÄ zdarzeÅ: $error';
  }

  @override
  String get noEventsFound => 'Nie znaleziono zdarzeÅ';

  @override
  String get failedToLoadFunnels => 'Nie udaÅo siÄ zaÅadowaÄ lejkÃ³w';

  @override
  String get noFunnelsSaved => 'Brak zapisanych lejkÃ³w';

  @override
  String get createFunnelsHint => 'UtwÃ³rz lejki w panelu internetowym';

  @override
  String get deleteFunnel => 'UsuÅ lejek';

  @override
  String deleteFunnelConfirm(String name) {
    return 'UsunÄÄ \"$name\"?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'Nie udaÅo siÄ usunÄÄ lejka: $error';
  }

  @override
  String get noStepsDefined => 'Nie zdefiniowano krokÃ³w dla tego lejka';

  @override
  String failedToAnalyze(String error) {
    return 'Nie udaÅo siÄ przeanalizowaÄ: $error';
  }

  @override
  String get overallConversion => 'OgÃ³lna konwersja';

  @override
  String dropoff(String value) {
    return 'OdpadniÄcie: $value';
  }

  @override
  String get createGoal => 'UtwÃ³rz cel';

  @override
  String get failedToLoadGoals => 'Nie udaÅo siÄ zaÅadowaÄ celÃ³w';

  @override
  String get noGoalsConfigured => 'Brak skonfigurowanych celÃ³w';

  @override
  String get noGoalsHint => 'NaciÅnij +, aby utworzyÄ nowy cel';

  @override
  String get conversions => 'Konwersje';

  @override
  String get rate => 'WspÃ³Åczynnik';

  @override
  String get editGoal => 'Edytuj cel';

  @override
  String get createGoalTitle => 'UtwÃ³rz cel';

  @override
  String get name => 'Nazwa';

  @override
  String get type => 'Typ';

  @override
  String get path => 'ÅcieÅ¼ka';

  @override
  String get event => 'Zdarzenie';

  @override
  String get pathPattern => 'Wzorzec ÅcieÅ¼ki';

  @override
  String get eventName => 'Nazwa zdarzenia';

  @override
  String get deleteGoal => 'UsuÅ cel';

  @override
  String deleteGoalConfirm(String name) {
    return 'UsunÄÄ \"$name\"?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'Nie udaÅo siÄ usunÄÄ celu: $error';
  }

  @override
  String get failedToLoadPerformanceData =>
      'Nie udaÅo siÄ zaÅadowaÄ danych wydajnoÅci';

  @override
  String metricOverTime(String metric) {
    return '$metric w czasie';
  }

  @override
  String get byDimension => 'WedÅug wymiaru';

  @override
  String get failedToLoadDimensionData =>
      'Nie udaÅo siÄ zaÅadowaÄ danych wymiaru';

  @override
  String get good => 'Dobrze';

  @override
  String get needsImprovement => 'Wymaga poprawy';

  @override
  String get poor => 'SÅabo';

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
  String get dimPages => 'Strony';

  @override
  String get dimCountries => 'Kraje';

  @override
  String get dimDevices => 'UrzÄdzenia';

  @override
  String get dimBrowsers => 'PrzeglÄdarki';

  @override
  String get dimOS => 'System operacyjny';

  @override
  String get sessionFilters => 'Filtry sesji';

  @override
  String get minPageviews => 'Min. odsÅony';

  @override
  String get minEvents => 'Min. zdarzenia';

  @override
  String get minDurationSeconds => 'Min. czas trwania (sekundy)';

  @override
  String get failedToLoadSessions => 'Nie udaÅo siÄ zaÅadowaÄ sesji';

  @override
  String get noSessionsFound => 'Nie znaleziono sesji';

  @override
  String get filterSessions => 'Filtruj sesje';

  @override
  String get loadingMoreSessions => 'Åadowanie kolejnych sesji';

  @override
  String entryPage(String page) {
    return 'Strona wejÅciowa: $page';
  }

  @override
  String nPages(int count) {
    return '$count stron';
  }

  @override
  String get sessionReplays => 'Odtwarzanie sesji';

  @override
  String get failedToLoadReplays => 'Nie udaÅo siÄ zaÅadowaÄ odtworzeÅ';

  @override
  String get noReplaysFound => 'Nie znaleziono odtworzeÅ';

  @override
  String get noReplaysHint =>
      'Odtwarzanie sesji pojawi siÄ tutaj, gdy zostanie wÅÄczone.';

  @override
  String get previousPage => 'Poprzednia strona';

  @override
  String get nextPage => 'NastÄpna strona';

  @override
  String pageNumber(int number) {
    return 'Strona $number';
  }

  @override
  String get unknownBrowser => 'Nieznana przeglÄdarka';

  @override
  String get unknownCountry => 'Nieznany kraj';

  @override
  String get sortUsers => 'Sortuj uÅ¼ytkownikÃ³w';

  @override
  String get showAllUsers => 'PokaÅ¼ wszystkich uÅ¼ytkownikÃ³w';

  @override
  String get showIdentifiedOnly => 'PokaÅ¼ tylko zidentyfikowanych';

  @override
  String get searchUsers => 'Szukaj uÅ¼ytkownikÃ³w';

  @override
  String get searchUsersHint => 'Szukaj uÅ¼ytkownikÃ³w...';

  @override
  String get clearSearch => 'WyczyÅÄ wyszukiwanie';

  @override
  String get failedToLoadUsers => 'Nie udaÅo siÄ zaÅadowaÄ uÅ¼ytkownikÃ³w';

  @override
  String get noUsersFound => 'Nie znaleziono uÅ¼ytkownikÃ³w';

  @override
  String get noIdentifiedUsers => 'Brak zidentyfikowanych uÅ¼ytkownikÃ³w';

  @override
  String get usersWillAppear =>
      'UÅ¼ytkownicy pojawiÄ siÄ po ich zidentyfikowaniu';

  @override
  String get tryDifferentSearch => 'SprÃ³buj innego zapytania';

  @override
  String get sortedBy => 'Sortowane wedÅug';

  @override
  String get loadingMoreUsers => 'Åadowanie kolejnych uÅ¼ytkownikÃ³w';

  @override
  String get lastSeen => 'Ostatnio widziany';

  @override
  String get firstSeen => 'Pierwszy raz widziany';

  @override
  String nUsers(String count) {
    return '$count uÅ¼ytkownikÃ³w';
  }

  @override
  String nSessions(int count) {
    return '$count sesji';
  }

  @override
  String lastPrefix(String value) {
    return 'Ostatnio: $value';
  }

  @override
  String get failedToLoadSiteConfig =>
      'Nie udaÅo siÄ zaÅadowaÄ konfiguracji strony';

  @override
  String get failedToLoadMetrics => 'Nie udaÅo siÄ zaÅadowaÄ metryk';

  @override
  String get loadingMoreMetrics => 'Åadowanie kolejnych metryk';

  @override
  String noMetricData(String metric) {
    return 'Brak danych dla $metric';
  }

  @override
  String get settings => 'Ustawienia';

  @override
  String get connection => 'PoÅÄczenie';

  @override
  String get notConfigured => 'Nie skonfigurowano';

  @override
  String get authMethod => 'Metoda uwierzytelniania';

  @override
  String get sessionCookie => 'Ciasteczko sesji';

  @override
  String get loggedInAs => 'Zalogowano jako';

  @override
  String get unknown => 'Nieznane';

  @override
  String get appearance => 'WyglÄd';

  @override
  String get theme => 'Motyw';

  @override
  String get dark => 'Ciemny';

  @override
  String get light => 'Jasny';

  @override
  String get auto => 'Automatyczny';

  @override
  String get about => 'Informacje';

  @override
  String get appVersion => 'Wersja aplikacji';

  @override
  String get openSourceAnalytics => 'Analityka internetowa open source';

  @override
  String get logoutConfirm => 'Czy na pewno chcesz siÄ wylogowaÄ?';

  @override
  String get siteSettings => 'Ustawienia witryny';

  @override
  String get siteInformation => 'Informacje o witrynie';

  @override
  String get domain => 'Domena';

  @override
  String get siteId => 'ID witryny';

  @override
  String get created => 'Utworzono';

  @override
  String get trackingSettings => 'Ustawienia Åledzenia';

  @override
  String get publicDashboard => 'Publiczny panel';

  @override
  String get publicDashboardDesc => 'ZezwÃ³l na publiczny dostÄp do analityki';

  @override
  String get sessionReplay => 'Odtwarzanie sesji';

  @override
  String get sessionReplayDesc => 'Nagrywaj sesje uÅ¼ytkownikÃ³w';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'ÅledÅº Core Web Vitals';

  @override
  String get trackErrors => 'Åledzenie bÅÄdÃ³w';

  @override
  String get trackErrorsDesc => 'Przechwytuj bÅÄdy JavaScript';

  @override
  String get outboundLinksTracking => 'Linki wychodzÄce';

  @override
  String get outboundLinksDesc => 'ÅledÅº klikniÄcia w linki wychodzÄce';

  @override
  String get excludedIps => 'Wykluczone adresy IP';

  @override
  String get excludedCountries => 'Wykluczone kraje';

  @override
  String get settingsSaved => 'Ustawienia zapisane';

  @override
  String failedToSave(String error) {
    return 'Nie udaÅo siÄ zapisaÄ: $error';
  }

  @override
  String get timeRange => 'Zakres czasu';

  @override
  String get today => 'Dzisiaj';

  @override
  String get yesterday => 'Wczoraj';

  @override
  String get last7Days => 'Ostatnie 7 dni';

  @override
  String get last30Days => 'Ostatnie 30 dni';

  @override
  String get thisWeek => 'Ten tydzieÅ';

  @override
  String get thisMonth => 'Ten miesiÄc';

  @override
  String get thisYear => 'Ten rok';

  @override
  String get customRange => 'Zakres niestandardowy';

  @override
  String get filter => 'Filtr';

  @override
  String get addFilter => 'Dodaj filtr';

  @override
  String get parameter => 'Parametr';

  @override
  String get value => 'WartoÅÄ';

  @override
  String get enterFilterValue => 'WprowadÅº wartoÅÄ filtra';

  @override
  String get requestTimedOut =>
      'UpÅynÄÅ limit czasu Å¼Ädania. SprÃ³buj ponownie.';

  @override
  String get networkError => 'BÅÄd sieci. SprawdÅº poÅÄczenie.';

  @override
  String get sessionExpired => 'Sesja wygasÅa. Zaloguj siÄ ponownie.';

  @override
  String get accessDenied => 'Odmowa dostÄpu.';

  @override
  String get dataNotFound => 'Nie znaleziono danych.';

  @override
  String get serverError => 'BÅÄd serwera. SprÃ³buj ponownie pÃ³Åºniej.';

  @override
  String get failedToLoadGeneric =>
      'Nie udaÅo siÄ zaÅadowaÄ danych. SprÃ³buj ponownie.';

  @override
  String chartDataPoints(int count) {
    return 'Wykres z $count punktami danych';
  }

  @override
  String previousPrefix(String value) {
    return 'Poprz.: $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'Ocena wydajnoÅci: $rating';
  }

  @override
  String get loadingContent => 'Åadowanie zawartoÅci';

  @override
  String get language => 'JÄzyk';

  @override
  String get selectLanguage => 'Wybierz jÄzyk';

  @override
  String get failedToLoadUserDetails =>
      'Nie udaÅo siÄ zaÅadowaÄ szczegÃ³ÅÃ³w uÅ¼ytkownika';

  @override
  String lastSeenPrefix(String value) {
    return 'Ostatnio widziany: $value';
  }

  @override
  String get traits => 'Cechy';

  @override
  String get noTraits => 'Brak cech dla tego uÅ¼ytkownika';

  @override
  String get sessionDetail => 'SzczegÃ³Åy sesji';

  @override
  String get failedToLoadSession => 'Nie udaÅo siÄ zaÅadowaÄ sesji';

  @override
  String get entryPageLabel => 'Strona wejÅcia';

  @override
  String get exitPage => 'Strona wyjÅcia';

  @override
  String get browserAndDevice => 'PrzeglÄdarka i urzÄdzenie';

  @override
  String get browser => 'PrzeglÄdarka';

  @override
  String get os => 'System';

  @override
  String get device => 'UrzÄdzenie';

  @override
  String get sourceLabel => 'Å¹rÃ³dÅo';

  @override
  String get referrer => 'OdnoÅnik';

  @override
  String eventTimelineCount(int count) {
    return 'OÅ czasu ($count)';
  }

  @override
  String get noEvents => 'Brak wydarzeÅ';

  @override
  String get replayEventsTitle => 'Zdarzenia powtÃ³rki';

  @override
  String get failedToLoadReplay => 'Nie udaÅo siÄ zaÅadowaÄ powtÃ³rki';

  @override
  String get noReplayEvents => 'Brak zdarzeÅ powtÃ³rki';

  @override
  String get totalEvents => 'ÅÄcznie wydarzeÅ';

  @override
  String get userActionsLabel => 'Akcje uÅ¼ytkownika';

  @override
  String eventTimelineActions(int count) {
    return 'OÅ czasu ($count akcji)';
  }

  @override
  String get eventLog => 'Dziennik zdarzeÅ';

  @override
  String get viewEventLog => 'Zobacz dziennik zdarzeÅ';

  @override
  String get failedToLoadEventLog =>
      'Nie udaÅo siÄ zaÅadowaÄ dziennika zdarzeÅ';

  @override
  String get activityHeatmap => 'Mapa cieplna';

  @override
  String get heatmapLast4Weeks => 'Ostatnie 4 tygodnie';

  @override
  String get less => 'Mniej';

  @override
  String get more => 'WiÄcej';

  @override
  String get peakActivity => 'Szczytowa aktywnoÅÄ';

  @override
  String peakHour(String day, String time) {
    return '$day o $time';
  }

  @override
  String busiestDay(String day) {
    return 'Najbardziej aktywny dzieÅ: $day';
  }

  @override
  String get dayMon => 'Pon';

  @override
  String get dayTue => 'Wt';

  @override
  String get dayWed => 'År';

  @override
  String get dayThu => 'Czw';

  @override
  String get dayFri => 'Pt';

  @override
  String get daySat => 'Sob';

  @override
  String get daySun => 'Ndz';

  @override
  String get searchEvents => 'Szukaj zdarzeÅ...';

  @override
  String get allTypes => 'Wszystkie';

  @override
  String get noMatchingEvents => 'Brak pasujÄcych zdarzeÅ';

  @override
  String get liveView => 'Na Å¼ywo';

  @override
  String get autoRefresh => 'Automatyczne odÅwieÅ¼anie';

  @override
  String get usersOnlineNow => 'UÅ¼ytkownicy online';

  @override
  String lastUpdatedAt(String time) {
    return 'Zaktualizowano o $time';
  }

  @override
  String get last30Minutes => 'Ostatnie 30 minut';

  @override
  String get last5Minutes => 'Ostatnie 5 min';

  @override
  String get recentEvents => 'Ostatnie zdarzenia';

  @override
  String get noRecentEvents => 'Brak ostatnich zdarzeÅ';

  @override
  String get retention => 'Retencja';

  @override
  String get weekly => 'Tygodniowo';

  @override
  String get daily => 'Dziennie';

  @override
  String get retentionRange => 'Zakres';

  @override
  String retentionDays(int count) {
    return '$count dni';
  }

  @override
  String get failedToLoadRetention =>
      'Nie udaÅo siÄ zaÅadowaÄ danych retencji';

  @override
  String get noRetentionData => 'Brak danych retencji';

  @override
  String get cohort => 'Kohorta';

  @override
  String get retentionWeekPrefix => 'T';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => 'ÅcieÅ¼ki uÅ¼ytkownikÃ³w';

  @override
  String get journeySteps => 'Kroki';

  @override
  String get failedToLoadJourneys => 'Nie udaÅo siÄ zaÅadowaÄ ÅcieÅ¼ek';

  @override
  String get noJourneysFound => 'Nie znaleziono ÅcieÅ¼ek';

  @override
  String journeySessions(String count) {
    return '$count sesji';
  }

  @override
  String get locations => 'Lokalizacje';

  @override
  String get locationCities => 'Miasta';

  @override
  String get failedToLoadLocations => 'Nie udaÅo siÄ zaÅadowaÄ lokalizacji';

  @override
  String get noLocationsFound => 'Nie znaleziono lokalizacji';

  @override
  String get coreFeatures => 'GÅÃ³wne';

  @override
  String get insights => 'WglÄd';

  @override
  String get tools => 'NarzÄdzia';

  @override
  String get userTraits => 'Cechy';

  @override
  String get failedToLoadUserTraits =>
      'Nie udaÅo siÄ zaÅadowaÄ cech uÅ¼ytkownikÃ³w';

  @override
  String get noUserTraits => 'Nie znaleziono cech';

  @override
  String get noUserTraitsHint =>
      'Cechy pojawiÄ siÄ po zidentyfikowaniu uÅ¼ytkownikÃ³w z niestandardowymi wÅaÅciwoÅciami';

  @override
  String traitUsersCount(String count) {
    return '$count uÅ¼ytkownikÃ³w';
  }

  @override
  String get entryPages => 'Strony wejścia';

  @override
  String get exitPages => 'Strony wyjścia';

  @override
  String get browsers => 'Przeglądarki';

  @override
  String get operatingSystems => 'System';

  @override
  String get utmSource => 'Źródło UTM';

  @override
  String get channel => 'Kanał';

  @override
  String get pageTitles => 'Tytuły stron';

  @override
  String get sources => 'Źródła';
}
