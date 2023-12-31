-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2023-08-25 12:24:16 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE compra (
    id_compra        INTEGER NOT NULL,
    id_usr           INTEGER NOT NULL,
    id_card          INTEGER NOT NULL,
    amount           INTEGER,
    id_discount      INTEGER,
    id_pais          INTEGER NOT NULL,
    usuarios_id_user INTEGER NOT NULL
);

ALTER TABLE compra ADD CONSTRAINT compra_pk PRIMARY KEY ( id_compra,
                                                          usuarios_id_user );

CREATE TABLE developer (
    id_dev INTEGER NOT NULL,
    nombre VARCHAR2(25),
    alias  VARCHAR2(15)
);

ALTER TABLE developer ADD CONSTRAINT developer_pk PRIMARY KEY ( id_dev );

CREATE TABLE discounts (
    id_discount                   INTEGER NOT NULL,
    id_juego                      INTEGER,
    fecha_ini                     DATE,
    fecha_fin                     DATE,
    discount_disc                 INTEGER,
    juego_id_juego                INTEGER NOT NULL,
    juego_library_id_game         INTEGER NOT NULL,
    juego_library_id_usr          INTEGER NOT NULL,
    juego_compra_id_compra        INTEGER NOT NULL,
    juego_compra_usuarios_id_user INTEGER NOT NULL
);

ALTER TABLE discounts
    ADD CONSTRAINT discounts_pk PRIMARY KEY ( id_discount,
                                              juego_id_juego,
                                              juego_library_id_game,
                                              juego_library_id_usr,
                                              juego_compra_id_compra,
                                              juego_compra_usuarios_id_user );

CREATE TABLE games_in_catalog (
    id_game    INTEGER NOT NULL,
    fecha_lanz DATE
);

ALTER TABLE games_in_catalog ADD CONSTRAINT games_in_catalog_pk PRIMARY KEY ( id_game );

CREATE TABLE juego (
    id_juego                INTEGER NOT NULL,
    nombre_juego            VARCHAR2(25),
    short_desc              VARCHAR2(100),
    fecha_lanzamiento       DATE,
    precio                  INTEGER,
    genero                  VARCHAR2(25),
    id_clasificacion        INTEGER,
    score                   INTEGER,
    full_desc               VARCHAR2(1000),
    id_dev                  INTEGER NOT NULL,
    library_id_game         INTEGER NOT NULL,
    library_id_usr          INTEGER NOT NULL,
    compra_id_compra        INTEGER NOT NULL,
    compra_usuarios_id_user INTEGER NOT NULL,
    pais_id_pais            INTEGER NOT NULL
);

CREATE UNIQUE INDEX juego__idx ON
    juego (
        pais_id_pais
    ASC );

ALTER TABLE juego
    ADD CONSTRAINT juego_pk PRIMARY KEY ( id_juego,
                                          library_id_game,
                                          library_id_usr,
                                          compra_id_compra,
                                          compra_usuarios_id_user );

CREATE TABLE library (
    id_game          INTEGER NOT NULL,
    id_usr           INTEGER NOT NULL,
    fecha_adq        DATE,
    usuarios_id_user INTEGER NOT NULL
);

CREATE UNIQUE INDEX library__idx ON
    library (
        usuarios_id_user
    ASC );

ALTER TABLE library ADD CONSTRAINT library_pk PRIMARY KEY ( id_game,
                                                            id_usr );

CREATE TABLE pais (
    id_pais INTEGER NOT NULL,
    pais    VARCHAR2(25)
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id_pais );

CREATE TABLE peggi (
    id_peggi                      INTEGER NOT NULL,
    identificador                 VARCHAR2(5),
    edad_min                      INTEGER,
    juego_id_juego                INTEGER NOT NULL,
    juego_library_id_game         INTEGER NOT NULL,
    juego_library_id_usr          INTEGER NOT NULL,
    juego_compra_id_compra        INTEGER NOT NULL,
    juego_compra_usuarios_id_user INTEGER NOT NULL
);

CREATE UNIQUE INDEX peggi__idx ON
    peggi (
        juego_id_juego
    ASC,
        juego_library_id_game
    ASC,
        juego_library_id_usr
    ASC,
        juego_compra_id_compra
    ASC,
        juego_compra_usuarios_id_user
    ASC );

