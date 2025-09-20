Param(
  [string]$SourceDir = "Database/Tablas",
  [string]$OutDir = "Database/Campos"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function New-Dir($path) {
  if (-not (Test-Path -LiteralPath $path)) {
    New-Item -ItemType Directory -Path $path | Out-Null
  }
}

function Get-TableColumns {
  Param([string]$FilePath)
  $columns = @()
  $inCreate = $false
  $endSeen = $false
  $tableName = $null
  $lines = Get-Content -LiteralPath $FilePath
  foreach ($line in $lines) {
    if (-not $inCreate -and $line -match "(?i)^\s*CREATE\s+TABLE\b") {
      $inCreate = $true
      if ($line -match "\[(?<schema>[^\]]+)\]\s*\.\s*\[(?<tname>[^\]]+)\]") {
        $tableName = "$($Matches['schema']).$($Matches['tname'])"
      } elseif ($line -match "\[(?<schema>[^\]]+)\]\s*\[(?<tname>[^\]]+)\]") {
        # ej: [dbo][SACLIE]
        $tableName = "$($Matches['schema']).$($Matches['tname'])"
      } elseif ($line -match "\[(?<tname>[^\]]+)\]") {
        $tableName = $Matches['tname']
      }
      continue
    }
    if ($inCreate) {
      if ($line -match "^\s*\)\s*") { $endSeen = $true }
      if ($endSeen) { break }
      # Detectar líneas de columnas: empiezan con [Nombre]
      if ($line -match "^\s*\[(?<col>[^\]]+)\]\s+(?<rest>.+)") {
        $col = $Matches['col']
        $rest = $Matches['rest']
        if ($col -match "(?i)PRIMARY|CONSTRAINT|FOREIGN") { continue }
        if ($rest -match "(?i)^PRIMARY\s+KEY|^CONSTRAINT|^FOREIGN") { continue }
        # Normalizar posibles tipos entre corchetes
        $rest2 = $rest.Trim()
        $rest2 = ($rest2 -replace '^\[([^\]]+)\]', '$1')
        # Extraer tipo: nombre + (params)
        $type = $null
        if ($rest2 -match '^(?<tname>[A-Za-z]+[A-Za-z0-9]*)(?<paren>\([^\)]*\))?') {
          $type = ($Matches['tname'] + $Matches['paren'])
        } else {
          $type = ($rest2 -split "\s+")[0]
        }
        $columns += [PSCustomObject]@{ Name = $col; Type = $type }
      }
    }
  }
  return ,@($tableName, $columns)
}

function Describe-Column {
  Param(
    [string]$Table,
    [string]$Name,
    [string]$Type
  )
  $n = $Name
  $lower = $n.ToLowerInvariant()
  # Exactos
  switch ($n) {
    'Id' { return 'Identificador interno/autonumérico del registro.' }
    'ID' { return 'Identificador interno/autonumérico del registro.' }
    'NroUnico' { return 'Número único/autoincremental de la transacción o documento.' }
    'CreatedAt' { return 'Fecha y hora de creación del registro.' }
    'UpdatedAt' { return 'Fecha y hora de última actualización del registro.' }
    'Email' { return 'Correo electrónico de contacto.' }
    'Movil' { return 'Número de teléfono móvil.' }
    'Telef' { return 'Teléfono de contacto.' }
    'Telefonos' { return 'Listado de teléfonos de contacto.' }
    'Fax' { return 'Número de fax.' }
    'ZipCode' { return 'Código postal.' }
    'Password' { return 'Contraseña (hash) del usuario.' }
    'Profile' { return 'Perfil o rol descriptivo del usuario.' }
    'Imagen' { return 'Imagen/archivo binario asociado.' }
    'Memo' { return 'Campo de observaciones o notas (texto libre).' }
    default {}
  }

  # Prefijos/códigos comunes
  if ($n -match '^Cod(?<ent>[A-Z][A-Za-z0-9]+)$') {
    $ent = $Matches['ent']
    $emap = @{
      'Clie'='cliente'; 'Vend'='vendedor'; 'Prod'='producto'; 'Prov'='proveedor';
      'Sucu'='sucursal'; 'Ubic'='ubicación'; 'Zona'='zona'; 'Conv'='convenio';
      'Tarj'='tarjeta'; 'Oper'='operación'; 'Usua'='usuario'; 'Esta'='establecimiento/estado';
      'Tran'='transacción'; 'Pais'='país'; 'Estado'='estado'; 'Ciudad'='ciudad';
      'Municipio'='municipio'; 'Banc'='banco'; 'Mone'='moneda'; 'Alte'='alterno';
      'Taxs'='impuesto'; 'Tax'='impuesto'; 'Grupo'='grupo'; 'Repo'='reporte';
      'Join'='unión'
    }
    $target = $emap[$ent]
    if (-not $target) { $target = ($ent -replace '([A-Z])',' $1').Trim().ToLower() }
    return "Código de $target."
  }

  if ($n -match '^Numero(?<suf>.*)$') {
    $suf = $Matches['suf']
    $desc = 'Número de documento o referencia'
    switch ($suf) {
      'D' { $desc = 'Número de documento principal.' }
      'F' { $desc = 'Número fiscal/comprobante.' }
      'P' { $desc = 'Número de pedido o pago.' }
      'T' { $desc = 'Número de ticket/transacción.' }
      'R' { $desc = 'Número de recibo o referencia.' }
      'Z' { $desc = 'Número de zona o cierre Z.' }
      'U' { $desc = 'Número único/unificado.' }
      'NCF' { $desc = 'Número de comprobante fiscal (NCF).' }
      default {}
    }
    return "$desc"
  }

  if ($n -match '^Nro(?<what>[A-Z].*)$') {
    $what = $Matches['what']
    switch ($what) {
      'Turno' { return 'Número de turno/caja.' }
      'Regi' { return 'Número de registro/ítem.' }
      'Ctrol' { return 'Número de control fiscal.' }
      'Estable' { return 'Número de establecimiento.' }
      default { return 'Número correlativo asociado.' }
    }
  }

  if ($n -eq 'Moneda') { return 'Código o clave de moneda.' }
  if ($n -eq 'Factor') { return 'Factor de conversión (p. ej., tasa de cambio).'}

  if ($n -match '^Fecha(?<tag>[A-Z]{1,3})?$') {
    $tag = $Matches['tag']
    switch ($tag) {
      'E' { return 'Fecha de emisión/entrada.' }
      'I' { return 'Fecha de inicio.' }
      'V' { return 'Fecha de vencimiento.' }
      'T' { return 'Fecha de transacción.' }
      'R' { return 'Fecha de registro/recepción.' }
      'C' { return 'Fecha de cambio/actualización.' }
      'UV' { return 'Fecha de última venta.' }
      'UC' { return 'Fecha de última compra.' }
      default { return 'Fecha asociada al registro.' }
    }
  }

  if ($n -match '^(Direc|Direccion)(?<ln>\d)$') {
    return "Dirección línea $($Matches['ln'])."
  }

  if ($n -eq 'Descrip' -or $n -eq 'Descripcion') { return 'Descripción del registro.' }
  if ($n -eq 'Descrip2') { return 'Descripción adicional (2).' }
  if ($n -eq 'Descrip3') { return 'Descripción adicional (3).' }
  if ($n -eq 'ItemName') { return 'Nombre del elemento/ítem.' }
  if ($n -eq 'FolderName') { return 'Nombre de carpeta o agrupador.' }
  if ($n -eq 'Represent') { return 'Nombre del representante/contacto comercial.' }
  if ($n -eq 'Observa' -or $n -eq 'Notas' -or $n -like 'Notas*') { return 'Observaciones/notas del documento.' }

  if ($n -eq 'ID3') { return 'Identificación fiscal (RUC/CI/NIT) del tercero.' }
  if ($n -eq 'TipoID3') { return 'Tipo de identificación fiscal (RUC/CI/NIT, etc.).' }
  if ($n -eq 'TipoID') { return 'Tipo de identificación o clasificación del tercero.' }
  if ($n -eq 'TipoReg') { return 'Tipo/clase de registro.' }
  if ($n -eq 'TipoPVP') { return 'Tipo de precio de venta aplicable (PVP).' }
  if ($n -eq 'TipoCli') { return 'Tipo/categoría de cliente.' }
  if ($n -eq 'TipoDev') { return 'Tipo de devolución o ajuste.' }
  if ($n -eq 'TipoTraE') { return 'Tipo de transacción/estado externo.' }

  if ($n -eq 'Activo') { return 'Indicador de activo (0/1).' }
  if ($n -eq 'EsCredito') { return 'Indicador de manejo de crédito (0/1).' }
  if ($n -eq 'EsReten') { return 'Indicador de aplica retención (0/1).' }
  if (($n -clike 'Es*' -or $n -clike 'DEs*') -and $n -ne 'Estado') {
    # Flags comunes por palabra clave
    if ($n -match 'Lote') { return 'Indicador: maneja lotes (0/1).' }
    if ($n -match 'Vence') { return 'Indicador: maneja vencimiento (0/1).' }
    if ($n -match 'Import') { return 'Indicador: producto importado (0/1).' }
    if ($n -match 'Exento') { return 'Indicador: exento de impuestos (0/1).' }
    if ($n -match 'Pesa') { return 'Indicador: producto pesable (0/1).' }
    if ($n -match 'Empaque') { return 'Indicador: usa empaque (0/1).' }
    if ($n -match 'Seri') { return 'Indicador: maneja seriales (0/1).' }
    if ($n -match 'Comi') { return 'Indicador: afecta comisión (0/1).' }
    if ($n -match 'Comp') { return 'Indicador: compuesto/agrupado (0/1).' }
    return 'Indicador/flag de configuración (0/1).'
  }

  if ($n -match '^Saldo') { return 'Saldo asociado (moneda base), según contexto.' }
  if ($n -match '^PagosA$') { return 'Pagos acumulados aplicados.' }
  if ($n -match '^PromPago$') { return 'Promedio de pago/días de pago.' }
  if ($n -match '^LimiteCred$') { return 'Límite de crédito asignado.' }
  if ($n -match '^DiasCred$') { return 'Días de crédito asignados.' }
  if ($n -match '^EsToleran$') { return 'Indicador: permite tolerancia en pagos (0/1).' }
  if ($n -match '^DiasTole$') { return 'Días de tolerancia de pago.' }
  if ($n -match '^IntMora$') { return 'Indicador/tasa para interés de mora.' }
  if ($n -match '^Descto$') { return 'Descuento general aplicado.' }

  if ($n -match '^Precio') { return 'Precio de venta (según lista/escala indicada).' }
  if ($n -match '^Costo') { return 'Costo del producto (actual/promedio/anterior según sufijo).' }
  if ($n -match '^Existen$') { return 'Existencias actuales.' }
  if ($n -match '^ExUnidad$') { return 'Existencias expresadas en unidad alternativa.' }
  if ($n -match '^Compro$') { return 'Cantidad comprometida.' }
  if ($n -match '^Pedido$') { return 'Cantidad pedida.' }
  if ($n -match '^Minimo$') { return 'Stock mínimo permitido.' }
  if ($n -match '^Maximo$') { return 'Stock máximo permitido.' }
  if ($n -match '^Unidad$') { return 'Unidad de medida principal.' }
  if ($n -match '^UndEmpaq$') { return 'Unidad de empaque.' }
  if ($n -match '^CantEmpaq$') { return 'Cantidad por empaque.' }
  if ($n -match '^Tara$') { return 'Tara o peso del empaque.' }

  if ($n -match '^M(?:onto|to)') { return 'Monto/valor monetario asociado.' }
  if ($n -match '^Debitos$') { return 'Total de débitos.' }
  if ($n -match '^Creditos$') { return 'Total de créditos.' }
  if ($n -match '^TGravable0?$') { return 'Base imponible (0% o general según sufijo).' }
  if ($n -match '^TExento$') { return 'Base exenta de impuestos.' }
  if ($n -match '^RetenIVA$') { return 'Monto retenido de IVA/impuesto.' }
  if ($n -match '^Fletes$') { return 'Monto de fletes/transporte.' }
  if ($n -match '^Cancel') { return 'Montos cancelados/aplicados por forma o estado.' }

  if ($n -eq 'AutSRI') { return 'Código/clave de autorización fiscal (SRI).' }
  if ($n -eq 'PtoEmision') { return 'Punto de emisión fiscal.' }
  if ($n -eq 'NroEstable') { return 'Número de establecimiento fiscal.' }
  if ($n -eq 'Document') { return 'Referencia al documento asociado.' }

  if ($n -eq 'Clase') { return 'Clase o categoría del registro.' }
  if ($n -eq 'DescOrder') { return 'Orden corto para clasificación/ordenamiento.' }
  if ($n -eq 'Refere') { return 'Referencia/código alterno.' }
  if ($n -eq 'Marca') { return 'Marca asociada.' }
  if ($n -eq 'Grupo') { return 'Grupo/categoría.' }

  if ($n -eq 'Pais') { return 'Código de país (catálogo).' }
  if ($n -eq 'Estado') { return 'Código de estado/provincia (catálogo).' }
  if ($n -eq 'Ciudad') { return 'Código de ciudad (catálogo).' }
  if ($n -eq 'Municipio') { return 'Código de municipio (catálogo).' }

  if ($n -eq 'IDB' -or $n -eq 'PDB') { return 'Parámetro/identificador de banco (uso interno).'}
  if ($n -eq 'PrxConc') { return 'Consecutivo/próximo número de conciliación.' }
  if ($n -eq 'PrxNDDB') { return 'Próximo número de nota de débito bancaria.' }
  if ($n -eq 'PrxCheque') { return 'Próximo número de cheque.' }
  if ($n -eq 'InvChe') { return 'Inventario/contador de cheques.' }
  if ($n -eq 'CtaContab') { return 'Cuenta contable asociada.' }
  if ($n -eq 'CtaDebito') { return 'Cuenta contable de débito.' }
  if ($n -eq 'CtaConc') { return 'Cuenta/clave de conciliación.' }
  if ($n -eq 'RTransf') { return 'Regla/indicador de transferencia.' }
  if ($n -eq 'NomSuc') { return 'Nombre de la sucursal.' }
  if ($n -eq 'NoCuenta') { return 'Número de cuenta bancaria.' }
  if ($n -eq 'Sucursal') { return 'Nombre de la sucursal bancaria.' }
  if ($n -eq 'TDC') { return 'Código de tipo (TDC) según configuración.' }

  if ($n -eq 'Level') { return 'Nivel/rol de acceso asignado.' }
  if ($n -eq 'IdUserNot') { return 'Identificador de usuario para notificaciones.' }
  if ($n -match '^SData\d$') { return 'Dato adicional del sistema (extensión).' }

  if ($n -eq 'PuestoI') { return 'Puesto/posición de inventario/ubicación interna.' }

  return "Campo $n ($Type)."
}

New-Dir $OutDir

$indexLines = @('# Documentación de Campos por Tabla','','Archivos generados automáticamente desde scripts SQL.','')

Get-ChildItem -LiteralPath $SourceDir -Filter *.sql | Sort-Object Name | ForEach-Object {
  $file = $_.FullName
  $base = $_.BaseName # ej: dbo.SACLIE
  $res = Get-TableColumns -FilePath $file
  $tname = $res[0]
  $cols = $res[1]
  if (-not $tname) { $tname = $base }
  $outFile = Join-Path $OutDir ("$base.md")
  $lines = @("# $base",'',"Tabla: $tname","Origen: $($_.Name)",'' , '## Campos','')
  foreach ($c in $cols) {
    $desc = Describe-Column -Table $tname -Name $c.Name -Type $c.Type
    $lines += ("- " + $c.Name + " (" + $c.Type + "): " + $desc)
  }
  $lines += ''
  Set-Content -LiteralPath $outFile -Value $lines -Encoding UTF8
  $indexLines += ("- [$base](./$base.md)")
}

Set-Content -LiteralPath (Join-Path $OutDir 'README.md') -Value $indexLines -Encoding UTF8

Write-Host "Generacion completada en: $OutDir"
