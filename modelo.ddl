-- Generado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   en:        2023-02-27 19:32:05 COT
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE amortizacion (
    idamortizacion    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    monto             INTEGER,
    fecha             DATE,
    operacion         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    idprestamo        VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    idusuario         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    version           INTEGER,
    codamortizacion   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    totalamortizado   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    idgestorcliente   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    idgestorcobranza  VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    rolcobrador       VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    idusuariocobrador VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    nombrescobrador   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    apellidoscobrador VARCHAR2 
--  ERROR: VARCHAR2 size not specified 

);

CREATE UNIQUE INDEX amortizacion__idx ON
    amortizacion (
        idprestamo
    ASC );

ALTER TABLE amortizacion ADD CONSTRAINT amortizacion_pk PRIMARY KEY ( idamortizacion );

CREATE TABLE cliente (
    idcliente         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    dni               VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    nombre            VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    apellido          VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    telefono          VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    direccion         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    idusuario         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    operacion         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    codcliente        VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    numprestamo       INTEGER,
    idgestorcobranza  VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    idusuariocobrador VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    idusuarioowner    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    clienteasignado   INTEGER,
    isselected        NUMBER
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( idcliente );

CREATE TABLE gerstorcliente (
    idgestorcliente   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    idusuarioowner    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    idgestorcobranza  VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    idusuariocobrador VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    idcliente         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    fechainicio       DATE,
    fechafin          DATE,
    estado            RAW(2000),
    operacion         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 

);

ALTER TABLE gerstorcliente ADD CONSTRAINT gerstorcliente_pk PRIMARY KEY ( idgestorcliente );

CREATE TABLE gestorcobranza (
    idgestorcobranza  VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    idusuarioowner    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    idusuariocobrador VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    fechainicio       DATE NOT NULL,
    fechafin          DATE,
    estado            VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    operacion         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 

);

ALTER TABLE gestorcobranza ADD CONSTRAINT gestorcobranza_pk PRIMARY KEY ( idgestorcobranza );

CREATE TABLE prestamo (
    idprestamo   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    fecha        DATE NOT NULL,
    monto        NUMBER(18, 5) NOT NULL,
    tasa         NUMBER(18, 5) NOT NULL,
    adevolver    NUMBER,
    devuelto     NUMBER,
    estado       VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    dni          CHAR 
--  WARNING: CHAR size not specified 
     NOT NULL,
    operacion    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    idcliente    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    idusuario    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    nombre       VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    apellido     CLOB NOT NULL,
    codprestamo  VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    tipoprestamo VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    glosa        VARCHAR2 
--  ERROR: VARCHAR2 size not specified 

);

ALTER TABLE prestamo ADD CONSTRAINT prestamo_pk PRIMARY KEY ( idprestamo );

CREATE TABLE usuario (
    idusuario    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    nombres      VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    apellidos    VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    correo       VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    clave        VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    estadocuenta VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    dni          VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    telefono     VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    direccion    VARCHAR2(20),
    idsesion     VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    usuariorpc   VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( idusuario );

CREATE TABLE usuariorpc (
    idusuario           VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    nombres             VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    apellidos           VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    correo              VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    idsesion            VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    isrolowner          NUMBER,
    isroladmin          NUMBER,
    isrolgestorcobranza NUMBER
);

ALTER TABLE usuariorpc ADD CONSTRAINT usuariorpc_pk PRIMARY KEY ( idusuario );

ALTER TABLE amortizacion
    ADD CONSTRAINT amortizacion_gerstorcliente_fk FOREIGN KEY ( idgestorcliente )
        REFERENCES gerstorcliente ( idgestorcliente );

ALTER TABLE amortizacion
    ADD CONSTRAINT amortizacion_gestorcobranza_fk FOREIGN KEY ( idgestorcobranza )
        REFERENCES gestorcobranza ( idgestorcobranza );

ALTER TABLE amortizacion
    ADD CONSTRAINT amortizacion_prestamo_fk FOREIGN KEY ( idprestamo )
        REFERENCES prestamo ( idprestamo );

ALTER TABLE amortizacion
    ADD CONSTRAINT amortizacion_usuario_fk FOREIGN KEY ( idusuario )
        REFERENCES usuario ( idusuario );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_gestorcobranza_fk FOREIGN KEY ( idgestorcobranza )
        REFERENCES gestorcobranza ( idgestorcobranza );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_usuario_fk FOREIGN KEY ( idusuario )
        REFERENCES usuario ( idusuario );

ALTER TABLE gerstorcliente
    ADD CONSTRAINT gerstorcliente_cliente_fk FOREIGN KEY ( idcliente )
        REFERENCES cliente ( idcliente );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE gerstorcliente
    ADD CONSTRAINT gerstorcliente_gestorcobranza_fk FOREIGN KEY ( idgestorcobranza )
        REFERENCES gestorcobranza ( idgestorcobranza );

ALTER TABLE prestamo
    ADD CONSTRAINT prestamo_cliente_fk FOREIGN KEY ( idcliente )
        REFERENCES cliente ( idcliente );

ALTER TABLE prestamo
    ADD CONSTRAINT prestamo_usuario_fk FOREIGN KEY ( idusuario )
        REFERENCES usuario ( idusuario );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_usuariorpc_fk FOREIGN KEY ( usuariorpc )
        REFERENCES usuariorpc ( idusuario );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             1
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                  60
-- WARNINGS                                 1
