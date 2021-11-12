
/*==============================================================*/
/* Table: CHEF                                                  */
/*==============================================================*/
create table CHEF (
   ID_CHEF              NUMERIC              not null,
   NOMB_CHEF            TEXT                 null,
   APELL_CHEF           TEXT                 null,
   TELF_CHEF            TEXT                 null,
   constraint PK_CHEF primary key (ID_CHEF)
);

/*==============================================================*/
/* Index: CHEF_PK                                               */
/*==============================================================*/
create unique index CHEF_PK on CHEF (
ID_CHEF
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMERIC              not null,
   NOMB_CLIENTE         TEXT                 null,
   APELL_CLIENTE        TEXT                 null,
   CEDULA               TEXT                 null,
   TELF_CLIENTE         TEXT                 null,
   EMAIL_CLIENTE        TEXT                 null,
   DIRECCION_CLIENTE    TEXT                 null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   ID_FACTURA           NUMERIC              not null,
   NUM_DETALLE          NUMERIC              not null,
   ID_PLATO             NUMERIC              not null,
   CANTIDAD_DETALLE     NUMERIC              null,
   PRECIO_DETALLE       DECIMAL              null,
   VALOR_NETO           DECIMAL              null,
   constraint PK_DETALLE_FACTURA primary key (ID_FACTURA, NUM_DETALLE)
);

