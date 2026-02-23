import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pl'),
    Locale('pt'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Rybbit'**
  String get appName;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unofficial'**
  String get appSubtitle;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @serverUrl.
  ///
  /// In en, this message translates to:
  /// **'Server URL'**
  String get serverUrl;

  /// No description provided for @serverUrlHint.
  ///
  /// In en, this message translates to:
  /// **'https://your-rybbit-instance.com'**
  String get serverUrlHint;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @apiKey.
  ///
  /// In en, this message translates to:
  /// **'API Key'**
  String get apiKey;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @organizations.
  ///
  /// In en, this message translates to:
  /// **'Organizations'**
  String get organizations;

  /// No description provided for @noSitesFound.
  ///
  /// In en, this message translates to:
  /// **'No sites found'**
  String get noSitesFound;

  /// No description provided for @noSitesHint.
  ///
  /// In en, this message translates to:
  /// **'Add a site in the web dashboard to get started.'**
  String get noSitesHint;

  /// No description provided for @siteCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 site} other{{count} sites}}'**
  String siteCount(int count);

  /// No description provided for @members.
  ///
  /// In en, this message translates to:
  /// **'Members ({count})'**
  String members(int count);

  /// No description provided for @failedToLoadOrganizations.
  ///
  /// In en, this message translates to:
  /// **'Failed to load organizations'**
  String get failedToLoadOrganizations;

  /// No description provided for @noOrganizations.
  ///
  /// In en, this message translates to:
  /// **'No organizations'**
  String get noOrganizations;

  /// No description provided for @noOrganizationsHint.
  ///
  /// In en, this message translates to:
  /// **'Organizations can be created in the web dashboard'**
  String get noOrganizationsHint;

  /// No description provided for @failedToLoadMembers.
  ///
  /// In en, this message translates to:
  /// **'Failed to load members'**
  String get failedToLoadMembers;

  /// No description provided for @failedToLoadSites.
  ///
  /// In en, this message translates to:
  /// **'Failed to load sites'**
  String get failedToLoadSites;

  /// No description provided for @failedToLoadAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Failed to load analytics'**
  String get failedToLoadAnalytics;

  /// No description provided for @noDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noDataAvailable;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @sessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get sessions;

  /// No description provided for @pageviews.
  ///
  /// In en, this message translates to:
  /// **'Pageviews'**
  String get pageviews;

  /// No description provided for @pagesPerSession.
  ///
  /// In en, this message translates to:
  /// **'Pages/Session'**
  String get pagesPerSession;

  /// No description provided for @bounceRate.
  ///
  /// In en, this message translates to:
  /// **'Bounce Rate'**
  String get bounceRate;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @metrics.
  ///
  /// In en, this message translates to:
  /// **'Metrics'**
  String get metrics;

  /// No description provided for @pages.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get pages;

  /// No description provided for @referrers.
  ///
  /// In en, this message translates to:
  /// **'Referrers'**
  String get referrers;

  /// No description provided for @countries.
  ///
  /// In en, this message translates to:
  /// **'Countries'**
  String get countries;

  /// No description provided for @devices.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get devices;

  /// No description provided for @performance.
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get performance;

  /// No description provided for @goals.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get goals;

  /// No description provided for @funnels.
  ///
  /// In en, this message translates to:
  /// **'Funnels'**
  String get funnels;

  /// No description provided for @replay.
  ///
  /// In en, this message translates to:
  /// **'Replay'**
  String get replay;

  /// No description provided for @config.
  ///
  /// In en, this message translates to:
  /// **'Config'**
  String get config;

  /// No description provided for @usersOnline.
  ///
  /// In en, this message translates to:
  /// **'{count} users online'**
  String usersOnline(int count);

  /// No description provided for @events.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get events;

  /// No description provided for @eventsOverTime.
  ///
  /// In en, this message translates to:
  /// **'Events Over Time'**
  String get eventsOverTime;

  /// No description provided for @eventNames.
  ///
  /// In en, this message translates to:
  /// **'Event Names'**
  String get eventNames;

  /// No description provided for @noCustomEventsTracked.
  ///
  /// In en, this message translates to:
  /// **'No custom events tracked'**
  String get noCustomEventsTracked;

  /// No description provided for @failedToLoadProperties.
  ///
  /// In en, this message translates to:
  /// **'Failed to load properties'**
  String get failedToLoadProperties;

  /// No description provided for @noProperties.
  ///
  /// In en, this message translates to:
  /// **'No properties'**
  String get noProperties;

  /// No description provided for @outboundLinks.
  ///
  /// In en, this message translates to:
  /// **'Outbound Links'**
  String get outboundLinks;

  /// No description provided for @noOutboundLinksTracked.
  ///
  /// In en, this message translates to:
  /// **'No outbound links tracked'**
  String get noOutboundLinksTracked;

  /// No description provided for @failedToLoadChart.
  ///
  /// In en, this message translates to:
  /// **'Failed to load chart'**
  String get failedToLoadChart;

  /// No description provided for @errors.
  ///
  /// In en, this message translates to:
  /// **'Errors'**
  String get errors;

  /// No description provided for @failedToLoadErrors.
  ///
  /// In en, this message translates to:
  /// **'Failed to load errors'**
  String get failedToLoadErrors;

  /// No description provided for @noErrorsFound.
  ///
  /// In en, this message translates to:
  /// **'No errors found'**
  String get noErrorsFound;

  /// No description provided for @everythingLooksGood.
  ///
  /// In en, this message translates to:
  /// **'Everything looks good!'**
  String get everythingLooksGood;

  /// No description provided for @occurrences.
  ///
  /// In en, this message translates to:
  /// **'occurrences'**
  String get occurrences;

  /// No description provided for @sessionsAffected.
  ///
  /// In en, this message translates to:
  /// **'sessions affected'**
  String get sessionsAffected;

  /// No description provided for @failedToLoadEventsWithError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load events: {error}'**
  String failedToLoadEventsWithError(String error);

  /// No description provided for @noEventsFound.
  ///
  /// In en, this message translates to:
  /// **'No events found'**
  String get noEventsFound;

  /// No description provided for @failedToLoadFunnels.
  ///
  /// In en, this message translates to:
  /// **'Failed to load funnels'**
  String get failedToLoadFunnels;

  /// No description provided for @noFunnelsSaved.
  ///
  /// In en, this message translates to:
  /// **'No funnels saved'**
  String get noFunnelsSaved;

  /// No description provided for @createFunnelsHint.
  ///
  /// In en, this message translates to:
  /// **'Create funnels in the web dashboard'**
  String get createFunnelsHint;

  /// No description provided for @deleteFunnel.
  ///
  /// In en, this message translates to:
  /// **'Delete Funnel'**
  String get deleteFunnel;

  /// No description provided for @deleteFunnelConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"?'**
  String deleteFunnelConfirm(String name);

  /// No description provided for @failedToDeleteFunnel.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete funnel: {error}'**
  String failedToDeleteFunnel(String error);

  /// No description provided for @noStepsDefined.
  ///
  /// In en, this message translates to:
  /// **'No steps defined for this funnel'**
  String get noStepsDefined;

  /// No description provided for @failedToAnalyze.
  ///
  /// In en, this message translates to:
  /// **'Failed to analyze: {error}'**
  String failedToAnalyze(String error);

  /// No description provided for @overallConversion.
  ///
  /// In en, this message translates to:
  /// **'Overall Conversion'**
  String get overallConversion;

  /// No description provided for @dropoff.
  ///
  /// In en, this message translates to:
  /// **'Dropoff: {value}'**
  String dropoff(String value);

  /// No description provided for @createGoal.
  ///
  /// In en, this message translates to:
  /// **'Create goal'**
  String get createGoal;

  /// No description provided for @failedToLoadGoals.
  ///
  /// In en, this message translates to:
  /// **'Failed to load goals'**
  String get failedToLoadGoals;

  /// No description provided for @noGoalsConfigured.
  ///
  /// In en, this message translates to:
  /// **'No goals configured'**
  String get noGoalsConfigured;

  /// No description provided for @noGoalsHint.
  ///
  /// In en, this message translates to:
  /// **'Tap + to create a new goal'**
  String get noGoalsHint;

  /// No description provided for @conversions.
  ///
  /// In en, this message translates to:
  /// **'Conversions'**
  String get conversions;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @editGoal.
  ///
  /// In en, this message translates to:
  /// **'Edit Goal'**
  String get editGoal;

  /// No description provided for @createGoalTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Goal'**
  String get createGoalTitle;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @path.
  ///
  /// In en, this message translates to:
  /// **'Path'**
  String get path;

  /// No description provided for @event.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get event;

  /// No description provided for @pathPattern.
  ///
  /// In en, this message translates to:
  /// **'Path Pattern'**
  String get pathPattern;

  /// No description provided for @eventName.
  ///
  /// In en, this message translates to:
  /// **'Event Name'**
  String get eventName;

  /// No description provided for @deleteGoal.
  ///
  /// In en, this message translates to:
  /// **'Delete Goal'**
  String get deleteGoal;

  /// No description provided for @deleteGoalConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"?'**
  String deleteGoalConfirm(String name);

  /// No description provided for @failedToDeleteGoal.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete goal: {error}'**
  String failedToDeleteGoal(String error);

  /// No description provided for @failedToLoadPerformanceData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load performance data'**
  String get failedToLoadPerformanceData;

  /// No description provided for @metricOverTime.
  ///
  /// In en, this message translates to:
  /// **'{metric} Over Time'**
  String metricOverTime(String metric);

  /// No description provided for @byDimension.
  ///
  /// In en, this message translates to:
  /// **'By Dimension'**
  String get byDimension;

  /// No description provided for @failedToLoadDimensionData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load dimension data'**
  String get failedToLoadDimensionData;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get good;

  /// No description provided for @needsImprovement.
  ///
  /// In en, this message translates to:
  /// **'Needs Improvement'**
  String get needsImprovement;

  /// No description provided for @poor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get poor;

  /// No description provided for @largestContentfulPaint.
  ///
  /// In en, this message translates to:
  /// **'Largest Contentful Paint'**
  String get largestContentfulPaint;

  /// No description provided for @cumulativeLayoutShift.
  ///
  /// In en, this message translates to:
  /// **'Cumulative Layout Shift'**
  String get cumulativeLayoutShift;

  /// No description provided for @firstContentfulPaint.
  ///
  /// In en, this message translates to:
  /// **'First Contentful Paint'**
  String get firstContentfulPaint;

  /// No description provided for @timeToFirstByte.
  ///
  /// In en, this message translates to:
  /// **'Time to First Byte'**
  String get timeToFirstByte;

  /// No description provided for @interactionToNextPaint.
  ///
  /// In en, this message translates to:
  /// **'Interaction to Next Paint'**
  String get interactionToNextPaint;

  /// No description provided for @dimPages.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get dimPages;

  /// No description provided for @dimCountries.
  ///
  /// In en, this message translates to:
  /// **'Countries'**
  String get dimCountries;

  /// No description provided for @dimDevices.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get dimDevices;

  /// No description provided for @dimBrowsers.
  ///
  /// In en, this message translates to:
  /// **'Browsers'**
  String get dimBrowsers;

  /// No description provided for @dimOS.
  ///
  /// In en, this message translates to:
  /// **'OS'**
  String get dimOS;

  /// No description provided for @sessionFilters.
  ///
  /// In en, this message translates to:
  /// **'Session Filters'**
  String get sessionFilters;

  /// No description provided for @minPageviews.
  ///
  /// In en, this message translates to:
  /// **'Min Pageviews'**
  String get minPageviews;

  /// No description provided for @minEvents.
  ///
  /// In en, this message translates to:
  /// **'Min Events'**
  String get minEvents;

  /// No description provided for @minDurationSeconds.
  ///
  /// In en, this message translates to:
  /// **'Min Duration (seconds)'**
  String get minDurationSeconds;

  /// No description provided for @failedToLoadSessions.
  ///
  /// In en, this message translates to:
  /// **'Failed to load sessions'**
  String get failedToLoadSessions;

  /// No description provided for @noSessionsFound.
  ///
  /// In en, this message translates to:
  /// **'No sessions found'**
  String get noSessionsFound;

  /// No description provided for @filterSessions.
  ///
  /// In en, this message translates to:
  /// **'Filter sessions'**
  String get filterSessions;

  /// No description provided for @loadingMoreSessions.
  ///
  /// In en, this message translates to:
  /// **'Loading more sessions'**
  String get loadingMoreSessions;

  /// No description provided for @entryPage.
  ///
  /// In en, this message translates to:
  /// **'Entry page: {page}'**
  String entryPage(String page);

  /// No description provided for @nPages.
  ///
  /// In en, this message translates to:
  /// **'{count} pages'**
  String nPages(int count);

  /// No description provided for @sessionReplays.
  ///
  /// In en, this message translates to:
  /// **'Session Replays'**
  String get sessionReplays;

  /// No description provided for @failedToLoadReplays.
  ///
  /// In en, this message translates to:
  /// **'Failed to load replays'**
  String get failedToLoadReplays;

  /// No description provided for @noReplaysFound.
  ///
  /// In en, this message translates to:
  /// **'No replays found'**
  String get noReplaysFound;

  /// No description provided for @noReplaysHint.
  ///
  /// In en, this message translates to:
  /// **'Session replays will appear here when enabled.'**
  String get noReplaysHint;

  /// No description provided for @previousPage.
  ///
  /// In en, this message translates to:
  /// **'Previous page'**
  String get previousPage;

  /// No description provided for @nextPage.
  ///
  /// In en, this message translates to:
  /// **'Next page'**
  String get nextPage;

  /// No description provided for @pageNumber.
  ///
  /// In en, this message translates to:
  /// **'Page {number}'**
  String pageNumber(int number);

  /// No description provided for @unknownBrowser.
  ///
  /// In en, this message translates to:
  /// **'Unknown browser'**
  String get unknownBrowser;

  /// No description provided for @unknownCountry.
  ///
  /// In en, this message translates to:
  /// **'Unknown country'**
  String get unknownCountry;

  /// No description provided for @sortUsers.
  ///
  /// In en, this message translates to:
  /// **'Sort users'**
  String get sortUsers;

  /// No description provided for @showAllUsers.
  ///
  /// In en, this message translates to:
  /// **'Show all users'**
  String get showAllUsers;

  /// No description provided for @showIdentifiedOnly.
  ///
  /// In en, this message translates to:
  /// **'Show identified only'**
  String get showIdentifiedOnly;

  /// No description provided for @searchUsers.
  ///
  /// In en, this message translates to:
  /// **'Search users'**
  String get searchUsers;

  /// No description provided for @searchUsersHint.
  ///
  /// In en, this message translates to:
  /// **'Search users...'**
  String get searchUsersHint;

  /// No description provided for @clearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get clearSearch;

  /// No description provided for @failedToLoadUsers.
  ///
  /// In en, this message translates to:
  /// **'Failed to load users'**
  String get failedToLoadUsers;

  /// No description provided for @noUsersFound.
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get noUsersFound;

  /// No description provided for @noIdentifiedUsers.
  ///
  /// In en, this message translates to:
  /// **'No identified users'**
  String get noIdentifiedUsers;

  /// No description provided for @usersWillAppear.
  ///
  /// In en, this message translates to:
  /// **'Users will appear once they are identified'**
  String get usersWillAppear;

  /// No description provided for @tryDifferentSearch.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term'**
  String get tryDifferentSearch;

  /// No description provided for @sortedBy.
  ///
  /// In en, this message translates to:
  /// **'Sorted by'**
  String get sortedBy;

  /// No description provided for @loadingMoreUsers.
  ///
  /// In en, this message translates to:
  /// **'Loading more users'**
  String get loadingMoreUsers;

  /// No description provided for @lastSeen.
  ///
  /// In en, this message translates to:
  /// **'Last Seen'**
  String get lastSeen;

  /// No description provided for @firstSeen.
  ///
  /// In en, this message translates to:
  /// **'First Seen'**
  String get firstSeen;

  /// No description provided for @nUsers.
  ///
  /// In en, this message translates to:
  /// **'{count} users'**
  String nUsers(String count);

  /// No description provided for @nSessions.
  ///
  /// In en, this message translates to:
  /// **'{count} sessions'**
  String nSessions(int count);

  /// No description provided for @lastPrefix.
  ///
  /// In en, this message translates to:
  /// **'Last: {value}'**
  String lastPrefix(String value);

  /// No description provided for @failedToLoadSiteConfig.
  ///
  /// In en, this message translates to:
  /// **'Failed to load site config'**
  String get failedToLoadSiteConfig;

  /// No description provided for @failedToLoadMetrics.
  ///
  /// In en, this message translates to:
  /// **'Failed to load metrics'**
  String get failedToLoadMetrics;

  /// No description provided for @loadingMoreMetrics.
  ///
  /// In en, this message translates to:
  /// **'Loading more metrics'**
  String get loadingMoreMetrics;

  /// No description provided for @noMetricData.
  ///
  /// In en, this message translates to:
  /// **'No {metric} data'**
  String noMetricData(String metric);

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @connection.
  ///
  /// In en, this message translates to:
  /// **'Connection'**
  String get connection;

  /// No description provided for @notConfigured.
  ///
  /// In en, this message translates to:
  /// **'Not configured'**
  String get notConfigured;

  /// No description provided for @authMethod.
  ///
  /// In en, this message translates to:
  /// **'Auth Method'**
  String get authMethod;

  /// No description provided for @sessionCookie.
  ///
  /// In en, this message translates to:
  /// **'Session Cookie'**
  String get sessionCookie;

  /// No description provided for @loggedInAs.
  ///
  /// In en, this message translates to:
  /// **'Logged in as'**
  String get loggedInAs;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @auto.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get appVersion;

  /// No description provided for @openSourceAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Open source web analytics'**
  String get openSourceAnalytics;

  /// No description provided for @logoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirm;

  /// No description provided for @siteSettings.
  ///
  /// In en, this message translates to:
  /// **'Site Settings'**
  String get siteSettings;

  /// No description provided for @siteInformation.
  ///
  /// In en, this message translates to:
  /// **'Site Information'**
  String get siteInformation;

  /// No description provided for @domain.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get domain;

  /// No description provided for @siteId.
  ///
  /// In en, this message translates to:
  /// **'Site ID'**
  String get siteId;

  /// No description provided for @created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get created;

  /// No description provided for @trackingSettings.
  ///
  /// In en, this message translates to:
  /// **'Tracking Settings'**
  String get trackingSettings;

  /// No description provided for @publicDashboard.
  ///
  /// In en, this message translates to:
  /// **'Public Dashboard'**
  String get publicDashboard;

  /// No description provided for @publicDashboardDesc.
  ///
  /// In en, this message translates to:
  /// **'Allow public access to analytics'**
  String get publicDashboardDesc;

  /// No description provided for @sessionReplay.
  ///
  /// In en, this message translates to:
  /// **'Session Replay'**
  String get sessionReplay;

  /// No description provided for @sessionReplayDesc.
  ///
  /// In en, this message translates to:
  /// **'Record user sessions'**
  String get sessionReplayDesc;

  /// No description provided for @webVitals.
  ///
  /// In en, this message translates to:
  /// **'Web Vitals'**
  String get webVitals;

  /// No description provided for @webVitalsDesc.
  ///
  /// In en, this message translates to:
  /// **'Track Core Web Vitals'**
  String get webVitalsDesc;

  /// No description provided for @trackErrors.
  ///
  /// In en, this message translates to:
  /// **'Track Errors'**
  String get trackErrors;

  /// No description provided for @trackErrorsDesc.
  ///
  /// In en, this message translates to:
  /// **'Capture JavaScript errors'**
  String get trackErrorsDesc;

  /// No description provided for @outboundLinksTracking.
  ///
  /// In en, this message translates to:
  /// **'Outbound Links'**
  String get outboundLinksTracking;

  /// No description provided for @outboundLinksDesc.
  ///
  /// In en, this message translates to:
  /// **'Track outbound link clicks'**
  String get outboundLinksDesc;

  /// No description provided for @excludedIps.
  ///
  /// In en, this message translates to:
  /// **'Excluded IPs'**
  String get excludedIps;

  /// No description provided for @excludedCountries.
  ///
  /// In en, this message translates to:
  /// **'Excluded Countries'**
  String get excludedCountries;

  /// No description provided for @settingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Settings saved'**
  String get settingsSaved;

  /// No description provided for @failedToSave.
  ///
  /// In en, this message translates to:
  /// **'Failed to save: {error}'**
  String failedToSave(String error);

  /// No description provided for @timeRange.
  ///
  /// In en, this message translates to:
  /// **'Time Range'**
  String get timeRange;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @last7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 Days'**
  String get last7Days;

  /// No description provided for @last30Days.
  ///
  /// In en, this message translates to:
  /// **'Last 30 Days'**
  String get last30Days;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// No description provided for @thisYear.
  ///
  /// In en, this message translates to:
  /// **'This Year'**
  String get thisYear;

  /// No description provided for @customRange.
  ///
  /// In en, this message translates to:
  /// **'Custom Range'**
  String get customRange;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @addFilter.
  ///
  /// In en, this message translates to:
  /// **'Add Filter'**
  String get addFilter;

  /// No description provided for @parameter.
  ///
  /// In en, this message translates to:
  /// **'Parameter'**
  String get parameter;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @enterFilterValue.
  ///
  /// In en, this message translates to:
  /// **'Enter filter value'**
  String get enterFilterValue;

  /// No description provided for @requestTimedOut.
  ///
  /// In en, this message translates to:
  /// **'Request timed out. Please try again.'**
  String get requestTimedOut;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error. Check your connection.'**
  String get networkError;

  /// No description provided for @sessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Session expired. Please log in again.'**
  String get sessionExpired;

  /// No description provided for @accessDenied.
  ///
  /// In en, this message translates to:
  /// **'Access denied.'**
  String get accessDenied;

  /// No description provided for @dataNotFound.
  ///
  /// In en, this message translates to:
  /// **'Data not found.'**
  String get dataNotFound;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get serverError;

  /// No description provided for @failedToLoadGeneric.
  ///
  /// In en, this message translates to:
  /// **'Failed to load data. Please try again.'**
  String get failedToLoadGeneric;

  /// No description provided for @chartDataPoints.
  ///
  /// In en, this message translates to:
  /// **'Chart with {count} data points'**
  String chartDataPoints(int count);

  /// No description provided for @previousPrefix.
  ///
  /// In en, this message translates to:
  /// **'Prev: {value}'**
  String previousPrefix(String value);

  /// No description provided for @performanceRatingLabel.
  ///
  /// In en, this message translates to:
  /// **'Performance rating: {rating}'**
  String performanceRatingLabel(String rating);

  /// No description provided for @loadingContent.
  ///
  /// In en, this message translates to:
  /// **'Loading content'**
  String get loadingContent;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @failedToLoadUserDetails.
  ///
  /// In en, this message translates to:
  /// **'Failed to load user details'**
  String get failedToLoadUserDetails;

  /// No description provided for @lastSeenPrefix.
  ///
  /// In en, this message translates to:
  /// **'Last seen: {value}'**
  String lastSeenPrefix(String value);

  /// No description provided for @traits.
  ///
  /// In en, this message translates to:
  /// **'Traits'**
  String get traits;

  /// No description provided for @noTraits.
  ///
  /// In en, this message translates to:
  /// **'No traits set for this user'**
  String get noTraits;

  /// No description provided for @sessionDetail.
  ///
  /// In en, this message translates to:
  /// **'Session Detail'**
  String get sessionDetail;

  /// No description provided for @failedToLoadSession.
  ///
  /// In en, this message translates to:
  /// **'Failed to load session'**
  String get failedToLoadSession;

  /// No description provided for @entryPageLabel.
  ///
  /// In en, this message translates to:
  /// **'Entry Page'**
  String get entryPageLabel;

  /// No description provided for @exitPage.
  ///
  /// In en, this message translates to:
  /// **'Exit Page'**
  String get exitPage;

  /// No description provided for @browserAndDevice.
  ///
  /// In en, this message translates to:
  /// **'Browser & Device'**
  String get browserAndDevice;

  /// No description provided for @browser.
  ///
  /// In en, this message translates to:
  /// **'Browser'**
  String get browser;

  /// No description provided for @os.
  ///
  /// In en, this message translates to:
  /// **'OS'**
  String get os;

  /// No description provided for @device.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get device;

  /// No description provided for @sourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get sourceLabel;

  /// No description provided for @referrer.
  ///
  /// In en, this message translates to:
  /// **'Referrer'**
  String get referrer;

  /// No description provided for @eventTimelineCount.
  ///
  /// In en, this message translates to:
  /// **'Event Timeline ({count})'**
  String eventTimelineCount(int count);

  /// No description provided for @noEvents.
  ///
  /// In en, this message translates to:
  /// **'No events'**
  String get noEvents;

  /// No description provided for @replayEventsTitle.
  ///
  /// In en, this message translates to:
  /// **'Replay Events'**
  String get replayEventsTitle;

  /// No description provided for @failedToLoadReplay.
  ///
  /// In en, this message translates to:
  /// **'Failed to load replay'**
  String get failedToLoadReplay;

  /// No description provided for @noReplayEvents.
  ///
  /// In en, this message translates to:
  /// **'No replay events'**
  String get noReplayEvents;

  /// No description provided for @totalEvents.
  ///
  /// In en, this message translates to:
  /// **'Total Events'**
  String get totalEvents;

  /// No description provided for @userActionsLabel.
  ///
  /// In en, this message translates to:
  /// **'User Actions'**
  String get userActionsLabel;

  /// No description provided for @eventTimelineActions.
  ///
  /// In en, this message translates to:
  /// **'Event Timeline ({count} actions)'**
  String eventTimelineActions(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'cs',
    'de',
    'en',
    'es',
    'fr',
    'it',
    'ja',
    'ko',
    'pl',
    'pt',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