ALTER TABLE peggi ADD CONSTRAINT peggi_pk PRIMARY KEY ( id_peggi );

CREATE TABLE rating (
    id_rating        INTEGER NOT NULL,
    rating           VARCHAR2(25) NOT NULL,
    usuarios_id_user INTEGER NOT NULL
);

ALTER TABLE rating ADD CONSTRAINT rating_pk PRIMARY KEY ( id_rating,
                                                          usuarios_id_user );

CREATE TABLE relation_17 (
    rating_id_rating        INTEGER NOT NULL,
    rating_usuarios_id_user INTEGER NOT NULL,
    juego_id_juego          INTEGER NOT NULL,
    juego_id_game           INTEGER NOT NULL,
    juego_id_usr            INTEGER NOT NULL,
    juego_id_compra         INTEGER NOT NULL,
    juego_id_user           INTEGER NOT NULL
);

ALTER TABLE relation_17
    ADD CONSTRAINT relation_17_pk PRIMARY KEY ( rating_id_rating,
                                                rating_usuarios_id_user,
                                                juego_id_juego,
                                                juego_id_game,
                                                juego_id_usr,
                                                juego_id_compra,
                                                juego_id_user );

CREATE TABLE relation_19 (
    juego_id_juego   INTEGER NOT NULL,
    juego_id_game    INTEGER NOT NULL,
    juego_id_usr     INTEGER NOT NULL,
    juego_id_compra  INTEGER NOT NULL,
    juego_id_user    INTEGER NOT NULL,
    developer_id_dev INTEGER NOT NULL
);

ALTER TABLE relation_19
    ADD CONSTRAINT relation_19_pk PRIMARY KEY ( juego_id_juego,
                                                juego_id_game,
                                                juego_id_usr,
                                                juego_id_compra,
                                                juego_id_user,
                                                developer_id_dev );

CREATE TABLE relation_20 (
    wish_list_wish_list_id   NUMBER NOT NULL,
    games_in_catalog_id_game INTEGER NOT NULL
);

ALTER TABLE relation_20 ADD CONSTRAINT relation_20_pk PRIMARY KEY ( wish_list_wish_list_id,
                                                                    games_in_catalog_id_game );

CREATE TABLE stored_card (
    id_card          INTEGER NOT NULL,
    numero_tarjeta   INTEGER,
    fech_exp         DATE,
    id_usr           INTEGER,
    cardholder_name  VARCHAR2(25),
    id_card1         INTEGER,
    usuarios_id_user INTEGER NOT NULL
);

ALTER TABLE stored_card ADD CONSTRAINT stored_card_pk PRIMARY KEY ( id_card,
                                                                    usuarios_id_user );

CREATE TABLE usuarios (
    id_user      INTEGER NOT NULL,
    usr_name     VARCHAR2(25) NOT NULL,
    usr_lastname VARCHAR2(25),
    usr_nickname VARCHAR2(25),
    usr_bday     DATE,
    id_rol       INTEGER NOT NULL,
    password     VARCHAR2(25) NOT NULL,
    email        VARCHAR2(25),
    id_country   INTEGER,
    pais_id_pais INTEGER NOT NULL
);

CREATE UNIQUE INDEX usuarios__idx ON
    usuarios (
        pais_id_pais
    ASC );

ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id_user );

CREATE TABLE wish_list (
    id_usr           BLOB,
    id_game          INTEGER,
    usuarios_id_user INTEGER NOT NULL,
    wish_list_id     NUMBER NOT NULL
);

CREATE UNIQUE INDEX wish_list__idx ON
    wish_list (
        usuarios_id_user
    ASC );

ALTER TABLE wish_list ADD CONSTRAINT wish_list_pk PRIMARY KEY ( wish_list_id );

ALTER TABLE compra
    ADD CONSTRAINT compra_usuarios_fk FOREIGN KEY ( usuarios_id_user )
        REFERENCES usuarios ( id_user );

ALTER TABLE discounts
    ADD CONSTRAINT discounts_juego_fk FOREIGN KEY ( juego_id_juego,
                                                    juego_library_id_game,
                                                    juego_library_id_usr,
                                                    juego_compra_id_compra,
                                                    juego_compra_usuarios_id_user )
        REFERENCES juego ( id_juego,
                           library_id_game,
                           library_id_usr,
                           compra_id_compra,
                           compra_usuarios_id_user );