/*==============================================================*/
/* Index: DETALLE_FACTURA_PK                                    */
/*==============================================================*/
create unique index DETALLE_FACTURA_PK on DETALLE_FACTURA (
ID_FACTURA,
NUM_DETALLE
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on DETALLE_FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on DETALLE_FACTURA (
ID_PLATO
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           NUMERIC              not null,
   ID_CLIENTE           NUMERIC              not null,
   FECHA_FACTURA        DATE                 null,
   SUBTOTAL_FACTURA     DECIMAL              null,
   IVA_FACTURA          DECIMAL              null,
   TOTAL_FACTURA        DECIMAL              null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on FACTURA (
ID_CLIENTE
);

/*==============================================================*/
/* Table: INGREDIENTE                                           */
/*==============================================================*/
create table INGREDIENTE (
   ID_INGREDIENTE       NUMERIC              not null,
   ID_MEDIDA            NUMERIC              not null,
   NOMB_INGREDIENTE     TEXT                 null,
   CANT_INGREDIENTE     NUMERIC              null,
   COSTO_UND            DECIMAL              null,
   constraint PK_INGREDIENTE primary key (ID_INGREDIENTE)
);

/*==============================================================*/
/* Index: INGREDIENTE_PK                                        */
/*==============================================================*/
create unique index INGREDIENTE_PK on INGREDIENTE (
ID_INGREDIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on INGREDIENTE (
ID_MEDIDA
);

/*==============================================================*/
/* Table: MEDIDA                                                */
/*==============================================================*/
create table MEDIDA (
   ID_MEDIDA            NUMERIC              not null,
   DESCRP_MEDIDA        TEXT                 null,
   constraint PK_MEDIDA primary key (ID_MEDIDA)
);

/*==============================================================*/
/* Index: MEDIDA_PK                                             */
/*==============================================================*/
create unique index MEDIDA_PK on MEDIDA (
ID_MEDIDA
);

/*==============================================================*/
/* Table: MESA                                                  */
/*==============================================================*/
create table MESA (
   ID_MESA              NUMERIC              not null,
   NUM_MESA             NUMERIC              null,
   ID_MESERO            NUMERIC              not null,
   constraint PK_MESA primary key (ID_MESA)
);

/*==============================================================*/
/* Index: MESA_PK                                               */
/*==============================================================*/
create unique index MESA_PK on MESA (
ID_MESA
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on MESA (
ID_MESERO
);

/*==============================================================*/
/* Table: MESERO                                                */
/*==============================================================*/
create table MESERO (
   ID_MESERO            NUMERIC              not null,
   NOMB_MESERO          TEXT                 null,
   APELL_MESERO         TEXT                 null,
   TELF_MESERO          TEXT                 null,
   constraint PK_MESERO primary key (ID_MESERO)
);

/*==============================================================*/
/* Index: MESERO_PK                                             */
/*==============================================================*/
create unique index MESERO_PK on MESERO (
ID_MESERO
);

/*==============================================================*/
/* Table: PLATO                                                 */
/*==============================================================*/
create table PLATO (
   ID_PLATO             NUMERIC              not null,
   NOMB_PLATO           TEXT                 null,
   DESCR_PLATO          TEXT                 null,
   PRECIO_PLATO         DECIMAL              null,
   constraint PK_PLATO primary key (ID_PLATO)
);

/*==============================================================*/
/* Index: PLATO_PK                                              */
/*==============================================================*/
create unique index PLATO_PK on PLATO (
ID_PLATO
);

/*==============================================================*/
/* Table: RECETA                                                */
/*==============================================================*/
create table RECETA (
   ID_PLATO             NUMERIC              not null,
   ID_RECETA            NUMERIC              not null,
   NOMB_RECETA          TEXT                 null,
   ID_INGREDIENTE       NUMERIC              not null,
   ID_CHEF              NUMERIC              not null,
   constraint PK_RECETA primary key (ID_PLATO, ID_RECETA)
);

/*==============================================================*/
/* Index: RECETA_PK                                             */
/*==============================================================*/
create unique index RECETA_PK on RECETA (
ID_PLATO,
ID_RECETA
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on RECETA (
ID_PLATO
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on RECETA (
ID_INGREDIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on RECETA (
ID_CHEF
);

/*==============================================================*/
/* Table: RESERVACION                                           */
/*==============================================================*/
create table RESERVACION (
   ID_CLIENTE           NUMERIC              not null,
   ID_RESERVACION       NUMERIC              not null,
   ID_MESA              NUMERIC              not null,
   ESTADO_RESERVACION   TEXT                 null,
   FECHA_LLAMADA        DATE                 null,
   FECHA_RESERVACION    DATE                 null,
   constraint PK_RESERVACION primary key (ID_CLIENTE, ID_RESERVACION)
);

/*==============================================================*/
/* Index: RESERVACION_PK                                        */
/*==============================================================*/
create unique index RESERVACION_PK on RESERVACION (
ID_CLIENTE,
ID_RESERVACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on RESERVACION (
ID_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on RESERVACION (
ID_MESA
);

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_PLATO foreign key (ID_PLATO)
      references PLATO (ID_PLATO)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table INGREDIENTE
   add constraint FK_INGREDIE_RELATIONS_MEDIDA foreign key (ID_MEDIDA)
      references MEDIDA (ID_MEDIDA)
      on delete restrict on update restrict;

alter table MESA
   add constraint FK_MESA_RELATIONS_MESERO foreign key (ID_MESERO)
      references MESERO (ID_MESERO)
      on delete restrict on update restrict;

alter table RECETA
   add constraint FK_RECETA_RELATIONS_INGREDIE foreign key (ID_INGREDIENTE)
      references INGREDIENTE (ID_INGREDIENTE)
      on delete restrict on update restrict;

alter table RECETA
   add constraint FK_RECETA_RELATIONS_CHEF foreign key (ID_CHEF)
      references CHEF (ID_CHEF)
      on delete restrict on update restrict;

alter table RECETA
   add constraint FK_RECETA_RELATIONS_PLATO foreign key (ID_PLATO)
      references PLATO (ID_PLATO)
      on delete restrict on update restrict;

alter table RESERVACION
   add constraint FK_RESERVAC_RELATIONS_MESA foreign key (ID_MESA)
      references MESA (ID_MESA)
      on delete restrict on update restrict;

alter table RESERVACION
   add constraint FK_RESERVAC_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;