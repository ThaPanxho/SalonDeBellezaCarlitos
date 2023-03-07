CREATE DATABASE SalonDeBellezaCarlitos
GO
USE SalonDeBellezaCarlitos
GO

CREATE TABLE tbUsuarios(
	usu_Id					INT IDENTITY(1,1),
	usu_Usuario				NVARCHAR(100) NOT NULL UNIQUE,
	usu_Contrasenia			NVARCHAR(MAX) NOT NULL,
	emp_Id					INT not null UNIQUE,
	usu_UsuarioCreacion		INT not null,
	usu_FechaCreacion		DATETIME not null,
	usu_UsuarioModificacion INT ,
	usu_FechaModificacion	DATETIME,
	usu_Estado				BIT NOT NULL,

	CONSTRAINT PK_dbo_tbUsuarios_usu_Id PRIMARY KEY(usu_Id)
);

CREATE TABLE tbMetodoPago(
    metpago_Id                      INT IDENTITY(1,1) not null,
    metpago_Descripcion             NVARCHAR (100) NOT NULL,
	metpago_FechaCreacion		    DATETIME not null,
	metpago_UsuarioCreacion		    INT not null,
	metpago_FechaModificacion	    DATETIME,
	metpago_UsuarioModificacion     INT,
	metpago_Estado				    BIT not null,
	
	CONSTRAINT PK_dbo_tbMetodoPagos_metpago_Id PRIMARY KEY(metpago_Id),
	CONSTRAINT FK_dbo_tbMetodoPago_dbo_tbUsuarios_metpago_UsuarioCreacion_usu_Id FOREIGN KEY(metpago_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbMetodoPago_dbo_tbUsuarios_metpago_UsuarioModificacion_usu_Id FOREIGN KEY(metpago_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);

CREATE TABLE tbEstadosCiviles(
	estciv_Id					INT IDENTITY(1,1),
	estciv_Descripcion			NVARCHAR(200) not null UNIQUE,
	estciv_FechaCreacion		DATETIME not null,
	estciv_UsuarioCreacion		INT not null,
	estciv_FechaModificacion	DATETIME,
	estciv_UsuarioModificacion  INT,
	estciv_Estado				BIT not null, 
	CONSTRAINT PK_dbo_tbEstadosCiviles_estciv_Id PRIMARY KEY(estciv_Id),
	CONSTRAINT FK_dbo_tbEstadosCiviles_dbo_tbUsuarios_estciv_UsuarioCreacion_usu_Id FOREIGN KEY(estciv_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbEstadosCiviles_dbo_tbUsuarios_estciv_UsuarioModificacion_usu_Id FOREIGN KEY(estciv_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);


CREATE TABLE tbDepartamentos(
	dep_Id					INT IDENTITY(1,1),
	dep_Descripcion			NVARCHAR(200) NOT NULL UNIQUE,
    dep_Codigo              CHAR(2) NOT NULL UNIQUE,
	dep_FechaCreacion		DATETIME not null,
	dep_UsuarioCreacion		INT not null,
	dep_FechaModificacion	DATETIME,
	dep_UsuarioModificacion INT,
	dep_Estado				BIT not null,
	CONSTRAINT PK_dbo_tbDepartamentos_dep_Id PRIMARY KEY(dep_Id),
	CONSTRAINT FK_dbo_tbDepartamentos_dbo_tbUsuarios_dep_UsuarioCreacion_usu_Id FOREIGN KEY(dep_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbDepartamentos_dbo_tbUsuarios_dep_UsuarioModificacion_usu_Id FOREIGN KEY(dep_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);



CREATE TABLE tbMunicipios(
	mun_Id					INT IDENTITY(1,1),
	mun_Descripcion			NVARCHAR(200) NOT NULL,
    mun_Codigo              CHAR(4) NOT NULL UNIQUE,
	dep_Id					INT NOT NULL,
	mun_FechaCreacion		DATETIME not null,
	mun_UsuarioCreacion		INT not null,
	mun_FechaModificacion	DATETIME,
	mun_UsuarioModificacion INT,
	mun_Estado				BIT not null,
	CONSTRAINT PK_dbo_tbMunicipios_mun_Id PRIMARY KEY(mun_Id),
	CONSTRAINT FK_tbMunicipios_tbDepartamentos_dep_Id FOREIGN KEY(dep_Id) REFERENCES tbDepartamentos(dep_Id),
	CONSTRAINT FK_dbo_tbMunicipios_dbo_tbUsuarios_mun_UsuarioCreacion_usu_Id FOREIGN KEY(mun_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbMunicipios_dbo_tbUsuarios_mun_UsuarioModificacion_usu_Id FOREIGN KEY(mun_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);

CREATE TABLE tbCargos(
	car_Id					INT IDENTITY(1,1) NOT NULL,
	car_Descripcion				NVARCHAR(200) NOT NULL UNIQUE,
	car_FechaCreacion		DATETIME not null,
	car_UsuarioCreacion		INT not null,
	car_FechaModificacion	DATETIME,
	car_UsuarioModificacion INT,
	car_Estado				BIT not null,
	CONSTRAINT PK_dbo_tbCargos_car_Id PRIMARY KEY(car_Id),
	CONSTRAINT FK_dbo_tbCargos_dbo_tbUsuarios_car_UsuarioCreacion_usu_Id FOREIGN KEY(car_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
	CONSTRAINT FK_dbo_tbCargos_dbo_tbUsuarios_car_UsuarioModificacion_usu_Id FOREIGN KEY(car_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);

CREATE TABLE tbEmpleados(
	emp_Id                              INT IDENTITY (1,1),
	emp_Nombre							NVARCHAR(150) NOT NULL,
	emp_Apellido						NVARCHAR(150) NOT NULL,
	emp_Sexo							CHAR(1) NOT NULL,
	mun_Id								INT NOT NULL,
	emp_DireccionExacta					NVARCHAR(500) NOT NULL,
	estciv_Id							INT NOT NULL,
	emp_Telefono						NVARCHAR(20) NOT NULL,
	emp_CorreoElectronico				NVARCHAR(100) NOT NULL,
	emp_FechaNacimiento					Date NOT NULL,
	emp_FechaContratacion				Date NOT NULL,
	car_Id								INT NOT NULL,
	emp_FechaCreacion					DATETIME not null,
	emp_UsuarioCreacion					INT not null,
	emp_FechaModificacion				DATETIME,
	emp_UsuarioModificacion				INT,
	emp_Estado							BIT not null,

CONSTRAINT PK_dbo_tbEmpleados_emp_Id PRIMARY KEY(emp_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbMunicipios_mun_Id FOREIGN KEY(mun_Id) REFERENCES tbMunicipios(mun_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbEstadosCiviles_estciv_Id FOREIGN KEY(estciv_Id) REFERENCES tbEstadosCiviles(estciv_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbCargos_car_Id FOREIGN KEY(car_Id) REFERENCES tbCargos(car_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbUsuarios_emp_UsuarioCreacion_usu_Id FOREIGN KEY(emp_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbEmpleados_dbo_tbUsuarios_emp_UsuarioModificacion_usu_Id FOREIGN KEY(emp_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);


CREATE TABLE tbProveedores(

    prov_Id                              INT IDENTITY(1,1),
    prov_NombreEmpresa                   NVARCHAR (150) NOT NULL UNIQUE,
    prov_NombreContacto                  NVARCHAR (150) NOT NULL,
    mun_Id                               INT NOT NULL,
    prov_DireccionExacta                 NVARCHAR (500) NOT NULL,
    prov_Telefono                        NVARCHAR (20) NOT NULL,
    prov_FechaCreacion		             DATETIME NOT null,
    prov_UsuarioCreacion		         INT NOT null,
    prov_FechaModificacion	            DATETIME,
    prov_UsuarioModificacion             INT,
    prov_Estado                          BIT NOT null,
    CONSTRAINT PK_dbo_tbProveedores_prov_Id PRIMARY KEY(prov_Id),
    CONSTRAINT FK_dbo_tbProveedores_tbMunicipio_mun_id FOREIGN key(mun_id) REFERENCES tbMunicipios(mun_id)
);


CREATE TABLE tbCategorias(
    cat_Id                              INT IDENTITY(1,1),
    cat_Descripcion                     NVARCHAR (150) NOT NULL UNIQUE,
    cat_FechaCreacion		            DATETIME not null,
    cat_UsuarioCreacion		            INT not null,
    cat_FechaModificacion	            DATETIME,
    cat_UsuarioModificacion             INT,
    cat_Estado				            BIT not null,
CONSTRAINT PK_dbo_tbCategoria_cat_Id PRIMARY KEY(cat_Id),
CONSTRAINT FK_dbo_tbCategoria_dbo_tbUsuarios_cat_UsuarioCreacion_usu_Id FOREIGN KEY(cat_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbCategoria_dbo_tbUsuarios_cat_UsuarioModificacion_usu_Id FOREIGN KEY(cat_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);


CREATE TABLE tbProductos(
    pro_Id			                    INT IDENTITY(1,1),
    pro_Nombre		                    NVARCHAR (200) NOT NULL,
    pro_Precio		                    DECIMAL (18,2) NOT NULL,
    cat_Id			                    INT not null,
    pro_Stock		                    INT not null,
    prov_id								INT,
    pro_FechaCreacion					DATETIME not null,
    pro_UsuarioCreacion					INT not null,
    pro_FechaModificacion				DATETIME,
    pro_UsuarioModificacion				INT,
    pro_Estado							BIT not null,

CONSTRAINT PK_dbo_tbProductos_pro_Id PRIMARY KEY(pro_Id),
CONSTRAINT FK_dbo_tbProductos_tbCategoria_cat_Id FOREIGN KEY (cat_Id) REFERENCES tbCategorias(cat_Id),
CONSTRAINT FK_dbo_tbProductos_tbProveedores_prov_Id FOREIGN KEY (prov_id) REFERENCES tbProveedores (prov_id),
CONSTRAINT FK_dbo_tbProductos_dbo_tbUsuarios_pro_UsuarioCreacion_usu_Id FOREIGN KEY(pro_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbProductos_dbo_tbUsuarios_pro_UsuarioModificacion_usu_Id FOREIGN KEY(pro_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);


CREATE TABLE tbClientes(
cli_Id                              INT IDENTITY (1,1),
cli_Nombre							NVARCHAR(150) NOT NULL,
cli_Apellido						NVARCHAR(150) NOT NULL,
cli_Telefono						NVARCHAR(20) NOT NULL,
cli_CorreoElectronico				NVARCHAR(100),
cli_FechaCreacion					DATETIME not null,
cli_UsuarioCreacion					INT not null,
cli_FechaModificacion				DATETIME,
cli_UsuarioModificacion				INT,    
cli_Estado							BIT not null,

CONSTRAINT PK_dbo_tbClientes_cli_Id PRIMARY KEY(cli_id),
CONSTRAINT FK_dbo_tbClientes_dbo_tbUsuarios_cli_UsuarioCreacion_usu_Id FOREIGN KEY(cli_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbClientes_dbo_tbUsuarios_cli_UsuarioModificacion_usu_Id FOREIGN KEY(cli_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);

CREATE TABLE tbServicios(
    ser_Id                          INT IDENTITY(1,1),
    ser_Nombre                      NVARCHAR(150) NOT NULL,
    ser_Descripcion                 NVARCHAR(500) ,
    ser_Precio                      DECIMAL(18,2) NOT NULL,
    ser_FechaCreacion				DATETIME not null,
    ser_UsuarioCreacion				INT not null,
    ser_FechaModificacion			DATETIME,
    ser_UsuarioModificacion		    INT,    
    ser_Estado					    BIT not null,

    CONSTRAINT PK_dbo_tbServicio_ser_Id PRIMARY KEY(ser_Id),
    CONSTRAINT FK_dbo_tbServicios_dbo_tbUsuarios_ser_UsuarioCreacion_usu_Id FOREIGN KEY(ser_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
    CONSTRAINT FK_dbo_tbServicios_dbo_tbUsuarios_ser_UsuarioModificacion_usu_Id FOREIGN KEY(ser_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
    
);

CREATE TABLE tbFacturas(
    fac_Id                              INT IDENTITY(1,1),
    cli_Id                              INT not null,
    fac_Pedidos							DATETIME NOT NULL,
    emp_Id								INT not null,
    metpago_Id							INT not null,
    fac_FechaCreacion					DATETIME not null,
    fac_UsuarioCreacion					INT not null,
    fac_FechaModificacion				DATETIME,
    fac_UsuarioModificacion				INT,
    fac_Estado							BIT not null,

    CONSTRAINT PK_dbo_tbFacturas_fac_Id PRIMARY KEY(fac_Id),
    CONSTRAINT FK_dbo_tbFacturas_tbClientes_cli_id FOREIGN KEY(cli_Id) REFERENCES tbClientes(cli_Id),  
    CONSTRAINT FK_dbo_tbFacturas_tbMetodoPago_metpago_id FOREIGN KEY(metpago_Id) REFERENCES tbMetodoPago(metpago_Id),
    CONSTRAINT FK_dbo_tbFacturas_dbo_tbEmpleados_emp_Id FOREIGN KEY(emp_Id) REFERENCES tbEmpleados(emp_Id),
    CONSTRAINT FK_dbo_tbFacturas_dbo_tbUsuarios_ped_UsuarioCreacion_usu_Id FOREIGN KEY(fac_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
    CONSTRAINT FK_dbo_tbFacturas_dbo_tbUsuarios_ped_UsuarioModificacion_usu_Id FOREIGN KEY(fac_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);


CREATE TABLE tbFacturasDetalles(
fade_Id                             INT IDENTITY(1,1),
fac_Id                              INT not null,
pro_Id                              INT not null,
fade_Cantidad						INT NOT NULL,
fade_Precio							DECIMAL (18,2) NOT NULL,
fade_FechaCreacion					DATETIME not null,
fade_UsuarioCreacion				INT not null,
fade_FechaModificacion				DATETIME,
fade_UsuarioModificacion			INT,
fade_Estado							BIT not null,
CONSTRAINT PK_dbo_tbFacturasDetalles_fade_Id PRIMARY KEY(fade_Id),
CONSTRAINT FK_dbo_tbFacturasDetalles_tbFacturas_fac_id FOREIGN KEY(fac_Id) REFERENCES tbFacturas(fac_Id),
CONSTRAINT FK_dbo_tbFacturasDetalles_tbProductos_pro_id FOREIGN KEY(pro_Id) REFERENCES tbProductos(pro_Id),
CONSTRAINT FK_dbo_tbFacturasDetalles_dbo_tbUsuarios_fade_UsuarioCreacion_usu_Id FOREIGN KEY(fade_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbFacturasDetalles_dbo_tbUsuarios_fade_UsuarioModificacion_usu_Id FOREIGN KEY(fade_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);

CREATE TABLE tbSucursales(
    suc_Id                              INT IDENTITY(1,1),
    suc_Descripcion                     NVARCHAR(200) NOT NULL,
    mun_Id                              INT,
    suc_FechaCreacion					DATETIME not null,
    suc_UsuarioCreacion				    INT not null,
    suc_FechaModificacion				DATETIME,
    suc_UsuarioModificacion			    INT,
    suc_Estado							BIT not null,
    CONSTRAINT PK_dbo_tbSucursales_suc_Id PRIMARY KEY(suc_Id),
    CONSTRAINT FK_dbo_tbSucursales_dbo_tbMunicipios_mun_Id FOREIGN KEY(mun_Id) REFERENCES tbMunicipios(mun_Id),

    CONSTRAINT FK_dbo_tbSucursales_dbo_tbUsuarios_suc_UsuarioCreacion_usu_Id FOREIGN KEY(suc_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
    CONSTRAINT FK_dbo_tbSucursales_dbo_tbUsuarios_suc_UsuarioModificacion_usu_Id FOREIGN KEY(suc_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)

);

CREATE TABLE tbResevaciones(
res_Id                              INT IDENTITY(1,1),
cli_Id                              INT NOT NULL,
suc_Id                              INT NOT NULL,
res_DiaReservado                    DATE NOT NULL,
res_HoraInicio                      TIME NOT NULL,
res_HoraFin                         TIME NOT NULL,
res_FechaCreacion					DATETIME not null,
res_UsuarioCreacion				    INT not null,
res_FechaModificacion				DATETIME,
res_UsuarioModificacion			    INT,
res_Estado							BIT not null,

CONSTRAINT PK_dbo_tbResevaciones_res_Id PRIMARY KEY(res_Id),
CONSTRAINT FK_dbo_tbResevaciones_tbClientes_cli_id FOREIGN KEY(cli_Id) REFERENCES tbClientes(cli_Id),
CONSTRAINT FK_dbo_tbResevaciones_tbSucursales_suc_id FOREIGN KEY(suc_Id) REFERENCES tbSucursales(suc_Id),
CONSTRAINT FK_dbo_tbResevaciones_dbo_tbUsuarios_res_UsuarioCreacion_usu_Id FOREIGN KEY(res_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
CONSTRAINT FK_dbo_tbResevaciones_dbo_tbUsuarios_res_UsuarioModificacion_usu_Id FOREIGN KEY(res_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);


CREATE TABLE tbProductosXServicio(
    serpro_Id                       INT IDENTITY(1,1),
    ser_Id                          INT,
    pro_Id                          INT,
    serpro_FechaCreacion			DATETIME not null,
    serpro_UsuarioCreacion		    INT not null,
    serpro_FechaModificacion		DATETIME,
    serpro_UsuarioModificacion      INT,
    serpro_Estado				    BIT not null,

    CONSTRAINT PK_dbo_tbProductosXServicio_serpro_Id PRIMARY KEY(serpro_Id),
    CONSTRAINT FK_dbo_tbProductosXServicio_dbo_tbServicios_ser_Id FOREIGN KEY (ser_Id) REFERENCES tbServicios(ser_Id),
    CONSTRAINT FK_dbo_tbProductosXServicio_dbo_tbProductos_pro_Id FOREIGN KEY (pro_Id) REFERENCES tbProductos(pro_Id),
    CONSTRAINT FK_dbo_tbProductosXServicio_dbo_tbUsuarios_serpro_UsuarioCreacion_usu_Id FOREIGN KEY(serpro_UsuarioCreacion) REFERENCES tbUsuarios(usu_Id),
    CONSTRAINT FK_dbo_tbProductosXServicio_dbo_tbUsuarios_serpro_UsuarioModificacion_usu_Id FOREIGN KEY(serpro_UsuarioModificacion) REFERENCES tbUsuarios(usu_Id)
);

----INSERTS----



INSERT INTO [dbo].[tbUsuarios]
           ([usu_Usuario]
           ,[usu_Contrasenia]
           ,[emp_Id]
           ,[usu_UsuarioCreacion]
           ,[usu_FechaCreacion]
           ,[usu_UsuarioModificacion]
           ,[usu_FechaModificacion]
           ,[usu_Estado])
     VALUES
           ('admin',HASHBYTES('SHA2_512','admin'),1,1,GETDATE(),null,null,1)
GO



INSERT INTO [dbo].[tbDepartamentos](dep_Codigo,dep_Descripcion,dep_FechaCreacion,dep_UsuarioCreacion,dep_FechaModificacion,dep_UsuarioModificacion,dep_Estado)
VALUES ('01', 'Atlantida', GETDATE(), 1,null,null,1),
	   ('02', 'Colon', GETDATE(), 1,null,null,1),
	   ('03', 'Comayagua', GETDATE(), 1,null,null,1),
	   ('04', 'Copan', GETDATE(), 1,null,null,1),
	   ('05', 'Cortes', GETDATE(), 1,null,null,1),
	   ('06', 'Choluteca', GETDATE(), 1,null,null,1),
	   ('07', 'El Paraiso', GETDATE(), 1,null,null,1),
	   ('08', 'fabncisco Morazan', GETDATE(), 1,null,null,1),
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




	   
INSERT INTO [dbo].[tbMunicipios](mun_Codigo, mun_Descripcion,dep_Id, [mun_UsuarioCreacion], [mun_FechaCreacion],[mun_Estado])
VALUES('0101','La Ceiba ',1, 1, GETDATE(), 1),
      ('0102','El Porvenir','1', 1, GETDATE(), 1), 
	  ('0103','Jutiapa','1', 1, GETDATE(), 1),
	  ('0104','Jutiapa','1', 1, GETDATE(), 1),
	  ('0105','La Masica','1', 1, GETDATE(), 1),
	  ('0201','Trujillo','2', 1, GETDATE(), 1),
	  ('0202','Balfate','2', 1, GETDATE(), 1),
	  ('0203','Iriona','2', 1, GETDATE(), 1),
	  ('0204','Lim�n','2', 1, GETDATE(), 1),
	  ('0205','Sab�','2', 1, GETDATE(), 1),
	  ('0301','Comayagua','3', 1, GETDATE(), 1),
	  ('0302','Ajuterique','3', 1, GETDATE(), 1),
      ('0303','El Rosario','3', 1, GETDATE(), 1),
	  ('0304','Esqu�as','3', 1, GETDATE(), 1),
      ('0305','Humuya','3',1, GETDATE(), 1),
	  ('0401','Santa Rosa de Cop�n','4', 1, GETDATE(), 1),
	  ('0402','Caba�as','4', 1, GETDATE(), 1),
      ('0403','Concepci�n','4', 1, GETDATE(), 1),
	  ('0404','Cop�n Ruinas','4', 1, GETDATE(), 1),
      ('0405','Corqu�n','4', 1, GETDATE(), 1),
	  ('0501','San Pedro Sula ','5', 1, GETDATE(), 1),
      ('0502','Choloma ','5', 1, GETDATE(), 1),
      ('0503','Omoa','5', 1, GETDATE(), 1),
      ('0504','Pimienta','5', 1, GETDATE(), 1),
	  ('0505','Potrerillos','5', 1, GETDATE(), 1),
	  ('0601','Choluteca','6', 1, GETDATE(), 1),
      ('0602','Apacilagua','6', 1, GETDATE(), 1),
      ('0603','Concepci�n de Mar�a','6', 1, GETDATE(), 1),
      ('0604','Duyure','6', 1, GETDATE(), 1),
	  ('0605','El Corpus','7', 1, GETDATE(), 1),
	  ('0701','Yuscar�n','7', 1, GETDATE(), 1),
      ('0702','Alauca','7', 1, GETDATE(), 1),
      ('0703','Danl�','7', 1, GETDATE(), 1),
	  ('0704','El Para�so','7', 1, GETDATE(), 1),
      ('0705','G�inope','7', 1, GETDATE(), 1),
	  ('0801','Distrito Central (Comayag�ela y Tegucigalpa)','8', 1, GETDATE(), 1),
      ('0802','Alubar�n','8', 1, GETDATE(), 1),
      ('0803','Cedros','8', 1, GETDATE(), 1),
      ('0804','Curar�n','8', 1, GETDATE(), 1),
	  ('0805','El Porvenir','8', 1, GETDATE(), 1),
	  ('0901','Puerto Lempira','9', 1, GETDATE(), 1),
      ('0902','Brus Laguna','9', 1, GETDATE(), 1),
      ('0903','Ahuas','9', 1, GETDATE(), 1),
	  ('0904','Juan fabncisco Bulnes','9', 1, GETDATE(), 1),
      ('0905','Villeda Morales','9', 1, GETDATE(), 1),
	  ('1001','La Esperanza','10', 1, GETDATE(), 1),
      ('1002','Camasca','10', 1, GETDATE(), 1),
      ('1003','Colomoncagua','10', 1, GETDATE(), 1),
	  ('1004','Concepci�n','10', 1, GETDATE(), 1),
      ('1005','Dolores','10', 1, GETDATE(), 1),
	  ('1101','Roat�n','11', 1, GETDATE(), 1),
      ('1102','Guanaja','11', 1, GETDATE(), 1),
      ('1103','Jos� Santos Guardiola','11', 1, GETDATE(), 1),
	  ('1104','Utila','11', 1, GETDATE(), 1),
	  ('1201','La Paz','12', 1, GETDATE(), 1),
      ('1202','Aguanqueterique','12', 1, GETDATE(), 1),
      ('1203','Caba�as','12', 1, GETDATE(), 1),
	  ('1204','Cane','12', 1, GETDATE(), 1),
      ('1205','Chinacla','12', 1, GETDATE(), 1),
	  ('1301','Gracias','13', 1, GETDATE(), 1),
      ('1302','Bel�n','13', 1, GETDATE(), 1),
      ('1303','Candelaria','13', 1, GETDATE(), 1),
	  ('1304','Cololaca','13', 1, GETDATE(), 1),
      ('1305','Erandique','13', 1, GETDATE(), 1),
	  ('1401','Ocotepeque','14', 1, GETDATE(), 1),
      ('1402','Bel�n Gualcho','14', 1, GETDATE(), 1),
      ('1403','Concepci�n','14', 1, GETDATE(), 1),
	  ('1404','Dolores Merend�n','14', 1, GETDATE(), 1),
      ('1405','fabternidad','14', 1, GETDATE(), 1),
	  ('1501','Juticalpa','15', 1, GETDATE(), 1),
      ('1502','Campamento','15', 1, GETDATE(), 1),
      ('1503','Catacamas','15', 1, GETDATE(), 1),
	  ('1504','Concordia','15', 1, GETDATE(), 1),
      ('1505','Dulce Nombre de Culm�','15', 1, GETDATE(), 1),
	  ('1601','Santa B�rbara','12', 1, GETDATE(), 1),
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
      ('1805','Joc�n','12', 1, GETDATE(), 1)


	   INSERT INTO [dbo].[tbEstadosCiviles]
VALUES ( 'Casado(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ( 'Soltero(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ( 'Divorciado(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ( 'Viudo(a)',  GETDATE(), 1, NULL, NULL, 1),
	   ( 'Union libre',  GETDATE(), 1, NULL, NULL, 1)


	   Insert INTO [dbo].[tbCargos]
	   Values   ('Jefe',GetDate(),1,null,null,1),
                ('Gerente',GetDate(),1,null,null,1),
                ('Repartidor',GetDate(),1,null,null,1),
                ('Vendedor',GetDate(),1,null,null,1),
                ('Recepcionista',GetDate(),1,null,null,1)




INSERT INTO [dbo].[tbEmpleados]
           ([emp_Nombre]
           ,[emp_Apellido]
           ,[emp_Sexo]
           ,[mun_Id]
           ,[emp_DireccionExacta]
           ,[estciv_Id]
           ,[emp_Telefono]
           ,[emp_CorreoElectronico]
           ,[emp_FechaNacimiento]
           ,[emp_FechaContratacion]
           ,[car_Id]
           ,[emp_FechaCreacion]
           ,[emp_UsuarioCreacion]
           ,[emp_FechaModificacion]
           ,[emp_UsuarioModificacion]
           ,[emp_Estado])
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



ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbUsuarios_usu_UsuarioCreacion_usu_Id FOREIGN KEY([usu_UsuarioCreacion]) REFERENCES tbUsuarios(usu_Id);

GO

ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbUsuarios_usu_UsuarioModificacion_usu_Id FOREIGN KEY([usu_UsuarioModificacion]) REFERENCES tbUsuarios(usu_Id);

GO

ALTER TABLE [dbo].[tbUsuarios] 
ADD CONSTRAINT FK_dbo_tbUsuarios_dbo_tbEmpleados_emp_Id FOREIGN KEY([emp_Id]) REFERENCES tbEmpleados([emp_Id]);


GO



INSERT INTO [dbo].[tbMetodoPago]
           ([metpago_Descripcion]
           ,[metpago_FechaCreacion]
           ,[metpago_UsuarioCreacion]
           ,[metpago_FechaModificacion]
           ,[metpago_UsuarioModificacion]
           ,[metpago_Estado])
     VALUES
           ('Efectivo',GetDate(),1,null ,null,1),
           ('Tarjeta de Credito',GetDate(),1,null ,null,1),
           ('Tarjeta de Debito',GetDate(),1,null ,null,1)
GO




--Procedimientos almacenados del login

GO
CREATE OR ALTER PROCEDURE UDP_Login
	@usu_Usuario Nvarchar(100),
	@usu_Contrasenia Nvarchar(Max)
AS
BEGIN

Declare @Password Nvarchar(max) = (HASHBYTES('SHA2_512',@usu_Contrasenia))

SELECT [usu_Id]
      ,[usu_Usuario]
      ,[usu_Contrasenia]
      ,T1.[emp_Id]
	  ,t2.emp_Nombre + ' ' + t2.emp_Apellido as emp_Nombre 
      ,[usu_UsuarioCreacion]
      ,[usu_FechaCreacion]
      ,[usu_UsuarioModificacion]
      ,[usu_FechaModificacion]
      ,[usu_Estado]
  FROM [tbUsuarios] T1 INNER JOIN [dbo].[tbEmpleados] T2
  ON T1.emp_Id = T2.emp_Id
  WHERE t1.usu_Contrasenia = @Password 
  AND t1.usu_Usuario = @usu_Usuario

END
GO



GO
CREATE OR ALTER    PROCEDURE UDP_RecuperarContrasenia
@usu_Usuario VARCHAR(100),
@usu_Contrasenia NVARCHAR(MAX)

as
begin

Declare @Password Nvarchar(max) = (HASHBYTES('SHA2_512',@usu_Contrasenia))

UPDATE [dbo].[tbUsuarios]
   SET [usu_Contrasenia] = @Password
 WHERE usu_Usuario = @usu_Usuario


END
GO





-----Procedimientos almacenados de tbUsuarios


GO
CREATE OR ALTER PROCEDURE UDP_tbUsuarios_Insert
	@usu_Usuario Nvarchar(100),
	@usu_Contrasenia Nvarchar(max),
	@emp_Id int,
	@usu_UsuarioCreacion int

AS
BEGIN

Declare @Password Nvarchar(max) = (HASHBYTES('SHA2_512',@usu_Contrasenia))

INSERT INTO [dbo].[tbUsuarios]
           ([usu_Usuario]
           ,[usu_Contrasenia]
           ,[emp_Id]
           ,[usu_UsuarioCreacion]
           ,[usu_FechaCreacion]
           ,[usu_UsuarioModificacion]
           ,[usu_FechaModificacion]
           ,[usu_Estado])
     VALUES
           (@usu_Usuario
           ,@Password
           ,@emp_Id
           ,@usu_UsuarioCreacion
           ,GetDate()
           ,null
           ,null
           ,1)

END
GO

--Editar Usuario 
GO
CREATE OR ALTER PROCEDURE UDP_tbUsuarios_Update
	@usu_Id INT,
	@emp_Id int,
	@usuarioModificacion int
AS
BEGIN


UPDATE [dbo].[tbUsuarios]
   SET [emp_Id] = @emp_Id
      ,[usu_UsuarioModificacion] = @usuarioModificacion
      ,[usu_FechaModificacion] = GetDate()
      ,[usu_Estado] = 1
 WHERE usu_Id = @usu_Id


END
GO


--borrar Usuario
CREATE OR ALTER PROCEDURE UDP_tbUsuario_Delete
	@usu_Id INT
AS
BEGIN

UPDATE [dbo].[tbUsuarios]
   SET [usu_Estado] = 0
 WHERE usu_Id = @usu_Id


END
GO



--Procecdimiento alamacenados de Clientes

GO
CREATE PROCEDURE UDP_tbClientes_Insert
    @cli_Nombre NVARCHAR(100),
    @cli_Apellido NVARCHAR(100),
    @cli_Telefono NVARCHAR(20),
    @cli_CorreoElectronico NVARCHAR(100),
    @cli_UsuarioCreacion INT
AS
BEGIN
    INSERT INTO tbClientes([cli_Nombre], [cli_Apellido], [cli_Telefono], [cli_CorreoElectronico],[cli_FechaCreacion], [cli_UsuarioCreacion], [cli_FechaModificacion], [cli_UsuarioModificacion], [cli_Estado])
    VALUES (@cli_Nombre, @cli_Apellido, @cli_Telefono, @cli_CorreoElectronico, GETDATE(), @cli_UsuarioCreacion, NULL,  NULL	, 1)
END
GO
--Procedimiento almacenado Update tbClientes
GO
CREATE PROCEDURE UDP_tbClientes_Update
    @cli_Id INT,
    @cli_Nombre NVARCHAR(100),
    @cli_Apellido NVARCHAR(100),
    @cli_Telefono NVARCHAR(20),
    @cli_CorreoElectronico NVARCHAR(100),
    @cli_UsuarioModificacion INT
AS
BEGIN
    UPDATE tbClientes
    SET cli_Nombre = @cli_Nombre,
        cli_Apellido = @cli_Apellido,
        cli_Telefono = @cli_Telefono,
        cli_CorreoElectronico = @cli_CorreoElectronico,
        cli_FechaModificacion = GETDATE(),
        cli_UsuarioModificacion = @cli_UsuarioModificacion
    WHERE cli_Id = @cli_Id
END

--Procedimiento almacenado Delete tbClientes
GO
CREATE PROCEDURE UDP_tbClientes_Delete (
    @cli_Id INT
)
AS
BEGIN
    UPDATE tbClientes
    SET cli_Estado = 0
    WHERE cli_Id = @cli_Id
END



--Procedimientos almacenados de Empleados


GO
CREATE OR ALTER PROCEDURE UDP_tbEmpleados_Insert
	@emp_Nombre Nvarchar(150),
	@emp_Apellido Nvarchar(150),
	@emp_Sexo char(1),
	@mun_Id INT,
	@emp_DireccionExacta Nvarchar(500),
	@estciv_Id INT,
	@emp_Telefono Nvarchar(20),
	@emp_CorreoElectronico Nvarchar(100),
	@emp_FechaNacimiento Nvarchar(100),
	@emp_FechaContratacion Nvarchar(100),
	@car_Id INT,
	@emp_UsuarioCreacion INT
AS
BEGIN

INSERT INTO [dbo].[tbEmpleados]
           ([emp_Nombre]
           ,[emp_Apellido]
           ,[emp_Sexo]
           ,[mun_Id]
           ,[emp_DireccionExacta]
           ,[estciv_Id]
           ,[emp_Telefono]
           ,[emp_CorreoElectronico]
           ,[emp_FechaNacimiento]
           ,[emp_FechaContratacion]
           ,[car_Id]
           ,[emp_FechaCreacion]
           ,[emp_UsuarioCreacion]
           ,[emp_FechaModificacion]
           ,[emp_UsuarioModificacion]
           ,[emp_Estado])
     VALUES
           (@emp_Nombre
           ,@emp_Apellido
           ,@emp_Sexo
           ,@mun_Id
           ,@emp_DireccionExacta
           ,@estciv_Id
           ,@emp_Telefono
           ,@emp_CorreoElectronico
           ,@emp_FechaNacimiento
           ,@emp_FechaContratacion
           ,@car_Id
           ,GETDATE()
           ,@emp_UsuarioCreacion
           ,null
           ,null
           ,1)



END
GO



GO
CREATE OR ALTER PROCEDURE UDP_tbEmpleados_Update
	@emp_Id INT,
	@emp_Nombre Nvarchar(150),
	@emp_Apellido Nvarchar(150),
	@emp_Sexo char(1),
	@mun_Id INT,
	@emp_DireccionExacta Nvarchar(500),
	@estciv_Id INT,
	@emp_Telefono Nvarchar(20),
	@emp_CorreoElectronico Nvarchar(100),
	@emp_FechaNacimiento Nvarchar(100),
	@emp_FechaContratacion Nvarchar(100),
	@car_Id INT,
	@emp_UsuarioModificacion int
AS
BEGIN

UPDATE [dbo].[tbEmpleados]
   SET [emp_Nombre] = @emp_Nombre
      ,[emp_Apellido] = @emp_Apellido
      ,[emp_Sexo] = @emp_Sexo
      ,[mun_Id] = @mun_Id
      ,[emp_DireccionExacta] = @emp_DireccionExacta
      ,[estciv_Id] = @estciv_Id
      ,[emp_Telefono] = @emp_Telefono
      ,[emp_CorreoElectronico] = @emp_CorreoElectronico
      ,[emp_FechaNacimiento] = @emp_FechaNacimiento
      ,[emp_FechaContratacion] = @emp_FechaContratacion
      ,[car_Id] = @car_Id
      ,[emp_FechaModificacion] = GETDATE()
      ,[emp_UsuarioModificacion] = @emp_UsuarioModificacion
 WHERE emp_Id = @emp_Id



END
GO
GO
CREATE OR ALTER PROCEDURE UDP_tbEmpleados_Delete
	@emp_Id INT
AS
BEGIN

UPDATE [dbo].[tbEmpleados]
   SET emp_Estado = 0
 WHERE emp_Id = @emp_Id



END
GO

--Procedimientos almacenados de categorias

GO
CREATE OR ALTER PROCEDURE UDP_tbCategorias_Insert
	@cat_Descripcion Nvarchar(150),
	@cat_UsuarioCreacion int

AS
BEGIN

INSERT INTO [dbo].[tbCategoria]
           ([cat_Descripcion]
           ,[cat_FechaCreacion]
           ,[cat_UsuarioCreacion]
           ,[cat_FechaModificacion]
           ,[cat_UsuarioModificacion]
           ,[cat_Estado])
     VALUES
           (@cat_Descripcion
           ,GETDATE()
           ,@cat_UsuarioCreacion
           ,null
           ,null
           ,1)


END
GO


GO
CREATE OR ALTER PROCEDURE UDP_tbCategorias_Update
	@cat_Id INT,
	@cat_Descripcion Nvarchar(200),
	@cat_UsuarioModificacion int
AS
BEGIN

UPDATE [dbo].[tbCategoria]
   SET [cat_Descripcion] = @cat_Descripcion
      ,[cat_FechaModificacion] = GETDATE()
      ,[cat_UsuarioModificacion] = @cat_UsuarioModificacion
 WHERE cat_Id = @cat_Id


END
GO

GO
CREATE OR ALTER PROCEDURE UDP_tbCategorias_Delete
	@cat_Id INT
AS
BEGIN


UPDATE [dbo].[tbCategoria]
   SET [cat_Estado] = 0
 WHERE cat_Id = @cat_Id


END
GO


--Procedimientos almacenados de Cargos

CREATE OR ALTER PROCEDURE UDP_tbCargos_Insert
	@car_Nombre Nvarchar(150),
	@car_UsuarioCreacion int

AS
BEGIN

INSERT INTO [dbo].[tbCargos]
           ([car_Nombre]
           ,[car_FechaCreacion]
           ,[car_UsuarioCreacion]
           ,[car_FechaModificacion]
           ,[car_UsuarioModificacion]
           ,[car_Estado])
     VALUES
           (@car_Nombre
           ,GETDATE()
           ,@car_UsuarioCreacion
           ,null
           ,null
           ,1)


END
GO

GO
CREATE OR ALTER PROCEDURE UDP_tbCargos_Update
	@car_Id INT,
	@car_Nombre Nvarchar(150),
	@car_UsuarioModificacion int
AS
BEGIN

UPDATE [dbo].[tbCargos]
   SET [car_Nombre] = @car_Nombre
      ,[car_FechaModificacion] = GETDATE()
      ,[car_UsuarioModificacion] = @car_UsuarioModificacion
 WHERE car_Id = @car_Id
 
 GO
CREATE OR ALTER PROCEDURE UDP_tbCargos_Delete
	@car_Id INT
AS
BEGIN

UPDATE [dbo].[tbCargos]
   SET [car_Estado] = 0
 WHERE car_Id = @car_Id

END
GO



--Procedimientos Almacenados de Servicios

CREATE OR ALTER PROCEDURE UDP_tbServicios_Insert
	@ser_Nombre Nvarchar(150),
	@ser_Descripcion Nvarchar(500),
	@ser_Precio Nvarchar(150),
	@ser_UsuarioCreacion int

AS
BEGIN

INSERT INTO [dbo].[tbServicios]
           ([ser_Nombre]
           ,[ser_Descripcion]
           ,[ser_Precio]
           ,[ser_FechaCreacion]
           ,[ser_UsuarioCreacion]
           ,[ser_FechaModificacion]
           ,[ser_UsuarioModificacion]
           ,[ser_Estado])
     VALUES
           (@ser_Nombre
           ,@ser_Descripcion
           ,@ser_Precio
           ,GETDATE()
           ,@ser_UsuarioCreacion
           ,NULL
           ,NULL
           ,1)


END
GO

GO
CREATE OR ALTER PROCEDURE UDP_tbServicios_Update
	@ser_Id INT,
	@ser_Nombre Nvarchar(150),
	@ser_Descripcion Nvarchar(500),
	@ser_Precio Nvarchar(150),
	@ser_UsuarioModificacion int
AS
BEGIN

--Falta UPDATEEEE

 END
 GO



CREATE OR ALTER PROCEDURE UDP_tbCargos_Delete
	@car_Id INT
AS
BEGIN

--FaltaDeleteeeee

END
GO
----------------------------------------------------------------------------------
------------------PROCEDIMIENTOS----------------------

-----------Procedimiento Insert MetodoPago
GO
CREATE PROCEDURE UDP_tbMetodoPago_Insert
(
    @metpago_Descripcion             NVARCHAR (100),
    @metpago_UsuarioCreacion         INT
)
AS
BEGIN

    INSERT INTO tbMetodoPago ([metpago_Descripcion], [metpago_FechaCreacion], [metpago_UsuarioCreacion], [metpago_FechaModificacion], [metpago_UsuarioModificacion], [metpago_Estado])
    VALUES (@metpago_Descripcion, GETDATE(), @metpago_UsuarioCreacion, NULL, NULL, 1);
END

-----------Procedimiento Update MetodoPago
GO
CREATE PROCEDURE UDP_tbMetodoPago_Update
	@metpago_Id                      INT,
	@metpago_Descripcion             NVARCHAR (100),
	@metpago_UsuarioModificacion     INT
AS
BEGIN
	UPDATE tbMetodoPago
	SET metpago_Descripcion = @metpago_Descripcion,
	    metpago_FechaModificacion = GETDATE(),
	    metpago_UsuarioModificacion = @metpago_UsuarioModificacion
	WHERE metpago_Id = @metpago_Id;
END

-----------Procedimiento Delete MetodoPago
GO
CREATE PROCEDURE UDP_tbMetodoPago_Delete (
    @metpago_Id INT, @metpago_UsuarioModificacion INT
)
AS
BEGIN
    UPDATE tbMetodoPago
    SET metpago_Estado = 0,
        metpago_FechaModificacion = GETDATE(),
        metpago_UsuarioModificacion = @metpago_UsuarioModificacion 
    WHERE  metpago_Id = @metpago_Id
END

GO

-----------Procedimiento Insert EstadoCiviles
CREATE OR ALTER  PROCEDURE UDP_tbEstadoCiviles_Insert
@estciv_Id  INT,
@estciv_Descripcion Varchar(200),
@estciv_UsuarioCreacion INT
as
begin
INSERT INTO [dbo].[tbEstadosCiviles]
           ([estciv_Id]
           ,[estciv_Descripcion]
           ,[estciv_FechaCreacion]
           ,[estciv_UsuarioCreacion]
           ,[estciv_FechaModificacion]
           ,[estciv_UsuarioModificacion]
           ,[estciv_Estado])
     VALUES
           (@estciv_Id
           ,@estciv_Descripcion
           ,GETDATE()
           ,@estciv_UsuarioCreacion
           ,NULL
           ,NULL
           ,1)

END

GO

-----------Procedimiento Update EstadoCiviles
CREATE OR ALTER  PROCEDURE UDP_tbEstadoCiviles_Update
@estciv_Id  INT,
@estciv_Descripcion Varchar(200),
@estciv_UsuarioModificacion INT

as
begin

UPDATE [dbo].[tbEstadosCiviles]
   SET[estciv_Descripcion] = @estciv_Descripcion
      ,[estciv_FechaModificacion] = GETDATE()
      ,[estciv_UsuarioModificacion] = @estciv_UsuarioModificacion
 WHERE estciv_Id = @estciv_Id

END

GO

-----------Procedimiento Delete EstadoCiviles
CREATE OR ALTER  PROCEDURE UDP_tbEstadoCiviles_Delete
@estciv_Id  INT

as
begin

UPDATE [dbo].[tbEstadosCiviles]
   SET estciv_Estado = 0
 WHERE estciv_Id = @estciv_Id

end

GO

-----------Procedimiento Insert Departamentos
GO
CREATE OR ALTER PROCEDURE UDP_tbDepartamentos_Insert
    @dep_Id NVARCHAR(4),
    @dep_Descripcion NVARCHAR(150),
	@dep_Codigo		CHAR(2),
	@dep_UsuarioCreacion INT

AS
BEGIN
    INSERT INTO tbDepartamentos([dep_Id],[dep_Descripcion], dep_Codigo, [dep_FechaCreacion], [dep_UsuarioCreacion], [dep_FechaModificacion], [dep_UsuarioModificacion], [dep_Estado]) 
    VALUES (@dep_Id, @dep_Descripcion,@dep_Codigo, GETDATE(), @dep_UsuarioCreacion, NULL, NULL, 1);
END

GO
-----------Procedimiento Update Departamentos
CREATE PROCEDURE UDP_tbDepartamentos_Update
    @dep_Id INT,
    @dep_Descripcion NVARCHAR(200),
	@dep_Codigo		CHAR(2),
    @dep_UsuarioModificacion INT
AS
BEGIN

    UPDATE tbDepartamentos
    SET dep_Descripcion = @dep_Descripcion,
		dep_Codigo = @dep_Codigo,
        dep_FechaModificacion = GETDATE(),
        dep_UsuarioModificacion = @dep_UsuarioModificacion
    WHERE dep_Id = @dep_Id;
END


GO
-----------Procedimiento Delete Departamentos

CREATE OR ALTER PROCEDURE UDP_tbDepartamentos_Delete
	@dep_Id INT
AS
BEGIN

UPDATE [dbo].[tbDepartamentos]
   SET [dep_Estado] = 0
 WHERE [dep_Id] = @dep_Id

END
GO

-----------Procedimiento Insert Municipios
Create Procedure UDP_tbMunicipios_Insert
@mun_Id INT,
@mun_Descripcion Nvarchar(150),
@mun_Codigo Char(4),
@dep_Id INT,
@mun_UsuarioCreacion INT
as
begin

INSERT INTO [dbo].[tbMunicipios]
           ([mun_Id]
           ,[mun_Descripcion]
		   ,mun_Codigo
           ,[dep_Id]
           ,[mun_FechaCreacion]
           ,[mun_UsuarioCreacion]
           ,[mun_FechaModificacion]
           ,[mun_UsuarioModificacion]
           ,[mun_Estado])
     VALUES
           (@mun_Id
           ,@mun_Descripcion
		   ,@mun_Codigo
           ,@dep_Id
           ,GETDATE()
           ,@mun_UsuarioCreacion
           ,NULL
           ,NULL
           ,1)

end 

GO

-----------Procedimiento Update Municipios
Create Procedure UDP_tbMunicipios_Update
@mun_Id INT,
@mun_Descripcion Nvarchar(150),
@mun_Codigo CHAR(4),
@dep_Id INT,
@mun_UsuarioModificacion INT
as
begin

UPDATE [dbo].[tbMunicipios]
   SET [dep_Id] = @dep_Id
      ,mun_Descripcion = @mun_Descripcion
	  ,mun_Codigo = @mun_Codigo
      ,[mun_FechaModificacion] = GETDATE()
      ,[mun_UsuarioModificacion] = @mun_UsuarioModificacion
 WHERE mun_Id = @mun_Id



end 
GO
-----------Procedimiento Delete Municipios
Create Procedure UDP_tbMunicipiosDelete
@mun_Id INT
as
begin

UPDATE [dbo].[tbMunicipios]
   SET mun_Estado = 0
 WHERE mun_Id = @mun_Id



end 
GO
