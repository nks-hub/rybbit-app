// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => 'Inoffiziell';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get save => 'Speichern';

  @override
  String get update => 'Aktualisieren';

  @override
  String get create => 'Erstellen';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get add => 'Hinzufügen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get clear => 'Löschen';

  @override
  String get apply => 'Anwenden';

  @override
  String get goBack => 'Zurück';

  @override
  String get noData => 'Keine Daten';

  @override
  String get loading => 'Laden';

  @override
  String get logout => 'Abmelden';

  @override
  String get close => 'Schließen';

  @override
  String get serverUrl => 'Server-URL';

  @override
  String get serverUrlHint => 'https://ihre-rybbit-instanz.com';

  @override
  String get email => 'E-Mail';

  @override
  String get apiKey => 'API-Schlüssel';

  @override
  String get password => 'Passwort';

  @override
  String get connect => 'Verbinden';

  @override
  String get organizations => 'Organisationen';

  @override
  String get noSitesFound => 'Keine Websites gefunden';

  @override
  String get noSitesHint =>
      'Fügen Sie eine Website im Web-Dashboard hinzu, um zu beginnen.';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Websites',
      one: '1 Website',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return 'Mitglieder ($count)';
  }

  @override
  String get failedToLoadOrganizations =>
      'Organisationen konnten nicht geladen werden';

  @override
  String get noOrganizations => 'Keine Organisationen';

  @override
  String get noOrganizationsHint =>
      'Organisationen können im Web-Dashboard erstellt werden';

  @override
  String get failedToLoadMembers => 'Mitglieder konnten nicht geladen werden';

  @override
  String get failedToLoadSites => 'Websites konnten nicht geladen werden';

  @override
  String get failedToLoadAnalytics =>
      'Analysedaten konnten nicht geladen werden';

  @override
  String get noDataAvailable => 'Keine Daten verfügbar';

  @override
  String get users => 'Benutzer';

  @override
  String get sessions => 'Sitzungen';

  @override
  String get pageviews => 'Seitenaufrufe';

  @override
  String get pagesPerSession => 'Seiten/Sitzung';

  @override
  String get bounceRate => 'Absprungrate';

  @override
  String get duration => 'Dauer';

  @override
  String get metrics => 'Metriken';

  @override
  String get pages => 'Seiten';

  @override
  String get referrers => 'Verweisende';

  @override
  String get countries => 'Länder';

  @override
  String get devices => 'Geräte';

  @override
  String get performance => 'Leistung';

  @override
  String get goals => 'Ziele';

  @override
  String get funnels => 'Trichter';

  @override
  String get replay => 'Wiedergabe';

  @override
  String get config => 'Konfiguration';

  @override
  String usersOnline(int count) {
    return '$count Benutzer online';
  }

  @override
  String get events => 'Ereignisse';

  @override
  String get eventsOverTime => 'Ereignisse im Zeitverlauf';

  @override
  String get eventNames => 'Ereignisnamen';

  @override
  String get noCustomEventsTracked =>
      'Keine benutzerdefinierten Ereignisse erfasst';

  @override
  String get failedToLoadProperties =>
      'Eigenschaften konnten nicht geladen werden';

  @override
  String get noProperties => 'Keine Eigenschaften';

  @override
  String get outboundLinks => 'Ausgehende Links';

  @override
  String get noOutboundLinksTracked => 'Keine ausgehenden Links erfasst';

  @override
  String get failedToLoadChart => 'Diagramm konnte nicht geladen werden';

  @override
  String get errors => 'Fehler';

  @override
  String get failedToLoadErrors => 'Fehler konnten nicht geladen werden';

  @override
  String get noErrorsFound => 'Keine Fehler gefunden';

  @override
  String get everythingLooksGood => 'Alles sieht gut aus!';

  @override
  String get occurrences => 'Vorkommnisse';

  @override
  String get sessionsAffected => 'betroffene Sitzungen';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'Fehler beim Laden der Ereignisse: $error';
  }

  @override
  String get noEventsFound => 'Keine Ereignisse gefunden';

  @override
  String get failedToLoadFunnels => 'Trichter konnten nicht geladen werden';

  @override
  String get noFunnelsSaved => 'Keine Trichter gespeichert';

  @override
  String get createFunnelsHint => 'Erstellen Sie Trichter im Web-Dashboard';

  @override
  String get deleteFunnel => 'Trichter löschen';

  @override
  String deleteFunnelConfirm(String name) {
    return '\"$name\" löschen?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'Trichter konnte nicht gelöscht werden: $error';
  }

  @override
  String get noStepsDefined => 'Keine Schritte für diesen Trichter definiert';

  @override
  String failedToAnalyze(String error) {
    return 'Analyse fehlgeschlagen: $error';
  }

  @override
  String get overallConversion => 'Gesamtkonversion';

  @override
  String dropoff(String value) {
    return 'Abbruch: $value';
  }

  @override
  String get createGoal => 'Ziel erstellen';

  @override
  String get failedToLoadGoals => 'Ziele konnten nicht geladen werden';

  @override
  String get noGoalsConfigured => 'Keine Ziele konfiguriert';

  @override
  String get noGoalsHint => 'Tippen Sie auf +, um ein neues Ziel zu erstellen';

  @override
  String get conversions => 'Konversionen';

  @override
  String get rate => 'Rate';

  @override
  String get editGoal => 'Ziel bearbeiten';

  @override
  String get createGoalTitle => 'Ziel erstellen';

  @override
  String get name => 'Name';

  @override
  String get type => 'Typ';

  @override
  String get path => 'Pfad';

  @override
  String get event => 'Ereignis';

  @override
  String get pathPattern => 'Pfadmuster';

  @override
  String get eventName => 'Ereignisname';

  @override
  String get deleteGoal => 'Ziel löschen';

  @override
  String deleteGoalConfirm(String name) {
    return '\"$name\" löschen?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'Ziel konnte nicht gelöscht werden: $error';
  }

  @override
  String get failedToLoadPerformanceData =>
      'Leistungsdaten konnten nicht geladen werden';

  @override
  String metricOverTime(String metric) {
    return '$metric im Zeitverlauf';
  }

  @override
  String get byDimension => 'Nach Dimension';

  @override
  String get failedToLoadDimensionData =>
      'Dimensionsdaten konnten nicht geladen werden';

  @override
  String get good => 'Gut';

  @override
  String get needsImprovement => 'Verbesserungsbedarf';

  @override
  String get poor => 'Schlecht';

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
  String get dimPages => 'Seiten';

  @override
  String get dimCountries => 'Länder';

  @override
  String get dimDevices => 'Geräte';

  @override
  String get dimBrowsers => 'Browser';

  @override
  String get dimOS => 'Betriebssystem';

  @override
  String get sessionFilters => 'Sitzungsfilter';

  @override
  String get minPageviews => 'Min. Seitenaufrufe';

  @override
  String get minEvents => 'Min. Ereignisse';

  @override
  String get minDurationSeconds => 'Min. Dauer (Sekunden)';

  @override
  String get failedToLoadSessions => 'Sitzungen konnten nicht geladen werden';

  @override
  String get noSessionsFound => 'Keine Sitzungen gefunden';

  @override
  String get filterSessions => 'Sitzungen filtern';

  @override
  String get loadingMoreSessions => 'Weitere Sitzungen werden geladen';

  @override
  String entryPage(String page) {
    return 'Einstiegsseite: $page';
  }

  @override
  String nPages(int count) {
    return '$count Seiten';
  }

  @override
  String get sessionReplays => 'Sitzungswiedergaben';

  @override
  String get failedToLoadReplays => 'Wiedergaben konnten nicht geladen werden';

  @override
  String get noReplaysFound => 'Keine Wiedergaben gefunden';

  @override
  String get noReplaysHint =>
      'Sitzungswiedergaben erscheinen hier, wenn sie aktiviert sind.';

  @override
  String get previousPage => 'Vorherige Seite';

  @override
  String get nextPage => 'Nächste Seite';

  @override
  String pageNumber(int number) {
    return 'Seite $number';
  }

  @override
  String get unknownBrowser => 'Unbekannter Browser';

  @override
  String get unknownCountry => 'Unbekanntes Land';

  @override
  String get sortUsers => 'Benutzer sortieren';

  @override
  String get showAllUsers => 'Alle Benutzer anzeigen';

  @override
  String get showIdentifiedOnly => 'Nur identifizierte anzeigen';

  @override
  String get searchUsers => 'Benutzer suchen';

  @override
  String get searchUsersHint => 'Benutzer suchen...';

  @override
  String get clearSearch => 'Suche löschen';

  @override
  String get failedToLoadUsers => 'Benutzer konnten nicht geladen werden';

  @override
  String get noUsersFound => 'Keine Benutzer gefunden';

  @override
  String get noIdentifiedUsers => 'Keine identifizierten Benutzer';

  @override
  String get usersWillAppear =>
      'Benutzer erscheinen, sobald sie identifiziert wurden';

  @override
  String get tryDifferentSearch => 'Versuchen Sie einen anderen Suchbegriff';

  @override
  String get sortedBy => 'Sortiert nach';

  @override
  String get loadingMoreUsers => 'Weitere Benutzer werden geladen';

  @override
  String get lastSeen => 'Zuletzt gesehen';

  @override
  String get firstSeen => 'Zuerst gesehen';

  @override
  String nUsers(String count) {
    return '$count Benutzer';
  }

  @override
  String nSessions(int count) {
    return '$count Sitzungen';
  }

  @override
  String lastPrefix(String value) {
    return 'Zuletzt: $value';
  }

  @override
  String get failedToLoadSiteConfig =>
      'Seiteneinstellungen konnten nicht geladen werden';

  @override
  String get failedToLoadMetrics => 'Metriken konnten nicht geladen werden';

  @override
  String get loadingMoreMetrics => 'Weitere Metriken werden geladen';

  @override
  String noMetricData(String metric) {
    return 'Keine $metric-Daten';
  }

  @override
  String get settings => 'Einstellungen';

  @override
  String get connection => 'Verbindung';

  @override
  String get notConfigured => 'Nicht konfiguriert';

  @override
  String get authMethod => 'Authentifizierungsmethode';

  @override
  String get sessionCookie => 'Sitzungs-Cookie';

  @override
  String get loggedInAs => 'Angemeldet als';

  @override
  String get unknown => 'Unbekannt';

  @override
  String get appearance => 'Erscheinungsbild';

  @override
  String get theme => 'Design';

  @override
  String get dark => 'Dunkel';

  @override
  String get light => 'Hell';

  @override
  String get auto => 'Automatisch';

  @override
  String get about => 'Über';

  @override
  String get appVersion => 'App-Version';

  @override
  String get openSourceAnalytics => 'Open-Source-Webanalyse';

  @override
  String get logoutConfirm => 'Möchten Sie sich wirklich abmelden?';

  @override
  String get siteSettings => 'Website-Einstellungen';

  @override
  String get siteInformation => 'Website-Informationen';

  @override
  String get domain => 'Domain';

  @override
  String get siteId => 'Website-ID';

  @override
  String get created => 'Erstellt';

  @override
  String get trackingSettings => 'Tracking-Einstellungen';

  @override
  String get publicDashboard => 'Öffentliches Dashboard';

  @override
  String get publicDashboardDesc =>
      'Öffentlichen Zugriff auf Analysedaten erlauben';

  @override
  String get sessionReplay => 'Sitzungswiedergabe';

  @override
  String get sessionReplayDesc => 'Benutzersitzungen aufzeichnen';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Core Web Vitals erfassen';

  @override
  String get trackErrors => 'Fehler erfassen';

  @override
  String get trackErrorsDesc => 'JavaScript-Fehler aufzeichnen';

  @override
  String get outboundLinksTracking => 'Ausgehende Links';

  @override
  String get outboundLinksDesc => 'Klicks auf ausgehende Links erfassen';

  @override
  String get excludedIps => 'Ausgeschlossene IPs';

  @override
  String get excludedCountries => 'Ausgeschlossene Länder';

  @override
  String get settingsSaved => 'Einstellungen gespeichert';

  @override
  String failedToSave(String error) {
    return 'Speichern fehlgeschlagen: $error';
  }

  @override
  String get timeRange => 'Zeitraum';

  @override
  String get today => 'Heute';

  @override
  String get yesterday => 'Gestern';

  @override
  String get last7Days => 'Letzte 7 Tage';

  @override
  String get last30Days => 'Letzte 30 Tage';

  @override
  String get thisWeek => 'Diese Woche';

  @override
  String get thisMonth => 'Dieser Monat';

  @override
  String get thisYear => 'Dieses Jahr';

  @override
  String get customRange => 'Benutzerdefinierter Zeitraum';

  @override
  String get filter => 'Filter';

  @override
  String get addFilter => 'Filter hinzufügen';

  @override
  String get parameter => 'Parameter';

  @override
  String get value => 'Wert';

  @override
  String get enterFilterValue => 'Filterwert eingeben';

  @override
  String get requestTimedOut =>
      'Zeitüberschreitung bei der Anfrage. Bitte versuchen Sie es erneut.';

  @override
  String get networkError => 'Netzwerkfehler. Überprüfen Sie Ihre Verbindung.';

  @override
  String get sessionExpired =>
      'Sitzung abgelaufen. Bitte melden Sie sich erneut an.';

  @override
  String get accessDenied => 'Zugriff verweigert.';

  @override
  String get dataNotFound => 'Daten nicht gefunden.';

  @override
  String get serverError =>
      'Serverfehler. Bitte versuchen Sie es später erneut.';

  @override
  String get failedToLoadGeneric =>
      'Daten konnten nicht geladen werden. Bitte versuchen Sie es erneut.';

  @override
  String chartDataPoints(int count) {
    return 'Diagramm mit $count Datenpunkten';
  }

  @override
  String previousPrefix(String value) {
    return 'Vorh.: $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'Leistungsbewertung: $rating';
  }

  @override
  String get loadingContent => 'Inhalt wird geladen';

  @override
  String get language => 'Sprache';

  @override
  String get selectLanguage => 'Sprache auswählen';

  @override
  String get failedToLoadUserDetails =>
      'Benutzerdetails konnten nicht geladen werden';

  @override
  String lastSeenPrefix(String value) {
    return 'Zuletzt gesehen: $value';
  }

  @override
  String get traits => 'Eigenschaften';

  @override
  String get noTraits => 'Keine Eigenschaften für diesen Benutzer';

  @override
  String get sessionDetail => 'Sitzungsdetails';

  @override
  String get failedToLoadSession => 'Sitzung konnte nicht geladen werden';

  @override
  String get entryPageLabel => 'Einstiegsseite';

  @override
  String get exitPage => 'Ausstiegsseite';

  @override
  String get browserAndDevice => 'Browser & Gerät';

  @override
  String get browser => 'Browser';

  @override
  String get os => 'OS';

  @override
  String get device => 'Gerät';

  @override
  String get sourceLabel => 'Quelle';

  @override
  String get referrer => 'Verweiser';

  @override
  String eventTimelineCount(int count) {
    return 'Ereignis-Zeitleiste ($count)';
  }

  @override
  String get noEvents => 'Keine Ereignisse';

  @override
  String get replayEventsTitle => 'Replay-Ereignisse';

  @override
  String get failedToLoadReplay => 'Replay konnte nicht geladen werden';

  @override
  String get noReplayEvents => 'Keine Replay-Ereignisse';

  @override
  String get totalEvents => 'Ereignisse gesamt';

  @override
  String get userActionsLabel => 'Benutzeraktionen';

  @override
  String eventTimelineActions(int count) {
    return 'Ereignis-Zeitleiste ($count Aktionen)';
  }

  @override
  String get eventLog => 'Ereignisprotokoll';

  @override
  String get viewEventLog => 'Ereignisprotokoll anzeigen';

  @override
  String get failedToLoadEventLog =>
      'Ereignisprotokoll konnte nicht geladen werden';

  @override
  String get activityHeatmap => 'Heatmap';

  @override
  String get heatmapLast4Weeks => 'Letzte 4 Wochen';

  @override
  String get less => 'Weniger';

  @override
  String get more => 'Mehr';

  @override
  String get peakActivity => 'Spitzenaktivität';

  @override
  String peakHour(String day, String time) {
    return '$day um $time';
  }

  @override
  String busiestDay(String day) {
    return 'Aktivster Tag: $day';
  }

  @override
  String get dayMon => 'Mo';

  @override
  String get dayTue => 'Di';

  @override
  String get dayWed => 'Mi';

  @override
  String get dayThu => 'Do';

  @override
  String get dayFri => 'Fr';

  @override
  String get daySat => 'Sa';

  @override
  String get daySun => 'So';

  @override
  String get searchEvents => 'Ereignisse suchen...';

  @override
  String get allTypes => 'Alle';

  @override
  String get noMatchingEvents => 'Keine passenden Ereignisse';

  @override
  String get liveView => 'Live';

  @override
  String get autoRefresh => 'Automatische Aktualisierung';

  @override
  String get usersOnlineNow => 'Benutzer gerade online';

  @override
  String lastUpdatedAt(String time) {
    return 'Aktualisiert um $time';
  }

  @override
  String get last30Minutes => 'Letzte 30 Minuten';

  @override
  String get last5Minutes => 'Letzte 5 Min';

  @override
  String get recentEvents => 'Aktuelle Ereignisse';

  @override
  String get noRecentEvents => 'Keine aktuellen Ereignisse';
}
