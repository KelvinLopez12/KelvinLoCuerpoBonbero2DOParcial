/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     4/7/2021 21:41:45                            */
/*==============================================================*/


/*drop table BOMBERO;

drop table BOMBERO_CURSO;

drop table BOMBONA;

drop table CARGO;

drop table CUERPO_BOMBEROS;

drop table CURSO;

drop table ESTADO_BOMBONA;

drop table INSTITUCION;

drop table LLAMADAS;

drop table LLAMADA_SERVICIO;

drop table MANTENIMIENTO;

drop table MATERIAL;

drop table RANGO;

drop table SERVICIO;

drop table SERVICIOS_BOMBEROS;

drop table SERVICIO_VEHICULO;

drop table TIPO_LLAMADA;

drop table TIPO_MANTENIMIENTO;

drop table VEHICULO;*/

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


/*INSTITUCION*/
insert into INSTITUCION values (1,'Bomberman.SA', ' Cr45 40-46 Antioquia, Medellín Colombia.  ', 0345974562,'Bombsa@gmail.com');
insert into INSTITUCION values (2,'Bomberos de Miranda', 'avenida victor baptistas adyacente a la universidad simon rodriguez ', 1568975642,'BobMiranda@gmail.com');

/*CURSO*/
insert into CURSO values (1,1,'Entrada Forzada', '10/03/2020','10/06/2020',50);
insert into CURSO values (2,2,'Ventilación en Incendios Estructurales', '13/04/2020','13/05/2020',50);
insert into CURSO values (3,1,'Cuerdas, Nudos e Izlamiento del Material', '15/05/2020','15/05/2020',60);
insert into CURSO values (4,2,'Escalas para Control de Incendios', '17/06/2020','17/07/2020',60);
insert into CURSO values (5,1,'Búsqueda y Rescate en Incendios', '10/01/2021','10/02/2021',40);
insert into CURSO values (6,2,'Taller Sistema de Comando de Incidentes', '10/02/2021','10/03/2021',80);

/*RANGO*/
insert into RANGO values(1,'Capitan');
insert into RANGO values(2,'Inspector de brigada');
insert into RANGO values(3,'Subinspector de Brigada');
insert into RANGO values(4,'Bombero');

/*CARGO*/
insert into CARGO values(1,'Administrativo');
insert into CARGO values(2,'De servicio');
insert into CARGO values(3,'Mecanico');
insert into CARGO values(4,'Chofer');
insert into CARGO values(5,'Bombero');

/*CUERPO DE BOMBEROS*/
insert into CUERPO_BOMBEROS values (1,'Cuerpo de Bomberos de Manta', 'Ecuador, Manabi, Manta , Calle 12 y Avenida 11', 0964785321,'CBManta@gmail.com');

/*BOMBERO*/
insert into BOMBERO values(1,1,1,1,' Consuelo', 'Peinado ', 'Los esteros ', 0965478123,'15/03/1970','O +');
insert into BOMBERO values(2,2,2,1,'Mariano ', 'Cano ', ' 24 de Mayo', 0965785123,'15/03/1970','A +');
insert into BOMBERO values(3,3,3,1,' Jeronimo', 'Mejia ', 'calle 13 av 14', 0935879461,'15/03/1970', 'A-');
insert into BOMBERO values(4,4,4,1,'Luis ', 'Rey ', 'Calle 13 Av 24', 0960123458,'15/03/1970', 'B+');
insert into BOMBERO values(5,1,5,1,'Alexandre ', 'Dominguez ', 'Cuba ', 0965874132,'15/03/1970', 'AB +');
insert into BOMBERO values(6,2,1,1,'Rafael ', 'Fuentes ', 'Cosase', 0969874523,'15/03/1970','AB -');
insert into BOMBERO values(7,3,2,1,'Petra', 'Sevillano ', 'Los Angeles', 0925478944,'15/03/1970','O +');
insert into BOMBERO values(8,4,3,1,'Jhon ', 'Nieto ', 'Los esteros', 0936987415,'15/03/1970', 'A +');
insert into BOMBERO values(9,1,4,1,'Marc ', 'Esponoza ', 'El palmar', 0947851641,'15/03/1970','A-');
insert into BOMBERO values(10,2,2,1,'Pedro ', 'Sole ', 'Proaño ', 0932548942,'15/03/1970','B+');

