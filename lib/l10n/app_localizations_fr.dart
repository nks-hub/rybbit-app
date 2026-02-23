// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => 'Non officiel';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get save => 'Enregistrer';

  @override
  String get update => 'Mettre à jour';

  @override
  String get create => 'Créer';

  @override
  String get retry => 'Réessayer';

  @override
  String get add => 'Ajouter';

  @override
  String get edit => 'Modifier';

  @override
  String get clear => 'Effacer';

  @override
  String get apply => 'Appliquer';

  @override
  String get goBack => 'Retour';

  @override
  String get noData => 'Aucune donnée';

  @override
  String get loading => 'Chargement';

  @override
  String get logout => 'Déconnexion';

  @override
  String get close => 'Fermer';

  @override
  String get serverUrl => 'URL du serveur';

  @override
  String get serverUrlHint => 'https://votre-instance-rybbit.com';

  @override
  String get email => 'E-mail';

  @override
  String get apiKey => 'Clé API';

  @override
  String get password => 'Mot de passe';

  @override
  String get connect => 'Se connecter';

  @override
  String get organizations => 'Organisations';

  @override
  String get noSitesFound => 'Aucun site trouvé';

  @override
  String get noSitesHint =>
      'Ajoutez un site dans le tableau de bord web pour commencer.';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sites',
      one: '1 site',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return 'Membres ($count)';
  }

  @override
  String get failedToLoadOrganizations =>
      'Échec du chargement des organisations';

  @override
  String get noOrganizations => 'Aucune organisation';

  @override
  String get noOrganizationsHint =>
      'Les organisations peuvent être créées dans le tableau de bord web';

  @override
  String get failedToLoadMembers => 'Échec du chargement des membres';

  @override
  String get failedToLoadSites => 'Échec du chargement des sites';

  @override
  String get failedToLoadAnalytics => 'Échec du chargement des analyses';

  @override
  String get noDataAvailable => 'Aucune donnée disponible';

  @override
  String get users => 'Utilisateurs';

  @override
  String get sessions => 'Sessions';

  @override
  String get pageviews => 'Pages vues';

  @override
  String get pagesPerSession => 'Pages/Session';

  @override
  String get bounceRate => 'Taux de rebond';

  @override
  String get duration => 'Durée';

  @override
  String get metrics => 'Métriques';

  @override
  String get pages => 'Pages';

  @override
  String get referrers => 'Référents';

  @override
  String get countries => 'Pays';

  @override
  String get devices => 'Appareils';

  @override
  String get performance => 'Performance';

  @override
  String get goals => 'Objectifs';

  @override
  String get funnels => 'Entonnoirs';

  @override
  String get replay => 'Replay';

  @override
  String get config => 'Configuration';

  @override
  String usersOnline(int count) {
    return '$count utilisateurs en ligne';
  }

  @override
  String get events => 'Événements';

  @override
  String get eventsOverTime => 'Événements au fil du temps';

  @override
  String get eventNames => 'Noms des événements';

  @override
  String get noCustomEventsTracked => 'Aucun événement personnalisé suivi';

  @override
  String get failedToLoadProperties => 'Échec du chargement des propriétés';

  @override
  String get noProperties => 'Aucune propriété';

  @override
  String get outboundLinks => 'Liens sortants';

  @override
  String get noOutboundLinksTracked => 'Aucun lien sortant suivi';

  @override
  String get failedToLoadChart => 'Échec du chargement du graphique';

  @override
  String get errors => 'Erreurs';

  @override
  String get failedToLoadErrors => 'Échec du chargement des erreurs';

  @override
  String get noErrorsFound => 'Aucune erreur trouvée';

  @override
  String get everythingLooksGood => 'Tout semble en ordre !';

  @override
  String get occurrences => 'occurrences';

  @override
  String get sessionsAffected => 'sessions affectées';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'Échec du chargement des événements : $error';
  }

  @override
  String get noEventsFound => 'Aucun événement trouvé';

  @override
  String get failedToLoadFunnels => 'Échec du chargement des entonnoirs';

  @override
  String get noFunnelsSaved => 'Aucun entonnoir enregistré';

  @override
  String get createFunnelsHint =>
      'Créez des entonnoirs dans le tableau de bord web';

  @override
  String get deleteFunnel => 'Supprimer l\'entonnoir';

  @override
  String deleteFunnelConfirm(String name) {
    return 'Supprimer \"$name\" ?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'Échec de la suppression de l\'entonnoir : $error';
  }

  @override
  String get noStepsDefined => 'Aucune étape définie pour cet entonnoir';

  @override
  String failedToAnalyze(String error) {
    return 'Échec de l\'analyse : $error';
  }

  @override
  String get overallConversion => 'Conversion globale';

  @override
  String dropoff(String value) {
    return 'Abandon : $value';
  }

  @override
  String get createGoal => 'Créer un objectif';

  @override
  String get failedToLoadGoals => 'Échec du chargement des objectifs';

  @override
  String get noGoalsConfigured => 'Aucun objectif configuré';

  @override
  String get noGoalsHint => 'Appuyez sur + pour créer un nouvel objectif';

  @override
  String get conversions => 'Conversions';

  @override
  String get rate => 'Taux';

  @override
  String get editGoal => 'Modifier l\'objectif';

  @override
  String get createGoalTitle => 'Créer un objectif';

  @override
  String get name => 'Nom';

  @override
  String get type => 'Type';

  @override
  String get path => 'Chemin';

  @override
  String get event => 'Événement';

  @override
  String get pathPattern => 'Modèle de chemin';

  @override
  String get eventName => 'Nom de l\'événement';

  @override
  String get deleteGoal => 'Supprimer l\'objectif';

  @override
  String deleteGoalConfirm(String name) {
    return 'Supprimer \"$name\" ?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'Échec de la suppression de l\'objectif : $error';
  }

  @override
  String get failedToLoadPerformanceData =>
      'Échec du chargement des données de performance';

  @override
  String metricOverTime(String metric) {
    return '$metric au fil du temps';
  }

  @override
  String get byDimension => 'Par dimension';

  @override
  String get failedToLoadDimensionData =>
      'Échec du chargement des données de dimension';

  @override
  String get good => 'Bon';

  @override
  String get needsImprovement => 'À améliorer';

  @override
  String get poor => 'Mauvais';

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
  String get dimPages => 'Pages';

  @override
  String get dimCountries => 'Pays';

  @override
  String get dimDevices => 'Appareils';

  @override
  String get dimBrowsers => 'Navigateurs';

  @override
  String get dimOS => 'OS';

  @override
  String get sessionFilters => 'Filtres de session';

  @override
  String get minPageviews => 'Pages vues min.';

  @override
  String get minEvents => 'Événements min.';

  @override
  String get minDurationSeconds => 'Durée min. (secondes)';

  @override
  String get failedToLoadSessions => 'Échec du chargement des sessions';

  @override
  String get noSessionsFound => 'Aucune session trouvée';

  @override
  String get filterSessions => 'Filtrer les sessions';

  @override
  String get loadingMoreSessions => 'Chargement de sessions supplémentaires';

  @override
  String entryPage(String page) {
    return 'Page d\'entrée : $page';
  }

  @override
  String nPages(int count) {
    return '$count pages';
  }

  @override
  String get sessionReplays => 'Replays de session';

  @override
  String get failedToLoadReplays => 'Échec du chargement des replays';

  @override
  String get noReplaysFound => 'Aucun replay trouvé';

  @override
  String get noReplaysHint =>
      'Les replays de session apparaîtront ici lorsqu\'ils seront activés.';

  @override
  String get previousPage => 'Page précédente';

  @override
  String get nextPage => 'Page suivante';

  @override
  String pageNumber(int number) {
    return 'Page $number';
  }

  @override
  String get unknownBrowser => 'Navigateur inconnu';

  @override
  String get unknownCountry => 'Pays inconnu';

  @override
  String get sortUsers => 'Trier les utilisateurs';

  @override
  String get showAllUsers => 'Afficher tous les utilisateurs';

  @override
  String get showIdentifiedOnly => 'Afficher uniquement les identifiés';

  @override
  String get searchUsers => 'Rechercher des utilisateurs';

  @override
  String get searchUsersHint => 'Rechercher des utilisateurs...';

  @override
  String get clearSearch => 'Effacer la recherche';

  @override
  String get failedToLoadUsers => 'Échec du chargement des utilisateurs';

  @override
  String get noUsersFound => 'Aucun utilisateur trouvé';

  @override
  String get noIdentifiedUsers => 'Aucun utilisateur identifié';

  @override
  String get usersWillAppear =>
      'Les utilisateurs apparaîtront une fois identifiés';

  @override
  String get tryDifferentSearch => 'Essayez un autre terme de recherche';

  @override
  String get sortedBy => 'Trié par';

  @override
  String get loadingMoreUsers => 'Chargement d\'utilisateurs supplémentaires';

  @override
  String get lastSeen => 'Dernière visite';

  @override
  String get firstSeen => 'Première visite';

  @override
  String nUsers(String count) {
    return '$count utilisateurs';
  }

  @override
  String nSessions(int count) {
    return '$count sessions';
  }

  @override
  String lastPrefix(String value) {
    return 'Dernier : $value';
  }

  @override
  String get failedToLoadSiteConfig =>
      'Échec du chargement de la configuration du site';

  @override
  String get failedToLoadMetrics => 'Échec du chargement des métriques';

  @override
  String get loadingMoreMetrics => 'Chargement de métriques supplémentaires';

  @override
  String noMetricData(String metric) {
    return 'Aucune donnée pour $metric';
  }

  @override
  String get settings => 'Paramètres';

  @override
  String get connection => 'Connexion';

  @override
  String get notConfigured => 'Non configuré';

  @override
  String get authMethod => 'Méthode d\'authentification';

  @override
  String get sessionCookie => 'Cookie de session';

  @override
  String get loggedInAs => 'Connecté en tant que';

  @override
  String get unknown => 'Inconnu';

  @override
  String get appearance => 'Apparence';

  @override
  String get theme => 'Thème';

  @override
  String get dark => 'Sombre';

  @override
  String get light => 'Clair';

  @override
  String get auto => 'Automatique';

  @override
  String get about => 'À propos';

  @override
  String get appVersion => 'Version de l\'application';

  @override
  String get openSourceAnalytics => 'Analyse web open source';

  @override
  String get logoutConfirm => 'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String get siteSettings => 'Paramètres du site';

  @override
  String get siteInformation => 'Informations du site';

  @override
  String get domain => 'Domaine';

  @override
  String get siteId => 'ID du site';

  @override
  String get created => 'Créé';

  @override
  String get trackingSettings => 'Paramètres de suivi';

  @override
  String get publicDashboard => 'Tableau de bord public';

  @override
  String get publicDashboardDesc => 'Autoriser l\'accès public aux analyses';

  @override
  String get sessionReplay => 'Replay de session';

  @override
  String get sessionReplayDesc => 'Enregistrer les sessions des utilisateurs';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Suivre les Core Web Vitals';

  @override
  String get trackErrors => 'Suivi des erreurs';

  @override
  String get trackErrorsDesc => 'Capturer les erreurs JavaScript';

  @override
  String get outboundLinksTracking => 'Liens sortants';

  @override
  String get outboundLinksDesc => 'Suivre les clics sur les liens sortants';

  @override
  String get excludedIps => 'IP exclues';

  @override
  String get excludedCountries => 'Pays exclus';

  @override
  String get settingsSaved => 'Paramètres enregistrés';

  @override
  String failedToSave(String error) {
    return 'Échec de l\'enregistrement : $error';
  }

  @override
  String get timeRange => 'Période';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get yesterday => 'Hier';

  @override
  String get last7Days => '7 derniers jours';

  @override
  String get last30Days => '30 derniers jours';

  @override
  String get thisWeek => 'Cette semaine';

  @override
  String get thisMonth => 'Ce mois-ci';

  @override
  String get thisYear => 'Cette année';

  @override
  String get customRange => 'Période personnalisée';

  @override
  String get filter => 'Filtre';

  @override
  String get addFilter => 'Ajouter un filtre';

  @override
  String get parameter => 'Paramètre';

  @override
  String get value => 'Valeur';

  @override
  String get enterFilterValue => 'Saisir une valeur de filtre';

  @override
  String get requestTimedOut => 'La requête a expiré. Veuillez réessayer.';

  @override
  String get networkError => 'Erreur réseau. Vérifiez votre connexion.';

  @override
  String get sessionExpired => 'Session expirée. Veuillez vous reconnecter.';

  @override
  String get accessDenied => 'Accès refusé.';

  @override
  String get dataNotFound => 'Données introuvables.';

  @override
  String get serverError => 'Erreur serveur. Veuillez réessayer plus tard.';

  @override
  String get failedToLoadGeneric =>
      'Échec du chargement des données. Veuillez réessayer.';

  @override
  String chartDataPoints(int count) {
    return 'Graphique avec $count points de données';
  }

  @override
  String previousPrefix(String value) {
    return 'Préc. : $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'Évaluation de la performance : $rating';
  }

  @override
  String get loadingContent => 'Chargement du contenu';

  @override
  String get language => 'Langue';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get failedToLoadUserDetails =>
      'Impossible de charger les détails de l\'utilisateur';

  @override
  String lastSeenPrefix(String value) {
    return 'Vu pour la dernière fois : $value';
  }

  @override
  String get traits => 'Attributs';

  @override
  String get noTraits => 'Aucun attribut pour cet utilisateur';

  @override
  String get sessionDetail => 'Détail de la session';

  @override
  String get failedToLoadSession => 'Impossible de charger la session';

  @override
  String get entryPageLabel => 'Page d\'entrée';

  @override
  String get exitPage => 'Page de sortie';

  @override
  String get browserAndDevice => 'Navigateur et appareil';

  @override
  String get browser => 'Navigateur';

  @override
  String get os => 'OS';

  @override
  String get device => 'Appareil';

  @override
  String get sourceLabel => 'Source';

  @override
  String get referrer => 'Référent';

  @override
  String eventTimelineCount(int count) {
    return 'Chronologie ($count)';
  }

  @override
  String get noEvents => 'Aucun événement';

  @override
  String get replayEventsTitle => 'Événements de replay';

  @override
  String get failedToLoadReplay => 'Impossible de charger le replay';

  @override
  String get noReplayEvents => 'Aucun événement de replay';

  @override
  String get totalEvents => 'Total des événements';

  @override
  String get userActionsLabel => 'Actions utilisateur';

  @override
  String eventTimelineActions(int count) {
    return 'Chronologie ($count actions)';
  }

  @override
  String get eventLog => 'Journal des événements';

  @override
  String get viewEventLog => 'Voir le journal des événements';

  @override
  String get failedToLoadEventLog =>
      'Impossible de charger le journal des événements';

  @override
  String get activityHeatmap => 'Carte thermique';

  @override
  String get heatmapLast4Weeks => '4 dernières semaines';

  @override
  String get less => 'Moins';

  @override
  String get more => 'Plus';

  @override
  String get peakActivity => 'Activité maximale';

  @override
  String peakHour(String day, String time) {
    return '$day à $time';
  }

  @override
  String busiestDay(String day) {
    return 'Jour le plus actif : $day';
  }

  @override
  String get dayMon => 'Lun';

  @override
  String get dayTue => 'Mar';

  @override
  String get dayWed => 'Mer';

  @override
  String get dayThu => 'Jeu';

  @override
  String get dayFri => 'Ven';

  @override
  String get daySat => 'Sam';

  @override
  String get daySun => 'Dim';

  @override
  String get searchEvents => 'Rechercher des événements...';

  @override
  String get allTypes => 'Tous';

  @override
  String get noMatchingEvents => 'Aucun événement correspondant';

  @override
  String get liveView => 'En direct';

  @override
  String get autoRefresh => 'Actualisation automatique';

  @override
  String get usersOnlineNow => 'Utilisateurs en ligne';

  @override
  String lastUpdatedAt(String time) {
    return 'Mis à jour à $time';
  }

  @override
  String get last30Minutes => '30 dernières minutes';

  @override
  String get last5Minutes => '5 dernières min';

  @override
  String get recentEvents => 'Événements récents';

  @override
  String get noRecentEvents => 'Aucun événement récent';
}
