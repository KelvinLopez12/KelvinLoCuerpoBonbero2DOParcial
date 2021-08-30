/*==============================================================*/
/* Table: BOMBERO                                               */
/*==============================================================*/
create table BOMBERO (
   ID_BOMBERO           INT4                 not null,
   ID_RANGO             INT4                 null,
   ID_CARGO             INT4                 null,
   ID_CB                INT4                 null,
   NOMBRE_BOMBERO       VARCHAR(100)         null,
   APELLIDO_BOMBERO     VARCHAR(100)         null,
   DIRECCION_BOMBERO    VARCHAR(500)         null,
   TELEFONO_BOMBERO     VARCHAR(20)          null,
   NACIMIENTO_BOMBERO   DATE                 null,
   TIPO_SANGRE_BOMBERO  VARCHAR(20)          null,
   constraint PK_BOMBERO primary key (ID_BOMBERO)
);

/*==============================================================*/
/* Table: BOMBERO_CURSO                                         */
/*==============================================================*/
create table BOMBERO_CURSO (
   ID_BOMBERO           INT4                 not null,
   ID_CURSO             INT4                 not null,
   PUNTUACION           DECIMAL              null,
   constraint PK_BOMBERO_CURSO primary key (ID_BOMBERO, ID_CURSO)
);

comment on table BOMBERO_CURSO is
'UN BOMBERO REALIZA MUCHOS CURSOS';

/*==============================================================*/
/* Table: BOMBONA                                               */
/*==============================================================*/
create table BOMBONA (
   ID_BOMBONA           INT4                 not null,
   ID_CB                INT4                 null,
   ID_EB                INT4                 null,
   DIRECCION_BOMBONA    VARCHAR(200)         null,
   constraint PK_BOMBONA primary key (ID_BOMBONA)
);
/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO (
   ID_CARGO             INT4                 not null,
   DESCRIPCION_CARGO    VARCHAR(100)         null,
   constraint PK_CARGO primary key (ID_CARGO)
);

/*==============================================================*/
/* Table: CUERPO_BOMBEROS                                       */
/*==============================================================*/
create table CUERPO_BOMBEROS (
   ID_CB                INT4                 not null,
   NOMBRE_CB            VARCHAR(50)          null,
   DIRECCION_CB         VARCHAR(200)         null,
   TELEFONO_CB          VARCHAR(20)          null,
   CORREO_CB            VARCHAR(100)         null,
   constraint PK_CUERPO_BOMBEROS primary key (ID_CB)
);
/*==============================================================*/
/* Table: CURSO                                                 */
/*==============================================================*/
create table CURSO (
   ID_CURSO             INT4                 not null,
   ID_INSTITUCION       INT4                 null,
   DESCRIPCION_CURSO    VARCHAR(500)         null,
   FECHA_INICIO_CURSO   DATE                 null,
   FECHA_FIN_CURSO      DATE                 null,
   HORAS_CURSO          INT4                 null,
   constraint PK_CURSO primary key (ID_CURSO)
);
/*==============================================================*/
/* Table: ESTADO_BOMBONA                                        */
/*==============================================================*/
create table ESTADO_BOMBONA (
   ID_EB                INT4                 not null,
   DESCRIPCION_EB       VARCHAR(100)         null,
   constraint PK_ESTADO_BOMBONA primary key (ID_EB)
);
/*==============================================================*/
/* Table: INSTITUCION                                           */
/*==============================================================*/
create table INSTITUCION (
   ID_INSTITUCION       INT4                 not null,
   NOMBRE_INSTITUCION   VARCHAR(100)         null,
   DIRECCION_INSTITUCION VARCHAR(100)         null,
   TELEFONO_INSTITUCION VARCHAR(20)          null,
   CORREO_INSTITUCION   VARCHAR(100)         null,
   constraint PK_INSTITUCION primary key (ID_INSTITUCION)
);
/*==============================================================*/
/* Table: LLAMADAS                                              */
/*==============================================================*/
create table LLAMADAS (
   ID_LLAMADA           INT4                 not null,
   ID_CB                INT4                 null,
   ID_TL                INT4                 null,
   MOTIVO_LLAMADA       VARCHAR(500)         null,
   FECHA_LLAMADA        DATE                 null,
   USUARIO_LLAMADA      VARCHAR(100)         null,
   constraint PK_LLAMADAS primary key (ID_LLAMADA)
);
/*==============================================================*/
/* Table: COMUNIDAD*/
/*==============================================================*/
create table COMUNIDAD(
   ID_COMUNIDAD           INT4                 not null,
   NOMBRE_COMUNIDAD       VARCHAR(100)         null,
   constraint PK_COMUNIDAD primary key (ID_COMUNIDAD)
);

