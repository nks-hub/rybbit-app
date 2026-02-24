// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => '非官方';

  @override
  String get cancel => '取消';

  @override
  String get delete => '删除';

  @override
  String get save => '保存';

  @override
  String get update => '更新';

  @override
  String get create => '创建';

  @override
  String get retry => '重试';

  @override
  String get add => '添加';

  @override
  String get edit => '编辑';

  @override
  String get clear => '清除';

  @override
  String get apply => '应用';

  @override
  String get goBack => '返回';

  @override
  String get noData => '暂无数据';

  @override
  String get loading => '加载中';

  @override
  String get logout => '退出登录';

  @override
  String get close => '关闭';

  @override
  String get serverUrl => '服务器 URL';

  @override
  String get serverUrlHint => 'https://your-rybbit-instance.com';

  @override
  String get email => '邮箱';

  @override
  String get apiKey => 'API 密钥';

  @override
  String get password => '密码';

  @override
  String get showPassword => '显示密码';

  @override
  String get hidePassword => '隐藏密码';

  @override
  String get connect => '连接';

  @override
  String get connectionFailed => '连接失败。请检查服务器 URL。';

  @override
  String get invalidApiKey => '无效的 API 密钥';

  @override
  String get connectionFailedApiKey => '连接失败。请检查服务器 URL 和 API 密钥。';

  @override
  String get organizations => '组织';

  @override
  String get noSitesFound => '未找到站点';

  @override
  String get noSitesHint => '在 Web 仪表板中添加站点以开始使用。';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个站点',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return '成员 ($count)';
  }

  @override
  String get failedToLoadOrganizations => '加载组织失败';

  @override
  String get noOrganizations => '暂无组织';

  @override
  String get noOrganizationsHint => '可以在 Web 仪表板中创建组织';

  @override
  String get failedToLoadMembers => '加载成员失败';

  @override
  String get failedToLoadSites => '加载站点失败';

  @override
  String get failedToLoadAnalytics => '加载分析数据失败';

  @override
  String get noDataAvailable => '暂无可用数据';

  @override
  String get users => '用户';

  @override
  String get sessions => '会话';

  @override
  String get pageviews => '页面浏览量';

  @override
  String get pagesPerSession => '页面/会话';

  @override
  String get bounceRate => '跳出率';

  @override
  String get duration => '时长';

  @override
  String get metrics => '指标';

  @override
  String get pages => '页面';

  @override
  String get referrers => '引荐来源';

  @override
  String get countries => '国家/地区';

  @override
  String get devices => '设备';

  @override
  String get performance => '性能';

  @override
  String get goals => '目标';

  @override
  String get funnels => '漏斗';

  @override
  String get replay => '回放';

  @override
  String get config => '配置';

  @override
  String usersOnline(int count) {
    return '$count 位用户在线';
  }

  @override
  String get events => '事件';

  @override
  String get eventsOverTime => '事件趋势';

  @override
  String get eventNames => '事件名称';

  @override
  String get noCustomEventsTracked => '未跟踪自定义事件';

  @override
  String get failedToLoadProperties => '加载属性失败';

  @override
  String get noProperties => '暂无属性';

  @override
  String get outboundLinks => '外部链接';

  @override
  String get noOutboundLinksTracked => '未跟踪外部链接';

  @override
  String get failedToLoadChart => '加载图表失败';

  @override
  String get errors => '错误';

  @override
  String get failedToLoadErrors => '加载错误失败';

  @override
  String get noErrorsFound => '未发现错误';

  @override
  String get everythingLooksGood => '一切正常！';

  @override
  String get occurrences => '发生次数';

  @override
  String get sessionsAffected => '受影响的会话';

  @override
  String failedToLoadEventsWithError(String error) {
    return '加载事件失败：$error';
  }

  @override
  String get noEventsFound => '未找到事件';

  @override
  String get failedToLoadFunnels => '加载漏斗失败';

  @override
  String get noFunnelsSaved => '暂无已保存的漏斗';

  @override
  String get createFunnelsHint => '在 Web 仪表板中创建漏斗';

  @override
  String get deleteFunnel => '删除漏斗';

  @override
  String deleteFunnelConfirm(String name) {
    return '删除\"$name\"？';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return '删除漏斗失败：$error';
  }

  @override
  String get noStepsDefined => '此漏斗未定义步骤';

  @override
  String failedToAnalyze(String error) {
    return '分析失败：$error';
  }

  @override
  String get overallConversion => '整体转化率';

  @override
  String dropoff(String value) {
    return '流失：$value';
  }

  @override
  String get createGoal => '创建目标';

  @override
  String get failedToLoadGoals => '加载目标失败';

  @override
  String get noGoalsConfigured => '暂无已配置的目标';

  @override
  String get noGoalsHint => '点击 + 创建新目标';

  @override
  String get conversions => '转化';

  @override
  String get rate => '比率';

  @override
  String get editGoal => '编辑目标';

  @override
  String get createGoalTitle => '创建目标';

  @override
  String get name => '名称';

  @override
  String get type => '类型';

  @override
  String get path => '路径';

  @override
  String get event => '事件';

  @override
  String get pathPattern => '路径模式';

  @override
  String get eventName => '事件名称';

  @override
  String get deleteGoal => '删除目标';

  @override
  String deleteGoalConfirm(String name) {
    return '删除\"$name\"？';
  }

  @override
  String failedToDeleteGoal(String error) {
    return '删除目标失败：$error';
  }

  @override
  String get failedToLoadPerformanceData => '加载性能数据失败';

  @override
  String metricOverTime(String metric) {
    return '$metric趋势';
  }

  @override
  String get byDimension => '按维度';

  @override
  String get failedToLoadDimensionData => '加载维度数据失败';

  @override
  String get good => '良好';

  @override
  String get needsImprovement => '需要改进';

  @override
  String get poor => '较差';

  @override
  String get largestContentfulPaint => '最大内容绘制';

  @override
  String get cumulativeLayoutShift => '累计布局偏移';

  @override
  String get firstContentfulPaint => '首次内容绘制';

  @override
  String get timeToFirstByte => '首字节时间';

  @override
  String get interactionToNextPaint => '交互到下一次绘制';

  @override
  String get dimPages => '页面';

  @override
  String get dimCountries => '国家/地区';

  @override
  String get dimDevices => '设备';

  @override
  String get dimBrowsers => '浏览器';

  @override
  String get dimOS => '操作系统';

  @override
  String get sessionFilters => '会话筛选';

  @override
  String get minPageviews => '最少页面浏览量';

  @override
  String get minEvents => '最少事件数';

  @override
  String get minDurationSeconds => '最短时长（秒）';

  @override
  String get failedToLoadSessions => '加载会话失败';

  @override
  String get noSessionsFound => '未找到会话';

  @override
  String get filterSessions => '筛选会话';

  @override
  String get loadingMoreSessions => '正在加载更多会话';

  @override
  String entryPage(String page) {
    return '入口页面：$page';
  }

  @override
  String nPages(int count) {
    return '$count 个页面';
  }

  @override
  String get sessionReplays => '会话回放';

  @override
  String get failedToLoadReplays => '加载回放失败';

  @override
  String get noReplaysFound => '未找到回放';

  @override
  String get noReplaysHint => '启用后，会话回放将显示在此处。';

  @override
  String get previousPage => '上一页';

  @override
  String get nextPage => '下一页';

  @override
  String pageNumber(int number) {
    return '第 $number 页';
  }

  @override
  String get unknownBrowser => '未知浏览器';

  @override
  String get unknownCountry => '未知国家/地区';

  @override
  String get sortUsers => '排序用户';

  @override
  String get showAllUsers => '显示所有用户';

  @override
  String get showIdentifiedOnly => '仅显示已识别用户';

  @override
  String get searchUsers => '搜索用户';

  @override
  String get searchUsersHint => '搜索用户…';

  @override
  String get clearSearch => '清除搜索';

  @override
  String get failedToLoadUsers => '加载用户失败';

  @override
  String get noUsersFound => '未找到用户';

  @override
  String get noIdentifiedUsers => '暂无已识别用户';

  @override
  String get usersWillAppear => '用户被识别后将显示在此处';

  @override
  String get tryDifferentSearch => '尝试其他搜索词';

  @override
  String get sortedBy => '排序方式';

  @override
  String get loadingMoreUsers => '正在加载更多用户';

  @override
  String get lastSeen => '最后在线';

  @override
  String get firstSeen => '首次在线';

  @override
  String nUsers(String count) {
    return '$count 位用户';
  }

  @override
  String nSessions(int count) {
    return '$count 个会话';
  }

  @override
  String lastPrefix(String value) {
    return '上次：$value';
  }

  @override
  String get failedToLoadSiteConfig => '加载站点配置失败';

  @override
  String get failedToLoadMetrics => '加载指标失败';

  @override
  String get loadingMoreMetrics => '正在加载更多指标';

  @override
  String noMetricData(String metric) {
    return '暂无$metric数据';
  }

  @override
  String get settings => '设置';

  @override
  String get connection => '连接';

  @override
  String get notConfigured => '未配置';

  @override
  String get authMethod => '认证方式';

  @override
  String get sessionCookie => '会话 Cookie';

  @override
  String get loggedInAs => '登录身份';

  @override
  String get unknown => '未知';

  @override
  String get appearance => '外观';

  @override
  String get theme => '主题';

  @override
  String get dark => '深色';

  @override
  String get light => '浅色';

  @override
  String get auto => '自动';

  @override
  String get about => '关于';

  @override
  String get appVersion => '应用版本';

  @override
  String get openSourceAnalytics => '开源 Web 分析工具';

  @override
  String get developer => '开发者';

  @override
  String get sourceCode => '源代码';

  @override
  String get viewOnGitHub => '在 GitHub 上查看';

  @override
  String get unofficialClient => 'Rybbit 分析平台非官方移动客户端';

  @override
  String get madeBy => '由 NKS Hub 制作';

  @override
  String get logoutConfirm => '确定要退出登录吗？';

  @override
  String get siteSettings => '站点设置';

  @override
  String get siteInformation => '站点信息';

  @override
  String get domain => '域名';

  @override
  String get siteId => '站点 ID';

  @override
  String siteLabel(String id) {
    return '站点 $id';
  }

  @override
  String get created => '创建时间';

  @override
  String get trackingSettings => '跟踪设置';

  @override
  String get publicDashboard => '公开仪表板';

  @override
  String get publicDashboardDesc => '允许公开访问分析数据';

  @override
  String get sessionReplay => '会话回放';

  @override
  String get sessionReplayDesc => '录制用户会话';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => '跟踪核心 Web 指标';

  @override
  String get trackErrors => '错误跟踪';

  @override
  String get trackErrorsDesc => '捕获 JavaScript 错误';

  @override
  String get outboundLinksTracking => '外部链接';

  @override
  String get outboundLinksDesc => '跟踪外部链接点击';

  @override
  String get excludedIps => '排除的 IP';

  @override
  String get excludedCountries => '排除的国家/地区';

  @override
  String get settingsSaved => '设置已保存';

  @override
  String failedToSave(String error) {
    return '保存失败：$error';
  }

  @override
  String get timeRange => '时间范围';

  @override
  String get today => '今天';

  @override
  String get yesterday => '昨天';

  @override
  String get last7Days => '过去 7 天';

  @override
  String get last30Days => '过去 30 天';

  @override
  String get thisWeek => '本周';

  @override
  String get thisMonth => '本月';

  @override
  String get thisYear => '今年';

  @override
  String get customRange => '自定义范围';

  @override
  String get allTime => '所有时间';

  @override
  String lastMinutes(int count) {
    return '最近$count分钟';
  }

  @override
  String get notSet => '(未设置)';

  @override
  String get bouncePrefix => '跳出率';

  @override
  String get timePrefix => '时间';

  @override
  String get eventTypePageview => '页面浏览';

  @override
  String get eventTypeCustom => '自定义';

  @override
  String get eventTypeOutbound => '外部';

  @override
  String get eventTypeClick => '点击';

  @override
  String get eventTypeForm => '表单';

  @override
  String get eventTypeInput => '输入';

  @override
  String get eventTypeCopy => '复制';

  @override
  String get filter => '筛选';

  @override
  String get addFilter => '添加筛选';

  @override
  String get parameter => '参数';

  @override
  String get value => '值';

  @override
  String get enterFilterValue => '输入筛选值';

  @override
  String get filterBrowser => '浏览器';

  @override
  String get filterOs => '操作系统';

  @override
  String get filterLanguage => '语言';

  @override
  String get filterCountry => '国家';

  @override
  String get filterRegion => '地区';

  @override
  String get filterCity => '城市';

  @override
  String get filterDeviceType => '设备类型';

  @override
  String get filterReferrer => '来源页';

  @override
  String get filterHostname => '主机名';

  @override
  String get filterPathname => '路径';

  @override
  String get filterPageTitle => '页面标题';

  @override
  String get filterQuerystring => '查询字符串';

  @override
  String get filterEventName => '事件名称';

  @override
  String get filterChannel => '渠道';

  @override
  String get filterUtmSource => 'UTM来源';

  @override
  String get filterUtmMedium => 'UTM媒介';

  @override
  String get filterUtmCampaign => 'UTM活动';

  @override
  String get filterUtmTerm => 'UTM术语';

  @override
  String get filterUtmContent => 'UTM内容';

  @override
  String get filterEntryPage => '入口页';

  @override
  String get filterExitPage => '出口页';

  @override
  String get requestTimedOut => '请求超时，请重试。';

  @override
  String get networkError => '网络错误，请检查您的连接。';

  @override
  String get sessionExpired => '会话已过期，请重新登录。';

  @override
  String get accessDenied => '访问被拒绝。';

  @override
  String get dataNotFound => '未找到数据。';

  @override
  String get serverError => '服务器错误，请稍后重试。';

  @override
  String get failedToLoadGeneric => '加载数据失败，请重试。';

  @override
  String chartDataPoints(int count) {
    return '图表包含 $count 个数据点';
  }

  @override
  String previousPrefix(String value) {
    return '上期：$value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return '性能评级：$rating';
  }

  @override
  String get loadingContent => '正在加载内容';

  @override
  String get language => '语言';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get failedToLoadUserDetails => '加载用户详情失败';

  @override
  String lastSeenPrefix(String value) {
    return '最后在线：$value';
  }

  @override
  String get traits => '用户属性';

  @override
  String get noTraits => '该用户没有设置属性';

  @override
  String get sessionDetail => '会话详情';

  @override
  String get failedToLoadSession => '加载会话失败';

  @override
  String get entryPageLabel => '入口页面';

  @override
  String get exitPage => '出口页面';

  @override
  String get browserAndDevice => '浏览器和设备';

  @override
  String get browser => '浏览器';

  @override
  String get os => '操作系统';

  @override
  String get device => '设备';

  @override
  String get sourceLabel => '来源';

  @override
  String get referrer => '引荐来源';

  @override
  String eventTimelineCount(int count) {
    return '事件时间线 ($count)';
  }

  @override
  String get noEvents => '暂无事件';

  @override
  String get replayEventsTitle => '回放事件';

  @override
  String get failedToLoadReplay => '加载回放失败';

  @override
  String get noReplayEvents => '暂无回放事件';

  @override
  String get totalEvents => '事件总计';

  @override
  String get userActionsLabel => '用户操作';

  @override
  String eventTimelineActions(int count) {
    return '事件时间线（$count 个操作）';
  }

  @override
  String get eventLog => '事件日志';

  @override
  String get viewEventLog => '查看事件日志';

  @override
  String get failedToLoadEventLog => '无法加载事件日志';

  @override
  String get activityHeatmap => '热力图';

  @override
  String get heatmapLast4Weeks => '最近4周';

  @override
  String get less => '较少';

  @override
  String get more => '较多';

  @override
  String get peakActivity => '峰值活动';

  @override
  String peakHour(String day, String time) {
    return '$day $time';
  }

  @override
  String busiestDay(String day) {
    return '最繁忙的一天：$day';
  }

  @override
  String get dayMon => '周一';

  @override
  String get dayTue => '周二';

  @override
  String get dayWed => '周三';

  @override
  String get dayThu => '周四';

  @override
  String get dayFri => '周五';

  @override
  String get daySat => '周六';

  @override
  String get daySun => '周日';

  @override
  String get searchEvents => '搜索事件...';

  @override
  String get allTypes => '全部';

  @override
  String get allOrganizations => '所有组织';

  @override
  String get noMatchingEvents => '没有匹配的事件';

  @override
  String get liveView => '实时';

  @override
  String get autoRefresh => '自动刷新';

  @override
  String get usersOnlineNow => '当前在线用户';

  @override
  String lastUpdatedAt(String time) {
    return '更新于 $time';
  }

  @override
  String get last30Minutes => '最近30分钟';

  @override
  String get last5Minutes => '最近5分钟';

  @override
  String get recentEvents => '最近事件';

  @override
  String get noRecentEvents => '没有最近的事件';

  @override
  String get retention => '留存率';

  @override
  String get weekly => '按周';

  @override
  String get daily => '按天';

  @override
  String get retentionRange => '范围';

  @override
  String retentionDays(int count) {
    return '$count天';
  }

  @override
  String get failedToLoadRetention => '加载留存数据失败';

  @override
  String get noRetentionData => '无留存数据';

  @override
  String get cohort => '队列';

  @override
  String get retentionWeekPrefix => 'W';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => '用户路径';

  @override
  String get journeySteps => '步骤';

  @override
  String get failedToLoadJourneys => '加载用户路径失败';

  @override
  String get noJourneysFound => '未找到用户路径';

  @override
  String journeySessions(String count) {
    return '$count个会话';
  }

  @override
  String get locations => '位置';

  @override
  String get locationCities => '城市';

  @override
  String get failedToLoadLocations => '加载位置数据失败';

  @override
  String get noLocationsFound => '未找到位置数据';

  @override
  String get coreFeatures => '核心';

  @override
  String get insights => '洞察';

  @override
  String get tools => '工具';

  @override
  String get userTraits => '用户特征';

  @override
  String get failedToLoadUserTraits => '加载用户特征失败';

  @override
  String get noUserTraits => '未找到用户特征';

  @override
  String get noUserTraitsHint => '当用户使用自定义属性标识时将显示特征';

  @override
  String traitUsersCount(String count) {
    return '$count个用户';
  }

  @override
  String get dashboard => '仪表板';

  @override
  String get analytics => '分析';

  @override
  String get noSiteSelected => '未选择站点';

  @override
  String selectSiteFromDashboard(String tabName) {
    return '从仪表板选项卡中选择一个站点以查看$tabName。';
  }

  @override
  String get goToDashboard => '前往仪表板';

  @override
  String todayVisitors(int count) {
    return '今天$count人';
  }

  @override
  String get entryPages => '入口页面';

  @override
  String get exitPages => '出口页面';

  @override
  String get browsers => '浏览器';

  @override
  String get operatingSystems => '操作系统';

  @override
  String get utmSource => 'UTM来源';

  @override
  String get channel => '渠道';

  @override
  String get pageTitles => '页面标题';

  @override
  String get sources => '来源';

  @override
  String get cities => '城市';

  @override
  String get languages => '语言';

  @override
  String get hostnames => '主机名';

  @override
  String get vpn => 'VPN';

  @override
  String get crawlers => '爬虫';

  @override
  String get datacenters => '数据中心';

  @override
  String get companies => '公司';

  @override
  String get companyType => '公司类型';

  @override
  String get companyDomain => '公司域名';

  @override
  String get asnOrg => 'ASN组织';

  @override
  String get asnType => 'ASN类型';

  @override
  String get asnDomain => 'ASN域名';

  @override
  String get utmMedium => 'UTM媒介';

  @override
  String get utmCampaign => 'UTM活动';

  @override
  String nMoreItems(int count) {
    return '+$count个更多';
  }

  @override
  String sessionsWithPercentage(String count, String percentage) {
    return '$count个会话 ($percentage%)';
  }

  @override
  String errorGeneric(String error) {
    return '错误: $error';
  }

  @override
  String get replayPageSnapshot => '页面快照';

  @override
  String get replayPageLoad => '页面加载';

  @override
  String get replayCustomEvent => '自定义事件';

  @override
  String get replayPluginEvent => '插件事件';

  @override
  String get replayInteraction => '交互';

  @override
  String get replayScroll => '滚动';

  @override
  String get replayResize => '调整大小';

  @override
  String get replayInput => '输入';

  @override
  String get replayUpdate => '更新';

  @override
  String get url => 'URL';

  @override
  String get searchSites => '搜索站点...';

  @override
  String get sortSites => '排序站点';

  @override
  String get sortAlphabetically => '按字母顺序';

  @override
  String get sortByCount => '按数量排序';

  @override
  String get sortByVisitors => '按今日访客';

  @override
  String get sortByLiveUsers => '按在线用户';

  @override
  String get noMatchingSites => '没有匹配的站点';

  @override
  String get utmTerm => 'UTM术语';

  @override
  String get utmContent => 'UTM内容';

  @override
  String get browserVersions => '浏览器版本';

  @override
  String get osVersions => '操作系统版本';

  @override
  String get screenDimensions => '屏幕尺寸';

  @override
  String get relativeNow => '现在';

  @override
  String relativeMinutes(int count) {
    return '$count分钟';
  }

  @override
  String relativeHours(int count) {
    return '$count小时';
  }

  @override
  String relativeDays(int count) {
    return '$count天';
  }

  @override
  String relativeWeeks(int count) {
    return '$count周';
  }

  @override
  String get emptyValue => '(空)';
}
