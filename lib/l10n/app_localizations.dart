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

  /// No description provided for @showPassword.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get hidePassword;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @invalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid URL (https://...)'**
  String get invalidUrl;

  /// No description provided for @connectionFailed.
  ///
  /// In en, this message translates to:
  /// **'Connection failed. Check server URL.'**
  String get connectionFailed;

  /// No description provided for @invalidApiKey.
  ///
  /// In en, this message translates to:
  /// **'Invalid API key'**
  String get invalidApiKey;

  /// No description provided for @connectionFailedApiKey.
  ///
  /// In en, this message translates to:
  /// **'Connection failed. Check server URL and API key.'**
  String get connectionFailedApiKey;

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

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source Code'**
  String get sourceCode;

  /// No description provided for @originalProject.
  ///
  /// In en, this message translates to:
  /// **'Original Project'**
  String get originalProject;

  /// No description provided for @viewOnGitHub.
  ///
  /// In en, this message translates to:
  /// **'View on GitHub'**
  String get viewOnGitHub;

  /// No description provided for @unofficialClient.
  ///
  /// In en, this message translates to:
  /// **'Unofficial mobile client for Rybbit analytics platform'**
  String get unofficialClient;

  /// No description provided for @madeBy.
  ///
  /// In en, this message translates to:
  /// **'Made by NKS Hub'**
  String get madeBy;

  /// No description provided for @mobileAppDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Mobile Application Developer'**
  String get mobileAppDeveloper;

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

  /// No description provided for @siteLabel.
  ///
  /// In en, this message translates to:
  /// **'Site {id}'**
  String siteLabel(String id);

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

  /// No description provided for @allTime.
  ///
  /// In en, this message translates to:
  /// **'All Time'**
  String get allTime;

  /// No description provided for @lastMinutes.
  ///
  /// In en, this message translates to:
  /// **'Last {count} min'**
  String lastMinutes(int count);

  /// No description provided for @notSet.
  ///
  /// In en, this message translates to:
  /// **'(not set)'**
  String get notSet;

  /// No description provided for @bouncePrefix.
  ///
  /// In en, this message translates to:
  /// **'Bounce'**
  String get bouncePrefix;

  /// No description provided for @timePrefix.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get timePrefix;

  /// No description provided for @eventTypePageview.
  ///
  /// In en, this message translates to:
  /// **'Pageview'**
  String get eventTypePageview;

  /// No description provided for @eventTypeCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get eventTypeCustom;

  /// No description provided for @eventTypeOutbound.
  ///
  /// In en, this message translates to:
  /// **'Outbound'**
  String get eventTypeOutbound;

  /// No description provided for @eventTypeClick.
  ///
  /// In en, this message translates to:
  /// **'Click'**
  String get eventTypeClick;

  /// No description provided for @eventTypeForm.
  ///
  /// In en, this message translates to:
  /// **'Form'**
  String get eventTypeForm;

  /// No description provided for @eventTypeInput.
  ///
  /// In en, this message translates to:
  /// **'Input'**
  String get eventTypeInput;

  /// No description provided for @eventTypeCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get eventTypeCopy;

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

  /// No description provided for @filterBrowser.
  ///
  /// In en, this message translates to:
  /// **'Browser'**
  String get filterBrowser;

  /// No description provided for @filterOs.
  ///
  /// In en, this message translates to:
  /// **'Operating System'**
  String get filterOs;

  /// No description provided for @filterLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get filterLanguage;

  /// No description provided for @filterCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get filterCountry;

  /// No description provided for @filterRegion.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get filterRegion;

  /// No description provided for @filterCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get filterCity;

  /// No description provided for @filterDeviceType.
  ///
  /// In en, this message translates to:
  /// **'Device Type'**
  String get filterDeviceType;

  /// No description provided for @filterReferrer.
  ///
  /// In en, this message translates to:
  /// **'Referrer'**
  String get filterReferrer;

  /// No description provided for @filterHostname.
  ///
  /// In en, this message translates to:
  /// **'Hostname'**
  String get filterHostname;

  /// No description provided for @filterPathname.
  ///
  /// In en, this message translates to:
  /// **'Pathname'**
  String get filterPathname;

  /// No description provided for @filterPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Page Title'**
  String get filterPageTitle;

  /// No description provided for @filterQuerystring.
  ///
  /// In en, this message translates to:
  /// **'Querystring'**
  String get filterQuerystring;

  /// No description provided for @filterEventName.
  ///
  /// In en, this message translates to:
  /// **'Event Name'**
  String get filterEventName;

  /// No description provided for @filterChannel.
  ///
  /// In en, this message translates to:
  /// **'Channel'**
  String get filterChannel;

  /// No description provided for @filterUtmSource.
  ///
  /// In en, this message translates to:
  /// **'UTM Source'**
  String get filterUtmSource;

  /// No description provided for @filterUtmMedium.
  ///
  /// In en, this message translates to:
  /// **'UTM Medium'**
  String get filterUtmMedium;

  /// No description provided for @filterUtmCampaign.
  ///
  /// In en, this message translates to:
  /// **'UTM Campaign'**
  String get filterUtmCampaign;

  /// No description provided for @filterUtmTerm.
  ///
  /// In en, this message translates to:
  /// **'UTM Term'**
  String get filterUtmTerm;

  /// No description provided for @filterUtmContent.
  ///
  /// In en, this message translates to:
  /// **'UTM Content'**
  String get filterUtmContent;

  /// No description provided for @filterEntryPage.
  ///
  /// In en, this message translates to:
  /// **'Entry Page'**
  String get filterEntryPage;

  /// No description provided for @filterExitPage.
  ///
  /// In en, this message translates to:
  /// **'Exit Page'**
  String get filterExitPage;

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

  /// No description provided for @eventLog.
  ///
  /// In en, this message translates to:
  /// **'Event Log'**
  String get eventLog;

  /// No description provided for @viewEventLog.
  ///
  /// In en, this message translates to:
  /// **'View Event Log'**
  String get viewEventLog;

  /// No description provided for @failedToLoadEventLog.
  ///
  /// In en, this message translates to:
  /// **'Failed to load event log'**
  String get failedToLoadEventLog;

  /// No description provided for @activityHeatmap.
  ///
  /// In en, this message translates to:
  /// **'Heatmap'**
  String get activityHeatmap;

  /// No description provided for @heatmapLast4Weeks.
  ///
  /// In en, this message translates to:
  /// **'Last 4 Weeks'**
  String get heatmapLast4Weeks;

  /// No description provided for @less.
  ///
  /// In en, this message translates to:
  /// **'Less'**
  String get less;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @peakActivity.
  ///
  /// In en, this message translates to:
  /// **'Peak Activity'**
  String get peakActivity;

  /// No description provided for @peakHour.
  ///
  /// In en, this message translates to:
  /// **'{day} at {time}'**
  String peakHour(String day, String time);

  /// No description provided for @busiestDay.
  ///
  /// In en, this message translates to:
  /// **'Busiest day: {day}'**
  String busiestDay(String day);

  /// No description provided for @dayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get dayMon;

  /// No description provided for @dayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get dayTue;

  /// No description provided for @dayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get dayWed;

  /// No description provided for @dayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get dayThu;

  /// No description provided for @dayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get dayFri;

  /// No description provided for @daySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get daySat;

  /// No description provided for @daySun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get daySun;

  /// No description provided for @searchEvents.
  ///
  /// In en, this message translates to:
  /// **'Search events...'**
  String get searchEvents;

  /// No description provided for @allTypes.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allTypes;

  /// No description provided for @allOrganizations.
  ///
  /// In en, this message translates to:
  /// **'All organizations'**
  String get allOrganizations;

  /// No description provided for @noMatchingEvents.
  ///
  /// In en, this message translates to:
  /// **'No matching events'**
  String get noMatchingEvents;

  /// No description provided for @liveView.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get liveView;

  /// No description provided for @autoRefresh.
  ///
  /// In en, this message translates to:
  /// **'Auto-refresh'**
  String get autoRefresh;

  /// No description provided for @usersOnlineNow.
  ///
  /// In en, this message translates to:
  /// **'Users online now'**
  String get usersOnlineNow;

  /// No description provided for @lastUpdatedAt.
  ///
  /// In en, this message translates to:
  /// **'Updated at {time}'**
  String lastUpdatedAt(String time);

  /// No description provided for @last30Minutes.
  ///
  /// In en, this message translates to:
  /// **'Last 30 Minutes'**
  String get last30Minutes;

  /// No description provided for @last5Minutes.
  ///
  /// In en, this message translates to:
  /// **'Last 5 min'**
  String get last5Minutes;

  /// No description provided for @recentEvents.
  ///
  /// In en, this message translates to:
  /// **'Recent Events'**
  String get recentEvents;

  /// No description provided for @noRecentEvents.
  ///
  /// In en, this message translates to:
  /// **'No recent events'**
  String get noRecentEvents;

  /// No description provided for @retention.
  ///
  /// In en, this message translates to:
  /// **'Retention'**
  String get retention;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @retentionRange.
  ///
  /// In en, this message translates to:
  /// **'Range'**
  String get retentionRange;

  /// No description provided for @retentionDays.
  ///
  /// In en, this message translates to:
  /// **'{count} days'**
  String retentionDays(int count);

  /// No description provided for @failedToLoadRetention.
  ///
  /// In en, this message translates to:
  /// **'Failed to load retention data'**
  String get failedToLoadRetention;

  /// No description provided for @noRetentionData.
  ///
  /// In en, this message translates to:
  /// **'No retention data'**
  String get noRetentionData;

  /// No description provided for @cohort.
  ///
  /// In en, this message translates to:
  /// **'Cohort'**
  String get cohort;

  /// No description provided for @retentionWeekPrefix.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get retentionWeekPrefix;

  /// No description provided for @retentionDayPrefix.
  ///
  /// In en, this message translates to:
  /// **'D'**
  String get retentionDayPrefix;

  /// No description provided for @journeys.
  ///
  /// In en, this message translates to:
  /// **'Journeys'**
  String get journeys;

  /// No description provided for @journeySteps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get journeySteps;

  /// No description provided for @failedToLoadJourneys.
  ///
  /// In en, this message translates to:
  /// **'Failed to load journeys'**
  String get failedToLoadJourneys;

  /// No description provided for @noJourneysFound.
  ///
  /// In en, this message translates to:
  /// **'No journeys found'**
  String get noJourneysFound;

  /// No description provided for @journeySessions.
  ///
  /// In en, this message translates to:
  /// **'{count} sessions'**
  String journeySessions(String count);

  /// No description provided for @locations.
  ///
  /// In en, this message translates to:
  /// **'Locations'**
  String get locations;

  /// No description provided for @locationCities.
  ///
  /// In en, this message translates to:
  /// **'Cities'**
  String get locationCities;

  /// No description provided for @failedToLoadLocations.
  ///
  /// In en, this message translates to:
  /// **'Failed to load locations'**
  String get failedToLoadLocations;

  /// No description provided for @noLocationsFound.
  ///
  /// In en, this message translates to:
  /// **'No locations found'**
  String get noLocationsFound;

  /// No description provided for @coreFeatures.
  ///
  /// In en, this message translates to:
  /// **'Core'**
  String get coreFeatures;

  /// No description provided for @insights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get insights;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get tools;

  /// No description provided for @userTraits.
  ///
  /// In en, this message translates to:
  /// **'Traits'**
  String get userTraits;

  /// No description provided for @failedToLoadUserTraits.
  ///
  /// In en, this message translates to:
  /// **'Failed to load user traits'**
  String get failedToLoadUserTraits;

  /// No description provided for @noUserTraits.
  ///
  /// In en, this message translates to:
  /// **'No user traits found'**
  String get noUserTraits;

  /// No description provided for @noUserTraitsHint.
  ///
  /// In en, this message translates to:
  /// **'User traits will appear when users are identified with custom properties'**
  String get noUserTraitsHint;

  /// No description provided for @traitUsersCount.
  ///
  /// In en, this message translates to:
  /// **'{count} users'**
  String traitUsersCount(String count);

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analytics;

  /// No description provided for @noSiteSelected.
  ///
  /// In en, this message translates to:
  /// **'No site selected'**
  String get noSiteSelected;

  /// No description provided for @selectSiteFromDashboard.
  ///
  /// In en, this message translates to:
  /// **'Select a site from the Dashboard tab to view {tabName}.'**
  String selectSiteFromDashboard(String tabName);

  /// No description provided for @goToDashboard.
  ///
  /// In en, this message translates to:
  /// **'Go to Dashboard'**
  String get goToDashboard;

  /// No description provided for @todayVisitors.
  ///
  /// In en, this message translates to:
  /// **'{count} today'**
  String todayVisitors(int count);

  /// No description provided for @entryPages.
  ///
  /// In en, this message translates to:
  /// **'Entry Pages'**
  String get entryPages;

  /// No description provided for @exitPages.
  ///
  /// In en, this message translates to:
  /// **'Exit Pages'**
  String get exitPages;

  /// No description provided for @browsers.
  ///
  /// In en, this message translates to:
  /// **'Browsers'**
  String get browsers;

  /// No description provided for @operatingSystems.
  ///
  /// In en, this message translates to:
  /// **'OS'**
  String get operatingSystems;

  /// No description provided for @utmSource.
  ///
  /// In en, this message translates to:
  /// **'UTM Source'**
  String get utmSource;

  /// No description provided for @channel.
  ///
  /// In en, this message translates to:
  /// **'Channel'**
  String get channel;

  /// No description provided for @pageTitles.
  ///
  /// In en, this message translates to:
  /// **'Page Titles'**
  String get pageTitles;

  /// No description provided for @sources.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get sources;

  /// No description provided for @cities.
  ///
  /// In en, this message translates to:
  /// **'Cities'**
  String get cities;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @hostnames.
  ///
  /// In en, this message translates to:
  /// **'Hostnames'**
  String get hostnames;

  /// No description provided for @vpn.
  ///
  /// In en, this message translates to:
  /// **'VPN'**
  String get vpn;

  /// No description provided for @crawlers.
  ///
  /// In en, this message translates to:
  /// **'Crawlers'**
  String get crawlers;

  /// No description provided for @datacenters.
  ///
  /// In en, this message translates to:
  /// **'Datacenters'**
  String get datacenters;

  /// No description provided for @companies.
  ///
  /// In en, this message translates to:
  /// **'Companies'**
  String get companies;

  /// No description provided for @companyType.
  ///
  /// In en, this message translates to:
  /// **'Company Type'**
  String get companyType;

  /// No description provided for @companyDomain.
  ///
  /// In en, this message translates to:
  /// **'Company Domain'**
  String get companyDomain;

  /// No description provided for @asnOrg.
  ///
  /// In en, this message translates to:
  /// **'ASN Org'**
  String get asnOrg;

  /// No description provided for @asnType.
  ///
  /// In en, this message translates to:
  /// **'ASN Type'**
  String get asnType;

  /// No description provided for @asnDomain.
  ///
  /// In en, this message translates to:
  /// **'ASN Domain'**
  String get asnDomain;

  /// No description provided for @utmMedium.
  ///
  /// In en, this message translates to:
  /// **'UTM Medium'**
  String get utmMedium;

  /// No description provided for @utmCampaign.
  ///
  /// In en, this message translates to:
  /// **'UTM Campaign'**
  String get utmCampaign;

  /// No description provided for @nMoreItems.
  ///
  /// In en, this message translates to:
  /// **'+{count} more'**
  String nMoreItems(int count);

  /// No description provided for @sessionsWithPercentage.
  ///
  /// In en, this message translates to:
  /// **'{count} sessions ({percentage}%)'**
  String sessionsWithPercentage(String count, String percentage);

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorGeneric(String error);

  /// No description provided for @replayPageSnapshot.
  ///
  /// In en, this message translates to:
  /// **'Page Snapshot'**
  String get replayPageSnapshot;

  /// No description provided for @replayPageLoad.
  ///
  /// In en, this message translates to:
  /// **'Page Load'**
  String get replayPageLoad;

  /// No description provided for @replayCustomEvent.
  ///
  /// In en, this message translates to:
  /// **'Custom Event'**
  String get replayCustomEvent;

  /// No description provided for @replayPluginEvent.
  ///
  /// In en, this message translates to:
  /// **'Plugin Event'**
  String get replayPluginEvent;

  /// No description provided for @replayInteraction.
  ///
  /// In en, this message translates to:
  /// **'Interaction'**
  String get replayInteraction;

  /// No description provided for @replayScroll.
  ///
  /// In en, this message translates to:
  /// **'Scroll'**
  String get replayScroll;

  /// No description provided for @replayResize.
  ///
  /// In en, this message translates to:
  /// **'Resize'**
  String get replayResize;

  /// No description provided for @replayInput.
  ///
  /// In en, this message translates to:
  /// **'Input'**
  String get replayInput;

  /// No description provided for @replayUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get replayUpdate;

  /// No description provided for @url.
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get url;

  /// No description provided for @searchSites.
  ///
  /// In en, this message translates to:
  /// **'Search sites...'**
  String get searchSites;

  /// No description provided for @sortSites.
  ///
  /// In en, this message translates to:
  /// **'Sort sites'**
  String get sortSites;

  /// No description provided for @sortAlphabetically.
  ///
  /// In en, this message translates to:
  /// **'Alphabetically'**
  String get sortAlphabetically;

  /// No description provided for @sortByCount.
  ///
  /// In en, this message translates to:
  /// **'Sort by count'**
  String get sortByCount;

  /// No description provided for @sortByVisitors.
  ///
  /// In en, this message translates to:
  /// **'By visitors today'**
  String get sortByVisitors;

  /// No description provided for @sortByLiveUsers.
  ///
  /// In en, this message translates to:
  /// **'By live users'**
  String get sortByLiveUsers;

  /// No description provided for @noMatchingSites.
  ///
  /// In en, this message translates to:
  /// **'No matching sites'**
  String get noMatchingSites;

  /// No description provided for @utmTerm.
  ///
  /// In en, this message translates to:
  /// **'UTM Term'**
  String get utmTerm;

  /// No description provided for @utmContent.
  ///
  /// In en, this message translates to:
  /// **'UTM Content'**
  String get utmContent;

  /// No description provided for @browserVersions.
  ///
  /// In en, this message translates to:
  /// **'Browser Versions'**
  String get browserVersions;

  /// No description provided for @osVersions.
  ///
  /// In en, this message translates to:
  /// **'OS Versions'**
  String get osVersions;

  /// No description provided for @screenDimensions.
  ///
  /// In en, this message translates to:
  /// **'Screen Dimensions'**
  String get screenDimensions;

  /// No description provided for @relativeNow.
  ///
  /// In en, this message translates to:
  /// **'now'**
  String get relativeNow;

  /// No description provided for @relativeMinutes.
  ///
  /// In en, this message translates to:
  /// **'{count}m'**
  String relativeMinutes(int count);

  /// No description provided for @relativeHours.
  ///
  /// In en, this message translates to:
  /// **'{count}h'**
  String relativeHours(int count);

  /// No description provided for @relativeDays.
  ///
  /// In en, this message translates to:
  /// **'{count}d'**
  String relativeDays(int count);

  /// No description provided for @relativeWeeks.
  ///
  /// In en, this message translates to:
  /// **'{count}w'**
  String relativeWeeks(int count);

  /// No description provided for @emptyValue.
  ///
  /// In en, this message translates to:
  /// **'(empty)'**
  String get emptyValue;

  /// No description provided for @screenviews.
  ///
  /// In en, this message translates to:
  /// **'Screenviews'**
  String get screenviews;

  /// No description provided for @screensPerSession.
  ///
  /// In en, this message translates to:
  /// **'Screens/Session'**
  String get screensPerSession;

  /// No description provided for @screens.
  ///
  /// In en, this message translates to:
  /// **'Screens'**
  String get screens;

  /// No description provided for @entryScreens.
  ///
  /// In en, this message translates to:
  /// **'Entry Screens'**
  String get entryScreens;

  /// No description provided for @exitScreens.
  ///
  /// In en, this message translates to:
  /// **'Exit Screens'**
  String get exitScreens;

  /// No description provided for @deviceModel.
  ///
  /// In en, this message translates to:
  /// **'Device Model'**
  String get deviceModel;

  /// No description provided for @appVersions.
  ///
  /// In en, this message translates to:
  /// **'App Versions'**
  String get appVersions;

  /// No description provided for @sdkInfo.
  ///
  /// In en, this message translates to:
  /// **'SDK Info'**
  String get sdkInfo;

  /// No description provided for @minScreenviews.
  ///
  /// In en, this message translates to:
  /// **'Min Screenviews'**
  String get minScreenviews;

  /// No description provided for @appBadge.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get appBadge;
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
