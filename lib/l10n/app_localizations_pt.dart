// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => 'Não oficial';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Excluir';

  @override
  String get save => 'Salvar';

  @override
  String get update => 'Atualizar';

  @override
  String get create => 'Criar';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get add => 'Adicionar';

  @override
  String get edit => 'Editar';

  @override
  String get clear => 'Limpar';

  @override
  String get apply => 'Aplicar';

  @override
  String get goBack => 'Voltar';

  @override
  String get noData => 'Sem dados';

  @override
  String get loading => 'Carregando';

  @override
  String get logout => 'Sair';

  @override
  String get close => 'Fechar';

  @override
  String get serverUrl => 'URL do servidor';

  @override
  String get serverUrlHint => 'https://sua-instancia-rybbit.com';

  @override
  String get email => 'E-mail';

  @override
  String get apiKey => 'API Key';

  @override
  String get password => 'Senha';

  @override
  String get connect => 'Conectar';

  @override
  String get organizations => 'Organizações';

  @override
  String get noSitesFound => 'Nenhum site encontrado';

  @override
  String get noSitesHint => 'Adicione um site no painel web para começar.';

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
    return 'Membros ($count)';
  }

  @override
  String get failedToLoadOrganizations => 'Falha ao carregar organizações';

  @override
  String get noOrganizations => 'Nenhuma organização';

  @override
  String get noOrganizationsHint =>
      'As organizações podem ser criadas no painel web';

  @override
  String get failedToLoadMembers => 'Falha ao carregar membros';

  @override
  String get failedToLoadSites => 'Falha ao carregar sites';

  @override
  String get failedToLoadAnalytics => 'Falha ao carregar análises';

  @override
  String get noDataAvailable => 'Nenhum dado disponível';

  @override
  String get users => 'Usuários';

  @override
  String get sessions => 'Sessões';

  @override
  String get pageviews => 'Visualizações de página';

  @override
  String get pagesPerSession => 'Páginas/Sessão';

  @override
  String get bounceRate => 'Taxa de rejeição';

  @override
  String get duration => 'Duração';

  @override
  String get metrics => 'Métricas';

  @override
  String get pages => 'Páginas';

  @override
  String get referrers => 'Referências';

  @override
  String get countries => 'Países';

  @override
  String get devices => 'Dispositivos';

  @override
  String get performance => 'Desempenho';

  @override
  String get goals => 'Metas';

  @override
  String get funnels => 'Funis';

  @override
  String get replay => 'Reprodução';

  @override
  String get config => 'Configuração';

  @override
  String usersOnline(int count) {
    return '$count usuários online';
  }

  @override
  String get events => 'Eventos';

  @override
  String get eventsOverTime => 'Eventos ao longo do tempo';

  @override
  String get eventNames => 'Nomes dos eventos';

  @override
  String get noCustomEventsTracked => 'Nenhum evento personalizado rastreado';

  @override
  String get failedToLoadProperties => 'Falha ao carregar propriedades';

  @override
  String get noProperties => 'Nenhuma propriedade';

  @override
  String get outboundLinks => 'Links externos';

  @override
  String get noOutboundLinksTracked => 'Nenhum link externo rastreado';

  @override
  String get failedToLoadChart => 'Falha ao carregar gráfico';

  @override
  String get errors => 'Erros';

  @override
  String get failedToLoadErrors => 'Falha ao carregar erros';

  @override
  String get noErrorsFound => 'Nenhum erro encontrado';

  @override
  String get everythingLooksGood => 'Tudo parece estar bem!';

  @override
  String get occurrences => 'ocorrências';

  @override
  String get sessionsAffected => 'sessões afetadas';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'Falha ao carregar eventos: $error';
  }

  @override
  String get noEventsFound => 'Nenhum evento encontrado';

  @override
  String get failedToLoadFunnels => 'Falha ao carregar funis';

  @override
  String get noFunnelsSaved => 'Nenhum funil salvo';

  @override
  String get createFunnelsHint => 'Crie funis no painel web';

  @override
  String get deleteFunnel => 'Excluir funil';

  @override
  String deleteFunnelConfirm(String name) {
    return 'Excluir \"$name\"?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'Falha ao excluir funil: $error';
  }

  @override
  String get noStepsDefined => 'Nenhuma etapa definida para este funil';

  @override
  String failedToAnalyze(String error) {
    return 'Falha ao analisar: $error';
  }

  @override
  String get overallConversion => 'Conversão geral';

  @override
  String dropoff(String value) {
    return 'Desistência: $value';
  }

  @override
  String get createGoal => 'Criar meta';

  @override
  String get failedToLoadGoals => 'Falha ao carregar metas';

  @override
  String get noGoalsConfigured => 'Nenhuma meta configurada';

  @override
  String get noGoalsHint => 'Toque em + para criar uma nova meta';

  @override
  String get conversions => 'Conversões';

  @override
  String get rate => 'Taxa';

  @override
  String get editGoal => 'Editar meta';

  @override
  String get createGoalTitle => 'Criar meta';

  @override
  String get name => 'Nome';

  @override
  String get type => 'Tipo';

  @override
  String get path => 'Caminho';

  @override
  String get event => 'Evento';

  @override
  String get pathPattern => 'Padrão de caminho';

  @override
  String get eventName => 'Nome do evento';

  @override
  String get deleteGoal => 'Excluir meta';

  @override
  String deleteGoalConfirm(String name) {
    return 'Excluir \"$name\"?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'Falha ao excluir meta: $error';
  }

  @override
  String get failedToLoadPerformanceData =>
      'Falha ao carregar dados de desempenho';

  @override
  String metricOverTime(String metric) {
    return '$metric ao longo do tempo';
  }

  @override
  String get byDimension => 'Por dimensão';

  @override
  String get failedToLoadDimensionData => 'Falha ao carregar dados de dimensão';

  @override
  String get good => 'Bom';

  @override
  String get needsImprovement => 'Precisa melhorar';

  @override
  String get poor => 'Ruim';

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
  String get dimPages => 'Páginas';

  @override
  String get dimCountries => 'Países';

  @override
  String get dimDevices => 'Dispositivos';

  @override
  String get dimBrowsers => 'Navegadores';

  @override
  String get dimOS => 'SO';

  @override
  String get sessionFilters => 'Filtros de sessão';

  @override
  String get minPageviews => 'Mín. de visualizações de página';

  @override
  String get minEvents => 'Mín. de eventos';

  @override
  String get minDurationSeconds => 'Duração mín. (segundos)';

  @override
  String get failedToLoadSessions => 'Falha ao carregar sessões';

  @override
  String get noSessionsFound => 'Nenhuma sessão encontrada';

  @override
  String get filterSessions => 'Filtrar sessões';

  @override
  String get loadingMoreSessions => 'Carregando mais sessões';

  @override
  String entryPage(String page) {
    return 'Página de entrada: $page';
  }

  @override
  String nPages(int count) {
    return '$count páginas';
  }

  @override
  String get sessionReplays => 'Reproduções de sessão';

  @override
  String get failedToLoadReplays => 'Falha ao carregar reproduções';

  @override
  String get noReplaysFound => 'Nenhuma reprodução encontrada';

  @override
  String get noReplaysHint =>
      'As reproduções de sessão aparecerão aqui quando habilitadas.';

  @override
  String get previousPage => 'Página anterior';

  @override
  String get nextPage => 'Próxima página';

  @override
  String pageNumber(int number) {
    return 'Página $number';
  }

  @override
  String get unknownBrowser => 'Navegador desconhecido';

  @override
  String get unknownCountry => 'País desconhecido';

  @override
  String get sortUsers => 'Ordenar usuários';

  @override
  String get showAllUsers => 'Mostrar todos os usuários';

  @override
  String get showIdentifiedOnly => 'Mostrar apenas identificados';

  @override
  String get searchUsers => 'Pesquisar usuários';

  @override
  String get searchUsersHint => 'Pesquisar usuários...';

  @override
  String get clearSearch => 'Limpar pesquisa';

  @override
  String get failedToLoadUsers => 'Falha ao carregar usuários';

  @override
  String get noUsersFound => 'Nenhum usuário encontrado';

  @override
  String get noIdentifiedUsers => 'Nenhum usuário identificado';

  @override
  String get usersWillAppear =>
      'Os usuários aparecerão quando forem identificados';

  @override
  String get tryDifferentSearch => 'Tente um termo de pesquisa diferente';

  @override
  String get sortedBy => 'Ordenado por';

  @override
  String get loadingMoreUsers => 'Carregando mais usuários';

  @override
  String get lastSeen => 'Visto por último';

  @override
  String get firstSeen => 'Visto pela primeira vez';

  @override
  String nUsers(String count) {
    return '$count utilizadores';
  }

  @override
  String nSessions(int count) {
    return '$count sessões';
  }

  @override
  String lastPrefix(String value) {
    return 'Último: $value';
  }

  @override
  String get failedToLoadSiteConfig =>
      'Falha ao carregar a configuração do site';

  @override
  String get failedToLoadMetrics => 'Falha ao carregar métricas';

  @override
  String get loadingMoreMetrics => 'Carregando mais métricas';

  @override
  String noMetricData(String metric) {
    return 'Sem dados de $metric';
  }

  @override
  String get settings => 'Configurações';

  @override
  String get connection => 'Conexão';

  @override
  String get notConfigured => 'Não configurado';

  @override
  String get authMethod => 'Método de autenticação';

  @override
  String get sessionCookie => 'Cookie de sessão';

  @override
  String get loggedInAs => 'Conectado como';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get appearance => 'Aparência';

  @override
  String get theme => 'Tema';

  @override
  String get dark => 'Escuro';

  @override
  String get light => 'Claro';

  @override
  String get auto => 'Automático';

  @override
  String get about => 'Sobre';

  @override
  String get appVersion => 'Versão do aplicativo';

  @override
  String get openSourceAnalytics => 'Análise web de código aberto';

  @override
  String get logoutConfirm => 'Tem certeza de que deseja sair?';

  @override
  String get siteSettings => 'Configurações do site';

  @override
  String get siteInformation => 'Informações do site';

  @override
  String get domain => 'Domínio';

  @override
  String get siteId => 'ID do site';

  @override
  String get created => 'Criado';

  @override
  String get trackingSettings => 'Configurações de rastreamento';

  @override
  String get publicDashboard => 'Painel público';

  @override
  String get publicDashboardDesc => 'Permitir acesso público às análises';

  @override
  String get sessionReplay => 'Reprodução de sessão';

  @override
  String get sessionReplayDesc => 'Gravar sessões de usuários';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Rastrear Core Web Vitals';

  @override
  String get trackErrors => 'Rastrear erros';

  @override
  String get trackErrorsDesc => 'Capturar erros de JavaScript';

  @override
  String get outboundLinksTracking => 'Links externos';

  @override
  String get outboundLinksDesc => 'Rastrear cliques em links externos';

  @override
  String get excludedIps => 'IPs excluídos';

  @override
  String get excludedCountries => 'Países excluídos';

  @override
  String get settingsSaved => 'Configurações salvas';

  @override
  String failedToSave(String error) {
    return 'Falha ao salvar: $error';
  }

  @override
  String get timeRange => 'Período';

  @override
  String get today => 'Hoje';

  @override
  String get yesterday => 'Ontem';

  @override
  String get last7Days => 'Últimos 7 dias';

  @override
  String get last30Days => 'Últimos 30 dias';

  @override
  String get thisWeek => 'Esta semana';

  @override
  String get thisMonth => 'Este mês';

  @override
  String get thisYear => 'Este ano';

  @override
  String get customRange => 'Período personalizado';

  @override
  String get filter => 'Filtro';

  @override
  String get addFilter => 'Adicionar filtro';

  @override
  String get parameter => 'Parâmetro';

  @override
  String get value => 'Valor';

  @override
  String get enterFilterValue => 'Insira o valor do filtro';

  @override
  String get requestTimedOut =>
      'A solicitação expirou. Por favor, tente novamente.';

  @override
  String get networkError => 'Erro de rede. Verifique sua conexão.';

  @override
  String get sessionExpired =>
      'Sessão expirada. Por favor, faça login novamente.';

  @override
  String get accessDenied => 'Acesso negado.';

  @override
  String get dataNotFound => 'Dados não encontrados.';

  @override
  String get serverError =>
      'Erro no servidor. Por favor, tente novamente mais tarde.';

  @override
  String get failedToLoadGeneric =>
      'Falha ao carregar dados. Por favor, tente novamente.';

  @override
  String chartDataPoints(int count) {
    return 'Gráfico com $count pontos de dados';
  }

  @override
  String previousPrefix(String value) {
    return 'Ant.: $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'Classificação de desempenho: $rating';
  }

  @override
  String get loadingContent => 'Carregando conteúdo';

  @override
  String get language => 'Idioma';

  @override
  String get selectLanguage => 'Selecionar idioma';

  @override
  String get failedToLoadUserDetails =>
      'Falha ao carregar detalhes do utilizador';

  @override
  String lastSeenPrefix(String value) {
    return 'Visto pela última vez: $value';
  }

  @override
  String get traits => 'Propriedades';

  @override
  String get noTraits => 'Sem propriedades para este utilizador';

  @override
  String get sessionDetail => 'Detalhe da sessão';

  @override
  String get failedToLoadSession => 'Falha ao carregar a sessão';

  @override
  String get entryPageLabel => 'Página de entrada';

  @override
  String get exitPage => 'Página de saída';

  @override
  String get browserAndDevice => 'Navegador e dispositivo';

  @override
  String get browser => 'Navegador';

  @override
  String get os => 'SO';

  @override
  String get device => 'Dispositivo';

  @override
  String get sourceLabel => 'Fonte';

  @override
  String get referrer => 'Referência';

  @override
  String eventTimelineCount(int count) {
    return 'Linha do tempo ($count)';
  }

  @override
  String get noEvents => 'Sem eventos';

  @override
  String get replayEventsTitle => 'Eventos de reprodução';

  @override
  String get failedToLoadReplay => 'Falha ao carregar a reprodução';

  @override
  String get noReplayEvents => 'Sem eventos de reprodução';

  @override
  String get totalEvents => 'Total de eventos';

  @override
  String get userActionsLabel => 'Ações do utilizador';

  @override
  String eventTimelineActions(int count) {
    return 'Linha do tempo ($count ações)';
  }

  @override
  String get eventLog => 'Registro de eventos';

  @override
  String get viewEventLog => 'Ver registro de eventos';

  @override
  String get failedToLoadEventLog => 'Falha ao carregar o registro de eventos';

  @override
  String get activityHeatmap => 'Mapa de calor';

  @override
  String get heatmapLast4Weeks => 'Últimas 4 semanas';

  @override
  String get less => 'Menos';

  @override
  String get more => 'Mais';

  @override
  String get peakActivity => 'Pico de atividade';

  @override
  String peakHour(String day, String time) {
    return '$day às $time';
  }

  @override
  String busiestDay(String day) {
    return 'Dia mais movimentado: $day';
  }

  @override
  String get dayMon => 'Seg';

  @override
  String get dayTue => 'Ter';

  @override
  String get dayWed => 'Qua';

  @override
  String get dayThu => 'Qui';

  @override
  String get dayFri => 'Sex';

  @override
  String get daySat => 'Sáb';

  @override
  String get daySun => 'Dom';

  @override
  String get searchEvents => 'Pesquisar eventos...';

  @override
  String get allTypes => 'Todos';

  @override
  String get noMatchingEvents => 'Nenhum evento correspondente';

  @override
  String get liveView => 'Ao vivo';

  @override
  String get autoRefresh => 'Atualização automática';

  @override
  String get usersOnlineNow => 'Usuários online agora';

  @override
  String lastUpdatedAt(String time) {
    return 'Atualizado às $time';
  }

  @override
  String get last30Minutes => 'Últimos 30 minutos';

  @override
  String get last5Minutes => 'Últimos 5 min';

  @override
  String get recentEvents => 'Eventos recentes';

  @override
  String get noRecentEvents => 'Nenhum evento recente';

  @override
  String get retention => 'Retenção';

  @override
  String get weekly => 'Semanal';

  @override
  String get daily => 'Diário';

  @override
  String get retentionRange => 'Intervalo';

  @override
  String retentionDays(int count) {
    return '$count dias';
  }

  @override
  String get failedToLoadRetention => 'Falha ao carregar dados de retenção';

  @override
  String get noRetentionData => 'Sem dados de retenção';

  @override
  String get cohort => 'Coorte';

  @override
  String get retentionWeekPrefix => 'S';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => 'Jornadas';

  @override
  String get journeySteps => 'Etapas';

  @override
  String get failedToLoadJourneys => 'Falha ao carregar jornadas';

  @override
  String get noJourneysFound => 'Nenhuma jornada encontrada';

  @override
  String journeySessions(String count) {
    return '$count sessões';
  }

  @override
  String get locations => 'Localizações';

  @override
  String get locationCities => 'Cidades';

  @override
  String get failedToLoadLocations => 'Falha ao carregar localizações';

  @override
  String get noLocationsFound => 'Nenhuma localização encontrada';

  @override
  String get coreFeatures => 'Principal';

  @override
  String get insights => 'Análises';

  @override
  String get tools => 'Ferramentas';

  @override
  String get userTraits => 'Atributos';

  @override
  String get failedToLoadUserTraits =>
      'Falha ao carregar atributos dos usuários';

  @override
  String get noUserTraits => 'Nenhum atributo encontrado';

  @override
  String get noUserTraitsHint =>
      'Os atributos aparecerão quando os usuários forem identificados com propriedades personalizadas';

  @override
  String traitUsersCount(String count) {
    return '$count usuários';
  }

  @override
  String get dashboard => 'Painel';

  @override
  String get analytics => 'Análise';

  @override
  String get noSiteSelected => 'Nenhum site selecionado';

  @override
  String selectSiteFromDashboard(String tabName) {
    return 'Selecione um site na aba Painel para ver $tabName.';
  }

  @override
  String get goToDashboard => 'Ir para o painel';

  @override
  String todayVisitors(int count) {
    return '$count hoje';
  }

  @override
  String get entryPages => 'Páginas de entrada';

  @override
  String get exitPages => 'Páginas de saída';

  @override
  String get browsers => 'Navegadores';

  @override
  String get operatingSystems => 'SO';

  @override
  String get utmSource => 'Fonte UTM';

  @override
  String get channel => 'Canal';

  @override
  String get pageTitles => 'Títulos de página';

  @override
  String get sources => 'Fontes';

  @override
  String get cities => 'Cidades';

  @override
  String get languages => 'Idiomas';

  @override
  String get hostnames => 'Nomes de host';

  @override
  String get vpn => 'VPN';

  @override
  String get crawlers => 'Rastreadores';

  @override
  String get datacenters => 'Data centers';

  @override
  String get companies => 'Empresas';

  @override
  String get companyType => 'Tipo de empresa';

  @override
  String get companyDomain => 'Domínio da empresa';

  @override
  String get asnOrg => 'Organização ASN';

  @override
  String get asnType => 'Tipo ASN';

  @override
  String get asnDomain => 'Domínio ASN';

  @override
  String get utmMedium => 'UTM Meio';

  @override
  String get utmCampaign => 'UTM Campanha';

  @override
  String nMoreItems(int count) {
    return '+$count mais';
  }

  @override
  String sessionsWithPercentage(String count, String percentage) {
    return '$count sessões ($percentage%)';
  }

  @override
  String errorGeneric(String error) {
    return 'Erro: $error';
  }

  @override
  String get replayPageSnapshot => 'Captura de página';

  @override
  String get replayPageLoad => 'Carregamento de página';

  @override
  String get replayCustomEvent => 'Evento personalizado';

  @override
  String get replayPluginEvent => 'Evento de plugin';

  @override
  String get replayInteraction => 'Interação';

  @override
  String get replayScroll => 'Rolagem';

  @override
  String get replayResize => 'Redimensionamento';

  @override
  String get replayInput => 'Entrada';

  @override
  String get replayUpdate => 'Atualização';

  @override
  String get url => 'URL';

  @override
  String get searchSites => 'Pesquisar sites...';

  @override
  String get sortSites => 'Ordenar sites';

  @override
  String get sortAlphabetically => 'Alfabeticamente';

  @override
  String get sortByCount => 'Ordenar por contagem';

  @override
  String get sortByVisitors => 'Por visitantes hoje';

  @override
  String get sortByLiveUsers => 'Por utilizadores online';

  @override
  String get noMatchingSites => 'Nenhum site correspondente';

  @override
  String get utmTerm => 'UTM Termo';

  @override
  String get utmContent => 'UTM Conteúdo';

  @override
  String get browserVersions => 'Versões do navegador';

  @override
  String get osVersions => 'Versões do SO';

  @override
  String get screenDimensions => 'Dimensões da tela';

  @override
  String get relativeNow => 'agora';

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
    return '${count}sem';
  }

  @override
  String get emptyValue => '(vazio)';
}