/*BOMBERO_CURSO*/
insert into BOMBERO_CURSO values(1,1,10);
insert into BOMBERO_CURSO values(2,1,9);
insert into BOMBERO_CURSO values(3,1,10);
insert into BOMBERO_CURSO values(4,2,8);
insert into BOMBERO_CURSO values(5,2,7);
insert into BOMBERO_CURSO values(6,2,9);
insert into BOMBERO_CURSO values(7,3,10);
insert into BOMBERO_CURSO values(8,3,9);
insert into BOMBERO_CURSO values(9,3,9);
insert into BOMBERO_CURSO values(10,4,9);
insert into BOMBERO_CURSO values(1,4,10);
insert into BOMBERO_CURSO values(2,4,9);
insert into BOMBERO_CURSO values(3,5,8);
insert into BOMBERO_CURSO values(4,5,10);
insert into BOMBERO_CURSO values(5,6,9);
insert into BOMBERO_CURSO values(6,6,8);

/*Tipo_llamada*/
insert into TIPO_LLAMADA values(1,'Llamada Seria');
insert into TIPO_LLAMADA values(2,'Llamada de broma');
insert into TIPO_LLAMADA values(3,'Llamada perdida');

/*LLAMADA*/
insert into LLAMADAS values(1,1,1,'Aviso de incendio','07/03/2020','Romulo Villacis');
insert into LLAMADAS values(2,1,1,'Explosion tanque de gas','17/04/2020','Roque Castro');
insert into LLAMADAS values(3,1,1,'Aviso choque en carretera ','07/05/2020','Amador Chavez');
insert into LLAMADAS values(4,1,1,'Aviso para rescate','20/06/2020','Basilisa Fuentes');
insert into LLAMADAS values(5,1,1,'Incendio en domicilio','30/10/2020','Victor Vazquez');
insert into LLAMADAS values(6,1,1,'Deslabe de ladera','07/02/2021','Teo Gomez');
insert into LLAMADAS values(7,1,1,'Incendio en centro comercial','17/05/2021','Drizz Hoyos');
insert into LLAMADAS values(8,1,2,'Ninguno','26/05/2021','Desconocido');
insert into LLAMADAS values(9,1,2,'Ninguno','17/06/2021','Desconocido');
insert into LLAMADAS values(10,1,3,'Desconocido','24/06/2021','Desconocido');

/*COMUNIDAD*/
INSERT INTO COMUNIDAD VALUES(1,'Eloy Alfaro');
INSERT INTO COMUNIDAD VALUES(2,'Los Esteros');
INSERT INTO COMUNIDAD VALUES(3,'TARQUI');


/*SERVICIO*/
insert into SERVICIO values(1,1,1,'07/03/2020','Barrio los esteros');
insert into SERVICIO values(2,1,2,'17/04/2020','Barrio los Angeles');
insert into SERVICIO values(3,1,3,'07/05/2020','Calle 13 entre Av 15 y 16');
insert into SERVICIO values(4,1,1,'20/06/2020','Altos de Manta Beach');
insert into SERVICIO values(5,1,2,'30/10/2020','Ciudadela Montecristo');
insert into SERVICIO values(6,1,2,'07/02/2021','San Lorenzo');
insert into SERVICIO values(7,1,3,'17/05/2021','La pradera');

/*LLAMADA_SERVICIO*/
insert into LLAMADA_SERVICIO values(1,1,'Luis Miguel','Quemadura de primera grado');
insert into LLAMADA_SERVICIO values(1,1,'Valentina Pratsl','Quemadura de segundo grado');
insert into LLAMADA_SERVICIO values(2,2,'Luisa Martinez','Quemadura de tercer grado');
insert into LLAMADA_SERVICIO values(2,2,'Irene Cristobal','Fractura interna');
insert into LLAMADA_SERVICIO values(3,3,'Najat Lopez','Fractura expuesta');
insert into LLAMADA_SERVICIO values(3,3,'Isaias Mendoza','Contusiones leves');
insert into LLAMADA_SERVICIO values(4,4,'Noa Sole','Contusiones graves');
insert into LLAMADA_SERVICIO values(4,4,'Ignacio Duran','Ileso');
insert into LLAMADA_SERVICIO values(5,5,'Younes Roman','Fallecido');
insert into LLAMADA_SERVICIO values(5,5,'Clara Lujan','Quemadura de primera grado');
insert into LLAMADA_SERVICIO values(6,6,'Josu Oviedo','Fractura interna');
insert into LLAMADA_SERVICIO values(6,6,'Angel Villar','Contusiones leves');
insert into LLAMADA_SERVICIO values(7,7,'Basilisa Redondo','Quemadura de segundo grado');
insert into LLAMADA_SERVICIO values(7,7,'Alberto Frances','Quemadura de tercer grado');

