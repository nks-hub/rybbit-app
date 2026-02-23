// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Rybbit';

  @override
  String get appSubtitle => 'No oficial';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get save => 'Guardar';

  @override
  String get update => 'Actualizar';

  @override
  String get create => 'Crear';

  @override
  String get retry => 'Reintentar';

  @override
  String get add => 'Agregar';

  @override
  String get edit => 'Editar';

  @override
  String get clear => 'Limpiar';

  @override
  String get apply => 'Aplicar';

  @override
  String get goBack => 'Volver';

  @override
  String get noData => 'Sin datos';

  @override
  String get loading => 'Cargando';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get close => 'Cerrar';

  @override
  String get serverUrl => 'URL del servidor';

  @override
  String get serverUrlHint => 'https://tu-instancia-rybbit.com';

  @override
  String get email => 'Correo electrónico';

  @override
  String get apiKey => 'API Key';

  @override
  String get password => 'Contraseña';

  @override
  String get connect => 'Conectar';

  @override
  String get organizations => 'Organizaciones';

  @override
  String get noSitesFound => 'No se encontraron sitios';

  @override
  String get noSitesHint => 'Agrega un sitio en el panel web para comenzar.';

  @override
  String siteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sitios',
      one: '1 sitio',
    );
    return '$_temp0';
  }

  @override
  String members(int count) {
    return 'Miembros ($count)';
  }

  @override
  String get failedToLoadOrganizations => 'Error al cargar las organizaciones';

  @override
  String get noOrganizations => 'Sin organizaciones';

  @override
  String get noOrganizationsHint =>
      'Las organizaciones se pueden crear en el panel web';

  @override
  String get failedToLoadMembers => 'Error al cargar los miembros';

  @override
  String get failedToLoadSites => 'Error al cargar los sitios';

  @override
  String get failedToLoadAnalytics => 'Error al cargar las analíticas';

  @override
  String get noDataAvailable => 'No hay datos disponibles';

  @override
  String get users => 'Usuarios';

  @override
  String get sessions => 'Sesiones';

  @override
  String get pageviews => 'Páginas vistas';

  @override
  String get pagesPerSession => 'Páginas/Sesión';

  @override
  String get bounceRate => 'Tasa de rebote';

  @override
  String get duration => 'Duración';

  @override
  String get metrics => 'Métricas';

  @override
  String get pages => 'Páginas';

  @override
  String get referrers => 'Referentes';

  @override
  String get countries => 'Países';

  @override
  String get devices => 'Dispositivos';

  @override
  String get performance => 'Rendimiento';

  @override
  String get goals => 'Objetivos';

  @override
  String get funnels => 'Embudos';

  @override
  String get replay => 'Reproducción';

  @override
  String get config => 'Configuración';

  @override
  String usersOnline(int count) {
    return '$count usuarios en línea';
  }

  @override
  String get events => 'Eventos';

  @override
  String get eventsOverTime => 'Eventos a lo largo del tiempo';

  @override
  String get eventNames => 'Nombres de eventos';

  @override
  String get noCustomEventsTracked =>
      'No se han registrado eventos personalizados';

  @override
  String get failedToLoadProperties => 'Error al cargar las propiedades';

  @override
  String get noProperties => 'Sin propiedades';

  @override
  String get outboundLinks => 'Enlaces salientes';

  @override
  String get noOutboundLinksTracked => 'No se han registrado enlaces salientes';

  @override
  String get failedToLoadChart => 'Error al cargar el gráfico';

  @override
  String get errors => 'Errores';

  @override
  String get failedToLoadErrors => 'Error al cargar los errores';

  @override
  String get noErrorsFound => 'No se encontraron errores';

  @override
  String get everythingLooksGood => '¡Todo se ve bien!';

  @override
  String get occurrences => 'ocurrencias';

  @override
  String get sessionsAffected => 'sesiones afectadas';

  @override
  String failedToLoadEventsWithError(String error) {
    return 'Error al cargar eventos: $error';
  }

  @override
  String get noEventsFound => 'No se encontraron eventos';

  @override
  String get failedToLoadFunnels => 'Error al cargar los embudos';

  @override
  String get noFunnelsSaved => 'No hay embudos guardados';

  @override
  String get createFunnelsHint => 'Crea embudos en el panel web';

  @override
  String get deleteFunnel => 'Eliminar embudo';

  @override
  String deleteFunnelConfirm(String name) {
    return '¿Eliminar \"$name\"?';
  }

  @override
  String failedToDeleteFunnel(String error) {
    return 'Error al eliminar embudo: $error';
  }

  @override
  String get noStepsDefined => 'No se han definido pasos para este embudo';

  @override
  String failedToAnalyze(String error) {
    return 'Error al analizar: $error';
  }

  @override
  String get overallConversion => 'Conversión general';

  @override
  String dropoff(String value) {
    return 'Abandono: $value';
  }

  @override
  String get createGoal => 'Crear objetivo';

  @override
  String get failedToLoadGoals => 'Error al cargar los objetivos';

  @override
  String get noGoalsConfigured => 'No hay objetivos configurados';

  @override
  String get noGoalsHint => 'Toca + para crear un nuevo objetivo';

  @override
  String get conversions => 'Conversiones';

  @override
  String get rate => 'Tasa';

  @override
  String get editGoal => 'Editar objetivo';

  @override
  String get createGoalTitle => 'Crear objetivo';

  @override
  String get name => 'Nombre';

  @override
  String get type => 'Tipo';

  @override
  String get path => 'Ruta';

  @override
  String get event => 'Evento';

  @override
  String get pathPattern => 'Patrón de ruta';

  @override
  String get eventName => 'Nombre del evento';

  @override
  String get deleteGoal => 'Eliminar objetivo';

  @override
  String deleteGoalConfirm(String name) {
    return '¿Eliminar \"$name\"?';
  }

  @override
  String failedToDeleteGoal(String error) {
    return 'Error al eliminar el objetivo: $error';
  }

  @override
  String get failedToLoadPerformanceData =>
      'Error al cargar los datos de rendimiento';

  @override
  String metricOverTime(String metric) {
    return '$metric a lo largo del tiempo';
  }

  @override
  String get byDimension => 'Por dimensión';

  @override
  String get failedToLoadDimensionData =>
      'Error al cargar los datos de dimensión';

  @override
  String get good => 'Bueno';

  @override
  String get needsImprovement => 'Necesita mejorar';

  @override
  String get poor => 'Deficiente';

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
  String get sessionFilters => 'Filtros de sesión';

  @override
  String get minPageviews => 'Mín. páginas vistas';

  @override
  String get minEvents => 'Mín. eventos';

  @override
  String get minDurationSeconds => 'Duración mín. (segundos)';

  @override
  String get failedToLoadSessions => 'Error al cargar las sesiones';

  @override
  String get noSessionsFound => 'No se encontraron sesiones';

  @override
  String get filterSessions => 'Filtrar sesiones';

  @override
  String get loadingMoreSessions => 'Cargando más sesiones';

  @override
  String entryPage(String page) {
    return 'Página de entrada: $page';
  }

  @override
  String nPages(int count) {
    return '$count páginas';
  }

  @override
  String get sessionReplays => 'Reproducciones de sesión';

  @override
  String get failedToLoadReplays => 'Error al cargar las reproducciones';

  @override
  String get noReplaysFound => 'No se encontraron reproducciones';

  @override
  String get noReplaysHint =>
      'Las reproducciones de sesión aparecerán aquí cuando estén habilitadas.';

  @override
  String get previousPage => 'Página anterior';

  @override
  String get nextPage => 'Página siguiente';

  @override
  String pageNumber(int number) {
    return 'Página $number';
  }

  @override
  String get unknownBrowser => 'Navegador desconocido';

  @override
  String get unknownCountry => 'País desconocido';

  @override
  String get sortUsers => 'Ordenar usuarios';

  @override
  String get showAllUsers => 'Mostrar todos los usuarios';

  @override
  String get showIdentifiedOnly => 'Mostrar solo identificados';

  @override
  String get searchUsers => 'Buscar usuarios';

  @override
  String get searchUsersHint => 'Buscar usuarios...';

  @override
  String get clearSearch => 'Limpiar búsqueda';

  @override
  String get failedToLoadUsers => 'Error al cargar los usuarios';

  @override
  String get noUsersFound => 'No se encontraron usuarios';

  @override
  String get noIdentifiedUsers => 'No hay usuarios identificados';

  @override
  String get usersWillAppear =>
      'Los usuarios aparecerán una vez que sean identificados';

  @override
  String get tryDifferentSearch =>
      'Intenta con un término de búsqueda diferente';

  @override
  String get sortedBy => 'Ordenado por';

  @override
  String get loadingMoreUsers => 'Cargando más usuarios';

  @override
  String get lastSeen => 'Última visita';

  @override
  String get firstSeen => 'Primera visita';

  @override
  String nUsers(String count) {
    return '$count usuarios';
  }

  @override
  String nSessions(int count) {
    return '$count sesiones';
  }

  @override
  String lastPrefix(String value) {
    return 'Último: $value';
  }

  @override
  String get failedToLoadSiteConfig =>
      'Error al cargar la configuración del sitio';

  @override
  String get failedToLoadMetrics => 'Error al cargar las métricas';

  @override
  String get loadingMoreMetrics => 'Cargando más métricas';

  @override
  String noMetricData(String metric) {
    return 'No hay datos de $metric';
  }

  @override
  String get settings => 'Configuración';

  @override
  String get connection => 'Conexión';

  @override
  String get notConfigured => 'No configurado';

  @override
  String get authMethod => 'Método de autenticación';

  @override
  String get sessionCookie => 'Cookie de sesión';

  @override
  String get loggedInAs => 'Conectado como';

  @override
  String get unknown => 'Desconocido';

  @override
  String get appearance => 'Apariencia';

  @override
  String get theme => 'Tema';

  @override
  String get dark => 'Oscuro';

  @override
  String get light => 'Claro';

  @override
  String get auto => 'Automático';

  @override
  String get about => 'Acerca de';

  @override
  String get appVersion => 'Versión de la aplicación';

  @override
  String get openSourceAnalytics => 'Analítica web de código abierto';

  @override
  String get logoutConfirm => '¿Estás seguro de que deseas cerrar sesión?';

  @override
  String get siteSettings => 'Configuración del sitio';

  @override
  String get siteInformation => 'Información del sitio';

  @override
  String get domain => 'Dominio';

  @override
  String get siteId => 'ID del sitio';

  @override
  String get created => 'Creado';

  @override
  String get trackingSettings => 'Configuración de seguimiento';

  @override
  String get publicDashboard => 'Panel público';

  @override
  String get publicDashboardDesc => 'Permitir acceso público a las analíticas';

  @override
  String get sessionReplay => 'Reproducción de sesión';

  @override
  String get sessionReplayDesc => 'Grabar sesiones de usuario';

  @override
  String get webVitals => 'Web Vitals';

  @override
  String get webVitalsDesc => 'Monitorear Core Web Vitals';

  @override
  String get trackErrors => 'Seguimiento de errores';

  @override
  String get trackErrorsDesc => 'Capturar errores de JavaScript';

  @override
  String get outboundLinksTracking => 'Enlaces salientes';

  @override
  String get outboundLinksDesc => 'Registrar clics en enlaces salientes';

  @override
  String get excludedIps => 'IPs excluidas';

  @override
  String get excludedCountries => 'Países excluidos';

  @override
  String get settingsSaved => 'Configuración guardada';

  @override
  String failedToSave(String error) {
    return 'Error al guardar: $error';
  }

  @override
  String get timeRange => 'Rango de tiempo';

  @override
  String get today => 'Hoy';

  @override
  String get yesterday => 'Ayer';

  @override
  String get last7Days => 'Últimos 7 días';

  @override
  String get last30Days => 'Últimos 30 días';

  @override
  String get thisWeek => 'Esta semana';

  @override
  String get thisMonth => 'Este mes';

  @override
  String get thisYear => 'Este año';

  @override
  String get customRange => 'Rango personalizado';

  @override
  String get filter => 'Filtro';

  @override
  String get addFilter => 'Agregar filtro';

  @override
  String get parameter => 'Parámetro';

  @override
  String get value => 'Valor';

  @override
  String get enterFilterValue => 'Ingresa el valor del filtro';

  @override
  String get requestTimedOut => 'La solicitud ha expirado. Inténtalo de nuevo.';

  @override
  String get networkError => 'Error de red. Verifica tu conexión.';

  @override
  String get sessionExpired => 'Sesión expirada. Inicia sesión de nuevo.';

  @override
  String get accessDenied => 'Acceso denegado.';

  @override
  String get dataNotFound => 'Datos no encontrados.';

  @override
  String get serverError => 'Error del servidor. Inténtalo más tarde.';

  @override
  String get failedToLoadGeneric =>
      'Error al cargar los datos. Inténtalo de nuevo.';

  @override
  String chartDataPoints(int count) {
    return 'Gráfico con $count puntos de datos';
  }

  @override
  String previousPrefix(String value) {
    return 'Ant: $value';
  }

  @override
  String performanceRatingLabel(String rating) {
    return 'Calificación de rendimiento: $rating';
  }

  @override
  String get loadingContent => 'Cargando contenido';

  @override
  String get language => 'Idioma';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get failedToLoadUserDetails =>
      'Error al cargar los detalles del usuario';

  @override
  String lastSeenPrefix(String value) {
    return 'Visto por última vez: $value';
  }

  @override
  String get traits => 'Propiedades';

  @override
  String get noTraits => 'Sin propiedades para este usuario';

  @override
  String get sessionDetail => 'Detalle de sesión';

  @override
  String get failedToLoadSession => 'Error al cargar la sesión';

  @override
  String get entryPageLabel => 'Página de entrada';

  @override
  String get exitPage => 'Página de salida';

  @override
  String get browserAndDevice => 'Navegador y dispositivo';

  @override
  String get browser => 'Navegador';

  @override
  String get os => 'SO';

  @override
  String get device => 'Dispositivo';

  @override
  String get sourceLabel => 'Fuente';

  @override
  String get referrer => 'Referente';

  @override
  String eventTimelineCount(int count) {
    return 'Línea de tiempo ($count)';
  }

  @override
  String get noEvents => 'Sin eventos';

  @override
  String get replayEventsTitle => 'Eventos de reproducción';

  @override
  String get failedToLoadReplay => 'Error al cargar la reproducción';

  @override
  String get noReplayEvents => 'Sin eventos de reproducción';

  @override
  String get totalEvents => 'Total de eventos';

  @override
  String get userActionsLabel => 'Acciones del usuario';

  @override
  String eventTimelineActions(int count) {
    return 'Línea de tiempo ($count acciones)';
  }

  @override
  String get eventLog => 'Registro de eventos';

  @override
  String get viewEventLog => 'Ver registro de eventos';

  @override
  String get failedToLoadEventLog => 'Error al cargar el registro de eventos';

  @override
  String get activityHeatmap => 'Mapa de calor';

  @override
  String get heatmapLast4Weeks => 'Últimas 4 semanas';

  @override
  String get less => 'Menos';

  @override
  String get more => 'Más';

  @override
  String get peakActivity => 'Actividad máxima';

  @override
  String peakHour(String day, String time) {
    return '$day a las $time';
  }

  @override
  String busiestDay(String day) {
    return 'Día más activo: $day';
  }

  @override
  String get dayMon => 'Lun';

  @override
  String get dayTue => 'Mar';

  @override
  String get dayWed => 'Mié';

  @override
  String get dayThu => 'Jue';

  @override
  String get dayFri => 'Vie';

  @override
  String get daySat => 'Sáb';

  @override
  String get daySun => 'Dom';

  @override
  String get searchEvents => 'Buscar eventos...';

  @override
  String get allTypes => 'Todos';

  @override
  String get noMatchingEvents => 'No hay eventos coincidentes';

  @override
  String get liveView => 'En vivo';

  @override
  String get autoRefresh => 'Actualización automática';

  @override
  String get usersOnlineNow => 'Usuarios en línea ahora';

  @override
  String lastUpdatedAt(String time) {
    return 'Actualizado a las $time';
  }

  @override
  String get last30Minutes => 'Últimos 30 minutos';

  @override
  String get last5Minutes => 'Últimos 5 min';

  @override
  String get recentEvents => 'Eventos recientes';

  @override
  String get noRecentEvents => 'No hay eventos recientes';

  @override
  String get retention => 'Retención';

  @override
  String get weekly => 'Semanal';

  @override
  String get daily => 'Diario';

  @override
  String get retentionRange => 'Rango';

  @override
  String retentionDays(int count) {
    return '$count días';
  }

  @override
  String get failedToLoadRetention => 'Error al cargar datos de retención';

  @override
  String get noRetentionData => 'Sin datos de retención';

  @override
  String get cohort => 'Cohorte';

  @override
  String get retentionWeekPrefix => 'S';

  @override
  String get retentionDayPrefix => 'D';

  @override
  String get journeys => 'Recorridos';

  @override
  String get journeySteps => 'Pasos';

  @override
  String get failedToLoadJourneys => 'Error al cargar recorridos';

  @override
  String get noJourneysFound => 'No se encontraron recorridos';

  @override
  String journeySessions(String count) {
    return '$count sesiones';
  }

  @override
  String get locations => 'Ubicaciones';

  @override
  String get locationCities => 'Ciudades';

  @override
  String get failedToLoadLocations => 'Error al cargar ubicaciones';

  @override
  String get noLocationsFound => 'No se encontraron ubicaciones';

  @override
  String get coreFeatures => 'Principal';

  @override
  String get insights => 'Análisis';

  @override
  String get tools => 'Herramientas';

  @override
  String get userTraits => 'Atributos';

  @override
  String get failedToLoadUserTraits => 'Error al cargar atributos de usuarios';

  @override
  String get noUserTraits => 'No se encontraron atributos';

  @override
  String get noUserTraitsHint =>
      'Los atributos aparecerán cuando los usuarios se identifiquen con propiedades personalizadas';

  @override
  String traitUsersCount(String count) {
    return '$count usuarios';
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
  String get entryPages => 'Páginas de entrada';

  @override
  String get exitPages => 'Páginas de salida';

  @override
  String get browsers => 'Navegadores';

  @override
  String get operatingSystems => 'SO';

  @override
  String get utmSource => 'Fuente UTM';

  @override
  String get channel => 'Canal';

  @override
  String get pageTitles => 'Títulos de página';

  @override
  String get sources => 'Fuentes';

  @override
  String get cities => 'Ciudades';

  @override
  String get languages => 'Idiomas';

  @override
  String get hostnames => 'Nombres de host';

  @override
  String get vpn => 'VPN';

  @override
  String get crawlers => 'Rastreadores';

  @override
  String get datacenters => 'Centros de datos';

  @override
  String get companies => 'Empresas';

  @override
  String get companyType => 'Tipo de empresa';

  @override
  String get companyDomain => 'Dominio de empresa';

  @override
  String get asnOrg => 'Organización ASN';

  @override
  String get asnType => 'Tipo ASN';

  @override
  String get asnDomain => 'Dominio ASN';

  @override
  String get utmMedium => 'UTM Medio';

  @override
  String get utmCampaign => 'UTM Campaña';

  @override
  String nMoreItems(int count) {
    return '+$count más';
  }

  @override
  String sessionsWithPercentage(String count, String percentage) {
    return '$count sesiones ($percentage%)';
  }

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get replayPageSnapshot => 'Captura de página';

  @override
  String get replayPageLoad => 'Carga de página';

  @override
  String get replayCustomEvent => 'Evento personalizado';

  @override
  String get replayPluginEvent => 'Evento de plugin';

  @override
  String get replayInteraction => 'Interacción';

  @override
  String get replayScroll => 'Desplazamiento';

  @override
  String get replayResize => 'Cambio de tamaño';

  @override
  String get replayInput => 'Entrada';

  @override
  String get replayUpdate => 'Actualización';

  @override
  String get url => 'URL';

  @override
  String get searchSites => 'Buscar sitios...';

  @override
  String get sortSites => 'Ordenar sitios';

  @override
  String get sortAlphabetically => 'Alfabéticamente';

  @override
  String get sortByVisitors => 'Por visitantes hoy';

  @override
  String get sortByLiveUsers => 'Por usuarios en línea';

  @override
  String get noMatchingSites => 'No se encontraron sitios';
}
