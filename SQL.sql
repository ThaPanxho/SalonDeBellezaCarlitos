CREATE DATABASE SalonDeBellezaCarlitos
GO
USE SalonDeBellezaCarlitos
GO
GO
CREATE SCHEMA gnrl;
GO
CREATE SCHEMA salo;
GO
CREATE SCHEMA acce;
GO
CREATE TABLE acce.tbUsuarios(
	usur_Id					    INT IDENTITY(1,1),
	usur_Usuario				NVARCHAR(100) NOT NULL UNIQUE,
	usur_Contrasenia			NVARCHAR(MAX) NOT NULL,
	empl_Id					    INT not null UNIQUE,
	usur_UsuarioCreacion		INT not null,
	usur_FechaCreacion		    DATETIME NOT NULL DEFAULT GETDATE(),
	usur_UsuarioModificacion    INT,
	usur_FechaModificacion	    DATETIME,
	usur_Estado				    BIT NOT NULL DEFAULT 1,

	CONSTRAINT PK_acce_tbUsuarios_usur_Id PRIMARY KEY(usur_Id)
);

CREATE TABLE gnrl.tbMetodoPago(
    metp_Id                         INT IDENTITY(1,1) not null,
    metp_Descripcion                NVARCHAR (100) NOT NULL,
	metp_FechaCreacion		        DATETIME NOT NULL DEFAULT GETDATE(),
	metp_UsuarioCreacion		    INT not null,
	metp_FechaModificacion	        DATETIME,
	metp_UsuarioModificacion        INT,
	metp_Estado				        BIT NOT NULL DEFAULT 1,
	
	CONSTRAINT PK_gnrl_tbMetodoPagos_metp_Id PRIMARY KEY(metp_Id),
	CONSTRAINT FK_gnrl_tbMetodoPagos_acce_tbUsuarios_metp_UsuarioCreacion_usur_Id FOREIGN KEY(metp_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
	CONSTRAINT FK_gnrl_tbMetodoPagos_acce_tbUsuarios_metp_UsuarioModificacion_usur_Id FOREIGN KEY(metp_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)

);

CREATE TABLE gnrl.tbEstadosCiviles(
	estc_Id					    INT IDENTITY(1,1),
	estc_Descripcion			NVARCHAR(200) not null UNIQUE,
	estc_FechaCreacion		    DATETIME NOT NULL DEFAULT GETDATE(),
	estc_UsuarioCreacion		INT not null,
	estc_FechaModificacion	    DATETIME,
	estc_UsuarioModificacion    INT,
	estc_Estado				    BIT NOT NULL DEFAULT 1, 
	CONSTRAINT PK_gnrl_tbEstadosCiviles_estc_Id PRIMARY KEY(estc_Id),
	CONSTRAINT FK_gnrl_tbEstadosCiviles_acce_tbUsuarios_estc_UsuarioCreacion_usur_Id FOREIGN KEY(estc_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
	CONSTRAINT FK_gnrl_tbEstadosCiviles_acce_tbUsuarios_estc_UsuarioModificacion_usur_Id FOREIGN KEY(estc_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)
);


CREATE TABLE gnrl.tbDepartamentos(
	depa_Id					    INT IDENTITY(1,1),
	depa_Descripcion			NVARCHAR(200) NOT NULL UNIQUE,
    depa_Codigo                 CHAR(2) NOT NULL UNIQUE,
	depa_FechaCreacion		    DATETIME NOT NULL DEFAULT GETDATE(),
	depa_UsuarioCreacion		INT not null,
	depa_FechaModificacion	    DATETIME,
	depa_UsuarioModificacion    INT,
	depa_Estado				    BIT NOT NULL DEFAULT 1,
	CONSTRAINT PK_gnrl_tbDepartamentos_depa_Id PRIMARY KEY(depa_Id),
	CONSTRAINT FK_gnrl_tbDepartamentos_acce_tbUsuarios_depa_UsuarioCreacion_usur_Id FOREIGN KEY(depa_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
	CONSTRAINT FK_gnrl_tbDepartamentos_acce_tbUsuarios_depa_UsuarioModificacion_usur_Id FOREIGN KEY(depa_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)
);



CREATE TABLE gnrl.tbMunicipios(
	muni_Id					    INT IDENTITY(1,1),
	muni_Descripcion			NVARCHAR(200) NOT NULL,
    muni_Codigo                 CHAR(4) NOT NULL UNIQUE,
	depa_Id					    INT NOT NULL,
	muni_FechaCreacion		    DATETIME NOT NULL DEFAULT GETDATE(),
	muni_UsuarioCreacion		INT not null,
	muni_FechaModificacion	    DATETIME,
	muni_UsuarioModificacion    INT,
	muni_Estado				    BIT NOT NULL DEFAULT 1,
	CONSTRAINT PK_gnrl_tbMunicipios_muni_Id PRIMARY KEY(muni_Id),
	CONSTRAINT FK_tbMunicipios_tbDepartamentos_depa_Id FOREIGN KEY(depa_Id) REFERENCES gnrl.tbDepartamentos(depa_Id),
	CONSTRAINT FK_gnrl_tbMunicipios_acce_tbUsuarios_muni_UsuarioCreacion_usur_Id FOREIGN KEY(muni_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
	CONSTRAINT FK_gnrl_tbMunicipios_acce_tbUsuarios_muni_UsuarioModificacion_usur_Id FOREIGN KEY(muni_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)
);

CREATE TABLE salo.tbCargos(
	carg_Id					        INT IDENTITY(1,1) NOT NULL,
	carg_Descripcion				NVARCHAR(200) NOT NULL UNIQUE,
	carg_FechaCreacion		        DATETIME NOT NULL DEFAULT GETDATE(),
	carg_UsuarioCreacion		    INT not null,
	carg_FechaModificacion	        DATETIME,
	carg_UsuarioModificacion        INT,
	carg_Estado				        BIT NOT NULL DEFAULT 1,
	CONSTRAINT PK_salo_tbCargos_carg_Id PRIMARY KEY(carg_Id),
	CONSTRAINT FK_salo_tbCargos_acce_tbUsuarios_carg_UsuarioCreacion_usur_Id FOREIGN KEY(carg_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
	CONSTRAINT FK_salo_tbCargos_acce_tbUsuarios_carg_UsuarioModificacion_usur_Id FOREIGN KEY(carg_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)
);

CREATE TABLE salo.tbEmpleados(
	empl_Id                             INT IDENTITY (1,1),
	empl_Nombre							NVARCHAR(150) NOT NULL,
	empl_Apellido						NVARCHAR(150) NOT NULL,
	empl_Sexo							CHAR(1) NOT NULL,
	muni_Id								INT NOT NULL,
	empl_DireccionExacta			    NVARCHAR(500) NOT NULL,
	estc_Id							    INT NOT NULL,
	empl_Telefono						NVARCHAR(20) NOT NULL,
	empl_CorreoElectronico				NVARCHAR(100) NOT NULL,
	empl_FechaNacimiento				Date NOT NULL,
	empl_FechaContratacion				Date NOT NULL,
	carg_Id								INT NOT NULL,
	empl_FechaCreacion					DATETIME NOT NULL DEFAULT GETDATE(),
	empl_UsuarioCreacion				INT not null,
	empl_FechaModificacion				DATETIME,
	empl_UsuarioModificacion			INT,
	empl_Estado							BIT NOT NULL DEFAULT 1,

CONSTRAINT PK_salo_tbEmpleados_empl_Id PRIMARY KEY(empl_Id),
CONSTRAINT FK_salo_tbEmpleados_gnrl_tbMunicipios_muni_Id FOREIGN KEY(muni_Id) REFERENCES gnrl.tbMunicipios(muni_Id),
CONSTRAINT FK_salo_tbEmpleados_gnrl_tbEstadosCiviles_estc_Id FOREIGN KEY(estc_Id) REFERENCES gnrl.tbEstadosCiviles(estc_Id),
CONSTRAINT FK_salo_tbEmpleados_salo_tbCargos_carg_Id FOREIGN KEY(carg_Id) REFERENCES salo.tbCargos(carg_Id),
CONSTRAINT FK_salo_tbEmpleados_acce_tbUsuarios_empl_UsuarioCreacion_usur_Id FOREIGN KEY(empl_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
CONSTRAINT FK_salo_tbEmpleados_acce_tbUsuarios_empl_UsuarioModificacion_usur_Id FOREIGN KEY(empl_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)

);


CREATE TABLE salo.tbProveedores(

    prov_Id                              INT IDENTITY(1,1),
    prov_NombreEmpresa                   NVARCHAR (150) NOT NULL UNIQUE,
    prov_NombreContacto                  NVARCHAR (150) NOT NULL,
    muni_Id                              INT NOT NULL,
    prov_DireccionExacta                 NVARCHAR (500) NOT NULL,
    prov_Telefono                        NVARCHAR (20) NOT NULL,
    prov_FechaCreacion		             DATETIME NOT NULL DEFAULT GETDATE(),
    prov_UsuarioCreacion		         INT NOT null,
    prov_FechaModificacion	             DATETIME,
    prov_UsuarioModificacion             INT,
    prov_Estado                          BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_salo_tbProveedores_prov_Id PRIMARY KEY(prov_Id),
    CONSTRAINT FK_salo_tbProveedores_tbMunicipio_muni_id FOREIGN key(muni_id) REFERENCES gnrl.tbMunicipios(muni_id)
);


CREATE TABLE salo.tbCategorias(
    cate_Id                                 INT IDENTITY(1,1),
    cate_Descripcion                        NVARCHAR (150) NOT NULL UNIQUE,
    cate_FechaCreacion		                DATETIME NOT NULL DEFAULT GETDATE(),
    cate_UsuarioCreacion		            INT not null,
    cate_FechaModificacion	                DATETIME,
    cate_UsuarioModificacion                INT,
    cate_Estado				                BIT NOT NULL DEFAULT 1,
CONSTRAINT PK_salo_tbCategoria_cate_Id PRIMARY KEY(cate_Id),
CONSTRAINT FK_salo_tbCategoria_acce_tbUsuarios_cate_UsuarioCreacion_usur_Id FOREIGN KEY(cate_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
CONSTRAINT FK_salo_tbCategoria_acce_tbUsuarios_cate_UsuarioModificacion_usur_Id FOREIGN KEY(cate_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)
);


CREATE TABLE salo.tbProductos(
    prod_Id			                    INT IDENTITY(1,1),
    prod_Nombre		                    NVARCHAR (200) NOT NULL,
    prod_Precio		                    DECIMAL (18,2) NOT NULL,
    cate_Id			                    INT not null,
    prod_Stock		                    INT not null,
    prov_id								INT,
    prod_FechaCreacion					DATETIME NOT NULL DEFAULT GETDATE(),
    prod_UsuarioCreacion				INT not null,
    prod_FechaModificacion				DATETIME,
    prod_UsuarioModificacion			INT,
    prod_Estado							BIT NOT NULL DEFAULT 1,

CONSTRAINT PK_salo_tbProductos_prod_Id PRIMARY KEY(prod_Id),
CONSTRAINT FK_salo_tbProductos_tbCategoria_cate_Id FOREIGN KEY (cate_Id) REFERENCES salo.tbCategorias(cate_Id),
CONSTRAINT FK_salo_tbProductos_tbProveedores_prov_Id FOREIGN KEY (prov_id) REFERENCES salo.tbProveedores (prov_id),
CONSTRAINT FK_salo_tbProductos_acce_tbUsuarios_prod_UsuarioCreacion_usur_Id FOREIGN KEY(prod_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
CONSTRAINT FK_salo_tbProductos_acce_tbUsuarios_prod_UsuarioModificacion_usur_Id FOREIGN KEY(prod_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)

);


CREATE TABLE salo.tbClientes(
clie_Id                             INT IDENTITY (1,1),
clie_Nombre							NVARCHAR(150) NOT NULL,
clie_Apellido						NVARCHAR(150) NOT NULL,
clie_Telefono						NVARCHAR(20) NOT NULL,
clie_CorreoElectronico				NVARCHAR(100),
clie_FechaCreacion					DATETIME NOT NULL DEFAULT GETDATE(),
clie_UsuarioCreacion				INT not null,
clie_FechaModificacion				DATETIME,
clie_UsuarioModificacion			INT,    
clie_Estado							BIT NOT NULL DEFAULT 1,

CONSTRAINT PK_salo_tbClientes_clie_Id PRIMARY KEY(clie_id),
CONSTRAINT FK_salo_tbClientes_acce_tbUsuarios_clie_UsuarioCreacion_usur_Id FOREIGN KEY(clie_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
CONSTRAINT FK_salo_tbClientes_acce_tbUsuarios_clie_UsuarioModificacion_usur_Id FOREIGN KEY(clie_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)

);

CREATE TABLE salo.tbServicios(
    serv_Id                         INT IDENTITY(1,1),
    serv_Nombre                     NVARCHAR(150) NOT NULL,
    serv_Descripcion                NVARCHAR(500) ,
    serv_Precio                     DECIMAL(18,2) NOT NULL,
    serv_FechaCreacion				DATETIME NOT NULL DEFAULT GETDATE(),
    serv_UsuarioCreacion			INT not null,
    serv_FechaModificacion			DATETIME,
    serv_UsuarioModificacion		INT,    
    serv_Estado					    BIT NOT NULL DEFAULT 1,

    CONSTRAINT PK_salo_tbServicio_serv_Id PRIMARY KEY(serv_Id),
    CONSTRAINT FK_salo_tbServicios_acce_tbUsuarios_serv_UsuarioCreacion_usur_Id FOREIGN KEY(serv_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
    CONSTRAINT FK_salo_tbServicios_acce_tbUsuarios_serv_UsuarioModificacion_usur_Id FOREIGN KEY(serv_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)
    
);

CREATE TABLE salo.tbFacturas(
    fact_Id                             INT IDENTITY(1,1),
    clie_Id                             INT not null,
    fact_Pedidos						DATETIME NOT NULL DEFAULT GETDATE(),
    empl_Id								INT not null,
    metp_Id							    INT not null,
    fact_FechaCreacion					DATETIME NOT NULL DEFAULT GETDATE(),
    fact_UsuarioCreacion				INT not null,
    fact_FechaModificacion				DATETIME,
    fact_UsuarioModificacion			INT,
    fact_Estado							BIT NOT NULL DEFAULT 1,

    CONSTRAINT PK_salo_tbFacturas_fact_Id PRIMARY KEY(fact_Id),
    CONSTRAINT FK_salo_tbFacturas_tbClientes_clie_id FOREIGN KEY(clie_Id) REFERENCES salo.tbClientes(clie_Id),  
    CONSTRAINT FK_salo_tbFacturas_tbMetodoPago_metp_id FOREIGN KEY(metp_Id) REFERENCES gnrl.tbMetodoPago(metp_Id),
    CONSTRAINT FK_salo_tbFacturas_salo_tbEmpleados_empl_Id FOREIGN KEY(empl_Id) REFERENCES salo.tbEmpleados(empl_Id),
    CONSTRAINT FK_salo_tbFacturas_acce_tbUsuarios_ped_UsuarioCreacion_usur_Id FOREIGN KEY(fact_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
    CONSTRAINT FK_salo_tbFacturas_acce_tbUsuarios_ped_UsuarioModificacion_usur_Id FOREIGN KEY(fact_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)

);


CREATE TABLE salo.tbFacturasDetalles(
fade_Id                             INT IDENTITY(1,1),
fact_Id                             INT not null,
prod_Id                             INT not null,
fade_Cantidad						INT NOT NULL,
fade_Precio							DECIMAL (18,2) NOT NULL,
fade_FechaCreacion					DATETIME NOT NULL DEFAULT GETDATE(),
fade_UsuarioCreacion				INT not null,
fade_FechaModificacion				DATETIME,
fade_UsuarioModificacion			INT,
fade_Estado							BIT NOT NULL DEFAULT 1,
CONSTRAINT PK_salo_tbFacturasDetalles_fade_Id PRIMARY KEY(fade_Id),
CONSTRAINT FK_salo_tbFacturasDetalles_tbFacturas_fact_id FOREIGN KEY(fact_Id) REFERENCES salo.tbFacturas(fact_Id),
CONSTRAINT FK_salo_tbFacturasDetalles_tbProductos_prod_id FOREIGN KEY(prod_Id) REFERENCES salo.tbProductos(prod_Id),
CONSTRAINT FK_salo_tbFacturasDetalles_acce_tbUsuarios_fade_UsuarioCreacion_usur_Id FOREIGN KEY(fade_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
CONSTRAINT FK_salo_tbFacturasDetalles_acce_tbUsuarios_fade_UsuarioModificacion_usur_Id FOREIGN KEY(fade_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)

);

CREATE TABLE salo.tbSucursales(
    sucu_Id                             INT IDENTITY(1,1), 
    sucu_Descripcion                    NVARCHAR(200) NOT NULL,
    muni_Id                             INT,
	sucu_DireccionExacta				NVARCHAR(500) NOT NULL,
    sucu_FechaCreacion					DATETIME NOT NULL DEFAULT GETDATE(),
    sucu_UsuarioCreacion				INT not null,
    sucu_FechaModificacion				DATETIME,
    sucu_UsuarioModificacion			INT,
    sucu_Estado							BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_salo_tbSucursales_sucu_Id PRIMARY KEY(sucu_Id),
    CONSTRAINT FK_salo_tbSucursales_gnrl_tbMunicipios_muni_Id FOREIGN KEY(muni_Id) REFERENCES gnrl.tbMunicipios(muni_Id),

    CONSTRAINT FK_salo_tbSucursales_acce_tbUsuarios_sucu_UsuarioCreacion_usur_Id FOREIGN KEY(sucu_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
    CONSTRAINT FK_salo_tbSucursales_acce_tbUsuarios_sucu_UsuarioModificacion_usur_Id FOREIGN KEY(sucu_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)

);

CREATE TABLE salo.tbReservaciones(
rese_Id                             INT IDENTITY(1,1),
clie_Id                             INT NOT NULL,
sucu_Id                             INT NOT NULL,
rese_DiaReservado                   DATE NOT NULL,
rese_HoraInicio                     TIME NOT NULL,
rese_HoraFin                        TIME NOT NULL,
rese_FechaCreacion					DATETIME NOT NULL DEFAULT GETDATE(),
rese_UsuarioCreacion				INT not null,
rese_FechaModificacion				DATETIME,
rese_UsuarioModificacion			INT,
rese_Estado							BIT NOT NULL DEFAULT 1,

CONSTRAINT PK_salo_tbReservaciones_rese_Id PRIMARY KEY(rese_Id),
CONSTRAINT FK_salo_tbReservaciones_tbClientes_clie_id FOREIGN KEY(clie_Id) REFERENCES salo.tbClientes(clie_Id),
CONSTRAINT FK_salo_tbReservaciones_tbSucursales_sucu_id FOREIGN KEY(sucu_Id) REFERENCES salo.tbSucursales(sucu_Id),
CONSTRAINT FK_salo_tbReservaciones_acce_tbUsuarios_rese_UsuarioCreacion_usur_Id FOREIGN KEY(rese_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
CONSTRAINT FK_salo_tbReservaciones_acce_tbUsuarios_rese_UsuarioModificacion_usur_Id FOREIGN KEY(rese_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)
);


CREATE TABLE salo.tbProductosXServicio(
    serprod_Id                      INT IDENTITY(1,1),
    serv_Id                         INT,
    prod_Id                         INT,
    serprod_FechaCreacion			DATETIME NOT NULL DEFAULT GETDATE(),
    serprod_UsuarioCreacion		    INT not null,
    serprod_FechaModificacion		DATETIME,
    serprod_UsuarioModificacion     INT,
    serprod_Estado				    BIT NOT NULL DEFAULT 1,

    CONSTRAINT PK_salo_tbProductosXServicio_serprod_Id PRIMARY KEY(serprod_Id),
    CONSTRAINT FK_salo_tbProductosXServicio_salo_tbServicios_serv_Id FOREIGN KEY (serv_Id) REFERENCES salo.tbServicios(serv_Id),
    CONSTRAINT FK_salo_tbProductosXServicio_salo_tbProductos_prod_Id FOREIGN KEY (prod_Id) REFERENCES salo.tbProductos(prod_Id),
    CONSTRAINT FK_salo_tbProductosXServicio_acce_tbUsuarios_serprod_UsuarioCreacion_usur_Id FOREIGN KEY(serprod_UsuarioCreacion) REFERENCES acce.tbUsuarios(usur_Id),
    CONSTRAINT FK_salo_tbProductosXServicio_acce_tbUsuarios_serprod_UsuarioModificacion_usur_Id FOREIGN KEY(serprod_UsuarioModificacion) REFERENCES acce.tbUsuarios(usur_Id)
);

----INSERTS----



INSERT INTO [acce].[tbUsuarios]
           ([usur_Usuario]
           ,[usur_Contrasenia]
           ,[empl_Id]
           ,[usur_UsuarioCreacion]
           ,[usur_FechaCreacion]
           ,[usur_UsuarioModificacion]
           ,[usur_FechaModificacion]
           ,[usur_Estado])
     VALUES
           ('admin',HASHBYTES('SHA2_512','admin'),1,1,GETDATE(),null,null,1)
GO



INSERT INTO [gnrl].[tbDepartamentos](depa_Codigo,depa_Descripcion,depa_FechaCreacion,depa_UsuarioCreacion,depa_FechaModificacion,depa_UsuarioModificacion,depa_Estado)
VALUES ('01', 'Atlantida', GETDATE(), 1,null,null,1),
	   ('02', 'Colon', GETDATE(), 1,null,null,1),
	   ('03', 'Comayagua', GETDATE(), 1,null,null,1),
	   ('04', 'Copan', GETDATE(), 1,null,null,1),
	   ('05', 'Cortes', GETDATE(), 1,null,null,1),
	   ('06', 'Choluteca', GETDATE(), 1,null,null,1),
	   ('07', 'El Paraiso', GETDATE(), 1,null,null,1),
	   ('08', 'francisco Morazan', GETDATE(), 1,null,null,1),
	   ('09', 'Gracias a Dios', GETDATE(), 1,null,null,1),
	   ('10', 'Intibuca', GETDATE(), 1,null,null,1),
	   ('11', 'Islas de la Bahia', GETDATE(), 1,null,null,1),
	   ('12', 'La Paz', GETDATE(), 1,null,null,1),
	   ('13', 'Lempira', GETDATE(), 1,null,null,1),
	   ('14', 'Ocotepeque', GETDATE(), 1,null,null,1),
	   ('15', 'Olancho', GETDATE(), 1,null,null,1),
	   ('16', 'Santa Barbara', GETDATE(), 1,null,null,1),
	   ('17', 'Valle', GETDATE(), 1,null,null,1),
	   ('18', 'Yoro', GETDATE(), 1,null,null,1)




	   
INSERT INTO [gnrl].[tbMunicipios](muni_Codigo, muni_Descripcion,depa_Id, [muni_UsuarioCreacion], [muni_FechaCreacion],[muni_Estado])
VALUES('0101','La Ceiba ',1, 1, GETDATE(), 1),
      ('0102','El Porvenir','1', 1, GETDATE(), 1), 
	  ('0103','Jutiapa','1', 1, GETDATE(), 1),
	  ('0104','Jutiapa','1', 1, GETDATE(), 1),
	  ('0105','La Masica','1', 1, GETDATE(), 1),
	  ('0201','Trujillo','2', 1, GETDATE(), 1),
	  ('0202','Balfate','2', 1, GETDATE(), 1),
	  ('0203','Iriona','2', 1, GETDATE(), 1),
	  ('0204','Limon','2', 1, GETDATE(), 1),
	  ('0205','Saba','2', 1, GETDATE(), 1),
	  ('0301','Comayagua','3', 1, GETDATE(), 1),
	  ('0302','Ajuterique','3', 1, GETDATE(), 1),
      ('0303','El Rosario','3', 1, GETDATE(), 1),
	  ('0304','Esqueas','3', 1, GETDATE(), 1),
      ('0305','Humuya','3',1, GETDATE(), 1),
	  ('0401','Santa Rosa de Copan','4', 1, GETDATE(), 1),
	  ('0402','Cabanias','4', 1, GETDATE(), 1),
      ('0403','Concepcion','4', 1, GETDATE(), 1),
	  ('0404','Copan Ruinas','4', 1, GETDATE(), 1),
      ('0405','Corquan','4', 1, GETDATE(), 1),
	  ('0501','San Pedro Sula ','5', 1, GETDATE(), 1),
      ('0502','Choloma ','5', 1, GETDATE(), 1),
      ('0503','Omoa','5', 1, GETDATE(), 1),
      ('0504','Pimienta','5', 1, GETDATE(), 1),
	  ('0505','Potrerillos','5', 1, GETDATE(), 1),
	  ('0601','Choluteca','6', 1, GETDATE(), 1),
      ('0602','Apacilagua','6', 1, GETDATE(), 1),
      ('0603','Concepcion de Maria','6', 1, GETDATE(), 1),
      ('0604','Duyure','6', 1, GETDATE(), 1),
	  ('0605','El Corpus','7', 1, GETDATE(), 1),
	  ('0701','Yuscaron','7', 1, GETDATE(), 1),
      ('0702','Alauca','7', 1, GETDATE(), 1),
      ('0703','Danli','7', 1, GETDATE(), 1),
	  ('0704','El Paraiso','7', 1, GETDATE(), 1),
      ('0705','Giinope','7', 1, GETDATE(), 1),
	  ('0801','Distrito Central (Comayagiela y Tegucigalpa)','8', 1, GETDATE(), 1),
      ('0802','Alubarun','8', 1, GETDATE(), 1),
      ('0803','Cedros','8', 1, GETDATE(), 1),
      ('0804','Curaran','8', 1, GETDATE(), 1),
	  ('0805','El Porvenir','8', 1, GETDATE(), 1),
	  ('0901','Puerto Lempira','9', 1, GETDATE(), 1),
      ('0902','Brus Laguna','9', 1, GETDATE(), 1),
      ('0903','Ahuas','9', 1, GETDATE(), 1),
	  ('0904','Juan fabncisco Bulnes','9', 1, GETDATE(), 1),
      ('0905','Villeda Morales','9', 1, GETDATE(), 1),
	  ('1001','La Esperanza','10', 1, GETDATE(), 1),
      ('1002','Camasca','10', 1, GETDATE(), 1),
      ('1003','Colomoncagua','10', 1, GETDATE(), 1),
	  ('1004','Concepcion','10', 1, GETDATE(), 1),
      ('1005','Dolores','10', 1, GETDATE(), 1),
	  ('1101','Roatan','11', 1, GETDATE(), 1),
      ('1102','Guanaja','11', 1, GETDATE(), 1),
      ('1103','Jose Santos Guardiola','11', 1, GETDATE(), 1),
	  ('1104','Utila','11', 1, GETDATE(), 1),
	  ('1201','La Paz','12', 1, GETDATE(), 1),
      ('1202','Aguanqueterique','12', 1, GETDATE(), 1),
      ('1203','Cabanias','12', 1, GETDATE(), 1),
	  ('1204','Cane','12', 1, GETDATE(), 1),
      ('1205','Chinacla','12', 1, GETDATE(), 1),
	  ('1301','Gracias','13', 1, GETDATE(), 1),
      ('1302','Belen','13', 1, GETDATE(), 1),
      ('1303','Candelaria','13', 1, GETDATE(), 1),
	  ('1304','Cololaca','13', 1, GETDATE(), 1),
      ('1305','Erandique','13', 1, GETDATE(), 1),
	  ('1401','Ocotepeque','14', 1, GETDATE(), 1),
      ('1402','Belen Gualcho','14', 1, GETDATE(), 1),
      ('1403','Concepcion','14', 1, GETDATE(), 1),
	  ('1404','Dolores Merendon','14', 1, GETDATE(), 1),
      ('1405','fabternidad','14', 1, GETDATE(), 1),
	  ('1501','Juticalpa','15', 1, GETDATE(), 1),
      ('1502','Campamento','15', 1, GETDATE(), 1),
      ('1503','Catacamas','15', 1, GETDATE(), 1),
	  ('1504','Concordia','15', 1, GETDATE(), 1),
      ('1505','Dulce Nombre de Culmo','15', 1, GETDATE(), 1),
	  ('1601','Santa Barbara','12', 1, GETDATE(), 1),
      ('1602','Arada','12', 1, GETDATE(), 1),
      ('1603','Atima','12', 1, GETDATE(), 1),
	  ('1604','Azacualpa','12', 1, GETDATE(), 1),
      ('1605','Ceguaca','12', 1, GETDATE(), 1),
	  ('1701','Nacaome','12', 1, GETDATE(), 1),
      ('1702','Alianza','12', 1, GETDATE(), 1),
      ('1703','Amapala','12', 1, GETDATE(), 1),
	  ('1704','Aramecina','12', 1, GETDATE(), 1),
      ('1705','Caridad','12', 1, GETDATE(), 1),
	  ('1801','Yoro','12', 1, GETDATE(), 1),
      ('1802','Arenal','12', 1, GETDATE(), 1),
      ('1803','El Negrito','12', 1, GETDATE(), 1),
	  ('1804','El artgreso','12', 1, GETDATE(), 1),
      ('1805','Jocon','12', 1, GETDATE(), 1)


	   INSERT INTO [gnrl].[tbEstadosCiviles]
VALUES ( 'Casado(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ( 'Soltero(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ( 'Divorciado(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ( 'Viudo(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ( 'Union libre',  GETDATE(), 1, NULL, NULL, 1)


	   Insert INTO [salo].[tbCargos]
	   Values   ('Jefe',GetDate(),1,null,null,1),
                ('Gerente',GetDate(),1,null,null,1),
                ('Repartidor',GetDate(),1,null,null,1),
                ('Vendedor',GetDate(),1,null,null,1),
                ('Recepcionista',GetDate(),1,null,null,1)




INSERT INTO [salo].[tbEmpleados]
           ([empl_Nombre]
           ,[empl_Apellido]
           ,[empl_Sexo]
           ,[muni_Id]
           ,[empl_DireccionExacta]
           ,[estc_Id]
           ,[empl_Telefono]
           ,[empl_CorreoElectronico]
           ,[empl_FechaNacimiento]
           ,[empl_FechaContratacion]
           ,[carg_Id]
           ,[empl_FechaCreacion]
           ,[empl_UsuarioCreacion]
           ,[empl_FechaModificacion]
           ,[empl_UsuarioModificacion]
           ,[empl_Estado])
     VALUES
           ('Daniel','Espinoza' ,'M','10' ,'Col. Municipal','1' ,'87756952' ,'daniele09099@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Selvin','Medina' ,'M','10' ,'Rivera','2' ,'98552231' ,'selvinmedi@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Christpher','Aguilar' ,'M','10' ,'Col. Satelite','3' ,'77450210' ,'agilarchris@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Alessia','Medina' ,'F','10' ,'Col. Miguel Angel Pavon','1' ,'99864520' ,'aless65@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Axel','Gomez' ,'M','10' ,'Bosques de Jucutuma','2' ,'50220345' ,'Gomez03@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Angie','Rolitas' ,'F','10' ,'Col. Felipe','1' ,'88541230' ,'rolitaAngie@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Dua','Lipa' ,'F','10' ,'Rio de piedras','1' ,'00000000' ,'lipa1995@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Pitbull','Perez' ,'M','10' ,'Rio de piedras','1' ,'00000000' ,'pitbull@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Michael','Jackson' ,'M','10' ,'Rio de piedras','1' ,'00000000' ,'Jackson@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Lady','Gaga' ,'F','10' ,'Rio de piedras','1' ,'00000000' ,'gaga@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Lionel','Messi' ,'M','10' ,'Rio de piedras','1' ,'00000000' ,'Messi@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1),
           ('Cristiano','Ronaldo' ,'M','10' ,'Rio de piedras','1' ,'00000000' ,'ElBicho@gmail.com',GETDATE() ,GetDate() ,1 ,GetDate() ,1 ,null ,null,1)
GO



ALTER TABLE [acce].[tbUsuarios] 
ADD CONSTRAINT FK_acce_tbUsuarios_acce_tbUsuarios_usur_UsuarioCreacion_usur_Id FOREIGN KEY([usur_UsuarioCreacion]) REFERENCES acce.tbUsuarios(usur_Id);

GO

ALTER TABLE [acce].[tbUsuarios] 
ADD CONSTRAINT FK_acce_tbUsuarios_acce_tbUsuarios_usur_UsuarioModificacion_usur_Id FOREIGN KEY([usur_UsuarioModificacion]) REFERENCES acce.tbUsuarios(usur_Id);

GO

ALTER TABLE [acce].[tbUsuarios] 
ADD CONSTRAINT FK_acce_tbUsuarios_salo_tbEmpleados_empl_Id FOREIGN KEY([empl_Id]) REFERENCES salo.tbEmpleados([empl_Id]);


GO



INSERT INTO [gnrl].[tbMetodoPago]
           ([metp_Descripcion]
           ,[metp_FechaCreacion]
           ,[metp_UsuarioCreacion]
           ,[metp_FechaModificacion]
           ,[metp_UsuarioModificacion]
           ,[metp_Estado])
     VALUES
           ('Efectivo',GetDate(),1,null ,null,1),
           ('Tarjeta de Credito',GetDate(),1,null ,null,1),
           ('Tarjeta de Debito',GetDate(),1,null ,null,1)
GO




--Procedimientos almacenados del login

GO
CREATE OR ALTER PROCEDURE UDP_Login
	@usur_Usuario Nvarchar(100),
	@usur_Contrasenia Nvarchar(Max)
AS
BEGIN

        BEGIN TRY
        Declare @Password Nvarchar(max) = (HASHBYTES('SHA2_512',@usur_Contrasenia))
        SELECT  [usur_Id]
                ,[usur_Usuario]
                ,[usur_Contrasenia]
                ,T1.[empl_Id]
                ,t2.empl_Nombre + ' ' + t2.empl_Apellido as empl_Nombre 
                ,[usur_UsuarioCreacion]
                ,[usur_FechaCreacion]
                ,[usur_UsuarioModificacion]
                ,[usur_FechaModificacion]
                ,[usur_Estado]
        FROM    [tbUsuarios] T1 INNER JOIN [salo].[tbEmpleados] T2
        ON      T1.empl_Id = T2.empl_Id
        WHERE   t1.usur_Contrasenia = @Password 
        AND     t1.usur_Usuario = @usur_Usuario

        --SELECT 1 as Proceso
        END TRY
        BEGIN CATCH

        SELECT 0 as Proceso
        END CATCH

END
GO



GO
CREATE OR ALTER    PROCEDURE UDP_RecuperarContrasenia
@usur_Usuario VARCHAR(100),
@usur_Contrasenia NVARCHAR(MAX)

as
BEGIN

BEGIN TRY

Declare @Password Nvarchar(max) = (HASHBYTES('SHA2_512',@usur_Contrasenia))

UPDATE [acce].[tbUsuarios]
   SET [usur_Contrasenia] = @Password
 WHERE usur_Usuario = @usur_Usuario

SELECT 1 as Proceso

END TRY
BEGIN CATCH

SELECT 0 as Proceso
END CATCH

END
GO





-----Procedimientos almacenados de tbUsuarios


GO
CREATE OR ALTER PROCEDURE UDP_tbUsuarios_Insert
	@usur_Usuario Nvarchar(100),
	@usur_Contrasenia Nvarchar(max),
	@empl_Id int,
	@usur_UsuarioCreacion int

AS
BEGIN

BEGIN TRY
Declare @Password Nvarchar(max) = (HASHBYTES('SHA2_512',@usur_Contrasenia))

INSERT INTO [acce].[tbUsuarios]
           ([usur_Usuario]
           ,[usur_Contrasenia]
           ,[empl_Id]
           ,[usur_UsuarioCreacion]
           ,[usur_FechaCreacion]
           ,[usur_UsuarioModificacion]
           ,[usur_FechaModificacion]
           ,[usur_Estado])
     VALUES
           (@usur_Usuario
           ,@Password
           ,@empl_Id
           ,@usur_UsuarioCreacion
           ,GetDate()
           ,null
           ,null
           ,1)

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH


END
GO

--Editar Usuario 
GO
CREATE OR ALTER PROCEDURE UDP_tbUsuarios_Update
	@usur_Id INT,
	@empl_Id int,
	@usuarioModificacion int
AS
BEGIN

BEGIN TRY

UPDATE [acce].[tbUsuarios]
   SET [empl_Id] = @empl_Id
      ,[usur_UsuarioModificacion] = @usuarioModificacion
      ,[usur_FechaModificacion] = GetDate()
      ,[usur_Estado] = 1
 WHERE usur_Id = @usur_Id

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH


END
GO


--borrar Usuario
CREATE OR ALTER PROCEDURE UDP_tbUsuario_Delete
	@usur_Id INT
AS
BEGIN

BEGIN TRY

UPDATE [acce].[tbUsuarios]
   SET [usur_Estado] = 0
 WHERE usur_Id = @usur_Id


SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH


END
GO



--Procecdimiento alamacenados de Clientes

GO
CREATE PROCEDURE UDP_tbClientes_Insert
    @clie_Nombre NVARCHAR(100),
    @clie_Apellido NVARCHAR(100),
    @clie_Telefono NVARCHAR(20),
    @clie_CorreoElectronico NVARCHAR(100),
    @clie_UsuarioCreacion INT
AS
BEGIN

BEGIN TRY
INSERT INTO tbClientes( [clie_Nombre], 
                            [clie_Apellido], 
                            [clie_Telefono], 
                            [clie_CorreoElectronico],
                            [clie_FechaCreacion], 
                            [clie_UsuarioCreacion], 
                            [clie_FechaModificacion], 
                            [clie_UsuarioModificacion], 
                            [clie_Estado])
    VALUES (    @clie_Nombre, 
                @clie_Apellido, 
                @clie_Telefono, 
                @clie_CorreoElectronico, 
                GETDATE(), 
                @clie_UsuarioCreacion, 
                NULL,  
                NULL, 
                1)

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH

    
END
GO
--Procedimiento almacenado Update tbClientes
GO
CREATE PROCEDURE UDP_tbClientes_Update
    @clie_Id INT,
    @clie_Nombre NVARCHAR(100),
    @clie_Apellido NVARCHAR(100),
    @clie_Telefono NVARCHAR(20),
    @clie_CorreoElectronico NVARCHAR(100),
    @clie_UsuarioModificacion INT
AS
BEGIN

BEGIN TRY
UPDATE tbClientes
    SET clie_Nombre = @clie_Nombre,
        clie_Apellido = @clie_Apellido,
        clie_Telefono = @clie_Telefono,
        clie_CorreoElectronico = @clie_CorreoElectronico,
        clie_FechaModificacion = GETDATE(),
        clie_UsuarioModificacion = @clie_UsuarioModificacion
    WHERE clie_Id = @clie_Id

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH

    
END

--Procedimiento almacenado Delete tbClientes
GO
CREATE PROCEDURE UDP_tbClientes_Delete (
    @clie_Id INT
)
AS
BEGIN

BEGIN TRY
UPDATE tbClientes
    SET clie_Estado = 0
    WHERE clie_Id = @clie_Id

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH

    
END



--Procedimientos almacenados de Empleados


GO
CREATE OR ALTER PROCEDURE UDP_tbEmpleados_Insert
	@empl_Nombre Nvarchar(150),
	@empl_Apellido Nvarchar(150),
	@empl_Sexo char(1),
	@muni_Id INT,
	@empl_DireccionExacta Nvarchar(500),
	@estc_Id INT,
	@empl_Telefono Nvarchar(20),
	@empl_CorreoElectronico Nvarchar(100),
	@empl_FechaNacimiento Nvarchar(100),
	@empl_FechaContratacion Nvarchar(100),
	@carg_Id INT,
	@empl_UsuarioCreacion INT
AS
BEGIN

BEGIN TRY

INSERT INTO [salo].[tbEmpleados]
           ([empl_Nombre]
           ,[empl_Apellido]
           ,[empl_Sexo]
           ,[muni_Id]
           ,[empl_DireccionExacta]
           ,[estc_Id]
           ,[empl_Telefono]
           ,[empl_CorreoElectronico]
           ,[empl_FechaNacimiento]
           ,[empl_FechaContratacion]
           ,[carg_Id]
           ,[empl_FechaCreacion]
           ,[empl_UsuarioCreacion]
           ,[empl_FechaModificacion]
           ,[empl_UsuarioModificacion]
           ,[empl_Estado])
     VALUES
           (@empl_Nombre
           ,@empl_Apellido
           ,@empl_Sexo
           ,@muni_Id
           ,@empl_DireccionExacta
           ,@estc_Id
           ,@empl_Telefono
           ,@empl_CorreoElectronico
           ,@empl_FechaNacimiento
           ,@empl_FechaContratacion
           ,@carg_Id
           ,GETDATE()
           ,@empl_UsuarioCreacion
           ,null
           ,null
           ,1)

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH




END
GO



GO
CREATE OR ALTER PROCEDURE UDP_tbEmpleados_Update
	@empl_Id INT,
	@empl_Nombre Nvarchar(150),
	@empl_Apellido Nvarchar(150),
	@empl_Sexo char(1),
	@muni_Id INT,
	@empl_DireccionExacta Nvarchar(500),
	@estc_Id INT,
	@empl_Telefono Nvarchar(20),
	@empl_CorreoElectronico Nvarchar(100),
	@empl_FechaNacimiento Nvarchar(100),
	@empl_FechaContratacion Nvarchar(100),
	@carg_Id INT,
	@empl_UsuarioModificacion int
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbEmpleados]
   SET [empl_Nombre] = @empl_Nombre
      ,[empl_Apellido] = @empl_Apellido
      ,[empl_Sexo] = @empl_Sexo
      ,[muni_Id] = @muni_Id
      ,[empl_DireccionExacta] = @empl_DireccionExacta
      ,[estc_Id] = @estc_Id
      ,[empl_Telefono] = @empl_Telefono
      ,[empl_CorreoElectronico] = @empl_CorreoElectronico
      ,[empl_FechaNacimiento] = @empl_FechaNacimiento
      ,[empl_FechaContratacion] = @empl_FechaContratacion
      ,[carg_Id] = @carg_Id
      ,[empl_FechaModificacion] = GETDATE()
      ,[empl_UsuarioModificacion] = @empl_UsuarioModificacion
 WHERE empl_Id = @empl_Id

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH


END
GO
GO
CREATE OR ALTER PROCEDURE UDP_tbEmpleados_Delete
	@empl_Id INT
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbEmpleados]
   SET empl_Estado = 0
 WHERE empl_Id = @empl_Id


SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH


END
GO

--Procedimientos almacenados de categorias

GO
CREATE OR ALTER PROCEDURE UDP_tbCategorias_Insert
	@cate_Descripcion Nvarchar(150),
	@cate_UsuarioCreacion int

AS
BEGIN
BEGIN TRY

INSERT INTO [salo].[tbCategoria]
           ([cate_Descripcion]
           ,[cate_FechaCreacion]
           ,[cate_UsuarioCreacion]
           ,[cate_FechaModificacion]
           ,[cate_UsuarioModificacion]
           ,[cate_Estado])
     VALUES
           (@cate_Descripcion
           ,GETDATE()
           ,@cate_UsuarioCreacion
           ,null
           ,null
           ,1)

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH


END
GO


GO
CREATE OR ALTER PROCEDURE UDP_tbCategorias_Update
	@cate_Id INT,
	@cate_Descripcion Nvarchar(200),
	@cate_UsuarioModificacion int
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbCategoria]
   SET [cate_Descripcion] = @cate_Descripcion
      ,[cate_FechaModificacion] = GETDATE()
      ,[cate_UsuarioModificacion] = @cate_UsuarioModificacion
 WHERE cate_Id = @cate_Id

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH


END
GO

GO
CREATE OR ALTER PROCEDURE UDP_tbCategorias_Delete
	@cate_Id INT
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbCategoria]
   SET [cate_Estado] = 0
 WHERE cate_Id = @cate_Id

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH


END
GO


--Procedimientos almacenados de Cargos

CREATE OR ALTER PROCEDURE UDP_tbCargos_Insert
	@carg_Descripcion Nvarchar(150),
	@carg_UsuarioCreacion int

AS
BEGIN
BEGIN TRY

INSERT INTO [salo].[tbCargos]
           ([carg_Descripcion]
           ,[carg_FechaCreacion]
           ,[carg_UsuarioCreacion]
           ,[carg_FechaModificacion]
           ,[carg_UsuarioModificacion]
           ,[carg_Estado])
     VALUES
           (@carg_Descripcion
           ,GETDATE()
           ,@carg_UsuarioCreacion
           ,null
           ,null
           ,1)

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH


END
GO

GO
CREATE OR ALTER PROCEDURE UDP_tbCargos_Update
	@carg_Id INT,
	@carg_Descripcion Nvarchar(150),
	@carg_UsuarioModificacion int
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbCargos]
   SET [carg_Descripcion] = @carg_Descripcion
      ,[carg_FechaModificacion] = GETDATE()
      ,[carg_UsuarioModificacion] = @carg_UsuarioModificacion
 WHERE carg_Id = @carg_Id

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH
END
 GO
CREATE OR ALTER PROCEDURE UDP_tbCargos_Delete
	@carg_Id INT
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbCargos]
   SET [carg_Estado] = 0
 WHERE carg_Id = @carg_Id

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH
END
GO



--Procedimientos Almacenados de Servicios

CREATE OR ALTER PROCEDURE UDP_tbServicios_Insert
	@serv_Nombre Nvarchar(150),
	@serv_Descripcion Nvarchar(500),
	@serv_Precio Nvarchar(150),
	@serv_UsuarioCreacion int

AS
BEGIN
BEGIN TRY

INSERT INTO [salo].[tbServicios]
           ([serv_Nombre]
           ,[serv_Descripcion]
           ,[serv_Precio]
           ,[serv_FechaCreacion]
           ,[serv_UsuarioCreacion]
           ,[serv_FechaModificacion]
           ,[serv_UsuarioModificacion]
           ,[serv_Estado])
     VALUES
           (@serv_Nombre
           ,@serv_Descripcion
           ,@serv_Precio
           ,GETDATE()
           ,@serv_UsuarioCreacion
           ,NULL
           ,NULL
           ,1)

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH


END
GO

GO
CREATE OR ALTER PROCEDURE UDP_tbServicios_Update
	@serv_Id INT,
	@serv_Nombre Nvarchar(150),
	@serv_Descripcion Nvarchar(500),
	@serv_Precio Nvarchar(150),
	@serv_UsuarioModificacion int
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbServicios]
   SET [serv_Nombre] = @serv_Nombre
      ,[serv_Descripcion] = @serv_Descripcion
      ,[serv_Precio] = @serv_Precio
      ,[serv_FechaModificacion] = GETDATE()
      ,[serv_UsuarioModificacion] = @serv_UsuarioModificacion
 WHERE serv_Id = @serv_Id


SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH

 END
 GO



CREATE OR ALTER PROCEDURE UDP_tbServicios_Delete
	@serv_Id INT
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbServicios]
   SET [serv_Estado] = 0
 WHERE serv_Id = @serv_Id

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH

END
GO

--Procedimientos almacenados de Productos
GO
CREATE OR ALTER PROCEDURE UDP_tbProductos_Insert
    @prod_Nombre NVARCHAR(200),
    @prod_Precio DECIMAL(18, 2),
    @cate_Id INT,
    @prod_Stock INT,
    @prov_Id INT,
    @prod_UsuarioCreacion INT

AS
BEGIN
BEGIN TRY

    INSERT INTO tbProductos ([prod_Nombre], 
                            [prod_Precio], 
                            [cate_Id],  
                            [prov_Id], 
                            [prod_Stock], 
                            [prod_FechaCreacion], 
                            [prod_UsuarioCreacion], 
                            [prod_FechaModificacion], 
                            [prod_UsuarioModificacion], 
                            [prod_Estado] )
    VALUES (@prod_Nombre, 
            @prod_Precio, 
            @cate_Id, 
            @prod_Stock, 
            @prov_Id,  
            GETDATE(), 
            @prod_UsuarioCreacion, 
            NULL, 
            NULL, 
            1);

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH
END


GO
CREATE OR ALTER PROCEDURE UDP_tbProductos_Update
    @prod_Id INT,
    @prod_Nombre NVARCHAR(200),
    @prod_Precio DECIMAL(18, 2),
    @cate_Id INT,
    @prod_Stock INT,
    @prov_Id INT,
    @prod_UsuarioModificacion INT
AS
BEGIN

BEGIN TRY
UPDATE tbProductos
    SET prod_Nombre = @prod_Nombre,
        prod_Precio = @prod_Precio,
        cate_Id    = @cate_id,
        prod_Stock = @prod_Stock,
        prov_Id = @prov_Id,
        prod_FechaModificacion = GETDATE(),
        prod_UsuarioModificacion =  @prod_UsuarioModificacion 
    WHERE prod_Id = @prod_Id

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH

    
END


GO
CREATE PROCEDURE UDP_tbProductos_Delete (
    @prod_Id INT
)
AS
BEGIN
BEGIN TRY

    UPDATE tbProductos
    SET prod_Estado = 0
    WHERE prod_Id = @prod_Id

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH
END

GO

--Procedimientos Almacenados de Sucursales

CREATE OR ALTER PROCEDURE UDP_tbSucursales_Insert
@sucu_Decripcion        NVARCHAR(200),
@muni_Id                INT,
@sucu_DireccionExacta   NVARCHAR(500),
@sucu_UsuarioCreacion   INT
AS
BEGIN
BEGIN TRY

INSERT INTO [salo].[tbSucursales]
           ([sucu_Descripcion]
           ,[muni_Id]
           ,[sucu_DireccionExacta]
           ,[sucu_FechaCreacion]
           ,[sucu_UsuarioCreacion]
           ,[sucu_FechaModificacion]
           ,[sucu_UsuarioModificacion]
           ,[sucu_Estado])
     VALUES
           (@sucu_Decripcion
           ,@muni_Id
           ,@sucu_DireccionExacta
           ,GETDATE()
           ,@sucu_UsuarioCreacion
           ,NULL
           ,NULL
           ,1)

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH

END
GO
CREATE OR ALTER PROCEDURE UDP_tbSucursales_Update
@sucu_Id                    INT,
@sucu_Decripcion            NVARCHAR(200),
@muni_Id                    INT,
@sucu_DireccionExacta       NVARCHAR(500),
@sucu_UsuarioModificacion   INT
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbSucursales]
   SET [sucu_Descripcion] = @sucu_Decripcion
      ,[muni_Id] = @muni_Id
      ,sucu_DireccionExacta = @sucu_DireccionExacta
      ,[sucu_FechaModificacion] = GETDATE()
      ,[sucu_UsuarioModificacion] = @sucu_UsuarioModificacion
 WHERE sucu_Id = @sucu_Id

END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH
END
GO
CREATE OR ALTER PROCEDURE UDP_tbSucuesales_Delete
@sucu_Id        INT
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbSucursales]
   SET sucu_Estado = 0
 WHERE sucu_Id = @sucu_Id

END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH

END
GO
--Procedimientos Alemacenados Reservaciones
GO
CREATE OR ALTER PROCEDURE UDP_tbReservaciones_Insert
@clie_Id				INT,
@sucu_Id                INT,
@rese_DiaReservado      VARCHAR(100),
@rese_HoraInicio        VARCHAR(100),
@rese_HoraFin           VARCHAR(100),
@rese_UsuarioCreacion   INT
AS
BEGIN
BEGIN TRY

INSERT INTO [salo].[tbResevaciones]
           ([clie_Id]
           ,[sucu_Id]
           ,[rese_DiaReservado]
           ,[rese_HoraInicio]
           ,[rese_HoraFin]
           ,[rese_FechaCreacion]
           ,[rese_UsuarioCreacion]
           ,[rese_FechaModificacion]
           ,[rese_UsuarioModificacion]
           ,[rese_Estado])
     VALUES
           (@clie_Id
           ,@sucu_Id
           ,@rese_DiaReservado
           ,@rese_HoraInicio
           ,@rese_HoraFin
           ,GETDATE()
           ,@rese_UsuarioCreacion
           ,NULL
           ,NULL
           ,1)


END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH


END
GO

CREATE OR ALTER PROCEDURE UDP_tbReservaciones_Update
@rese_Id                    INT,
@clie_Id                    INT,
@sucu_Id                    INT,
@rese_DiaReservado          VARCHAR(100),
@rese_HoraInicio            VARCHAR(100),
@rese_HoraFin               VARCHAR(100),
@rese_UsuarioModificacion   INT
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbResevaciones]
   SET [clie_Id] = @clie_Id
      ,[sucu_Id] = @sucu_Id
      ,[rese_DiaReservado] = @rese_DiaReservado
      ,[rese_HoraInicio] = @rese_HoraInicio
      ,[rese_HoraFin] = @rese_HoraFin
      ,[rese_FechaModificacion] = GETDATE()
      ,[rese_UsuarioModificacion] = @rese_UsuarioModificacion
 WHERE rese_Id = @rese_Id

END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH

END
GO

CREATE OR ALTER PROCEDURE UDP_tbReservaciones_Delete
@rese_Id                    INT
AS
BEGIN
BEGIN TRY

UPDATE [salo].[tbResevaciones]
   SET [rese_Estado] = 0
 WHERE rese_Id = @rese_Id


END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH
END
GO

----------------------------------------------------------------------------------
------------------PROCEDIMIENTOS----------------------

-----------Procedimiento Insert MetodoPago
GO
CREATE PROCEDURE UDP_tbMetodoPago_Insert
(
    @metp_Descripcion             NVARCHAR (100),
    @metp_UsuarioCreacion         INT
)
AS
BEGIN
BEGIN TRY

INSERT INTO tbMetodoPago (      [metp_Descripcion], 
                                [metp_FechaCreacion], 
                                [metp_UsuarioCreacion], 
                                [metp_FechaModificacion], 
                                [metp_UsuarioModificacion], 
                                [metp_Estado])
    VALUES (@metp_Descripcion, 
            GETDATE(), 
            @metp_UsuarioCreacion, 
            NULL, 
            NULL, 
            1);

SELECT 1 as Proceso
END TRY
BEGIN CATCH
SELECT 0 as Proceso
END CATCH
    
END

-----------Procedimiento Update MetodoPago
GO
CREATE PROCEDURE UDP_tbMetodoPago_Update
	@metp_Id                      INT,
	@metp_Descripcion             NVARCHAR (100),
	@metp_UsuarioModificacion     INT
AS
BEGIN
	UPDATE tbMetodoPago
	SET metp_Descripcion = @metp_Descripcion,
	    metp_FechaModificacion = GETDATE(),
	    metp_UsuarioModificacion = @metp_UsuarioModificacion
	WHERE metp_Id = @metp_Id;
END

-----------Procedimiento Delete MetodoPago
GO
CREATE PROCEDURE UDP_tbMetodoPago_Delete (
    @metp_Id INT, @metp_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbMetodoPago
    SET metp_Estado = 0,
        metp_FechaModificacion = GETDATE(),
        metp_UsuarioModificacion = @metp_UsuarioModificacion 
    WHERE  metp_Id = @metp_Id
END

GO

-----------Procedimiento Insert EstadoCiviles
CREATE OR ALTER  PROCEDURE UDP_tbEstadoCiviles_Insert
@estc_Id  INT,
@estc_Descripcion Varchar(200),
@estc_UsuarioCreacion INT
as
begin
INSERT INTO [gnrl].[tbEstadosCiviles]
           ([estc_Id]
           ,[estc_Descripcion]
           ,[estc_FechaCreacion]
           ,[estc_UsuarioCreacion]
           ,[estc_FechaModificacion]
           ,[estc_UsuarioModificacion]
           ,[estc_Estado])
     VALUES
           (@estc_Id
           ,@estc_Descripcion
           ,GETDATE()
           ,@estc_UsuarioCreacion
           ,NULL
           ,NULL
           ,1)

END

GO

-----------Procedimiento Update EstadoCiviles
CREATE OR ALTER  PROCEDURE UDP_tbEstadoCiviles_Update
@estc_Id  INT,
@estc_Descripcion Varchar(200),
@estc_UsuarioModificacion INT

as
begin

UPDATE [gnrl].[tbEstadosCiviles]
   SET[estc_Descripcion] = @estc_Descripcion
      ,[estc_FechaModificacion] = GETDATE()
      ,[estc_UsuarioModificacion] = @estc_UsuarioModificacion
 WHERE estc_Id = @estc_Id

END

GO

-----------Procedimiento Delete EstadoCiviles
CREATE OR ALTER  PROCEDURE UDP_tbEstadoCiviles_Delete
@estc_Id  INT

as
begin

UPDATE [gnrl].[tbEstadosCiviles]
   SET estc_Estado = 0
 WHERE estc_Id = @estc_Id

end

GO

-----------Procedimiento Insert Departamentos
GO
CREATE OR ALTER PROCEDURE UDP_tbDepartamentos_Insert
    @depa_Id NVARCHAR(4),
    @depa_Descripcion NVARCHAR(150),
	@depa_Codigo		CHAR(2),
	@depa_UsuarioCreacion INT

AS
BEGIN
    INSERT INTO tbDepartamentos([depa_Id],[depa_Descripcion], depa_Codigo, [depa_FechaCreacion], [depa_UsuarioCreacion], [depa_FechaModificacion], [depa_UsuarioModificacion], [depa_Estado]) 
    VALUES (@depa_Id, @depa_Descripcion,@depa_Codigo, GETDATE(), @depa_UsuarioCreacion, NULL, NULL, 1);
END

GO
-----------Procedimiento Update Departamentos
CREATE PROCEDURE UDP_tbDepartamentos_Update
    @depa_Id INT,
    @depa_Descripcion NVARCHAR(200),
	@depa_Codigo		CHAR(2),
    @depa_UsuarioModificacion INT
AS
BEGIN

    UPDATE tbDepartamentos
    SET depa_Descripcion = @depa_Descripcion,
		depa_Codigo = @depa_Codigo,
        depa_FechaModificacion = GETDATE(),
        depa_UsuarioModificacion = @depa_UsuarioModificacion
    WHERE depa_Id = @depa_Id;
END


GO
-----------Procedimiento Delete Departamentos

CREATE OR ALTER PROCEDURE UDP_tbDepartamentos_Delete
	@depa_Id INT
AS
BEGIN

UPDATE [gnrl].[tbDepartamentos]
   SET [depa_Estado] = 0
 WHERE [depa_Id] = @depa_Id

END
GO

-----------Procedimiento Insert Municipios
Create Procedure UDP_tbMunicipios_Insert
@muni_Id INT,
@muni_Descripcion Nvarchar(150),
@muni_Codigo Char(4),
@depa_Id INT,
@muni_UsuarioCreacion INT
as
begin

INSERT INTO [gnrl].[tbMunicipios]
           ([muni_Id]
           ,[muni_Descripcion]
		   ,muni_Codigo
           ,[depa_Id]
           ,[muni_FechaCreacion]
           ,[muni_UsuarioCreacion]
           ,[muni_FechaModificacion]
           ,[muni_UsuarioModificacion]
           ,[muni_Estado])
     VALUES
           (@muni_Id
           ,@muni_Descripcion
		   ,@muni_Codigo
           ,@depa_Id
           ,GETDATE()
           ,@muni_UsuarioCreacion
           ,NULL
           ,NULL
           ,1)

end 

GO

-----------Procedimiento Update Municipios
Create Procedure UDP_tbMunicipios_Update
@muni_Id INT,
@muni_Descripcion Nvarchar(150),
@muni_Codigo CHAR(4),
@depa_Id INT,
@muni_UsuarioModificacion INT
as
begin

UPDATE [grnl].[tbMunicipios]
   SET [depa_Id] = @depa_Id
      ,muni_Descripcion = @muni_Descripcion
	  ,muni_Codigo = @muni_Codigo
      ,[muni_FechaModificacion] = GETDATE()
      ,[muni_UsuarioModificacion] = @muni_UsuarioModificacion
 WHERE muni_Id = @muni_Id



end 
GO
-----------Procedimiento Delete Municipios
Create Procedure UDP_tbMunicipiosDelete
@muni_Id INT
as
begin

UPDATE [gnrl].[tbMunicipios]
   SET muni_Estado = 0
 WHERE muni_Id = @muni_Id



end 
GO