/*MATERIAL*/
insert into MATERIAL values(1,1,1,'casco 1');
insert into MATERIAL values(2,1,2,'casco 2');
insert into MATERIAL values(3,1,3,'casco 3');
insert into MATERIAL values(4,1,4,'hacha 1');
insert into MATERIAL values(5,1,5,'hacha 2');
insert into MATERIAL values(6,1,6,'hacha 3');
insert into MATERIAL values(7,1,7,'pala 1');
insert into MATERIAL values(8,1,8,'pala 2');
insert into MATERIAL values(9,1,9,'pala 3');
insert into MATERIAL values(10,1,10,'escalera 1');
insert into MATERIAL values(11,1,1,'escalera 2');
insert into MATERIAL values(12,1,2,'escalera 3');

/*ESTADO_BOMBONA*/
insert into ESTADO_BOMBONA values(1,'Disponible');
insert into ESTADO_BOMBONA values(2,'En mantenimiento');
insert into ESTADO_BOMBONA values(3,'Defectuosa');


/*BOMBONA*/
insert into BOMBONA values(1,1,1,'Barrio los esteros');
insert into BOMBONA values(2,1,2,'Barrio los Angeles');
insert into BOMBONA values(3,1,3,'Barrio los Esteros');
insert into BOMBONA values(4,1,1,'24 de mayo');
insert into BOMBONA values(5,1,2,'Cosase');

/*TIPO_MANTENIMIENTO*/
insert into TIPO_MANTENIMIENTO values(1,'Cambio de partes');
insert into TIPO_MANTENIMIENTO values(2,'Mantenimiento preventivo');
insert into TIPO_MANTENIMIENTO values(3,'Limpieza');
insert into TIPO_MANTENIMIENTO values(4,'Control de rutina');

/*VEHICULO*/
insert into vehiculo values(1,1,1,'ABC-123');
insert into vehiculo values(2,1,2,'PTT-159');
insert into vehiculo values(3,1,3,'MBC-463');

/*MANTENIMIENTO*/
insert into MANTENIMIENTO values(1,1,1,1,'05/07/2020','Se realiza cambio de ruedas al vehiculo',500);
insert into MANTENIMIENTO values(2,1,1,2,'10/09/2020','Se un mantenimiento preventivo al motor',100);
insert into MANTENIMIENTO values(3,2,2,3,'15/11/2020','Se realiza limpieza del vehiculo',20);
insert into MANTENIMIENTO values(4,3,3,4,'20/01/2021','Se realiza control de rutina al vehiculo',60);
insert into MANTENIMIENTO values(5,3,4,1,'25/03/2021','Se realiza cambio de bujias',200);

/*SERVICIO_VEHICULO*/
insert into SERVICIO_VEHICULO values(1,1);
insert into SERVICIO_VEHICULO values(1,2);
insert into SERVICIO_VEHICULO values(2,2);
insert into SERVICIO_VEHICULO values(3,3);
insert into SERVICIO_VEHICULO values(2,4);
insert into SERVICIO_VEHICULO values(3,4);
insert into SERVICIO_VEHICULO values(1,5);
insert into SERVICIO_VEHICULO values(2,6);
insert into SERVICIO_VEHICULO values(3,7);

/*SERVICIOS_BOMBEROS*/
insert into SERVICIOS_BOMBEROS values(1,1,'SI',9,'Control de incendio');
insert into SERVICIOS_BOMBEROS values(2,1,'NO',0,'Ninguna');
insert into SERVICIOS_BOMBEROS values(5,1,'SI',9,'Control de incendio');
insert into SERVICIOS_BOMBEROS values(6,1,'SI',9,'Control de incendio');
insert into SERVICIOS_BOMBEROS values(3,2,'SI',9,'Primeros auxilios');
insert into SERVICIOS_BOMBEROS values(4,2,'SI',9,'Primeros auxilios');
insert into SERVICIOS_BOMBEROS values(7,2,'NO',0,'Ninguna');
insert into SERVICIOS_BOMBEROS values(8,2,'SI',9,'Primeros auxilios');
insert into SERVICIOS_BOMBEROS values(5,3,'NO',0,'Ninguna');
insert into SERVICIOS_BOMBEROS values(6,3,'SI',9,'Primeros auxilios');
insert into SERVICIOS_BOMBEROS values(9,3,'SI',9,'limpieza de escombros');
insert into SERVICIOS_BOMBEROS values(10,3,'NO',0,'Ninguna');
insert into SERVICIOS_BOMBEROS values(7,4,'SI',9,'Primeros auxilios');
insert into SERVICIOS_BOMBEROS values(8,4,'NO',0,'Ninguna');
insert into SERVICIOS_BOMBEROS values(9,5,'SI',9,'Control de incendio');
insert into SERVICIOS_BOMBEROS values(10,5,'SI',9,'Control de incendio');
insert into SERVICIOS_BOMBEROS values(1,6,'NO',0,'Ninguna');
insert into SERVICIOS_BOMBEROS values(2,6,'SI',9,'Evacuacion de civiles');
insert into SERVICIOS_BOMBEROS values(3,7,'SI',9,'Control de incendio');
insert into SERVICIOS_BOMBEROS values(4,7,'NO',0,'Ninguna');







