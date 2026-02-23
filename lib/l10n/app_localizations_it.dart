// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => 'Non ufficiale';

  @override
  String get cancel => 'Annulla';

  @override
  String get delete => 'Elimina';

  @override
  String get save => 'Salva';

  @override
  String get update => 'Aggiorna';

  @override
  String get create => 'Crea';

  @override
  String get retry => 'Riprova';

  @override
  String get add => 'Aggiungi';

  @override
  String get edit => 'Modifica';

  @override
  String get clear => 'Cancella';

  @override
  String get apply => 'Applica';

  @override
  String get goBack => 'Indietro';

  @override
  String get noData => 'Nessun dato';

  @override
  String get loading => 'Caricamento';

  @override
  String get logout => 'Esci';

  @override
  String get close => 'Chiudi';

  @override
  String get serverUrl => 'URL del server';

  @override
  String get serverUrlHint => 'https://la-tua-istanza-rybbit.com';

  @override
  String get email => 'Email';

  @override
  String get apiKey => 'API Key';

  @override
  String get password => 'Password';

  @override
  String get connect => 'Connetti';

  @override
  String get organizations => 'Organizzazioni';

  @override
  String get noSitesFound => 'Nessun sito trovato';

  @override
  String get noSitesHint =>
      'Aggiungere un sito nella dashboard web per iniziare.';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count siti',
      one: '1 sito',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return 'Membri ($count)';
  }

  @override
  String get failedToLoadOrganizations =>
      'Impossibile caricare le organizzazioni';

  @override
  String get noOrganizations => 'Nessuna organizzazione';

  @override
  String get noOrganizationsHint =>
      'Le organizzazioni possono essere create nella dashboard web';

  @override
  String get failedToLoadMembers => 'Impossibile caricare i membri';

  @override
  String get failedToLoadSites => 'Impossibile caricare i siti';

  @override
  String get failedToLoadAnalytics => 'Impossibile caricare le analisi';

  @override
  String get noDataAvailable => 'Nessun dato disponibile';

  @override
  String get users => 'Utenti';

  @override
  String get sessions => 'Sessioni';

  @override
  String get pageviews => 'Visualizzazioni di pagina';

  @override
  String get pagesPerSession => 'Pagine/Sessione';

  @override
  String get bounceRate => 'Frequenza di rimbalzo';

  @override
  String get duration => 'Durata';

  @override
  String get metrics => 'Metriche';

  @override
  String get pages => 'Pagine';

  @override
  String get referrers => 'Referrer';

  @override
  String get countries => 'Paesi';

  @override
  String get devices => 'Dispositivi';

  @override
  String get performance => 'Prestazioni';

  @override
  String get goals => 'Obiettivi';

  @override
  String get funnels => 'Funnel';

  @override
  String get replay => 'Riproduzione';

  @override
  String get config => 'Configurazione';

  @override
  String usersOnline(int count) {
    return '$count utenti online';
  }

  @override
  String get events => 'Eventi';

  @override
  String get eventsOverTime => 'Eventi nel tempo';

  @override
  String get eventNames => 'Nomi degli eventi';

  @override
  String get noCustomEventsTracked => 'Nessun evento personalizzato tracciato';

  @override
  String get failedToLoadProperties => 'Impossibile caricare le proprietà';

  @override
  String get noProperties => 'Nessuna proprietà';

  @override
  String get outboundLinks => 'Link in uscita';

  @override
  String get noOutboundLinksTracked => 'Nessun link in uscita tracciato';

  @override
  String get failedToLoadChart => 'Impossibile caricare il grafico';

  @override
  String get errors => 'Errori';

  @override
  String get failedToLoadErrors => 'Impossibile caricare gli errori';

  @override
  String get noErrorsFound => 'Nessun errore trovato';

  @override
  String get everythingLooksGood => 'Tutto sembra a posto!';

  @override
  String get occurrences => 'occorrenze';

  @override
  String get sessionsAffected => 'sessioni interessate';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'Impossibile caricare gli eventi: $error';
  }

  @override
  String get noEventsFound => 'Nessun evento trovato';

  @override
  String get failedToLoadFunnels => 'Impossibile caricare i funnel';

  @override
  String get noFunnelsSaved => 'Nessun funnel salvato';

  @override
  String get createFunnelsHint => 'Creare i funnel nella dashboard web';

  @override
  String get deleteFunnel => 'Elimina funnel';

  @override
  String deleteFunnelConfirm(String name) {
    return 'Eliminare \"$name\"?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'Impossibile eliminare il funnel: $error';
  }

  @override
  String get noStepsDefined => 'Nessun passaggio definito per questo funnel';

  @override
  String failedToAnalyze(String error) {
    return 'Analisi non riuscita: $error';
  }

  @override
  String get overallConversion => 'Conversione complessiva';

  @override
  String dropoff(String value) {
    return 'Abbandono: $value';
  }

  @override
  String get createGoal => 'Crea obiettivo';

  @override
  String get failedToLoadGoals => 'Impossibile caricare gli obiettivi';

  @override
  String get noGoalsConfigured => 'Nessun obiettivo configurato';

  @override
  String get noGoalsHint => 'Toccare + per creare un nuovo obiettivo';

  @override
  String get conversions => 'Conversioni';

  @override
  String get rate => 'Tasso';

  @override
  String get editGoal => 'Modifica obiettivo';

  @override
  String get createGoalTitle => 'Crea obiettivo';

  @override
  String get name => 'Nome';

  @override
  String get type => 'Tipo';

  @override
  String get path => 'Percorso';

  @override
  String get event => 'Evento';

  @override
  String get pathPattern => 'Modello di percorso';

  @override
  String get eventName => 'Nome evento';

  @override
  String get deleteGoal => 'Elimina obiettivo';

  @override
  String deleteGoalConfirm(String name) {
    return 'Eliminare \"$name\"?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'Impossibile eliminare l\'obiettivo: $error';
  }

  @override
  String get failedToLoadPerformanceData =>
      'Impossibile caricare i dati sulle prestazioni';

  @override
  String metricOverTime(String metric) {
    return '$metric nel tempo';
  }

  @override
  String get byDimension => 'Per dimensione';

  @override
  String get failedToLoadDimensionData =>
      'Impossibile caricare i dati della dimensione';

  @override
  String get good => 'Buono';

  @override
  String get needsImprovement => 'Da migliorare';

  @override
  String get poor => 'Scarso';

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
  String get dimPages => 'Pagine';

  @override
  String get dimCountries => 'Paesi';

  @override
  String get dimDevices => 'Dispositivi';

  @override
  String get dimBrowsers => 'Browser';

  @override
  String get dimOS => 'OS';

  @override
  String get sessionFilters => 'Filtri sessione';

  @override
  String get minPageviews => 'Visualizzazioni di pagina minime';

  @override
  String get minEvents => 'Eventi minimi';

  @override
  String get minDurationSeconds => 'Durata minima (secondi)';

  @override
  String get failedToLoadSessions => 'Impossibile caricare le sessioni';

  @override
  String get noSessionsFound => 'Nessuna sessione trovata';

  @override
  String get filterSessions => 'Filtra sessioni';

  @override
  String get loadingMoreSessions => 'Caricamento di altre sessioni';

  @override
  String entryPage(String page) {
    return 'Pagina di ingresso: $page';
  }

  @override
  String nPages(int count) {
    return '$count pagine';
  }

  @override
  String get sessionReplays => 'Riproduzioni delle sessioni';

  @override
  String get failedToLoadReplays => 'Impossibile caricare le riproduzioni';

  @override
  String get noReplaysFound => 'Nessuna riproduzione trovata';

  @override
  String get noReplaysHint =>
      'Le riproduzioni delle sessioni appariranno qui quando abilitate.';

  @override
  String get previousPage => 'Pagina precedente';

  @override
  String get nextPage => 'Pagina successiva';

  @override
  String pageNumber(int number) {
    return 'Pagina $number';
  }

  @override
  String get unknownBrowser => 'Browser sconosciuto';

  @override
  String get unknownCountry => 'Paese sconosciuto';

  @override
  String get sortUsers => 'Ordina utenti';

  @override
  String get showAllUsers => 'Mostra tutti gli utenti';

  @override
  String get showIdentifiedOnly => 'Mostra solo identificati';

  @override
  String get searchUsers => 'Cerca utenti';

  @override
  String get searchUsersHint => 'Cerca utenti...';

  @override
  String get clearSearch => 'Cancella ricerca';

  @override
  String get failedToLoadUsers => 'Impossibile caricare gli utenti';

  @override
  String get noUsersFound => 'Nessun utente trovato';

  @override
  String get noIdentifiedUsers => 'Nessun utente identificato';

  @override
  String get usersWillAppear => 'Gli utenti appariranno una volta identificati';

  @override
  String get tryDifferentSearch => 'Provare un termine di ricerca diverso';

  @override
  String get sortedBy => 'Ordinato per';

  @override
  String get loadingMoreUsers => 'Caricamento di altri utenti';

  @override
  String get lastSeen => 'Ultimo accesso';

  @override
  String get firstSeen => 'Primo accesso';

  @override
  String nUsers(String count) {
    return '$count utenti';
  }

  @override
  String nSessions(int count) {
    return '$count sessioni';
  }

  @override
  String lastPrefix(String value) {
    return 'Ultimo: $value';
  }

  @override
  String get failedToLoadSiteConfig =>
      'Impossibile caricare la configurazione del sito';

  @override
  String get failedToLoadMetrics => 'Impossibile caricare le metriche';

  @override
  String get loadingMoreMetrics => 'Caricamento di altre metriche';

  @override
  String noMetricData(String metric) {
    return 'Nessun dato per $metric';
  }

  @override
  String get settings => 'Impostazioni';

  @override
  String get connection => 'Connessione';

  @override
  String get notConfigured => 'Non configurato';

  @override
  String get authMethod => 'Metodo di autenticazione';

  @override
  String get sessionCookie => 'Cookie di sessione';

  @override
  String get loggedInAs => 'Connesso come';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get appearance => 'Aspetto';

  @override
  String get theme => 'Tema';

  @override
  String get dark => 'Scuro';

  @override
  String get light => 'Chiaro';

  @override
  String get auto => 'Automatico';

  @override
  String get about => 'Informazioni';

  @override
  String get appVersion => 'Versione dell\'app';

  @override
  String get openSourceAnalytics => 'Analisi web open source';

  @override
  String get logoutConfirm => 'Confermare l\'uscita?';

  @override
  String get siteSettings => 'Impostazioni del sito';

  @override
  String get siteInformation => 'Informazioni sul sito';

  @override
  String get domain => 'Dominio';

  @override
  String get siteId => 'ID del sito';

  @override
  String get created => 'Creato';

  @override
  String get trackingSettings => 'Impostazioni di tracciamento';

  @override
  String get publicDashboard => 'Dashboard pubblica';

  @override
  String get publicDashboardDesc =>
      'Consentire l\'accesso pubblico alle analisi';

  @override
  String get sessionReplay => 'Riproduzione sessione';

  @override
  String get sessionReplayDesc => 'Registrare le sessioni degli utenti';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Monitorare i Core Web Vitals';

  @override
  String get trackErrors => 'Traccia errori';

  @override
  String get trackErrorsDesc => 'Catturare gli errori JavaScript';

  @override
  String get outboundLinksTracking => 'Link in uscita';

  @override
  String get outboundLinksDesc => 'Tracciare i clic sui link in uscita';

  @override
  String get excludedIps => 'IP esclusi';

  @override
  String get excludedCountries => 'Paesi esclusi';

  @override
  String get settingsSaved => 'Impostazioni salvate';

  @override
  String failedToSave(String error) {
    return 'Salvataggio non riuscito: $error';
  }

  @override
  String get timeRange => 'Intervallo di tempo';

  @override
  String get today => 'Oggi';

  @override
  String get yesterday => 'Ieri';

  @override
  String get last7Days => 'Ultimi 7 giorni';

  @override
  String get last30Days => 'Ultimi 30 giorni';

  @override
  String get thisWeek => 'Questa settimana';

  @override
  String get thisMonth => 'Questo mese';

  @override
  String get thisYear => 'Quest\'anno';

  @override
  String get customRange => 'Intervallo personalizzato';

  @override
  String get filter => 'Filtro';

  @override
  String get addFilter => 'Aggiungi filtro';

  @override
  String get parameter => 'Parametro';

  @override
  String get value => 'Valore';

  @override
  String get enterFilterValue => 'Inserire il valore del filtro';

  @override
  String get requestTimedOut => 'La richiesta è scaduta. Riprovare.';

  @override
  String get networkError => 'Errore di rete. Verificare la connessione.';

  @override
  String get sessionExpired =>
      'Sessione scaduta. Effettuare nuovamente l\'accesso.';

  @override
  String get accessDenied => 'Accesso negato.';

  @override
  String get dataNotFound => 'Dati non trovati.';

  @override
  String get serverError => 'Errore del server. Riprovare più tardi.';

  @override
  String get failedToLoadGeneric => 'Impossibile caricare i dati. Riprovare.';

  @override
  String chartDataPoints(int count) {
    return 'Grafico con $count punti dati';
  }

  @override
  String previousPrefix(String value) {
    return 'Prec: $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'Valutazione delle prestazioni: $rating';
  }

  @override
  String get loadingContent => 'Caricamento del contenuto';

  @override
  String get language => 'Lingua';

  @override
  String get selectLanguage => 'Seleziona lingua';

  @override
  String get failedToLoadUserDetails =>
      'Impossibile caricare i dettagli dell\'utente';

  @override
  String lastSeenPrefix(String value) {
    return 'Ultimo accesso: $value';
  }

  @override
  String get traits => 'Proprietà';

  @override
  String get noTraits => 'Nessuna proprietà per questo utente';

  @override
  String get sessionDetail => 'Dettaglio sessione';

  @override
  String get failedToLoadSession => 'Impossibile caricare la sessione';

  @override
  String get entryPageLabel => 'Pagina di ingresso';

  @override
  String get exitPage => 'Pagina di uscita';

  @override
  String get browserAndDevice => 'Browser e dispositivo';

  @override
  String get browser => 'Browser';

  @override
  String get os => 'OS';

  @override
  String get device => 'Dispositivo';

  @override
  String get sourceLabel => 'Sorgente';

  @override
  String get referrer => 'Referente';

  @override
  String eventTimelineCount(int count) {
    return 'Cronologia eventi ($count)';
  }

  @override
  String get noEvents => 'Nessun evento';

  @override
  String get replayEventsTitle => 'Eventi di replay';

  @override
  String get failedToLoadReplay => 'Impossibile caricare il replay';

  @override
  String get noReplayEvents => 'Nessun evento di replay';

  @override
  String get totalEvents => 'Totale eventi';

  @override
  String get userActionsLabel => 'Azioni utente';

  @override
  String eventTimelineActions(int count) {
    return 'Cronologia eventi ($count azioni)';
  }

  @override
  String get eventLog => 'Registro eventi';

  @override
  String get viewEventLog => 'Visualizza registro eventi';

  @override
  String get failedToLoadEventLog => 'Impossibile caricare il registro eventi';

  @override
  String get activityHeatmap => 'Mappa di calore';

  @override
  String get heatmapLast4Weeks => 'Ultime 4 settimane';

  @override
  String get less => 'Meno';

  @override
  String get more => 'Più';

  @override
  String get peakActivity => 'Attività di picco';

  @override
  String peakHour(String day, String time) {
    return '$day alle $time';
  }

  @override
  String busiestDay(String day) {
    return 'Giorno più attivo: $day';
  }

  @override
  String get dayMon => 'Lun';

  @override
  String get dayTue => 'Mar';

  @override
  String get dayWed => 'Mer';

  @override
  String get dayThu => 'Gio';

  @override
  String get dayFri => 'Ven';

  @override
  String get daySat => 'Sab';

  @override
  String get daySun => 'Dom';

  @override
  String get searchEvents => 'Cerca eventi...';

  @override
  String get allTypes => 'Tutti';

  @override
  String get noMatchingEvents => 'Nessun evento corrispondente';

  @override
  String get liveView => 'Dal vivo';

  @override
  String get autoRefresh => 'Aggiornamento automatico';

  @override
  String get usersOnlineNow => 'Utenti online ora';

  @override
  String lastUpdatedAt(String time) {
    return 'Aggiornato alle $time';
  }

  @override
  String get last30Minutes => 'Ultimi 30 minuti';

  @override
  String get last5Minutes => 'Ultimi 5 min';

  @override
  String get recentEvents => 'Eventi recenti';

  @override
  String get noRecentEvents => 'Nessun evento recente';

  @override
  String get retention => 'Retention';

  @override
  String get weekly => 'Settimanale';

  @override
  String get daily => 'Giornaliero';

  @override
  String get retentionRange => 'Intervallo';

  @override
  String retentionDays(int count) {
    return '$count giorni';
  }

  @override
  String get failedToLoadRetention =>
      'Impossibile caricare i dati di retention';

  @override
  String get noRetentionData => 'Nessun dato di retention';

  @override
  String get cohort => 'Coorte';

  @override
  String get retentionWeekPrefix => 'S';

  @override
  String get retentionDayPrefix => 'G';

  @override
  String get journeys => 'Percorsi';

  @override
  String get journeySteps => 'Passaggi';

  @override
  String get failedToLoadJourneys => 'Impossibile caricare i percorsi';

  @override
  String get noJourneysFound => 'Nessun percorso trovato';

  @override
  String journeySessions(String count) {
    return '$count sessioni';
  }

  @override
  String get locations => 'Posizioni';

  @override
  String get locationCities => 'Città';

  @override
  String get failedToLoadLocations => 'Impossibile caricare le posizioni';

  @override
  String get noLocationsFound => 'Nessuna posizione trovata';
}
