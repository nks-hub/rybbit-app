// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => 'Unofficial';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get save => 'Save';

  @override
  String get update => 'Update';

  @override
  String get create => 'Create';

  @override
  String get retry => 'Retry';

  @override
  String get add => 'Add';

  @override
  String get edit => 'Edit';

  @override
  String get clear => 'Clear';

  @override
  String get apply => 'Apply';

  @override
  String get goBack => 'Go back';

  @override
  String get noData => 'No data';

  @override
  String get loading => 'Loading';

  @override
  String get logout => 'Logout';

  @override
  String get close => 'Close';

  @override
  String get serverUrl => 'Server URL';

  @override
  String get serverUrlHint => 'https://your-rybbit-instance.com';

  @override
  String get email => 'Email';

  @override
  String get apiKey => 'API Key';

  @override
  String get password => 'Password';

  @override
  String get connect => 'Connect';

  @override
  String get organizations => 'Organizations';

  @override
  String get noSitesFound => 'No sites found';

  @override
  String get noSitesHint => 'Add a site in the web dashboard to get started.';

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
    return 'Members ($count)';
  }

  @override
  String get failedToLoadOrganizations => 'Failed to load organizations';

  @override
  String get noOrganizations => 'No organizations';

  @override
  String get noOrganizationsHint =>
      'Organizations can be created in the web dashboard';

  @override
  String get failedToLoadMembers => 'Failed to load members';

  @override
  String get failedToLoadSites => 'Failed to load sites';

  @override
  String get failedToLoadAnalytics => 'Failed to load analytics';

  @override
  String get noDataAvailable => 'No data available';

  @override
  String get users => 'Users';

  @override
  String get sessions => 'Sessions';

  @override
  String get pageviews => 'Pageviews';

  @override
  String get pagesPerSession => 'Pages/Session';

  @override
  String get bounceRate => 'Bounce Rate';

  @override
  String get duration => 'Duration';

  @override
  String get metrics => 'Metrics';

  @override
  String get pages => 'Pages';

  @override
  String get referrers => 'Referrers';

  @override
  String get countries => 'Countries';

  @override
  String get devices => 'Devices';

  @override
  String get performance => 'Performance';

  @override
  String get goals => 'Goals';

  @override
  String get funnels => 'Funnels';

  @override
  String get replay => 'Replay';

  @override
  String get config => 'Config';

  @override
  String usersOnline(int count) {
    return '$count users online';
  }

  @override
  String get events => 'Events';

  @override
  String get eventsOverTime => 'Events Over Time';

  @override
  String get eventNames => 'Event Names';

  @override
  String get noCustomEventsTracked => 'No custom events tracked';

  @override
  String get failedToLoadProperties => 'Failed to load properties';

  @override
  String get noProperties => 'No properties';

  @override
  String get outboundLinks => 'Outbound Links';

  @override
  String get noOutboundLinksTracked => 'No outbound links tracked';

  @override
  String get failedToLoadChart => 'Failed to load chart';

  @override
  String get errors => 'Errors';

  @override
  String get failedToLoadErrors => 'Failed to load errors';

  @override
  String get noErrorsFound => 'No errors found';

  @override
  String get everythingLooksGood => 'Everything looks good!';

  @override
  String get occurrences => 'occurrences';

  @override
  String get sessionsAffected => 'sessions affected';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'Failed to load events: $error';
  }

  @override
  String get noEventsFound => 'No events found';

  @override
  String get failedToLoadFunnels => 'Failed to load funnels';

  @override
  String get noFunnelsSaved => 'No funnels saved';

  @override
  String get createFunnelsHint => 'Create funnels in the web dashboard';

  @override
  String get deleteFunnel => 'Delete Funnel';

  @override
  String deleteFunnelConfirm(String name) {
    return 'Delete \"$name\"?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'Failed to delete funnel: $error';
  }

  @override
  String get noStepsDefined => 'No steps defined for this funnel';

  @override
  String failedToAnalyze(String error) {
    return 'Failed to analyze: $error';
  }

  @override
  String get overallConversion => 'Overall Conversion';

  @override
  String dropoff(String value) {
    return 'Dropoff: $value';
  }

  @override
  String get createGoal => 'Create goal';

  @override
  String get failedToLoadGoals => 'Failed to load goals';

  @override
  String get noGoalsConfigured => 'No goals configured';

  @override
  String get noGoalsHint => 'Tap + to create a new goal';

  @override
  String get conversions => 'Conversions';

  @override
  String get rate => 'Rate';

  @override
  String get editGoal => 'Edit Goal';

  @override
  String get createGoalTitle => 'Create Goal';

  @override
  String get name => 'Name';

  @override
  String get type => 'Type';

  @override
  String get path => 'Path';

  @override
  String get event => 'Event';

  @override
  String get pathPattern => 'Path Pattern';

  @override
  String get eventName => 'Event Name';

  @override
  String get deleteGoal => 'Delete Goal';

  @override
  String deleteGoalConfirm(String name) {
    return 'Delete \"$name\"?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'Failed to delete goal: $error';
  }

  @override
  String get failedToLoadPerformanceData => 'Failed to load performance data';

  @override
  String metricOverTime(String metric) {
    return '$metric Over Time';
  }

  @override
  String get byDimension => 'By Dimension';

  @override
  String get failedToLoadDimensionData => 'Failed to load dimension data';

  @override
  String get good => 'Good';

  @override
  String get needsImprovement => 'Needs Improvement';

  @override
  String get poor => 'Poor';

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
  String get dimCountries => 'Countries';

  @override
  String get dimDevices => 'Devices';

  @override
  String get dimBrowsers => 'Browsers';

  @override
  String get dimOS => 'OS';

  @override
  String get sessionFilters => 'Session Filters';

  @override
  String get minPageviews => 'Min Pageviews';

  @override
  String get minEvents => 'Min Events';

  @override
  String get minDurationSeconds => 'Min Duration (seconds)';

  @override
  String get failedToLoadSessions => 'Failed to load sessions';

  @override
  String get noSessionsFound => 'No sessions found';

  @override
  String get filterSessions => 'Filter sessions';

  @override
  String get loadingMoreSessions => 'Loading more sessions';

  @override
  String entryPage(String page) {
    return 'Entry page: $page';
  }

  @override
  String nPages(int count) {
    return '$count pages';
  }

  @override
  String get sessionReplays => 'Session Replays';

  @override
  String get failedToLoadReplays => 'Failed to load replays';

  @override
  String get noReplaysFound => 'No replays found';

  @override
  String get noReplaysHint => 'Session replays will appear here when enabled.';

  @override
  String get previousPage => 'Previous page';

  @override
  String get nextPage => 'Next page';

  @override
  String pageNumber(int number) {
    return 'Page $number';
  }

  @override
  String get unknownBrowser => 'Unknown browser';

  @override
  String get unknownCountry => 'Unknown country';

  @override
  String get sortUsers => 'Sort users';

  @override
  String get showAllUsers => 'Show all users';

  @override
  String get showIdentifiedOnly => 'Show identified only';

  @override
  String get searchUsers => 'Search users';

  @override
  String get searchUsersHint => 'Search users...';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get failedToLoadUsers => 'Failed to load users';

  @override
  String get noUsersFound => 'No users found';

  @override
  String get noIdentifiedUsers => 'No identified users';

  @override
  String get usersWillAppear => 'Users will appear once they are identified';

  @override
  String get tryDifferentSearch => 'Try a different search term';

  @override
  String get sortedBy => 'Sorted by';

  @override
  String get loadingMoreUsers => 'Loading more users';

  @override
  String get lastSeen => 'Last Seen';

  @override
  String get firstSeen => 'First Seen';

  @override
  String nUsers(String count) {
    return '$count users';
  }

  @override
  String nSessions(int count) {
    return '$count sessions';
  }

  @override
  String lastPrefix(String value) {
    return 'Last: $value';
  }

  @override
  String get failedToLoadSiteConfig => 'Failed to load site config';

  @override
  String get failedToLoadMetrics => 'Failed to load metrics';

  @override
  String get loadingMoreMetrics => 'Loading more metrics';

  @override
  String noMetricData(String metric) {
    return 'No $metric data';
  }

  @override
  String get settings => 'Settings';

  @override
  String get connection => 'Connection';

  @override
  String get notConfigured => 'Not configured';

  @override
  String get authMethod => 'Auth Method';

  @override
  String get sessionCookie => 'Session Cookie';

  @override
  String get loggedInAs => 'Logged in as';

  @override
  String get unknown => 'Unknown';

  @override
  String get appearance => 'Appearance';

  @override
  String get theme => 'Theme';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get auto => 'Auto';

  @override
  String get about => 'About';

  @override
  String get appVersion => 'App Version';

  @override
  String get openSourceAnalytics => 'Open source web analytics';

  @override
  String get logoutConfirm => 'Are you sure you want to logout?';

  @override
  String get siteSettings => 'Site Settings';

  @override
  String get siteInformation => 'Site Information';

  @override
  String get domain => 'Domain';

  @override
  String get siteId => 'Site ID';

  @override
  String get created => 'Created';

  @override
  String get trackingSettings => 'Tracking Settings';

  @override
  String get publicDashboard => 'Public Dashboard';

  @override
  String get publicDashboardDesc => 'Allow public access to analytics';

  @override
  String get sessionReplay => 'Session Replay';

  @override
  String get sessionReplayDesc => 'Record user sessions';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Track Core Web Vitals';

  @override
  String get trackErrors => 'Track Errors';

  @override
  String get trackErrorsDesc => 'Capture JavaScript errors';

  @override
  String get outboundLinksTracking => 'Outbound Links';

  @override
  String get outboundLinksDesc => 'Track outbound link clicks';

  @override
  String get excludedIps => 'Excluded IPs';

  @override
  String get excludedCountries => 'Excluded Countries';

  @override
  String get settingsSaved => 'Settings saved';

  @override
  String failedToSave(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get timeRange => 'Time Range';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get last7Days => 'Last 7 Days';

  @override
  String get last30Days => 'Last 30 Days';

  @override
  String get thisWeek => 'This Week';

  @override
  String get thisMonth => 'This Month';

  @override
  String get thisYear => 'This Year';

  @override
  String get customRange => 'Custom Range';

  @override
  String get filter => 'Filter';

  @override
  String get addFilter => 'Add Filter';

  @override
  String get parameter => 'Parameter';

  @override
  String get value => 'Value';

  @override
  String get enterFilterValue => 'Enter filter value';

  @override
  String get requestTimedOut => 'Request timed out. Please try again.';

  @override
  String get networkError => 'Network error. Check your connection.';

  @override
  String get sessionExpired => 'Session expired. Please log in again.';

  @override
  String get accessDenied => 'Access denied.';

  @override
  String get dataNotFound => 'Data not found.';

  @override
  String get serverError => 'Server error. Please try again later.';

  @override
  String get failedToLoadGeneric => 'Failed to load data. Please try again.';

  @override
  String chartDataPoints(int count) {
    return 'Chart with $count data points';
  }

  @override
  String previousPrefix(String value) {
    return 'Prev: $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'Performance rating: $rating';
  }

  @override
  String get loadingContent => 'Loading content';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get failedToLoadUserDetails => 'Failed to load user details';

  @override
  String lastSeenPrefix(String value) {
    return 'Last seen: $value';
  }

  @override
  String get traits => 'Traits';

  @override
  String get noTraits => 'No traits set for this user';

  @override
  String get sessionDetail => 'Session Detail';

  @override
  String get failedToLoadSession => 'Failed to load session';

  @override
  String get entryPageLabel => 'Entry Page';

  @override
  String get exitPage => 'Exit Page';

  @override
  String get browserAndDevice => 'Browser & Device';

  @override
  String get browser => 'Browser';

  @override
  String get os => 'OS';

  @override
  String get device => 'Device';

  @override
  String get sourceLabel => 'Source';

  @override
  String get referrer => 'Referrer';

  @override
  String eventTimelineCount(int count) {
    return 'Event Timeline ($count)';
  }

  @override
  String get noEvents => 'No events';

  @override
  String get replayEventsTitle => 'Replay Events';

  @override
  String get failedToLoadReplay => 'Failed to load replay';

  @override
  String get noReplayEvents => 'No replay events';

  @override
  String get totalEvents => 'Total Events';

  @override
  String get userActionsLabel => 'User Actions';

  @override
  String eventTimelineActions(int count) {
    return 'Event Timeline ($count actions)';
  }

  @override
  String get eventLog => 'Event Log';

  @override
  String get viewEventLog => 'View Event Log';

  @override
  String get failedToLoadEventLog => 'Failed to load event log';

  @override
  String get activityHeatmap => 'Heatmap';

  @override
  String get heatmapLast4Weeks => 'Last 4 Weeks';

  @override
  String get less => 'Less';

  @override
  String get more => 'More';

  @override
  String get peakActivity => 'Peak Activity';

  @override
  String peakHour(String day, String time) {
    return '$day at $time';
  }

  @override
  String busiestDay(String day) {
    return 'Busiest day: $day';
  }

  @override
  String get dayMon => 'Mon';

  @override
  String get dayTue => 'Tue';

  @override
  String get dayWed => 'Wed';

  @override
  String get dayThu => 'Thu';

  @override
  String get dayFri => 'Fri';

  @override
  String get daySat => 'Sat';

  @override
  String get daySun => 'Sun';

  @override
  String get searchEvents => 'Search events...';

  @override
  String get allTypes => 'All';

  @override
  String get noMatchingEvents => 'No matching events';

  @override
  String get liveView => 'Live';

  @override
  String get autoRefresh => 'Auto-refresh';

  @override
  String get usersOnlineNow => 'Users online now';

  @override
  String lastUpdatedAt(String time) {
    return 'Updated at $time';
  }

  @override
  String get last30Minutes => 'Last 30 Minutes';

  @override
  String get last5Minutes => 'Last 5 min';

  @override
  String get recentEvents => 'Recent Events';

  @override
  String get noRecentEvents => 'No recent events';

  @override
  String get retention => 'Retention';

  @override
  String get weekly => 'Weekly';

  @override
  String get daily => 'Daily';

  @override
  String get retentionRange => 'Range';

  @override
  String retentionDays(int count) {
    return '$count days';
  }

  @override
  String get failedToLoadRetention => 'Failed to load retention data';

  @override
  String get noRetentionData => 'No retention data';

  @override
  String get cohort => 'Cohort';

  @override
  String get retentionWeekPrefix => 'W';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => 'Journeys';

  @override
  String get journeySteps => 'Steps';

  @override
  String get failedToLoadJourneys => 'Failed to load journeys';

  @override
  String get noJourneysFound => 'No journeys found';

  @override
  String journeySessions(String count) {
    return '$count sessions';
  }

  @override
  String get locations => 'Locations';

  @override
  String get locationCities => 'Cities';

  @override
  String get failedToLoadLocations => 'Failed to load locations';

  @override
  String get noLocationsFound => 'No locations found';

  @override
  String get coreFeatures => 'Core';

  @override
  String get insights => 'Insights';

  @override
  String get tools => 'Tools';

  @override
  String get userTraits => 'Traits';

  @override
  String get failedToLoadUserTraits => 'Failed to load user traits';

  @override
  String get noUserTraits => 'No user traits found';

  @override
  String get noUserTraitsHint =>
      'User traits will appear when users are identified with custom properties';

  @override
  String traitUsersCount(String count) {
    return '$count users';
  }

  @override
  String get dashboard => 'Dashboard';

  @override
  String get analytics => 'Analytics';

  @override
  String get noSiteSelected => 'No site selected';

  @override
  String selectSiteFromDashboard(String tabName) {
    return 'Select a site from the Dashboard tab to view $tabName.';
  }

  @override
  String get goToDashboard => 'Go to Dashboard';

  @override
  String todayVisitors(int count) {
    return '$count today';
  }

  @override
  String get entryPages => 'Entry Pages';

  @override
  String get exitPages => 'Exit Pages';

  @override
  String get browsers => 'Browsers';

  @override
  String get operatingSystems => 'OS';

  @override
  String get utmSource => 'UTM Source';

  @override
  String get channel => 'Channel';

  @override
  String get pageTitles => 'Page Titles';

  @override
  String get sources => 'Sources';

  @override
  String get cities => 'Cities';

  @override
  String get languages => 'Languages';

  @override
  String get hostnames => 'Hostnames';

  @override
  String get vpn => 'VPN';

  @override
  String get crawlers => 'Crawlers';

  @override
  String get datacenters => 'Datacenters';

  @override
  String get companies => 'Companies';

  @override
  String get companyType => 'Company Type';

  @override
  String get companyDomain => 'Company Domain';

  @override
  String get asnOrg => 'ASN Org';

  @override
  String get asnType => 'ASN Type';

  @override
  String get asnDomain => 'ASN Domain';

  @override
  String get utmMedium => 'UTM Medium';

  @override
  String get utmCampaign => 'UTM Campaign';

  @override
  String nMoreItems(int count) {
    return '+$count more';
  }

  @override
  String sessionsWithPercentage(String count, String percentage) {
    return '$count sessions ($percentage%)';
  }

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get replayPageSnapshot => 'Page Snapshot';

  @override
  String get replayPageLoad => 'Page Load';

  @override
  String get replayCustomEvent => 'Custom Event';

  @override
  String get replayPluginEvent => 'Plugin Event';

  @override
  String get replayInteraction => 'Interaction';

  @override
  String get replayScroll => 'Scroll';

  @override
  String get replayResize => 'Resize';

  @override
  String get replayInput => 'Input';

  @override
  String get replayUpdate => 'Update';

  @override
  String get url => 'URL';

  @override
  String get searchSites => 'Search sites...';

  @override
  String get sortSites => 'Sort sites';

  @override
  String get sortAlphabetically => 'Alphabetically';

  @override
  String get sortByCount => 'Sort by count';

  @override
  String get sortByVisitors => 'By visitors today';

  @override
  String get sortByLiveUsers => 'By live users';

  @override
  String get noMatchingSites => 'No matching sites';

  @override
  String get utmTerm => 'UTM Term';

  @override
  String get utmContent => 'UTM Content';

  @override
  String get browserVersions => 'Browser Versions';

  @override
  String get osVersions => 'OS Versions';

  @override
  String get screenDimensions => 'Screen Dimensions';
}
