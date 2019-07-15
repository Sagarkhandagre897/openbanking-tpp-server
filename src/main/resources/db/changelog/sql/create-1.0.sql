SET DATABASE DEFAULT INITIAL SCHEMA PUBLIC;
SET SCHEMA PUBLIC;
CREATE MEMORY TABLE USER_BANK
(
    USERNAME      VARCHAR(64)                                             NOT NULL,
    BANK_ID       VARCHAR(64)                                             NOT NULL,
    CODE          VARCHAR(64),
    BANK_USERNAME VARCHAR(64),
    ACCESS_TOKEN  VARCHAR(64),
    SCOPE         VARCHAR(64),
    ID            INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 0) NOT NULL PRIMARY KEY
);
ALTER TABLE USER_BANK
    ALTER COLUMN ID RESTART WITH 0;
CREATE MEMORY TABLE ACCESS_TOKEN
(
    ID                INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 0) NOT NULL,
    ACCESS_TOKEN      VARCHAR(64)                                             NOT NULL,
    ACCESS_TOKEN_TYPE VARCHAR(8)                                              NOT NULL,
    SCOPE             VARCHAR(64)                                             NOT NULL,
    EXPIRES           BIGINT                                                  NOT NULL,
    REFRESH_TOKEN     VARCHAR(64),
    BANK_ID           VARCHAR(64)                                             NOT NULL,
    USERNAME          VARCHAR(64),
    CONSTRAINT ACCESS_TOKEN2_PK PRIMARY KEY (ID)
);
ALTER TABLE ACCESS_TOKEN
    ALTER COLUMN ID RESTART WITH 14;
CREATE MEMORY TABLE CONSENTS
(
    ID        INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 0) NOT NULL,
    BANK_ID   VARCHAR(64)                                             NOT NULL,
    CONSENTID VARCHAR(64)                                             NOT NULL,
    EXPIRES   INTEGER,
    CONSTRAINT CONSENTS_PK PRIMARY KEY (ID)
);
ALTER TABLE CONSENTS
    ALTER COLUMN ID RESTART WITH 0;
CREATE MEMORY TABLE BANKS
(
    ID            VARCHAR(64) NOT NULL,
    NAME          VARCHAR(64),
    SHORTNAME     VARCHAR(64),
    LONGNAME      VARCHAR(255),
    LOGOURL       VARCHAR(255),
    TOKEN_URL     VARCHAR(255),
    ACCOUNTS_URL  VARCHAR(255),
    CLIENT_ID     VARCHAR(64),
    CLIENT_SECRET VARCHAR(64),
    CALLBACK_URL  VARCHAR(255),
    USERNAME      VARCHAR(64),
    AUTHORIZE_URL VARCHAR(255),
    CONSTRAINT BANKS_PK PRIMARY KEY (ID)
);
CREATE MEMORY TABLE USERS
(
    USERNAME VARCHAR(50) COLLATE SQL_TEXT_UCC NOT NULL PRIMARY KEY,
    PASSWORD VARCHAR(500) COLLATE SQL_TEXT_UCC NOT NULL,
    ENABLED  BOOLEAN NOT NULL
);
CREATE MEMORY TABLE AUTHORITIES
(
    USERNAME  VARCHAR(50) COLLATE SQL_TEXT_UCC NOT NULL,
    AUTHORITY VARCHAR(50) COLLATE SQL_TEXT_UCC NOT NULL,
    CONSTRAINT FK_AUTHORITIES_USERS FOREIGN KEY (USERNAME) REFERENCES PUBLIC.USERS (USERNAME)
);
CREATE UNIQUE INDEX IX_AUTH_USERNAME ON AUTHORITIES (USERNAME, AUTHORITY);
COMMENT ON TABLE USER_BANK IS 'User & Bank relation';