/*==============================================================*/
/* Table: LLAMADA_SERVICIO                                      */
/*==============================================================*/
create table LLAMADA_SERVICIO (
   ID_SERVICIO          INT4                 not null,
   ID_LLAMADA           INT4                 not null,
   NOMBRE_AFECTADO      VARCHAR(100)         null,
   ESTADO_AFECTADO      VARCHAR(500)         null
);

comment on table LLAMADA_SERVICIO is
'UN SERVICIO SURGE DE UNA LLAMADA';
/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO (
   ID_MANTENIMIENTO     INT4                 not null,
   ID_VEHICULO          INT4                 null,
   ID_BOMBERO           INT4                 null,
   ID_TM                INT4                 null,
   FECHA_MANTENIMIENTO  DATE                 null,
   DETALLE_MANTENIMIENTO VARCHAR(500)         null,
   COSTO_MANTENIMIENTO  DECIMAL              null,
   constraint PK_MANTENIMIENTO primary key (ID_MANTENIMIENTO)
);

/*==============================================================*/
/* Table: MATERIAL                                              */
/*==============================================================*/
create table MATERIAL (
   ID_MATERIAL          INT4                 not null,
   ID_CB                INT4                 null,
   ID_BOMBERO           INT4                 null,
   NOMBRE_MATERIAL      VARCHAR(100)         null,
   constraint PK_MATERIAL primary key (ID_MATERIAL)
);

/*==============================================================*/
/* Table: RANGO                                                 */
/*==============================================================*/
create table RANGO (
   ID_RANGO             INT4                 not null,
   DESCRIPCION_RANGO    VARCHAR(100)         null,
   constraint PK_RANGO primary key (ID_RANGO)
);
/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          INT4                 not null,
   ID_CB                INT4                 null,
   ID_COMUNIDAD         INT4                 null,
   FECHA_SERVICIO       DATE                 null,
   DIRECCION_SERVICIO   VARCHAR(100)         null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);
/*==============================================================*/
/* Table: SERVICIOS_BOMBEROS                                    */
/*==============================================================*/
create table SERVICIOS_BOMBEROS (
   ID_BOMBERO           INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   ASISTENCIA_SB        VARCHAR(10)          null,
   PUNTUACION_SB        DECIMAL              null,
   DETALLE_SB           VARCHAR(500)         null,
   constraint PK_SERVICIOS_BOMBEROS primary key (ID_BOMBERO, ID_SERVICIO)
);

comment on table SERVICIOS_BOMBEROS is
'UN SERVICIO ES ´RESTADO POR MUCHOS BOMBEROS';

/*==============================================================*/
/* Table: SERVICIO_VEHICULO                                     */
/*==============================================================*/
create table SERVICIO_VEHICULO (
   ID_VEHICULO          INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   constraint PK_SERVICIO_VEHICULO primary key (ID_VEHICULO, ID_SERVICIO)
);

comment on table SERVICIO_VEHICULO is
'UN SERVICIO PUEDE SER ATENDIDO POR VARIOS VEHICULOS';

/*==============================================================*/
/* Table: TIPO_LLAMADA                                          */
/*==============================================================*/
create table TIPO_LLAMADA (
   ID_TL                INT4                 not null,
   DESCRIPCION_TL       VARCHAR(100)         null,
   constraint PK_TIPO_LLAMADA primary key (ID_TL)
);

/*==============================================================*/
/* Table: TIPO_MANTENIMIENTO                                    */
/*==============================================================*/
create table TIPO_MANTENIMIENTO (
   ID_TM                INT4                 not null,
   DESCRIPCION_TM       VARCHAR(100)         null,
   constraint PK_TIPO_MANTENIMIENTO primary key (ID_TM)
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   ID_VEHICULO          INT4                 not null,
   ID_CB                INT4                 null,
   ID_BOMBERO           INT4                 null,
   PLACA_VEHICULO       VARCHAR(15)          null,
   constraint PK_VEHICULO primary key (ID_VEHICULO)
);

alter table BOMBERO
   add constraint FK_BOMBERO_BOMBERO_C_CARGO foreign key (ID_CARGO)
      references CARGO (ID_CARGO)
      on delete restrict on update restrict;