/*Consulta-1*/
/*Consultar el lugar del siniestro, quien reporto y el motivo de la misma.*/
select
SERVICIO.DIRECCION_SERVICIO AS LUGAR,
LLAMADAS.USUARIO_LLAMADA AS REPORTANTE,
LLAMADAS.MOTIVO_LLAMADA AS MOTIVO
FROM SERVICIO 
INNER JOIN LLAMADA_SERVICIO ON LLAMADA_SERVICIO.ID_SERVICIO=SERVICIO.ID_SERVICIO
INNER JOIN LLAMADAS ON LLAMADAS.ID_LLAMADA=LLAMADA_SERVICIO.ID_LLAMADA;

/*Consulta-2*/
/*Mostar dentro de cada rango de oficial del cuerpo de bomberos cuantos cursos se han realizados por cada bombero.*/
select 
(BOMBERO.NOMBRE_BOMBERO || BOMBERO.APELLIDO_BOMBERO) as BOMBERO,
RANGO.DESCRIPCION_RANGO as RANGO,
count(CURSO.ID_CURSO) as CANTIDAD_CURSOS
from BOMBERO
inner join RANGO on RANGO.ID_RANGO=BOMBERO.ID_RANGO
inner join BOMBERO_CURSO on BOMBERO_CURSO.ID_BOMBERO=BOMBERO.ID_BOMBERO
inner join CURSO on CURSO.ID_CURSO=BOMBERO_CURSO.ID_CURSO
group by BOMBERO, RANGO


/*Consulta-3*/
/*Consultar la cantidad de veces que un bombero ha faltado.*/
select 
(BOMBERO.NOMBRE_BOMBERO || BOMBERO.APELLIDO_BOMBERO) as BOMBERO,
count(SERVICIOS_BOMBEROS.ID_SERVICIO)as CANTIDAD_FALTAS
from BOMBERO
inner join SERVICIOS_BOMBEROS on SERVICIOS_BOMBEROS.ID_BOMBERO=BOMBERO.ID_BOMBERO
where SERVICIOS_BOMBEROS.ASISTENCIA_SB='NO'
group by BOMBERO;


/*Consulta-4*/
/*Mostrar cuantas personas le han dado mantenimiento a un vehículo.*/

select 
VEHICULO.PLACA_VEHICULO as placa,
count(BOMBERO.ID_BOMBERO) as CANTIDAD_PERSONAS
from VEHICULO
inner join MANTENIMIENTO on MANTENIMIENTO.ID_VEHICULO=VEHICULO.ID_VEHICULO
inner join BOMBERO on MANTENIMIENTO.ID_BOMBERO=BOMBERO.ID_BOMBERO
group by placa;



/*Consulta--Adicional*/
/*Consultar la puntuación de cada bombero y la actividad de servicio que realiza.*/


SELECT 
(BOMBERO.NOMBRE_BOMBERO || BOMBERO.APELLIDO_BOMBERO)AS BOMBERO,
SERVICIO.ID_SERVICIO,
SERVICIOS_BOMBEROS.DETALLE_SB,
SERVICIOS_BOMBEROS.PUNTUACION_SB
FROM SERVICIO
INNER JOIN SERVICIOS_BOMBEROS ON SERVICIOS_BOMBEROS.ID_SERVICIO=SERVICIO.ID_SERVICIO
INNER JOIN BOMBERO ON BOMBERO.ID_BOMBERO=SERVICIOS_BOMBEROS.ID_BOMBERO
ORDER BY BOMBERO;