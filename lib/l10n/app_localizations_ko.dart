// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => '비공식';

  @override
  String get cancel => '취소';

  @override
  String get delete => '삭제';

  @override
  String get save => '저장';

  @override
  String get update => '업데이트';

  @override
  String get create => '생성';

  @override
  String get retry => '다시 시도';

  @override
  String get add => '추가';

  @override
  String get edit => '편집';

  @override
  String get clear => '지우기';

  @override
  String get apply => '적용';

  @override
  String get goBack => '뒤로 가기';

  @override
  String get noData => '데이터 없음';

  @override
  String get loading => '로딩 중';

  @override
  String get logout => '로그아웃';

  @override
  String get close => '닫기';

  @override
  String get serverUrl => '서버 URL';

  @override
  String get serverUrlHint => 'https://your-rybbit-instance.com';

  @override
  String get email => '이메일';

  @override
  String get apiKey => 'API 키';

  @override
  String get password => '비밀번호';

  @override
  String get showPassword => '비밀번호 표시';

  @override
  String get hidePassword => '비밀번호 숨기기';

  @override
  String get connect => '연결';

  @override
  String get invalidUrl => '유효한 URL을 입력하세요 (https://...)';

  @override
  String get connectionFailed => '연결에 실패했습니다. 서버 URL을 확인하세요.';

  @override
  String get invalidApiKey => '유효하지 않은 API 키';

  @override
  String get connectionFailedApiKey => '연결에 실패했습니다. 서버 URL과 API 키를 확인하세요.';

  @override
  String get organizations => '조직';

  @override
  String get noSitesFound => '사이트를 찾을 수 없습니다';

  @override
  String get noSitesHint => '시작하려면 웹 대시보드에서 사이트를 추가하세요.';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 사이트',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return '멤버 ($count)';
  }

  @override
  String get failedToLoadOrganizations => '조직을 불러오지 못했습니다';

  @override
  String get noOrganizations => '조직 없음';

  @override
  String get noOrganizationsHint => '웹 대시보드에서 조직을 생성할 수 있습니다';

  @override
  String get failedToLoadMembers => '멤버를 불러오지 못했습니다';

  @override
  String get failedToLoadSites => '사이트를 불러오지 못했습니다';

  @override
  String get failedToLoadAnalytics => '분석 데이터를 불러오지 못했습니다';

  @override
  String get noDataAvailable => '사용 가능한 데이터가 없습니다';

  @override
  String get users => '사용자';

  @override
  String get sessions => '세션';

  @override
  String get pageviews => '페이지뷰';

  @override
  String get pagesPerSession => '페이지/세션';

  @override
  String get bounceRate => '이탈률';

  @override
  String get duration => '체류 시간';

  @override
  String get metrics => '지표';

  @override
  String get pages => '페이지';

  @override
  String get referrers => '유입 경로';

  @override
  String get countries => '국가';

  @override
  String get devices => '기기';

  @override
  String get performance => '성능';

  @override
  String get goals => '목표';

  @override
  String get funnels => '퍼널';

  @override
  String get replay => '리플레이';

  @override
  String get config => '설정';

  @override
  String usersOnline(int count) {
    return '$count명 온라인';
  }

  @override
  String get events => '이벤트';

  @override
  String get eventsOverTime => '시간별 이벤트';

  @override
  String get eventNames => '이벤트 이름';

  @override
  String get noCustomEventsTracked => '추적된 커스텀 이벤트가 없습니다';

  @override
  String get failedToLoadProperties => '속성을 불러오지 못했습니다';

  @override
  String get noProperties => '속성 없음';

  @override
  String get outboundLinks => '외부 링크';

  @override
  String get noOutboundLinksTracked => '추적된 외부 링크가 없습니다';

  @override
  String get failedToLoadChart => '차트를 불러오지 못했습니다';

  @override
  String get errors => '오류';

  @override
  String get failedToLoadErrors => '오류를 불러오지 못했습니다';

  @override
  String get noErrorsFound => '오류를 찾을 수 없습니다';

  @override
  String get everythingLooksGood => '모든 것이 정상입니다!';

  @override
  String get occurrences => '발생 횟수';

  @override
  String get sessionsAffected => '영향받은 세션';

  @override
  String failedToLoadEventsWithError(String error) {
    return '이벤트를 불러오지 못했습니다: $error';
  }

  @override
  String get noEventsFound => '이벤트를 찾을 수 없습니다';

  @override
  String get failedToLoadFunnels => '퍼널을 불러오지 못했습니다';

  @override
  String get noFunnelsSaved => '저장된 퍼널이 없습니다';

  @override
  String get createFunnelsHint => '웹 대시보드에서 퍼널을 생성하세요';

  @override
  String get deleteFunnel => '퍼널 삭제';

  @override
  String deleteFunnelConfirm(String name) {
    return '\"$name\"을(를) 삭제하시겠습니까?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return '퍼널 삭제 실패: $error';
  }

  @override
  String get noStepsDefined => '이 퍼널에 정의된 단계가 없습니다';

  @override
  String failedToAnalyze(String error) {
    return '분석 실패: $error';
  }

  @override
  String get overallConversion => '전체 전환율';

  @override
  String dropoff(String value) {
    return '이탈: $value';
  }

  @override
  String get createGoal => '목표 생성';

  @override
  String get failedToLoadGoals => '목표를 불러오지 못했습니다';

  @override
  String get noGoalsConfigured => '설정된 목표가 없습니다';

  @override
  String get noGoalsHint => '+ 버튼을 눌러 새 목표를 생성하세요';

  @override
  String get conversions => '전환';

  @override
  String get rate => '비율';

  @override
  String get editGoal => '목표 편집';

  @override
  String get createGoalTitle => '목표 생성';

  @override
  String get name => '이름';

  @override
  String get type => '유형';

  @override
  String get path => '경로';

  @override
  String get event => '이벤트';

  @override
  String get pathPattern => '경로 패턴';

  @override
  String get eventName => '이벤트 이름';

  @override
  String get deleteGoal => '목표 삭제';

  @override
  String deleteGoalConfirm(String name) {
    return '\"$name\"을(를) 삭제하시겠습니까?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return '목표 삭제 실패: $error';
  }

  @override
  String get failedToLoadPerformanceData => '성능 데이터를 불러오지 못했습니다';

  @override
  String metricOverTime(String metric) {
    return '시간별 $metric';
  }

  @override
  String get byDimension => '차원별';

  @override
  String get failedToLoadDimensionData => '차원 데이터를 불러오지 못했습니다';

  @override
  String get good => '양호';

  @override
  String get needsImprovement => '개선 필요';

  @override
  String get poor => '나쁨';

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
  String get dimPages => '페이지';

  @override
  String get dimCountries => '국가';

  @override
  String get dimDevices => '기기';

  @override
  String get dimBrowsers => '브라우저';

  @override
  String get dimOS => 'OS';

  @override
  String get sessionFilters => '세션 필터';

  @override
  String get minPageviews => '최소 페이지뷰';

  @override
  String get minEvents => '최소 이벤트';

  @override
  String get minDurationSeconds => '최소 체류 시간 (초)';

  @override
  String get failedToLoadSessions => '세션을 불러오지 못했습니다';

  @override
  String get noSessionsFound => '세션을 찾을 수 없습니다';

  @override
  String get filterSessions => '세션 필터링';

  @override
  String get loadingMoreSessions => '더 많은 세션 로딩 중';

  @override
  String entryPage(String page) {
    return '진입 페이지: $page';
  }

  @override
  String nPages(int count) {
    return '$count개 페이지';
  }

  @override
  String get sessionReplays => '세션 리플레이';

  @override
  String get failedToLoadReplays => '리플레이를 불러오지 못했습니다';

  @override
  String get noReplaysFound => '리플레이를 찾을 수 없습니다';

  @override
  String get noReplaysHint => '세션 리플레이가 활성화되면 여기에 표시됩니다.';

  @override
  String get previousPage => '이전 페이지';

  @override
  String get nextPage => '다음 페이지';

  @override
  String pageNumber(int number) {
    return '$number 페이지';
  }

  @override
  String get unknownBrowser => '알 수 없는 브라우저';

  @override
  String get unknownCountry => '알 수 없는 국가';

  @override
  String get sortUsers => '사용자 정렬';

  @override
  String get showAllUsers => '모든 사용자 표시';

  @override
  String get showIdentifiedOnly => '식별된 사용자만 표시';

  @override
  String get searchUsers => '사용자 검색';

  @override
  String get searchUsersHint => '사용자 검색...';

  @override
  String get clearSearch => '검색 지우기';

  @override
  String get failedToLoadUsers => '사용자를 불러오지 못했습니다';

  @override
  String get noUsersFound => '사용자를 찾을 수 없습니다';

  @override
  String get noIdentifiedUsers => '식별된 사용자가 없습니다';

  @override
  String get usersWillAppear => '사용자가 식별되면 여기에 표시됩니다';

  @override
  String get tryDifferentSearch => '다른 검색어를 시도해 보세요';

  @override
  String get sortedBy => '정렬 기준';

  @override
  String get loadingMoreUsers => '더 많은 사용자 로딩 중';

  @override
  String get lastSeen => '마지막 방문';

  @override
  String get firstSeen => '첫 방문';

  @override
  String nUsers(String count) {
    return '$count명의 사용자';
  }

  @override
  String nSessions(int count) {
    return '$count개 세션';
  }

  @override
  String lastPrefix(String value) {
    return '이전: $value';
  }

  @override
  String get failedToLoadSiteConfig => '사이트 설정을 불러오지 못했습니다';

  @override
  String get failedToLoadMetrics => '지표를 불러오지 못했습니다';

  @override
  String get loadingMoreMetrics => '더 많은 지표 로딩 중';

  @override
  String noMetricData(String metric) {
    return '$metric 데이터 없음';
  }

  @override
  String get settings => '설정';

  @override
  String get connection => '연결';

  @override
  String get notConfigured => '설정되지 않음';

  @override
  String get authMethod => '인증 방식';

  @override
  String get sessionCookie => '세션 쿠키';

  @override
  String get loggedInAs => '로그인 계정';

  @override
  String get unknown => '알 수 없음';

  @override
  String get appearance => '외관';

  @override
  String get theme => '테마';

  @override
  String get dark => '다크';

  @override
  String get light => '라이트';

  @override
  String get auto => '자동';

  @override
  String get about => '정보';

  @override
  String get appVersion => '앱 버전';

  @override
  String get openSourceAnalytics => '오픈 소스 웹 분석 도구';

  @override
  String get developer => '개발자';

  @override
  String get sourceCode => '소스 코드';

  @override
  String get originalProject => '원본 프로젝트';

  @override
  String get viewOnGitHub => 'GitHub에서 보기';

  @override
  String get unofficialClient => 'Rybbit 분석 플랫폼 비공식 모바일 클라이언트';

  @override
  String get madeBy => 'NKS Hub 제작';

  @override
  String get mobileAppDeveloper => '모바일 앱 개발자';

  @override
  String get logoutConfirm => '정말 로그아웃하시겠습니까?';

  @override
  String get siteSettings => '사이트 설정';

  @override
  String get siteInformation => '사이트 정보';

  @override
  String get domain => '도메인';

  @override
  String get siteId => '사이트 ID';

  @override
  String siteLabel(String id) {
    return '사이트 $id';
  }

  @override
  String get created => '생성일';

  @override
  String get trackingSettings => '추적 설정';

  @override
  String get publicDashboard => '공개 대시보드';

  @override
  String get publicDashboardDesc => '분석 데이터에 공개 접근 허용';

  @override
  String get sessionReplay => '세션 리플레이';

  @override
  String get sessionReplayDesc => '사용자 세션 기록';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Core Web Vitals 추적';

  @override
  String get trackErrors => '오류 추적';

  @override
  String get trackErrorsDesc => 'JavaScript 오류 캡처';

  @override
  String get outboundLinksTracking => '외부 링크';

  @override
  String get outboundLinksDesc => '외부 링크 클릭 추적';

  @override
  String get excludedIps => '제외된 IP';

  @override
  String get excludedCountries => '제외된 국가';

  @override
  String get settingsSaved => '설정이 저장되었습니다';

  @override
  String failedToSave(String error) {
    return '저장 실패: $error';
  }

  @override
  String get timeRange => '기간';

  @override
  String get today => '오늘';

  @override
  String get yesterday => '어제';

  @override
  String get last7Days => '최근 7일';

  @override
  String get last30Days => '최근 30일';

  @override
  String get thisWeek => '이번 주';

  @override
  String get thisMonth => '이번 달';

  @override
  String get thisYear => '올해';

  @override
  String get customRange => '사용자 지정 기간';

  @override
  String get allTime => '전체 기간';

  @override
  String lastMinutes(int count) {
    return '최근 $count분';
  }

  @override
  String get notSet => '(설정되지 않음)';

  @override
  String get bouncePrefix => '이탈률';

  @override
  String get timePrefix => '시간';

  @override
  String get eventTypePageview => '페이지뷰';

  @override
  String get eventTypeCustom => '사용자 정의';

  @override
  String get eventTypeOutbound => '외부';

  @override
  String get eventTypeClick => '클릭';

  @override
  String get eventTypeForm => '양식';

  @override
  String get eventTypeInput => '입력';

  @override
  String get eventTypeCopy => '복사';

  @override
  String get filter => '필터';

  @override
  String get addFilter => '필터 추가';

  @override
  String get parameter => '매개변수';

  @override
  String get value => '값';

  @override
  String get enterFilterValue => '필터 값을 입력하세요';

  @override
  String get filterBrowser => '브라우저';

  @override
  String get filterOs => '운영체제';

  @override
  String get filterLanguage => '언어';

  @override
  String get filterCountry => '국가';

  @override
  String get filterRegion => '지역';

  @override
  String get filterCity => '도시';

  @override
  String get filterDeviceType => '기기 유형';

  @override
  String get filterReferrer => '리퍼러';

  @override
  String get filterHostname => '호스트명';

  @override
  String get filterPathname => '경로';

  @override
  String get filterPageTitle => '페이지 제목';

  @override
  String get filterQuerystring => '쿼리스트링';

  @override
  String get filterEventName => '이벤트명';

  @override
  String get filterChannel => '채널';

  @override
  String get filterUtmSource => 'UTM 소스';

  @override
  String get filterUtmMedium => 'UTM 매체';

  @override
  String get filterUtmCampaign => 'UTM 캠페인';

  @override
  String get filterUtmTerm => 'UTM 용어';

  @override
  String get filterUtmContent => 'UTM 콘텐츠';

  @override
  String get filterEntryPage => '진입 페이지';

  @override
  String get filterExitPage => '이탈 페이지';

  @override
  String get requestTimedOut => '요청 시간이 초과되었습니다. 다시 시도해 주세요.';

  @override
  String get networkError => '네트워크 오류입니다. 연결을 확인해 주세요.';

  @override
  String get sessionExpired => '세션이 만료되었습니다. 다시 로그인해 주세요.';

  @override
  String get accessDenied => '접근이 거부되었습니다.';

  @override
  String get dataNotFound => '데이터를 찾을 수 없습니다.';

  @override
  String get serverError => '서버 오류입니다. 나중에 다시 시도해 주세요.';

  @override
  String get failedToLoadGeneric => '데이터를 불러오지 못했습니다. 다시 시도해 주세요.';

  @override
  String chartDataPoints(int count) {
    return '$count개의 데이터 포인트가 있는 차트';
  }

  @override
  String previousPrefix(String value) {
    return '이전: $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return '성능 등급: $rating';
  }

  @override
  String get loadingContent => '콘텐츠 로딩 중';

  @override
  String get language => '언어';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get failedToLoadUserDetails => '사용자 세부 정보를 불러오지 못했습니다';

  @override
  String lastSeenPrefix(String value) {
    return '마지막 접속: $value';
  }

  @override
  String get traits => '속성';

  @override
  String get noTraits => '이 사용자의 속성이 없습니다';

  @override
  String get sessionDetail => '세션 상세';

  @override
  String get failedToLoadSession => '세션을 불러오지 못했습니다';

  @override
  String get entryPageLabel => '진입 페이지';

  @override
  String get exitPage => '이탈 페이지';

  @override
  String get browserAndDevice => '브라우저 및 기기';

  @override
  String get browser => '브라우저';

  @override
  String get os => 'OS';

  @override
  String get device => '기기';

  @override
  String get sourceLabel => '소스';

  @override
  String get referrer => '리퍼러';

  @override
  String eventTimelineCount(int count) {
    return '이벤트 타임라인 ($count)';
  }

  @override
  String get noEvents => '이벤트 없음';

  @override
  String get replayEventsTitle => '리플레이 이벤트';

  @override
  String get failedToLoadReplay => '리플레이를 불러오지 못했습니다';

  @override
  String get noReplayEvents => '리플레이 이벤트 없음';

  @override
  String get totalEvents => '전체 이벤트';

  @override
  String get userActionsLabel => '사용자 동작';

  @override
  String eventTimelineActions(int count) {
    return '이벤트 타임라인 ($count개 동작)';
  }

  @override
  String get eventLog => '이벤트 로그';

  @override
  String get viewEventLog => '이벤트 로그 보기';

  @override
  String get failedToLoadEventLog => '이벤트 로그를 불러오지 못했습니다';

  @override
  String get activityHeatmap => '히트맵';

  @override
  String get heatmapLast4Weeks => '최근 4주';

  @override
  String get less => '적음';

  @override
  String get more => '많음';

  @override
  String get peakActivity => '최고 활동';

  @override
  String peakHour(String day, String time) {
    return '$day $time';
  }

  @override
  String busiestDay(String day) {
    return '가장 바쁜 날: $day';
  }

  @override
  String get dayMon => '월';

  @override
  String get dayTue => '화';

  @override
  String get dayWed => '수';

  @override
  String get dayThu => '목';

  @override
  String get dayFri => '금';

  @override
  String get daySat => '토';

  @override
  String get daySun => '일';

  @override
  String get searchEvents => '이벤트 검색...';

  @override
  String get allTypes => '전체';

  @override
  String get allOrganizations => '모든 조직';

  @override
  String get noMatchingEvents => '일치하는 이벤트 없음';

  @override
  String get liveView => '라이브';

  @override
  String get autoRefresh => '자동 새로고침';

  @override
  String get usersOnlineNow => '현재 온라인 사용자';

  @override
  String lastUpdatedAt(String time) {
    return '$time에 업데이트됨';
  }

  @override
  String get last30Minutes => '최근 30분';

  @override
  String get last5Minutes => '최근 5분';

  @override
  String get recentEvents => '최근 이벤트';

  @override
  String get noRecentEvents => '최근 이벤트 없음';

  @override
  String get retention => '리텐션';

  @override
  String get weekly => '주간';

  @override
  String get daily => '일간';

  @override
  String get retentionRange => '범위';

  @override
  String retentionDays(int count) {
    return '$count일';
  }

  @override
  String get failedToLoadRetention => '리텐션 데이터를 불러오지 못했습니다';

  @override
  String get noRetentionData => '리텐션 데이터 없음';

  @override
  String get cohort => '코호트';

  @override
  String get retentionWeekPrefix => 'W';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => '사용자 경로';

  @override
  String get journeySteps => '단계';

  @override
  String get failedToLoadJourneys => '사용자 경로를 불러오지 못했습니다';

  @override
  String get noJourneysFound => '사용자 경로가 없습니다';

  @override
  String journeySessions(String count) {
    return '$count 세션';
  }

  @override
  String get locations => '위치';

  @override
  String get locationCities => '도시';

  @override
  String get failedToLoadLocations => '위치를 불러오지 못했습니다';

  @override
  String get noLocationsFound => '위치가 없습니다';

  @override
  String get coreFeatures => '핵심';

  @override
  String get insights => '인사이트';

  @override
  String get tools => '도구';

  @override
  String get userTraits => '특성';

  @override
  String get failedToLoadUserTraits => '사용자 특성을 불러오지 못했습니다';

  @override
  String get noUserTraits => '특성이 없습니다';

  @override
  String get noUserTraitsHint => '사용자가 사용자 정의 속성으로 식별되면 표시됩니다';

  @override
  String traitUsersCount(String count) {
    return '$count명 사용자';
  }

  @override
  String get dashboard => '대시보드';

  @override
  String get analytics => '분석';

  @override
  String get noSiteSelected => '선택된 사이트 없음';

  @override
  String selectSiteFromDashboard(String tabName) {
    return '$tabName을(를) 보려면 대시보드 탭에서 사이트를 선택하세요.';
  }

  @override
  String get goToDashboard => '대시보드로 이동';

  @override
  String todayVisitors(int count) {
    return '오늘 $count명';
  }

  @override
  String get entryPages => '진입 페이지';

  @override
  String get exitPages => '이탈 페이지';

  @override
  String get browsers => '브라우저';

  @override
  String get operatingSystems => 'OS';

  @override
  String get utmSource => 'UTM 소스';

  @override
  String get channel => '채널';

  @override
  String get pageTitles => '페이지 제목';

  @override
  String get sources => '소스';

  @override
  String get cities => '도시';

  @override
  String get languages => '언어';

  @override
  String get hostnames => '호스트명';

  @override
  String get vpn => 'VPN';

  @override
  String get crawlers => '크롤러';

  @override
  String get datacenters => '데이터센터';

  @override
  String get companies => '회사';

  @override
  String get companyType => '회사 유형';

  @override
  String get companyDomain => '회사 도메인';

  @override
  String get asnOrg => 'ASN 조직';

  @override
  String get asnType => 'ASN 유형';

  @override
  String get asnDomain => 'ASN 도메인';

  @override
  String get utmMedium => 'UTM 매체';

  @override
  String get utmCampaign => 'UTM 캠페인';

  @override
  String nMoreItems(int count) {
    return '+$count개 더';
  }

  @override
  String sessionsWithPercentage(String count, String percentage) {
    return '$count 세션 ($percentage%)';
  }

  @override
  String errorGeneric(String error) {
    return '오류: $error';
  }

  @override
  String get replayPageSnapshot => '페이지 스냅샷';

  @override
  String get replayPageLoad => '페이지 로드';

  @override
  String get replayCustomEvent => '커스텀 이벤트';

  @override
  String get replayPluginEvent => '플러그인 이벤트';

  @override
  String get replayInteraction => '인터랙션';

  @override
  String get replayScroll => '스크롤';

  @override
  String get replayResize => '크기 조절';

  @override
  String get replayInput => '입력';

  @override
  String get replayUpdate => '업데이트';

  @override
  String get url => 'URL';

  @override
  String get searchSites => '사이트 검색...';

  @override
  String get sortSites => '사이트 정렬';

  @override
  String get sortAlphabetically => '알파벳순';

  @override
  String get sortByCount => '개수순 정렬';

  @override
  String get sortByVisitors => '오늘 방문자순';

  @override
  String get sortByLiveUsers => '온라인 사용자순';

  @override
  String get noMatchingSites => '일치하는 사이트 없음';

  @override
  String get utmTerm => 'UTM 용어';

  @override
  String get utmContent => 'UTM 콘텐츠';

  @override
  String get browserVersions => '브라우저 버전';

  @override
  String get osVersions => 'OS 버전';

  @override
  String get screenDimensions => '화면 크기';

  @override
  String get relativeNow => '지금';

  @override
  String relativeMinutes(int count) {
    return '$count분';
  }

  @override
  String relativeHours(int count) {
    return '$count시간';
  }

  @override
  String relativeDays(int count) {
    return '$count일';
  }

  @override
  String relativeWeeks(int count) {
    return '$count주';
  }

  @override
  String get emptyValue => '(비어있음)';

  @override
  String get screenviews => '화면조회수';

  @override
  String get screensPerSession => '화면/세션';

  @override
  String get screens => '화면';

  @override
  String get entryScreens => '진입 화면';

  @override
  String get exitScreens => '종료 화면';

  @override
  String get deviceModel => '기기 모델';

  @override
  String get appVersions => '앱 버전';

  @override
  String get sdkInfo => '기기 정보';

  @override
  String get minScreenviews => '최소 화면조회수';

  @override
  String get appBadge => '앱';

  @override
  String get eventTypeScreenview => '화면조회';
}
