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
  String get delete => 'Usuń';

  @override
  String get save => 'Zapisz';

  @override
  String get update => 'Aktualizuj';

  @override
  String get create => 'Utwórz';

  @override
  String get retry => 'Ponów';

  @override
  String get add => 'Dodaj';

  @override
  String get edit => 'Edytuj';

  @override
  String get clear => 'Wyczyść';

  @override
  String get apply => 'Zastosuj';

  @override
  String get goBack => 'Wróć';

  @override
  String get noData => 'Brak danych';

  @override
  String get loading => 'Ładowanie';

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
  String get password => 'Hasło';

  @override
  String get showPassword => 'Pokaż hasło';

  @override
  String get hidePassword => 'Ukryj hasło';

  @override
  String get connect => 'Połącz';

  @override
  String get invalidUrl => 'Wprowadź prawidłowy URL (https://...)';

  @override
  String get connectionFailed =>
      'Połączenie nie powiodło się. Sprawdź adres URL serwera.';

  @override
  String get invalidApiKey => 'Nieprawidłowy klucz API';

  @override
  String get connectionFailedApiKey =>
      'Połączenie nie powiodło się. Sprawdź adres URL serwera i klucz API.';

  @override
  String get unexpectedError =>
      'Wystąpił nieoczekiwany błąd. Spróbuj ponownie.';

  @override
  String get organizations => 'Organizacje';

  @override
  String get noSitesFound => 'Nie znaleziono witryn';

  @override
  String get noSitesHint =>
      'Dodaj witrynę w panelu internetowym, aby rozpocząć.';

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
    return 'Członkowie ($count)';
  }

  @override
  String get failedToLoadOrganizations => 'Nie udało się załadować organizacji';

  @override
  String get noOrganizations => 'Brak organizacji';

  @override
  String get noOrganizationsHint =>
      'Organizacje można tworzyć w panelu internetowym';

  @override
  String get failedToLoadMembers => 'Nie udało się załadować członków';

  @override
  String get failedToLoadSites => 'Nie udało się załadować stron';

  @override
  String get failedToLoadAnalytics => 'Nie udało się załadować analityki';

  @override
  String get noDataAvailable => 'Brak dostępnych danych';

  @override
  String get users => 'Użytkownicy';

  @override
  String get sessions => 'Sesje';

  @override
  String get pageviews => 'Odsłony';

  @override
  String get pagesPerSession => 'Strony/Sesja';

  @override
  String get bounceRate => 'Współczynnik odrzuceń';

  @override
  String get duration => 'Czas trwania';

  @override
  String get metrics => 'Metryki';

  @override
  String get pages => 'Strony';

  @override
  String get referrers => 'Strony odsyłające';

  @override
  String get countries => 'Kraje';

  @override
  String get devices => 'Urządzenia';

  @override
  String get performance => 'Wydajność';

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
    return '$count użytkowników online';
  }

  @override
  String get events => 'Zdarzenia';

  @override
  String get eventsOverTime => 'Zdarzenia w czasie';

  @override
  String get eventNames => 'Nazwy zdarzeń';

  @override
  String get noCustomEventsTracked => 'Nie śledzono niestandardowych zdarzeń';

  @override
  String get failedToLoadProperties => 'Nie udało się załadować właściwości';

  @override
  String get noProperties => 'Brak właściwości';

  @override
  String get outboundLinks => 'Linki wychodzące';

  @override
  String get noOutboundLinksTracked => 'Nie śledzono linków wychodzących';

  @override
  String get failedToLoadChart => 'Nie udało się załadować wykresu';

  @override
  String get errors => 'Błędy';

  @override
  String get failedToLoadErrors => 'Nie udało się załadować błędów';

  @override
  String get noErrorsFound => 'Nie znaleziono błędów';

  @override
  String get everythingLooksGood => 'Wszystko wygląda dobrze!';

  @override
  String get occurrences => 'wystąpienia';

  @override
  String get sessionsAffected => 'dotknięte sesje';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'Nie udało się załadować zdarzeń: $error';
  }

  @override
  String get noEventsFound => 'Nie znaleziono zdarzeń';

  @override
  String get failedToLoadFunnels => 'Nie udało się załadować lejków';

  @override
  String get noFunnelsSaved => 'Brak zapisanych lejków';

  @override
  String get createFunnelsHint => 'Utwórz lejki w panelu internetowym';

  @override
  String get deleteFunnel => 'Usuń lejek';

  @override
  String deleteFunnelConfirm(String name) {
    return 'Usunąć \"$name\"?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'Nie udało się usunąć lejka: $error';
  }

  @override
  String get noStepsDefined => 'Nie zdefiniowano kroków dla tego lejka';

  @override
  String failedToAnalyze(String error) {
    return 'Nie udało się przeanalizować: $error';
  }

  @override
  String get overallConversion => 'Ogólna konwersja';

  @override
  String dropoff(String value) {
    return 'Odpadnięcie: $value';
  }

  @override
  String get createGoal => 'Utwórz cel';

  @override
  String get failedToLoadGoals => 'Nie udało się załadować celów';

  @override
  String get noGoalsConfigured => 'Brak skonfigurowanych celów';

  @override
  String get noGoalsHint => 'Naciśnij +, aby utworzyć nowy cel';

  @override
  String get conversions => 'Konwersje';

  @override
  String get rate => 'Współczynnik';

  @override
  String get editGoal => 'Edytuj cel';

  @override
  String get createGoalTitle => 'Utwórz cel';

  @override
  String get name => 'Nazwa';

  @override
  String get type => 'Typ';

  @override
  String get path => 'Ścieżka';

  @override
  String get event => 'Zdarzenie';

  @override
  String get pathPattern => 'Wzorzec ścieżki';

  @override
  String get eventName => 'Nazwa zdarzenia';

  @override
  String get deleteGoal => 'Usuń cel';

  @override
  String deleteGoalConfirm(String name) {
    return 'Usunąć \"$name\"?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'Nie udało się usunąć celu: $error';
  }

  @override
  String get failedToLoadPerformanceData =>
      'Nie udało się załadować danych wydajności';

  @override
  String metricOverTime(String metric) {
    return '$metric w czasie';
  }

  @override
  String get byDimension => 'Według wymiaru';

  @override
  String get failedToLoadDimensionData =>
      'Nie udało się załadować danych wymiaru';

  @override
  String get good => 'Dobrze';

  @override
  String get needsImprovement => 'Wymaga poprawy';

  @override
  String get poor => 'Słabo';

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
  String get dimDevices => 'Urządzenia';

  @override
  String get dimBrowsers => 'Przeglądarki';

  @override
  String get dimOS => 'System operacyjny';

  @override
  String get sessionFilters => 'Filtry sesji';

  @override
  String get minPageviews => 'Min. odsłony';

  @override
  String get minEvents => 'Min. zdarzenia';

  @override
  String get minDurationSeconds => 'Min. czas trwania (sekundy)';

  @override
  String get failedToLoadSessions => 'Nie udało się załadować sesji';

  @override
  String get noSessionsFound => 'Nie znaleziono sesji';

  @override
  String get filterSessions => 'Filtruj sesje';

  @override
  String get loadingMoreSessions => 'Ładowanie kolejnych sesji';

  @override
  String entryPage(String page) {
    return 'Strona wejściowa: $page';
  }

  @override
  String nPages(int count) {
    return '$count stron';
  }

  @override
  String get sessionReplays => 'Odtwarzanie sesji';

  @override
  String get failedToLoadReplays => 'Nie udało się załadować odtworzeń';

  @override
  String get noReplaysFound => 'Nie znaleziono odtworzeń';

  @override
  String get noReplaysHint =>
      'Odtwarzanie sesji pojawi się tutaj, gdy zostanie włączone.';

  @override
  String get previousPage => 'Poprzednia strona';

  @override
  String get nextPage => 'Następna strona';

  @override
  String pageNumber(int number) {
    return 'Strona $number';
  }

  @override
  String get unknownBrowser => 'Nieznana przeglądarka';

  @override
  String get unknownCountry => 'Nieznany kraj';

  @override
  String get sortUsers => 'Sortuj użytkowników';

  @override
  String get showAllUsers => 'Pokaż wszystkich użytkowników';

  @override
  String get showIdentifiedOnly => 'Pokaż tylko zidentyfikowanych';

  @override
  String get searchUsers => 'Szukaj użytkowników';

  @override
  String get searchUsersHint => 'Szukaj użytkowników...';

  @override
  String get clearSearch => 'Wyczyść wyszukiwanie';

  @override
  String get failedToLoadUsers => 'Nie udało się załadować użytkowników';

  @override
  String get noUsersFound => 'Nie znaleziono użytkowników';

  @override
  String get noIdentifiedUsers => 'Brak zidentyfikowanych użytkowników';

  @override
  String get usersWillAppear =>
      'Użytkownicy pojawią się po ich zidentyfikowaniu';

  @override
  String get tryDifferentSearch => 'Spróbuj innego zapytania';

  @override
  String get sortedBy => 'Sortowane według';

  @override
  String get loadingMoreUsers => 'Ładowanie kolejnych użytkowników';

  @override
  String get lastSeen => 'Ostatnio widziany';

  @override
  String get firstSeen => 'Pierwszy raz widziany';

  @override
  String nUsers(String count) {
    return '$count użytkowników';
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
      'Nie udało się załadować konfiguracji strony';

  @override
  String get failedToLoadMetrics => 'Nie udało się załadować metryk';

  @override
  String get loadingMoreMetrics => 'Ładowanie kolejnych metryk';

  @override
  String noMetricData(String metric) {
    return 'Brak danych dla $metric';
  }

  @override
  String get settings => 'Ustawienia';

  @override
  String get connection => 'Połączenie';

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
  String get appearance => 'Wygląd';

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
  String get developer => 'Deweloper';

  @override
  String get sourceCode => 'Kod źródłowy';

  @override
  String get originalProject => 'Oryginalny projekt';

  @override
  String get viewOnGitHub => 'Zobacz na GitHubie';

  @override
  String get unofficialClient =>
      'Nieoficjalny klient mobilny platformy analitycznej Rybbit';

  @override
  String get madeBy => 'Stworzone przez NKS Hub';

  @override
  String get mobileAppDeveloper => 'Programista aplikacji mobilnej';

  @override
  String get logoutConfirm => 'Czy na pewno chcesz się wylogować?';

  @override
  String get siteSettings => 'Ustawienia witryny';

  @override
  String get siteInformation => 'Informacje o witrynie';

  @override
  String get domain => 'Domena';

  @override
  String get siteId => 'ID witryny';

  @override
  String siteLabel(String id) {
    return 'Witryna $id';
  }

  @override
  String get created => 'Utworzono';

  @override
  String get trackingSettings => 'Ustawienia śledzenia';

  @override
  String get publicDashboard => 'Publiczny panel';

  @override
  String get publicDashboardDesc => 'Zezwól na publiczny dostęp do analityki';

  @override
  String get sessionReplay => 'Odtwarzanie sesji';

  @override
  String get sessionReplayDesc => 'Nagrywaj sesje użytkowników';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Śledź Core Web Vitals';

  @override
  String get trackErrors => 'Śledzenie błędów';

  @override
  String get trackErrorsDesc => 'Przechwytuj błędy JavaScript';

  @override
  String get outboundLinksTracking => 'Linki wychodzące';

  @override
  String get outboundLinksDesc => 'Śledź kliknięcia w linki wychodzące';

  @override
  String get excludedIps => 'Wykluczone adresy IP';

  @override
  String get excludedCountries => 'Wykluczone kraje';

  @override
  String get settingsSaved => 'Ustawienia zapisane';

  @override
  String failedToSave(String error) {
    return 'Nie udało się zapisać: $error';
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
  String get thisWeek => 'Ten tydzień';

  @override
  String get thisMonth => 'Ten miesiąc';

  @override
  String get thisYear => 'Ten rok';

  @override
  String get customRange => 'Zakres niestandardowy';

  @override
  String get allTime => 'Cały okres';

  @override
  String lastMinutes(int count) {
    return 'Ostatnie $count min';
  }

  @override
  String get notSet => '(nieustawione)';

  @override
  String get bouncePrefix => 'Odrzucenia';

  @override
  String get timePrefix => 'Czas';

  @override
  String get eventTypePageview => 'Wyświetlenie strony';

  @override
  String get eventTypeCustom => 'Własne';

  @override
  String get eventTypeOutbound => 'Wychodzące';

  @override
  String get eventTypeClick => 'Kliknięcie';

  @override
  String get eventTypeForm => 'Formularz';

  @override
  String get eventTypeInput => 'Wprowadzenie';

  @override
  String get eventTypeCopy => 'Kopiowanie';

  @override
  String get filter => 'Filtr';

  @override
  String get addFilter => 'Dodaj filtr';

  @override
  String get parameter => 'Parametr';

  @override
  String get value => 'Wartość';

  @override
  String get enterFilterValue => 'Wprowadź wartość filtra';

  @override
  String get filterBrowser => 'Przeglądarka';

  @override
  String get filterOs => 'System operacyjny';

  @override
  String get filterLanguage => 'Język';

  @override
  String get filterCountry => 'Kraj';

  @override
  String get filterRegion => 'Region';

  @override
  String get filterCity => 'Miasto';

  @override
  String get filterDeviceType => 'Typ urządzenia';

  @override
  String get filterReferrer => 'Strona odsyłająca';

  @override
  String get filterHostname => 'Hostname';

  @override
  String get filterPathname => 'Ścieżka';

  @override
  String get filterPageTitle => 'Tytuł strony';

  @override
  String get filterQuerystring => 'Querystring';

  @override
  String get filterEventName => 'Nazwa zdarzenia';

  @override
  String get filterChannel => 'Kanał';

  @override
  String get filterUtmSource => 'Źródło UTM';

  @override
  String get filterUtmMedium => 'Medium UTM';

  @override
  String get filterUtmCampaign => 'Kampania UTM';

  @override
  String get filterUtmTerm => 'Termin UTM';

  @override
  String get filterUtmContent => 'Treść UTM';

  @override
  String get filterEntryPage => 'Strona wejściowa';

  @override
  String get filterExitPage => 'Strona wyjściowa';

  @override
  String get requestTimedOut =>
      'Upłynął limit czasu żądania. Spróbuj ponownie.';

  @override
  String get networkError => 'Błąd sieci. Sprawdź połączenie.';

  @override
  String get sessionExpired => 'Sesja wygasła. Zaloguj się ponownie.';

  @override
  String get accessDenied => 'Odmowa dostępu.';

  @override
  String get dataNotFound => 'Nie znaleziono danych.';

  @override
  String get serverError => 'Błąd serwera. Spróbuj ponownie później.';

  @override
  String get failedToLoadGeneric =>
      'Nie udało się załadować danych. Spróbuj ponownie.';

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
    return 'Ocena wydajności: $rating';
  }

  @override
  String get loadingContent => 'Ładowanie zawartości';

  @override
  String get language => 'Język';

  @override
  String get selectLanguage => 'Wybierz język';

  @override
  String get failedToLoadUserDetails =>
      'Nie udało się załadować szczegółów użytkownika';

  @override
  String lastSeenPrefix(String value) {
    return 'Ostatnio widziany: $value';
  }

  @override
  String get traits => 'Cechy';

  @override
  String get noTraits => 'Brak cech dla tego użytkownika';

  @override
  String get sessionDetail => 'Szczegóły sesji';

  @override
  String get failedToLoadSession => 'Nie udało się załadować sesji';

  @override
  String get entryPageLabel => 'Strona wejścia';

  @override
  String get exitPage => 'Strona wyjścia';

  @override
  String get browserAndDevice => 'Przeglądarka i urządzenie';

  @override
  String get browser => 'Przeglądarka';

  @override
  String get os => 'System';

  @override
  String get device => 'Urządzenie';

  @override
  String get sourceLabel => 'Źródło';

  @override
  String get referrer => 'Odnośnik';

  @override
  String eventTimelineCount(int count) {
    return 'Oś czasu ($count)';
  }

  @override
  String get noEvents => 'Brak wydarzeń';

  @override
  String get replayEventsTitle => 'Zdarzenia powtórki';

  @override
  String get failedToLoadReplay => 'Nie udało się załadować powtórki';

  @override
  String get noReplayEvents => 'Brak zdarzeń powtórki';

  @override
  String get totalEvents => 'Łącznie wydarzeń';

  @override
  String get userActionsLabel => 'Akcje użytkownika';

  @override
  String eventTimelineActions(int count) {
    return 'Oś czasu ($count akcji)';
  }

  @override
  String get eventLog => 'Dziennik zdarzeń';

  @override
  String get viewEventLog => 'Zobacz dziennik zdarzeń';

  @override
  String get failedToLoadEventLog =>
      'Nie udało się załadować dziennika zdarzeń';

  @override
  String get activityHeatmap => 'Mapa cieplna';

  @override
  String get heatmapLast4Weeks => 'Ostatnie 4 tygodnie';

  @override
  String get less => 'Mniej';

  @override
  String get more => 'Więcej';

  @override
  String get peakActivity => 'Szczytowa aktywność';

  @override
  String peakHour(String day, String time) {
    return '$day o $time';
  }

  @override
  String busiestDay(String day) {
    return 'Najbardziej aktywny dzień: $day';
  }

  @override
  String get dayMon => 'Pon';

  @override
  String get dayTue => 'Wt';

  @override
  String get dayWed => 'Śr';

  @override
  String get dayThu => 'Czw';

  @override
  String get dayFri => 'Pt';

  @override
  String get daySat => 'Sob';

  @override
  String get daySun => 'Ndz';

  @override
  String get searchEvents => 'Szukaj zdarzeń...';

  @override
  String get allTypes => 'Wszystkie';

  @override
  String get allOrganizations => 'Wszystkie organizacje';

  @override
  String get noMatchingEvents => 'Brak pasujących zdarzeń';

  @override
  String get liveView => 'Na żywo';

  @override
  String get autoRefresh => 'Automatyczne odświeżanie';

  @override
  String get usersOnlineNow => 'Użytkownicy online';

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
  String get noRecentEvents => 'Brak ostatnich zdarzeń';

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
  String get failedToLoadRetention => 'Nie udało się załadować danych retencji';

  @override
  String get noRetentionData => 'Brak danych retencji';

  @override
  String get cohort => 'Kohorta';

  @override
  String get retentionWeekPrefix => 'T';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => 'Ścieżki użytkowników';

  @override
  String get journeySteps => 'Kroki';

  @override
  String get failedToLoadJourneys => 'Nie udało się załadować ścieżek';

  @override
  String get noJourneysFound => 'Nie znaleziono ścieżek';

  @override
  String journeySessions(String count) {
    return '$count sesji';
  }

  @override
  String get locations => 'Lokalizacje';

  @override
  String get locationCities => 'Miasta';

  @override
  String get failedToLoadLocations => 'Nie udało się załadować lokalizacji';

  @override
  String get noLocationsFound => 'Nie znaleziono lokalizacji';

  @override
  String get coreFeatures => 'Główne';

  @override
  String get insights => 'Wgląd';

  @override
  String get tools => 'Narzędzia';

  @override
  String get userTraits => 'Cechy';

  @override
  String get failedToLoadUserTraits =>
      'Nie udało się załadować cech użytkowników';

  @override
  String get noUserTraits => 'Nie znaleziono cech';

  @override
  String get noUserTraitsHint =>
      'Cechy pojawią się po zidentyfikowaniu użytkowników z niestandardowymi właściwościami';

  @override
  String traitUsersCount(String count) {
    return '$count użytkowników';
  }

  @override
  String get dashboard => 'Panel';

  @override
  String get analytics => 'Analityka';

  @override
  String get noSiteSelected => 'Nie wybrano witryny';

  @override
  String selectSiteFromDashboard(String tabName) {
    return 'Wybierz witrynę w zakładce Panel, aby wyświetlić $tabName.';
  }

  @override
  String get goToDashboard => 'Przejdź do panelu';

  @override
  String todayVisitors(int count) {
    return '$count dzisiaj';
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

  @override
  String get cities => 'Miasta';

  @override
  String get languages => 'Języki';

  @override
  String get hostnames => 'Nazwy hostów';

  @override
  String get vpn => 'VPN';

  @override
  String get crawlers => 'Roboty';

  @override
  String get datacenters => 'Centra danych';

  @override
  String get companies => 'Firmy';

  @override
  String get companyType => 'Typ firmy';

  @override
  String get companyDomain => 'Domena firmy';

  @override
  String get asnOrg => 'Organizacja ASN';

  @override
  String get asnType => 'Typ ASN';

  @override
  String get asnDomain => 'Domena ASN';

  @override
  String get utmMedium => 'UTM Medium';

  @override
  String get utmCampaign => 'UTM Kampania';

  @override
  String nMoreItems(int count) {
    return '+$count więcej';
  }

  @override
  String sessionsWithPercentage(String count, String percentage) {
    return '$count sesji ($percentage%)';
  }

  @override
  String errorGeneric(String error) {
    return 'Błąd: $error';
  }

  @override
  String get replayPageSnapshot => 'Zrzut strony';

  @override
  String get replayPageLoad => 'Ładowanie strony';

  @override
  String get replayCustomEvent => 'Zdarzenie niestandardowe';

  @override
  String get replayPluginEvent => 'Zdarzenie wtyczki';

  @override
  String get replayInteraction => 'Interakcja';

  @override
  String get replayScroll => 'Przewijanie';

  @override
  String get replayResize => 'Zmiana rozmiaru';

  @override
  String get replayInput => 'Wejście';

  @override
  String get replayUpdate => 'Aktualizacja';

  @override
  String get url => 'URL';

  @override
  String get searchSites => 'Szukaj stron...';

  @override
  String get sortSites => 'Sortuj strony';

  @override
  String get sortAlphabetically => 'Alfabetycznie';

  @override
  String get sortByCount => 'Sortuj wg ilości';

  @override
  String get sortByVisitors => 'Według odwiedzających dziś';

  @override
  String get sortByLiveUsers => 'Według użytkowników online';

  @override
  String get noMatchingSites => 'Brak pasujących stron';

  @override
  String get utmTerm => 'UTM Termin';

  @override
  String get utmContent => 'UTM Treść';

  @override
  String get browserVersions => 'Wersje przeglądarek';

  @override
  String get osVersions => 'Wersje systemów';

  @override
  String get screenDimensions => 'Wymiary ekranu';

  @override
  String get relativeNow => 'teraz';

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
    return '${count}tyg';
  }

  @override
  String get emptyValue => '(puste)';

  @override
  String get screenviews => 'Wyświetlenia ekranów';

  @override
  String get screensPerSession => 'Ekrany/Sesja';

  @override
  String get screens => 'Ekrany';

  @override
  String get entryScreens => 'Ekrany wejściowe';

  @override
  String get exitScreens => 'Ekrany wyjściowe';

  @override
  String get deviceModel => 'Model urządzenia';

  @override
  String get appVersions => 'Wersje aplikacji';

  @override
  String get sdkInfo => 'Informacje o urządzeniu';

  @override
  String get minScreenviews => 'Min. wyświetleń ekranu';

  @override
  String get appBadge => 'Aplikacja';

  @override
  String get eventTypeScreenview => 'Wyświetlenie ekranu';
}
