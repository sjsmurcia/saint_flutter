// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Saint';

  @override
  String get logoutTooltip => 'Cerrar sesion';

  @override
  String get loginTitle => 'Iniciar sesion';

  @override
  String get emailLabel => 'Correo';

  @override
  String get emailRequired => 'El correo es obligatorio';

  @override
  String get emailInvalid => 'Escribe un correo valido';

  @override
  String get passwordLabel => 'Contrasena';

  @override
  String get passwordRequired => 'La contrasena es obligatoria';

  @override
  String get passwordShort => 'Minimo 4 caracteres';

  @override
  String get loginButton => 'Ingresar';

  @override
  String get homeTitle => 'Panel';

  @override
  String get tenantLabel => 'Tenant';

  @override
  String get catalogSectionTitle => 'Catalogos';

  @override
  String get productsTitle => 'Productos';

  @override
  String get productsSubtitle => 'Consulta y sincroniza el catalogo offline';

  @override
  String get clientsTitle => 'Clientes';

  @override
  String get clientsSubtitle => 'Disponible offline con sincronizacion';

  @override
  String get salesTitle => 'Ventas';

  @override
  String get salesSubtitle => 'Captura tickets sin conexion';

  @override
  String get salesEmpty => 'Aun no hay ventas registradas';

  @override
  String get createSaleButton => 'Registrar venta';

  @override
  String get purchasesTitle => 'Compras';

  @override
  String get purchasesSubtitle => 'Captura documentos de proveedor offline';

  @override
  String get purchasesEmpty => 'Aun no hay compras registradas';

  @override
  String get createPurchaseButton => 'Registrar compra';

  @override
  String get productsEmpty => 'Aun no hay productos sincronizados';

  @override
  String get clientsEmpty => 'Aun no hay clientes sincronizados';

  @override
  String get outboxTitle => 'Pendientes por sincronizar';

  @override
  String get outboxEmpty => 'Sin documentos pendientes';

  @override
  String get documentTotalLabel => 'Importe total';

  @override
  String get documentStatusDraft => 'Borrador';

  @override
  String get documentStatusSent => 'Sincronizado';

  @override
  String get documentCreatedMessage =>
      'Documento guardado y enviado a la bandeja';

  @override
  String get companySelectorTitle => 'Selecciona empresa y sucursal';

  @override
  String get companyLabel => 'Empresa';

  @override
  String get branchLabel => 'Sucursal';

  @override
  String get companySelectorEmpty => 'Sin empresas disponibles';

  @override
  String get companySelectorTooltip => 'Cambiar empresa';

  @override
  String get backgroundSyncEnabled => 'Sincronizacion en segundo plano activa';

  @override
  String get manualSyncButton => 'Sincronizar ahora';

  @override
  String get workmanagerError => 'Fallo la sincronizacion en segundo plano';

  @override
  String get fieldRequired => 'Campo requerido';

  @override
  String get invalidAmount => 'Ingresa un monto valido';

  @override
  String get close => 'Cerrar';

  @override
  String get genericError => 'Ocurrio un error';

  @override
  String get retry => 'Reintentar';

  @override
  String get banksTitle => 'Bancos';

  @override
  String get banksEmpty => 'Sin cuentas bancarias';

  @override
  String get bankAccountLabel => 'Cuenta';

  @override
  String get registerMovement => 'Registrar movimiento';

  @override
  String get movementDeposit => 'Deposito';

  @override
  String get movementWithdraw => 'Retiro';

  @override
  String get save => 'Guardar';

  @override
  String get banksSubtitle => 'Movimientos basicos offline';

  @override
  String get movementTypeLabel => 'Tipo';

  @override
  String get movementDescriptionLabel => 'Descripcion';

  @override
  String get movementsEmpty => 'Sin movimientos registrados';

  @override
  String get reportsTitle => 'Reportes';

  @override
  String get reportsInvoiceTitle => 'Factura';

  @override
  String get invoiceIdLabel => 'Folio de factura';

  @override
  String get reportInvoicePlaceholder => 'Ejemplo: FAC-1001';

  @override
  String get generateInvoiceButton => 'Generar factura';

  @override
  String get reportsSalesPeriodTitle => 'Ventas por periodo';

  @override
  String get selectRangeButton => 'Seleccionar periodo';

  @override
  String get generateSalesPeriodButton => 'Generar reporte de ventas';

  @override
  String get reportsHistoryTitle => 'Reportes descargados';

  @override
  String get reportsHistoryEmpty => 'Sin descargas previas';

  @override
  String get reportDownloadSuccess => 'Reporte descargado';

  @override
  String get reportDownloadError => 'No se pudo generar el reporte';

  @override
  String get reportOpenError => 'No se pudo abrir el archivo';

  @override
  String get reportShareError => 'No se pudo compartir el archivo';

  @override
  String get reportDeleted => 'Reporte eliminado';

  @override
  String get open => 'Abrir';

  @override
  String get share => 'Compartir';

  @override
  String get delete => 'Eliminar';
}