alter table BOMBERO
   add constraint FK_BOMBERO_BOMBERO_R_RANGO foreign key (ID_RANGO)
      references RANGO (ID_RANGO)
      on delete restrict on update restrict;

alter table BOMBERO
   add constraint FK_BOMBERO_CERPO_BOM_CUERPO_B foreign key (ID_CB)
      references CUERPO_BOMBEROS (ID_CB)
      on delete restrict on update restrict;

alter table BOMBERO_CURSO
   add constraint FK_BOMBERO__BOMBERO_C_BOMBERO foreign key (ID_BOMBERO)
      references BOMBERO (ID_BOMBERO)
      on delete restrict on update restrict;

alter table BOMBERO_CURSO
   add constraint FK_BOMBERO__BOMBERO_C_CURSO foreign key (ID_CURSO)
      references CURSO (ID_CURSO)
      on delete restrict on update restrict;

alter table BOMBONA
   add constraint FK_BOMBONA_BOMBONA_E_ESTADO_B foreign key (ID_EB)
      references ESTADO_BOMBONA (ID_EB)
      on delete restrict on update restrict;

alter table BOMBONA
   add constraint FK_BOMBONA_CUERPO_BO_CUERPO_B foreign key (ID_CB)
      references CUERPO_BOMBEROS (ID_CB)
      on delete restrict on update restrict;

alter table CURSO
   add constraint FK_CURSO_INSTITUCI_INSTITUC foreign key (ID_INSTITUCION)
      references INSTITUCION (ID_INSTITUCION)
      on delete restrict on update restrict;

alter table LLAMADAS
   add constraint FK_LLAMADAS_CUERPO_LL_CUERPO_B foreign key (ID_CB)
      references CUERPO_BOMBEROS (ID_CB)
      on delete restrict on update restrict;

alter table LLAMADAS
   add constraint FK_LLAMADAS_LLAMADA_T_TIPO_LLA foreign key (ID_TL)
      references TIPO_LLAMADA (ID_TL)
      on delete restrict on update restrict;

alter table LLAMADA_SERVICIO
   add constraint FK_LLAMADA__LLAMADA_S_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table LLAMADA_SERVICIO
   add constraint FK_LLAMADA__LLAMADA_S_LLAMADAS foreign key (ID_LLAMADA)
      references LLAMADAS (ID_LLAMADA)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_MANTENIMI_BOMBERO foreign key (ID_BOMBERO)
      references BOMBERO (ID_BOMBERO)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_MATENIMIE_TIPO_MAN foreign key (ID_TM)
      references TIPO_MANTENIMIENTO (ID_TM)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_VEHICULO__VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
      on delete restrict on update restrict;

alter table MATERIAL
   add constraint FK_MATERIAL_BOMBERO_M_BOMBERO foreign key (ID_BOMBERO)
      references BOMBERO (ID_BOMBERO)
      on delete restrict on update restrict;

alter table MATERIAL
   add constraint FK_MATERIAL_CUERPO_MA_CUERPO_B foreign key (ID_CB)
      references CUERPO_BOMBEROS (ID_CB)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_CUERPO_SE_CUERPO_B foreign key (ID_CB)
      references CUERPO_BOMBEROS (ID_CB)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_COMUNIDAD foreign key (ID_COMUNIDAD)
      references COMUNIDAD (ID_COMUNIDAD)
      on delete restrict on update restrict;

alter table SERVICIOS_BOMBEROS
   add constraint FK_SERVICIO_SERVICIOS_BOMBERO foreign key (ID_BOMBERO)
      references BOMBERO (ID_BOMBERO)
      on delete restrict on update restrict;

alter table SERVICIOS_BOMBEROS
   add constraint FK_SERVICIO_SERVICIOS_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table SERVICIO_VEHICULO
   add constraint FK_SERVICIO_SERVICIO__VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
      on delete restrict on update restrict;

alter table SERVICIO_VEHICULO
   add constraint FK_SERVICIO_SERVICIO__SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table VEHICULO
   add constraint FK_VEHICULO_CUERPO_VE_CUERPO_B foreign key (ID_CB)
      references CUERPO_BOMBEROS (ID_CB)
      on delete restrict on update restrict;

alter table VEHICULO
   add constraint FK_VEHICULO_VEHICULO__BOMBERO foreign key (ID_BOMBERO)
      references BOMBERO (ID_BOMBERO)
      on delete restrict on update restrict;