ALTER TABLE juego
    ADD CONSTRAINT juego_compra_fk FOREIGN KEY ( compra_id_compra,
                                                 compra_usuarios_id_user )
        REFERENCES compra ( id_compra,
                            usuarios_id_user );

ALTER TABLE juego
    ADD CONSTRAINT juego_library_fk FOREIGN KEY ( library_id_game,
                                                  library_id_usr )
        REFERENCES library ( id_game,
                             id_usr );

ALTER TABLE juego
    ADD CONSTRAINT juego_pais_fk FOREIGN KEY ( pais_id_pais )
        REFERENCES pais ( id_pais );

ALTER TABLE library
    ADD CONSTRAINT library_usuarios_fk FOREIGN KEY ( usuarios_id_user )
        REFERENCES usuarios ( id_user );

ALTER TABLE peggi
    ADD CONSTRAINT peggi_juego_fk FOREIGN KEY ( juego_id_juego,
                                                juego_library_id_game,
                                                juego_library_id_usr,
                                                juego_compra_id_compra,
                                                juego_compra_usuarios_id_user )
        REFERENCES juego ( id_juego,
                           library_id_game,
                           library_id_usr,
                           compra_id_compra,
                           compra_usuarios_id_user );

ALTER TABLE rating
    ADD CONSTRAINT rating_usuarios_fk FOREIGN KEY ( usuarios_id_user )
        REFERENCES usuarios ( id_user );

ALTER TABLE relation_17
    ADD CONSTRAINT relation_17_juego_fk FOREIGN KEY ( juego_id_juego,
                                                      juego_id_game,
                                                      juego_id_usr,
                                                      juego_id_compra,
                                                      juego_id_user )
        REFERENCES juego ( id_juego,
                           library_id_game,
                           library_id_usr,
                           compra_id_compra,
                           compra_usuarios_id_user );

ALTER TABLE relation_17
    ADD CONSTRAINT relation_17_rating_fk FOREIGN KEY ( rating_id_rating,
                                                       rating_usuarios_id_user )
        REFERENCES rating ( id_rating,
                            usuarios_id_user );

ALTER TABLE relation_19
    ADD CONSTRAINT relation_19_developer_fk FOREIGN KEY ( developer_id_dev )
        REFERENCES developer ( id_dev );

ALTER TABLE relation_19
    ADD CONSTRAINT relation_19_juego_fk FOREIGN KEY ( juego_id_juego,
                                                      juego_id_game,
                                                      juego_id_usr,
                                                      juego_id_compra,
                                                      juego_id_user )
        REFERENCES juego ( id_juego,
                           library_id_game,
                           library_id_usr,
                           compra_id_compra,
                           compra_usuarios_id_user );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE relation_20
    ADD CONSTRAINT relation_20_games_in_catalog_fk FOREIGN KEY ( games_in_catalog_id_game )
        REFERENCES games_in_catalog ( id_game );

ALTER TABLE relation_20
    ADD CONSTRAINT relation_20_wish_list_fk FOREIGN KEY ( wish_list_wish_list_id )
        REFERENCES wish_list ( wish_list_id );

ALTER TABLE stored_card
    ADD CONSTRAINT stored_card_usuarios_fk FOREIGN KEY ( usuarios_id_user )
        REFERENCES usuarios ( id_user );

ALTER TABLE usuarios
    ADD CONSTRAINT usuarios_pais_fk FOREIGN KEY ( pais_id_pais )
        REFERENCES pais ( id_pais );

ALTER TABLE wish_list
    ADD CONSTRAINT wish_list_usuarios_fk FOREIGN KEY ( usuarios_id_user )
        REFERENCES usuarios ( id_user );

CREATE SEQUENCE wish_list_wish_list_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER wish_list_wish_list_id_trg BEFORE
    INSERT ON wish_list
    FOR EACH ROW
    WHEN ( new.wish_list_id IS NULL )
BEGIN
    :new.wish_list_id := wish_list_wish_list_id_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             5
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
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
-- CREATE SEQUENCE                          1
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
-- ERRORS                                   1
-- WARNINGS                                 0
