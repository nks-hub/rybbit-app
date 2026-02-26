// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => '非公式';

  @override
  String get cancel => 'キャンセル';

  @override
  String get delete => '削除';

  @override
  String get save => '保存';

  @override
  String get update => '更新';

  @override
  String get create => '作成';

  @override
  String get retry => '再試行';

  @override
  String get add => '追加';

  @override
  String get edit => '編集';

  @override
  String get clear => 'クリア';

  @override
  String get apply => '適用';

  @override
  String get goBack => '戻る';

  @override
  String get noData => 'データなし';

  @override
  String get loading => '読み込み中';

  @override
  String get logout => 'ログアウト';

  @override
  String get close => '閉じる';

  @override
  String get serverUrl => 'サーバーURL';

  @override
  String get serverUrlHint => 'https://your-rybbit-instance.com';

  @override
  String get email => 'メールアドレス';

  @override
  String get apiKey => 'APIキー';

  @override
  String get password => 'パスワード';

  @override
  String get showPassword => 'パスワードを表示';

  @override
  String get hidePassword => 'パスワードを非表示';

  @override
  String get connect => '接続';

  @override
  String get invalidUrl => '有効なURLを入力してください (https://...)';

  @override
  String get connectionFailed => '接続に失敗しました。サーバーURLを確認してください。';

  @override
  String get invalidApiKey => '無効なAPIキー';

  @override
  String get connectionFailedApiKey => '接続に失敗しました。サーバーURLとAPIキーを確認してください。';

  @override
  String get organizations => '組織';

  @override
  String get noSitesFound => 'サイトが見つかりません';

  @override
  String get noSitesHint => 'Webダッシュボードでサイトを追加して始めましょう。';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countサイト',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return 'メンバー ($count)';
  }

  @override
  String get failedToLoadOrganizations => '組織の読み込みに失敗しました';

  @override
  String get noOrganizations => '組織がありません';

  @override
  String get noOrganizationsHint => '組織はWebダッシュボードで作成できます';

  @override
  String get failedToLoadMembers => 'メンバーの読み込みに失敗しました';

  @override
  String get failedToLoadSites => 'サイトの読み込みに失敗しました';

  @override
  String get failedToLoadAnalytics => 'アナリティクスの読み込みに失敗しました';

  @override
  String get noDataAvailable => '利用可能なデータがありません';

  @override
  String get users => 'ユーザー';

  @override
  String get sessions => 'セッション';

  @override
  String get pageviews => 'ページビュー';

  @override
  String get pagesPerSession => 'ページ/セッション';

  @override
  String get bounceRate => '直帰率';

  @override
  String get duration => '滞在時間';

  @override
  String get metrics => '指標';

  @override
  String get pages => 'ページ';

  @override
  String get referrers => 'リファラー';

  @override
  String get countries => '国';

  @override
  String get devices => 'デバイス';

  @override
  String get performance => 'パフォーマンス';

  @override
  String get goals => '目標';

  @override
  String get funnels => 'ファネル';

  @override
  String get replay => 'リプレイ';

  @override
  String get config => '設定';

  @override
  String usersOnline(int count) {
    return '$count人のユーザーがオンライン';
  }

  @override
  String get events => 'イベント';

  @override
  String get eventsOverTime => 'イベントの推移';

  @override
  String get eventNames => 'イベント名';

  @override
  String get noCustomEventsTracked => 'カスタムイベントは記録されていません';

  @override
  String get failedToLoadProperties => 'プロパティの読み込みに失敗しました';

  @override
  String get noProperties => 'プロパティがありません';

  @override
  String get outboundLinks => '外部リンク';

  @override
  String get noOutboundLinksTracked => '外部リンクは記録されていません';

  @override
  String get failedToLoadChart => 'チャートの読み込みに失敗しました';

  @override
  String get errors => 'エラー';

  @override
  String get failedToLoadErrors => 'エラーの読み込みに失敗しました';

  @override
  String get noErrorsFound => 'エラーは見つかりませんでした';

  @override
  String get everythingLooksGood => 'すべて正常です！';

  @override
  String get occurrences => '発生回数';

  @override
  String get sessionsAffected => '影響を受けたセッション';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'イベントの読み込みに失敗しました: $error';
  }

  @override
  String get noEventsFound => 'イベントが見つかりません';

  @override
  String get failedToLoadFunnels => 'ファネルの読み込みに失敗しました';

  @override
  String get noFunnelsSaved => '保存されたファネルはありません';

  @override
  String get createFunnelsHint => 'Webダッシュボードでファネルを作成してください';

  @override
  String get deleteFunnel => 'ファネルを削除';

  @override
  String deleteFunnelConfirm(String name) {
    return '「$name」を削除しますか？';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'ファネルの削除に失敗しました: $error';
  }

  @override
  String get noStepsDefined => 'このファネルにはステップが定義されていません';

  @override
  String failedToAnalyze(String error) {
    return '分析に失敗しました: $error';
  }

  @override
  String get overallConversion => '全体のコンバージョン';

  @override
  String dropoff(String value) {
    return '離脱: $value';
  }

  @override
  String get createGoal => '目標を作成';

  @override
  String get failedToLoadGoals => '目標の読み込みに失敗しました';

  @override
  String get noGoalsConfigured => '目標が設定されていません';

  @override
  String get noGoalsHint => '＋をタップして新しい目標を作成してください';

  @override
  String get conversions => 'コンバージョン';

  @override
  String get rate => '率';

  @override
  String get editGoal => '目標を編集';

  @override
  String get createGoalTitle => '目標を作成';

  @override
  String get name => '名前';

  @override
  String get type => 'タイプ';

  @override
  String get path => 'パス';

  @override
  String get event => 'イベント';

  @override
  String get pathPattern => 'パスパターン';

  @override
  String get eventName => 'イベント名';

  @override
  String get deleteGoal => '目標を削除';

  @override
  String deleteGoalConfirm(String name) {
    return '「$name」を削除しますか？';
  }

  @override
  String failedToDeleteGoal(String error) {
    return '目標の削除に失敗しました: $error';
  }

  @override
  String get failedToLoadPerformanceData => 'パフォーマンスデータの読み込みに失敗しました';

  @override
  String metricOverTime(String metric) {
    return '$metricの推移';
  }

  @override
  String get byDimension => 'ディメンション別';

  @override
  String get failedToLoadDimensionData => 'ディメンションデータの読み込みに失敗しました';

  @override
  String get good => '良好';

  @override
  String get needsImprovement => '改善が必要';

  @override
  String get poor => '不良';

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
  String get dimPages => 'ページ';

  @override
  String get dimCountries => '国';

  @override
  String get dimDevices => 'デバイス';

  @override
  String get dimBrowsers => 'ブラウザ';

  @override
  String get dimOS => 'OS';

  @override
  String get sessionFilters => 'セッションフィルター';

  @override
  String get minPageviews => '最小ページビュー数';

  @override
  String get minEvents => '最小イベント数';

  @override
  String get minDurationSeconds => '最小滞在時間（秒）';

  @override
  String get failedToLoadSessions => 'セッションの読み込みに失敗しました';

  @override
  String get noSessionsFound => 'セッションが見つかりません';

  @override
  String get filterSessions => 'セッションをフィルター';

  @override
  String get loadingMoreSessions => 'セッションを追加読み込み中';

  @override
  String entryPage(String page) {
    return '入口ページ: $page';
  }

  @override
  String nPages(int count) {
    return '$countページ';
  }

  @override
  String get sessionReplays => 'セッションリプレイ';

  @override
  String get failedToLoadReplays => 'リプレイの読み込みに失敗しました';

  @override
  String get noReplaysFound => 'リプレイが見つかりません';

  @override
  String get noReplaysHint => 'セッションリプレイが有効になると、ここに表示されます。';

  @override
  String get previousPage => '前のページ';

  @override
  String get nextPage => '次のページ';

  @override
  String pageNumber(int number) {
    return '$numberページ';
  }

  @override
  String get unknownBrowser => '不明なブラウザ';

  @override
  String get unknownCountry => '不明な国';

  @override
  String get sortUsers => 'ユーザーを並び替え';

  @override
  String get showAllUsers => 'すべてのユーザーを表示';

  @override
  String get showIdentifiedOnly => '識別済みのみ表示';

  @override
  String get searchUsers => 'ユーザーを検索';

  @override
  String get searchUsersHint => 'ユーザーを検索...';

  @override
  String get clearSearch => '検索をクリア';

  @override
  String get failedToLoadUsers => 'ユーザーの読み込みに失敗しました';

  @override
  String get noUsersFound => 'ユーザーが見つかりません';

  @override
  String get noIdentifiedUsers => '識別済みユーザーがいません';

  @override
  String get usersWillAppear => 'ユーザーが識別されると、ここに表示されます';

  @override
  String get tryDifferentSearch => '別の検索キーワードをお試しください';

  @override
  String get sortedBy => '並び順';

  @override
  String get loadingMoreUsers => 'ユーザーを追加読み込み中';

  @override
  String get lastSeen => '最終確認';

  @override
  String get firstSeen => '初回確認';

  @override
  String nUsers(String count) {
    return '$count人のユーザー';
  }

  @override
  String nSessions(int count) {
    return '$countセッション';
  }

  @override
  String lastPrefix(String value) {
    return '前回: $value';
  }

  @override
  String get failedToLoadSiteConfig => 'サイト設定の読み込みに失敗しました';

  @override
  String get failedToLoadMetrics => '指標の読み込みに失敗しました';

  @override
  String get loadingMoreMetrics => '指標を追加読み込み中';

  @override
  String noMetricData(String metric) {
    return '$metricのデータがありません';
  }

  @override
  String get settings => '設定';

  @override
  String get connection => '接続';

  @override
  String get notConfigured => '未設定';

  @override
  String get authMethod => '認証方式';

  @override
  String get sessionCookie => 'セッションCookie';

  @override
  String get loggedInAs => 'ログイン中';

  @override
  String get unknown => '不明';

  @override
  String get appearance => '外観';

  @override
  String get theme => 'テーマ';

  @override
  String get dark => 'ダーク';

  @override
  String get light => 'ライト';

  @override
  String get auto => '自動';

  @override
  String get about => '情報';

  @override
  String get appVersion => 'アプリバージョン';

  @override
  String get openSourceAnalytics => 'オープンソースのウェブアナリティクス';

  @override
  String get developer => '開発者';

  @override
  String get sourceCode => 'ソースコード';

  @override
  String get originalProject => 'オリジナルプロジェクト';

  @override
  String get viewOnGitHub => 'GitHubで見る';

  @override
  String get unofficialClient => 'Rybbit分析プラットフォーム用の非公式モバイルクライアント';

  @override
  String get madeBy => 'NKS Hub 制作';

  @override
  String get mobileAppDeveloper => 'モバイルアプリ開発者';

  @override
  String get logoutConfirm => 'ログアウトしてもよろしいですか？';

  @override
  String get siteSettings => 'サイト設定';

  @override
  String get siteInformation => 'サイト情報';

  @override
  String get domain => 'ドメイン';

  @override
  String get siteId => 'サイトID';

  @override
  String siteLabel(String id) {
    return 'サイト $id';
  }

  @override
  String get created => '作成日';

  @override
  String get trackingSettings => 'トラッキング設定';

  @override
  String get publicDashboard => '公開ダッシュボード';

  @override
  String get publicDashboardDesc => 'アナリティクスへの公開アクセスを許可します';

  @override
  String get sessionReplay => 'セッションリプレイ';

  @override
  String get sessionReplayDesc => 'ユーザーセッションを記録します';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Core Web Vitalsを計測します';

  @override
  String get trackErrors => 'エラー追跡';

  @override
  String get trackErrorsDesc => 'JavaScriptエラーをキャプチャします';

  @override
  String get outboundLinksTracking => '外部リンク';

  @override
  String get outboundLinksDesc => '外部リンクのクリックを追跡します';

  @override
  String get excludedIps => '除外IP';

  @override
  String get excludedCountries => '除外する国';

  @override
  String get settingsSaved => '設定を保存しました';

  @override
  String failedToSave(String error) {
    return '保存に失敗しました: $error';
  }

  @override
  String get timeRange => '期間';

  @override
  String get today => '今日';

  @override
  String get yesterday => '昨日';

  @override
  String get last7Days => '過去7日間';

  @override
  String get last30Days => '過去30日間';

  @override
  String get thisWeek => '今週';

  @override
  String get thisMonth => '今月';

  @override
  String get thisYear => '今年';

  @override
  String get customRange => 'カスタム期間';

  @override
  String get allTime => '全期間';

  @override
  String lastMinutes(int count) {
    return '過去$count分';
  }

  @override
  String get notSet => '(未設定)';

  @override
  String get bouncePrefix => '直帰率';

  @override
  String get timePrefix => '時間';

  @override
  String get eventTypePageview => 'ページビュー';

  @override
  String get eventTypeCustom => 'カスタム';

  @override
  String get eventTypeOutbound => 'アウトバウンド';

  @override
  String get eventTypeClick => 'クリック';

  @override
  String get eventTypeForm => 'フォーム';

  @override
  String get eventTypeInput => '入力';

  @override
  String get eventTypeCopy => 'コピー';

  @override
  String get filter => 'フィルター';

  @override
  String get addFilter => 'フィルターを追加';

  @override
  String get parameter => 'パラメーター';

  @override
  String get value => '値';

  @override
  String get enterFilterValue => 'フィルターの値を入力してください';

  @override
  String get filterBrowser => 'ブラウザ';

  @override
  String get filterOs => 'OS';

  @override
  String get filterLanguage => '言語';

  @override
  String get filterCountry => '国';

  @override
  String get filterRegion => '地域';

  @override
  String get filterCity => '都市';

  @override
  String get filterDeviceType => 'デバイスタイプ';

  @override
  String get filterReferrer => 'リファラー';

  @override
  String get filterHostname => 'ホスト名';

  @override
  String get filterPathname => 'パス';

  @override
  String get filterPageTitle => 'ページタイトル';

  @override
  String get filterQuerystring => 'クエリ文字列';

  @override
  String get filterEventName => 'イベント名';

  @override
  String get filterChannel => 'チャネル';

  @override
  String get filterUtmSource => 'UTMソース';

  @override
  String get filterUtmMedium => 'UTMメディア';

  @override
  String get filterUtmCampaign => 'UTMキャンペーン';

  @override
  String get filterUtmTerm => 'UTM用語';

  @override
  String get filterUtmContent => 'UTMコンテンツ';

  @override
  String get filterEntryPage => 'エントリーページ';

  @override
  String get filterExitPage => '離脱ページ';

  @override
  String get requestTimedOut => 'リクエストがタイムアウトしました。再度お試しください。';

  @override
  String get networkError => 'ネットワークエラーです。接続を確認してください。';

  @override
  String get sessionExpired => 'セッションの有効期限が切れました。再度ログインしてください。';

  @override
  String get accessDenied => 'アクセスが拒否されました。';

  @override
  String get dataNotFound => 'データが見つかりません。';

  @override
  String get serverError => 'サーバーエラーです。しばらくしてから再度お試しください。';

  @override
  String get failedToLoadGeneric => 'データの読み込みに失敗しました。再度お試しください。';

  @override
  String chartDataPoints(int count) {
    return '$countデータポイントのチャート';
  }

  @override
  String previousPrefix(String value) {
    return '前回: $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'パフォーマンス評価: $rating';
  }

  @override
  String get loadingContent => 'コンテンツを読み込み中';

  @override
  String get language => '言語';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get failedToLoadUserDetails => 'ユーザー詳細の読み込みに失敗しました';

  @override
  String lastSeenPrefix(String value) {
    return '最終閲覧: $value';
  }

  @override
  String get traits => '属性';

  @override
  String get noTraits => 'このユーザーの属性はありません';

  @override
  String get sessionDetail => 'セッション詳細';

  @override
  String get failedToLoadSession => 'セッションの読み込みに失敗しました';

  @override
  String get entryPageLabel => '入口ページ';

  @override
  String get exitPage => '出口ページ';

  @override
  String get browserAndDevice => 'ブラウザとデバイス';

  @override
  String get browser => 'ブラウザ';

  @override
  String get os => 'OS';

  @override
  String get device => 'デバイス';

  @override
  String get sourceLabel => 'ソース';

  @override
  String get referrer => 'リファラー';

  @override
  String eventTimelineCount(int count) {
    return 'イベントタイムライン ($count)';
  }

  @override
  String get noEvents => 'イベントなし';

  @override
  String get replayEventsTitle => 'リプレイイベント';

  @override
  String get failedToLoadReplay => 'リプレイの読み込みに失敗しました';

  @override
  String get noReplayEvents => 'リプレイイベントなし';

  @override
  String get totalEvents => 'イベント合計';

  @override
  String get userActionsLabel => 'ユーザーアクション';

  @override
  String eventTimelineActions(int count) {
    return 'イベントタイムライン ($countアクション)';
  }

  @override
  String get eventLog => 'イベントログ';

  @override
  String get viewEventLog => 'イベントログを表示';

  @override
  String get failedToLoadEventLog => 'イベントログの読み込みに失敗しました';

  @override
  String get activityHeatmap => 'ヒートマップ';

  @override
  String get heatmapLast4Weeks => '過去4週間';

  @override
  String get less => '少ない';

  @override
  String get more => '多い';

  @override
  String get peakActivity => 'ピークアクティビティ';

  @override
  String peakHour(String day, String time) {
    return '$day $time';
  }

  @override
  String busiestDay(String day) {
    return '最も忙しい日: $day';
  }

  @override
  String get dayMon => '月';

  @override
  String get dayTue => '火';

  @override
  String get dayWed => '水';

  @override
  String get dayThu => '木';

  @override
  String get dayFri => '金';

  @override
  String get daySat => '土';

  @override
  String get daySun => '日';

  @override
  String get searchEvents => 'イベントを検索...';

  @override
  String get allTypes => 'すべて';

  @override
  String get allOrganizations => 'すべての組織';

  @override
  String get noMatchingEvents => '一致するイベントがありません';

  @override
  String get liveView => 'ライブ';

  @override
  String get autoRefresh => '自動更新';

  @override
  String get usersOnlineNow => '現在オンラインのユーザー';

  @override
  String lastUpdatedAt(String time) {
    return '$time に更新';
  }

  @override
  String get last30Minutes => '過去30分';

  @override
  String get last5Minutes => '過去5分';

  @override
  String get recentEvents => '最近のイベント';

  @override
  String get noRecentEvents => '最近のイベントはありません';

  @override
  String get retention => 'リテンション';

  @override
  String get weekly => '週次';

  @override
  String get daily => '日次';

  @override
  String get retentionRange => '範囲';

  @override
  String retentionDays(int count) {
    return '$count日間';
  }

  @override
  String get failedToLoadRetention => 'リテンションデータの読み込みに失敗しました';

  @override
  String get noRetentionData => 'リテンションデータなし';

  @override
  String get cohort => 'コホート';

  @override
  String get retentionWeekPrefix => 'W';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => 'ジャーニー';

  @override
  String get journeySteps => 'ステップ';

  @override
  String get failedToLoadJourneys => 'ジャーニーの読み込みに失敗しました';

  @override
  String get noJourneysFound => 'ジャーニーが見つかりません';

  @override
  String journeySessions(String count) {
    return '$countセッション';
  }

  @override
  String get locations => 'ロケーション';

  @override
  String get locationCities => '都市';

  @override
  String get failedToLoadLocations => 'ロケーションの読み込みに失敗しました';

  @override
  String get noLocationsFound => 'ロケーションが見つかりません';

  @override
  String get coreFeatures => 'コア';

  @override
  String get insights => 'インサイト';

  @override
  String get tools => 'ツール';

  @override
  String get userTraits => 'トレイト';

  @override
  String get failedToLoadUserTraits => 'ユーザートレイトの読み込みに失敗しました';

  @override
  String get noUserTraits => 'トレイトが見つかりません';

  @override
  String get noUserTraitsHint => 'カスタムプロパティでユーザーが識別されると表示されます';

  @override
  String traitUsersCount(String count) {
    return '$countユーザー';
  }

  @override
  String get dashboard => 'ダッシュボード';

  @override
  String get analytics => 'アナリティクス';

  @override
  String get noSiteSelected => 'サイトが選択されていません';

  @override
  String selectSiteFromDashboard(String tabName) {
    return '$tabNameを表示するにはダッシュボードタブからサイトを選択してください。';
  }

  @override
  String get goToDashboard => 'ダッシュボードへ';

  @override
  String todayVisitors(int count) {
    return '今日$count人';
  }

  @override
  String get entryPages => '入口ページ';

  @override
  String get exitPages => '出口ページ';

  @override
  String get browsers => 'ブラウザ';

  @override
  String get operatingSystems => 'OS';

  @override
  String get utmSource => 'UTMソース';

  @override
  String get channel => 'チャネル';

  @override
  String get pageTitles => 'ページタイトル';

  @override
  String get sources => 'ソース';

  @override
  String get cities => '都市';

  @override
  String get languages => '言語';

  @override
  String get hostnames => 'ホスト名';

  @override
  String get vpn => 'VPN';

  @override
  String get crawlers => 'クローラー';

  @override
  String get datacenters => 'データセンター';

  @override
  String get companies => '企業';

  @override
  String get companyType => '企業タイプ';

  @override
  String get companyDomain => '企業ドメイン';

  @override
  String get asnOrg => 'ASN組織';

  @override
  String get asnType => 'ASNタイプ';

  @override
  String get asnDomain => 'ASNドメイン';

  @override
  String get utmMedium => 'UTMメディア';

  @override
  String get utmCampaign => 'UTMキャンペーン';

  @override
  String nMoreItems(int count) {
    return '+$count件';
  }

  @override
  String sessionsWithPercentage(String count, String percentage) {
    return '$countセッション ($percentage%)';
  }

  @override
  String errorGeneric(String error) {
    return 'エラー: $error';
  }

  @override
  String get replayPageSnapshot => 'ページスナップショット';

  @override
  String get replayPageLoad => 'ページ読み込み';

  @override
  String get replayCustomEvent => 'カスタムイベント';

  @override
  String get replayPluginEvent => 'プラグインイベント';

  @override
  String get replayInteraction => 'インタラクション';

  @override
  String get replayScroll => 'スクロール';

  @override
  String get replayResize => 'リサイズ';

  @override
  String get replayInput => '入力';

  @override
  String get replayUpdate => '更新';

  @override
  String get url => 'URL';

  @override
  String get searchSites => 'サイトを検索...';

  @override
  String get sortSites => 'サイトを並べ替え';

  @override
  String get sortAlphabetically => 'アルファベット順';

  @override
  String get sortByCount => '件数順';

  @override
  String get sortByVisitors => '今日の訪問者数順';

  @override
  String get sortByLiveUsers => 'オンラインユーザー数順';

  @override
  String get noMatchingSites => '該当するサイトがありません';

  @override
  String get utmTerm => 'UTMターム';

  @override
  String get utmContent => 'UTMコンテンツ';

  @override
  String get browserVersions => 'ブラウザバージョン';

  @override
  String get osVersions => 'OSバージョン';

  @override
  String get screenDimensions => '画面サイズ';

  @override
  String get relativeNow => '今';

  @override
  String relativeMinutes(int count) {
    return '$count分';
  }

  @override
  String relativeHours(int count) {
    return '$count時間';
  }

  @override
  String relativeDays(int count) {
    return '$count日';
  }

  @override
  String relativeWeeks(int count) {
    return '$count週';
  }

  @override
  String get emptyValue => '(空)';

  @override
  String get screenviews => 'Screenviews';

  @override
  String get screensPerSession => 'Screens/Session';

  @override
  String get screens => 'Screens';

  @override
  String get entryScreens => 'Entry Screens';

  @override
  String get exitScreens => 'Exit Screens';

  @override
  String get deviceModel => 'Device Model';

  @override
  String get appVersions => 'App Versions';

  @override
  String get sdkInfo => 'SDK Info';

  @override
  String get minScreenviews => '最小スクリーンビュー数';

  @override
  String get appBadge => 'アプリ';
}
