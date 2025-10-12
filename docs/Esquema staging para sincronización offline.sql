USE SAINTA
GO 

 CREATE SCHEMA mobile_sync;
   GO

   -- Productos
   CREATE TABLE mobile_sync.products (
       id            NVARCHAR(40)  NOT NULL PRIMARY KEY,
       tenant_id     NVARCHAR(40)  NOT NULL,
       company_id    NVARCHAR(40)  NULL,
       branch_id     NVARCHAR(40)  NULL,
       name          NVARCHAR(200) NOT NULL,
       sku           NVARCHAR(100) NOT NULL,
       price         DECIMAL(18,2) NOT NULL,
       updated_at    DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME()
   );

   -- Clientes / Proveedores
   CREATE TABLE mobile_sync.clients (
       id            NVARCHAR(40)  NOT NULL PRIMARY KEY,
       tenant_id     NVARCHAR(40)  NOT NULL,
       type          NVARCHAR(20)  NOT NULL, -- 'customer' | 'supplier'
       name          NVARCHAR(200) NOT NULL,
       email         NVARCHAR(200) NULL,
       phone         NVARCHAR(100) NULL,
       address       NVARCHAR(400) NULL,
       tax_id        NVARCHAR(50)  NULL,
       updated_at    DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME()
   );

   -- Ventas
   CREATE TABLE mobile_sync.sales_documents (
       id            NVARCHAR(40)  NOT NULL PRIMARY KEY,
       tenant_id     NVARCHAR(40)  NOT NULL,
       company_id    NVARCHAR(40)  NOT NULL,
       branch_id     NVARCHAR(40)  NOT NULL,
       client_id     NVARCHAR(40)  NULL,
       total         DECIMAL(18,2) NOT NULL,
       status        NVARCHAR(20)  NOT NULL,
       created_at    DATETIME2     NOT NULL,
       updated_at    DATETIME2     NOT NULL
   );

   -- Compras
   CREATE TABLE mobile_sync.purchase_documents (
       id            NVARCHAR(40)  NOT NULL PRIMARY KEY,
       tenant_id     NVARCHAR(40)  NOT NULL,
       company_id    NVARCHAR(40)  NOT NULL,
       branch_id     NVARCHAR(40)  NOT NULL,
       supplier_id   NVARCHAR(40)  NULL,
       total         DECIMAL(18,2) NOT NULL,
       status        NVARCHAR(20)  NOT NULL,
       created_at    DATETIME2     NOT NULL,
       updated_at    DATETIME2     NOT NULL
   );

   -- Cuentas bancarias
   CREATE TABLE mobile_sync.bank_accounts (
       id            NVARCHAR(40)  NOT NULL PRIMARY KEY,
       tenant_id     NVARCHAR(40)  NOT NULL,
       name          NVARCHAR(200) NOT NULL,
       currency      NVARCHAR(10)  NOT NULL,
       balance       DECIMAL(18,2) NOT NULL DEFAULT 0,
       updated_at    DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME()
   );

   -- Movimientos bancarios
   CREATE TABLE mobile_sync.bank_movements (
       id            NVARCHAR(40)  NOT NULL PRIMARY KEY,
       tenant_id     NVARCHAR(40)  NOT NULL,
       account_id    NVARCHAR(40)  NOT NULL,
       amount        DECIMAL(18,2) NOT NULL,
       type          NVARCHAR(20)  NOT NULL, -- 'deposit' | 'withdraw'
       description   NVARCHAR(400) NULL,
       occurred_at   DATETIME2     NOT NULL,
       status        NVARCHAR(20)  NOT NULL,
       created_at    DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME()
   );

   -- Estado de sincronización
   CREATE TABLE mobile_sync.sync_states (
       id             NVARCHAR(40)  NOT NULL PRIMARY KEY,
       entity         NVARCHAR(50)  NOT NULL,
       last_synced_at DATETIME2     NULL
   );

   -- Outbox
   CREATE TABLE mobile_sync.outbox_entries (
       id            NVARCHAR(40)  NOT NULL PRIMARY KEY,
       tenant_id     NVARCHAR(40)  NOT NULL,
       entity        NVARCHAR(50)  NOT NULL,
       payload       NVARCHAR(MAX) NOT NULL,
       status        NVARCHAR(20)  NOT NULL DEFAULT 'pending',
       created_at    DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME(),
       processed_at  DATETIME2     NULL
   );
   GO