﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using SalonDeBellezaCarlitos.Entities.Entities;

#nullable disable

namespace SalonDeBellezaCarlitos.DataAccess.Context
{
    public partial class SalondebellezacarlitosContext : DbContext
    {
        public SalondebellezacarlitosContext()
        {
        }

        public SalondebellezacarlitosContext(DbContextOptions<SalondebellezacarlitosContext> options)
            : base(options)
        {
        }

        public virtual DbSet<tbCargos> tbCargos { get; set; }
        public virtual DbSet<tbCategorias> tbCategorias { get; set; }
        public virtual DbSet<tbClientes> tbClientes { get; set; }
        public virtual DbSet<tbDepartamentos> tbDepartamentos { get; set; }
        public virtual DbSet<tbEmpleados> tbEmpleados { get; set; }
        public virtual DbSet<tbEstadosCiviles> tbEstadosCiviles { get; set; }
        public virtual DbSet<tbFacturas> tbFacturas { get; set; }
        public virtual DbSet<tbFacturasDetalles> tbFacturasDetalles { get; set; }
        public virtual DbSet<tbMetodoPago> tbMetodoPago { get; set; }
        public virtual DbSet<tbMunicipios> tbMunicipios { get; set; }
        public virtual DbSet<tbProductos> tbProductos { get; set; }
        public virtual DbSet<tbProductosXServicio> tbProductosXServicio { get; set; }
        public virtual DbSet<tbProveedores> tbProveedores { get; set; }
        public virtual DbSet<tbReservaciones> tbReservaciones { get; set; }
        public virtual DbSet<tbServicios> tbServicios { get; set; }
        public virtual DbSet<tbSucursales> tbSucursales { get; set; }
        public virtual DbSet<tbUsuarios> tbUsuarios { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            modelBuilder.Entity<tbCargos>(entity =>
            {
                entity.HasKey(e => e.carg_Id)
                    .HasName("PK_salo_tbCargos_carg_Id");

                entity.ToTable("tbCargos", "salo");

                entity.HasIndex(e => e.carg_Descripcion, "UQ__tbCargos__F3099AE0E7E38B4E")
                    .IsUnique();

                entity.Property(e => e.carg_Descripcion)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.carg_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.carg_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.carg_FechaModificacion).HasColumnType("datetime");

                entity.HasOne(d => d.carg_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbCargoscarg_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.carg_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbCargos_acce_tbUsuarios_carg_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.carg_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbCargoscarg_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.carg_UsuarioModificacion)
                    .HasConstraintName("FK_salo_tbCargos_acce_tbUsuarios_carg_UsuarioModificacion_usur_Id");
            });

            modelBuilder.Entity<tbCategorias>(entity =>
            {
                entity.HasKey(e => e.cate_Id)
                    .HasName("PK_salo_tbCategoria_cate_Id");

                entity.ToTable("tbCategorias", "salo");

                entity.HasIndex(e => e.cate_Descripcion, "UQ__tbCatego__55D9A779E376D8F2")
                    .IsUnique();

                entity.Property(e => e.cate_Descripcion)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.cate_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.cate_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.cate_FechaModificacion).HasColumnType("datetime");

                entity.HasOne(d => d.cate_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbCategoriascate_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.cate_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbCategoria_acce_tbUsuarios_cate_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.cate_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbCategoriascate_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.cate_UsuarioModificacion)
                    .HasConstraintName("FK_salo_tbCategoria_acce_tbUsuarios_cate_UsuarioModificacion_usur_Id");
            });

            modelBuilder.Entity<tbClientes>(entity =>
            {
                entity.HasKey(e => e.clie_Id)
                    .HasName("PK_salo_tbClientes_clie_Id");

                entity.ToTable("tbClientes", "salo");

                entity.Property(e => e.clie_Apellido)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.clie_CorreoElectronico).HasMaxLength(100);

                entity.Property(e => e.clie_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.clie_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.clie_FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.clie_Nombre)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.clie_Telefono)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.HasOne(d => d.clie_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbClientesclie_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.clie_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbClientes_acce_tbUsuarios_clie_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.clie_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbClientesclie_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.clie_UsuarioModificacion)
                    .HasConstraintName("FK_salo_tbClientes_acce_tbUsuarios_clie_UsuarioModificacion_usur_Id");
            });

            modelBuilder.Entity<tbDepartamentos>(entity =>
            {
                entity.HasKey(e => e.depa_Id)
                    .HasName("PK_gnrl_tbDepartamentos_depa_Id");

                entity.ToTable("tbDepartamentos", "gnrl");

                entity.HasIndex(e => e.depa_Codigo, "UQ__tbDepart__CCD74A04B0324F2C")
                    .IsUnique();

                entity.HasIndex(e => e.depa_Descripcion, "UQ__tbDepart__D4C398404A18A824")
                    .IsUnique();

                entity.Property(e => e.depa_Codigo)
                    .IsRequired()
                    .HasMaxLength(2)
                    .IsUnicode(false)
                    .IsFixedLength(true);

                entity.Property(e => e.depa_Descripcion)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.depa_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.depa_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.depa_FechaModificacion).HasColumnType("datetime");

                entity.HasOne(d => d.depa_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbDepartamentosdepa_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.depa_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_gnrl_tbDepartamentos_acce_tbUsuarios_depa_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.depa_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbDepartamentosdepa_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.depa_UsuarioModificacion)
                    .HasConstraintName("FK_gnrl_tbDepartamentos_acce_tbUsuarios_depa_UsuarioModificacion_usur_Id");
            });

            modelBuilder.Entity<tbEmpleados>(entity =>
            {
                entity.HasKey(e => e.empl_Id)
                    .HasName("PK_salo_tbEmpleados_empl_Id");

                entity.ToTable("tbEmpleados", "salo");

                entity.Property(e => e.empl_Apellido)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.empl_CorreoElectronico)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.empl_DireccionExacta)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.empl_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.empl_FechaContratacion).HasColumnType("date");

                entity.Property(e => e.empl_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.empl_FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.empl_FechaNacimiento).HasColumnType("date");

                entity.Property(e => e.empl_Nombre)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.empl_Sexo)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength(true);

                entity.Property(e => e.empl_Telefono)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.HasOne(d => d.carg)
                    .WithMany(p => p.tbEmpleados)
                    .HasForeignKey(d => d.carg_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbEmpleados_salo_tbCargos_carg_Id");

                entity.HasOne(d => d.empl_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbEmpleadosempl_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.empl_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbEmpleados_acce_tbUsuarios_empl_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.empl_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbEmpleadosempl_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.empl_UsuarioModificacion)
                    .HasConstraintName("FK_salo_tbEmpleados_acce_tbUsuarios_empl_UsuarioModificacion_usur_Id");

                entity.HasOne(d => d.estc)
                    .WithMany(p => p.tbEmpleados)
                    .HasForeignKey(d => d.estc_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbEmpleados_gnrl_tbEstadosCiviles_estc_Id");

                entity.HasOne(d => d.muni)
                    .WithMany(p => p.tbEmpleados)
                    .HasForeignKey(d => d.muni_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbEmpleados_gnrl_tbMunicipios_muni_Id");
            });

            modelBuilder.Entity<tbEstadosCiviles>(entity =>
            {
                entity.HasKey(e => e.estc_Id)
                    .HasName("PK_gnrl_tbEstadosCiviles_estc_Id");

                entity.ToTable("tbEstadosCiviles", "gnrl");

                entity.HasIndex(e => e.estc_Descripcion, "UQ__tbEstado__01777E3BACAFE30C")
                    .IsUnique();

                entity.Property(e => e.estc_Descripcion)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.estc_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.estc_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.estc_FechaModificacion).HasColumnType("datetime");

                entity.HasOne(d => d.estc_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbEstadosCivilesestc_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.estc_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_gnrl_tbEstadosCiviles_acce_tbUsuarios_estc_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.estc_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbEstadosCivilesestc_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.estc_UsuarioModificacion)
                    .HasConstraintName("FK_gnrl_tbEstadosCiviles_acce_tbUsuarios_estc_UsuarioModificacion_usur_Id");
            });

            modelBuilder.Entity<tbFacturas>(entity =>
            {
                entity.HasKey(e => e.fact_Id)
                    .HasName("PK_salo_tbFacturas_fact_Id");

                entity.ToTable("tbFacturas", "salo");

                entity.Property(e => e.fact_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.fact_Fecha)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.fact_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.fact_FechaModificacion).HasColumnType("datetime");

                entity.HasOne(d => d.clie)
                    .WithMany(p => p.tbFacturas)
                    .HasForeignKey(d => d.clie_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbFacturas_tbClientes_clie_id");

                entity.HasOne(d => d.empl_Id_AtendidoNavigation)
                    .WithMany(p => p.tbFacturasempl_Id_AtendidoNavigation)
                    .HasForeignKey(d => d.empl_Id_Atendido)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbFacturas_salo_tbEmpleados_empl_Id_Atendido");

                entity.HasOne(d => d.empl_Id_CajaNavigation)
                    .WithMany(p => p.tbFacturasempl_Id_CajaNavigation)
                    .HasForeignKey(d => d.empl_Id_Caja)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbFacturas_salo_tbEmpleados_empl_Id_Caja");

                entity.HasOne(d => d.fact_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbFacturasfact_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.fact_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbFacturas_acce_tbUsuarios_ped_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.fact_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbFacturasfact_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.fact_UsuarioModificacion)
                    .HasConstraintName("FK_salo_tbFacturas_acce_tbUsuarios_ped_UsuarioModificacion_usur_Id");

                entity.HasOne(d => d.metp)
                    .WithMany(p => p.tbFacturas)
                    .HasForeignKey(d => d.metp_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbFacturas_tbMetodoPago_metp_id");
            });

            modelBuilder.Entity<tbFacturasDetalles>(entity =>
            {
                entity.HasKey(e => e.fade_Id)
                    .HasName("PK_salo_tbFacturasDetalles_fade_Id");

                entity.ToTable("tbFacturasDetalles", "salo");

                entity.Property(e => e.fade_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.fade_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.fade_FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.fade_Precio).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.fact)
                    .WithMany(p => p.tbFacturasDetalles)
                    .HasForeignKey(d => d.fact_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbFacturasDetalles_tbFacturas_fact_id");

                entity.HasOne(d => d.fade_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbFacturasDetallesfade_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.fade_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbFacturasDetalles_acce_tbUsuarios_fade_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.fade_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbFacturasDetallesfade_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.fade_UsuarioModificacion)
                    .HasConstraintName("FK_salo_tbFacturasDetalles_acce_tbUsuarios_fade_UsuarioModificacion_usur_Id");

                entity.HasOne(d => d.prod)
                    .WithMany(p => p.tbFacturasDetalles)
                    .HasForeignKey(d => d.prod_Id)
                    .HasConstraintName("FK_salo_tbFacturasDetalles_tbProductos_prod_id");

                entity.HasOne(d => d.serv)
                    .WithMany(p => p.tbFacturasDetalles)
                    .HasForeignKey(d => d.serv_Id)
                    .HasConstraintName("FK_salo_tbFacturasDetalles_tbServicios_serv_id");
            });

            modelBuilder.Entity<tbMetodoPago>(entity =>
            {
                entity.HasKey(e => e.metp_Id)
                    .HasName("PK_gnrl_tbMetodoPagos_metp_Id");

                entity.ToTable("tbMetodoPago", "gnrl");

                entity.Property(e => e.metp_Descripcion)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.metp_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.metp_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.metp_FechaModificacion).HasColumnType("datetime");

                entity.HasOne(d => d.metp_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbMetodoPagometp_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.metp_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_gnrl_tbMetodoPagos_acce_tbUsuarios_metp_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.metp_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbMetodoPagometp_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.metp_UsuarioModificacion)
                    .HasConstraintName("FK_gnrl_tbMetodoPagos_acce_tbUsuarios_metp_UsuarioModificacion_usur_Id");
            });

            modelBuilder.Entity<tbMunicipios>(entity =>
            {
                entity.HasKey(e => e.muni_Id)
                    .HasName("PK_gnrl_tbMunicipios_muni_Id");

                entity.ToTable("tbMunicipios", "gnrl");

                entity.HasIndex(e => e.muni_Codigo, "UQ__tbMunici__3C7692E1998F35CE")
                    .IsUnique();

                entity.Property(e => e.muni_Codigo)
                    .IsRequired()
                    .HasMaxLength(4)
                    .IsUnicode(false)
                    .IsFixedLength(true);

                entity.Property(e => e.muni_Descripcion)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.muni_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.muni_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.muni_FechaModificacion).HasColumnType("datetime");

                entity.HasOne(d => d.depa)
                    .WithMany(p => p.tbMunicipios)
                    .HasForeignKey(d => d.depa_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.muni_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbMunicipiosmuni_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.muni_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_gnrl_tbMunicipios_acce_tbUsuarios_muni_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.muni_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbMunicipiosmuni_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.muni_UsuarioModificacion)
                    .HasConstraintName("FK_gnrl_tbMunicipios_acce_tbUsuarios_muni_UsuarioModificacion_usur_Id");
            });

            modelBuilder.Entity<tbProductos>(entity =>
            {
                entity.HasKey(e => e.prod_Id)
                    .HasName("PK_salo_tbProductos_prod_Id");

                entity.ToTable("tbProductos", "salo");

                entity.Property(e => e.prod_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.prod_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.prod_FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.prod_Nombre)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.prod_Precio).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.cate)
                    .WithMany(p => p.tbProductos)
                    .HasForeignKey(d => d.cate_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbProductos_tbCategoria_cate_Id");

                entity.HasOne(d => d.prod_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbProductosprod_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.prod_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbProductos_acce_tbUsuarios_prod_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.prod_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbProductosprod_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.prod_UsuarioModificacion)
                    .HasConstraintName("FK_salo_tbProductos_acce_tbUsuarios_prod_UsuarioModificacion_usur_Id");

                entity.HasOne(d => d.prov)
                    .WithMany(p => p.tbProductos)
                    .HasForeignKey(d => d.prov_id)
                    .HasConstraintName("FK_salo_tbProductos_tbProveedores_prov_Id");
            });

            modelBuilder.Entity<tbProductosXServicio>(entity =>
            {
                entity.HasKey(e => e.spro_Id)
                    .HasName("PK_salo_tbProductosXServicio_serprod_Id");

                entity.ToTable("tbProductosXServicio", "salo");

                entity.Property(e => e.spro_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.spro_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.spro_FechaModificacion).HasColumnType("datetime");

                entity.HasOne(d => d.prod)
                    .WithMany(p => p.tbProductosXServicio)
                    .HasForeignKey(d => d.prod_Id)
                    .HasConstraintName("FK_salo_tbProductosXServicio_salo_tbProductos_prod_Id");

                entity.HasOne(d => d.serv)
                    .WithMany(p => p.tbProductosXServicio)
                    .HasForeignKey(d => d.serv_Id)
                    .HasConstraintName("FK_salo_tbProductosXServicio_salo_tbServicios_serv_Id");

                entity.HasOne(d => d.spro_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbProductosXServiciospro_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.spro_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbProductosXServicio_acce_tbUsuarios_serprod_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.spro_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbProductosXServiciospro_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.spro_UsuarioModificacion)
                    .HasConstraintName("FK_salo_tbProductosXServicio_acce_tbUsuarios_serprod_UsuarioModificacion_usur_Id");
            });

            modelBuilder.Entity<tbProveedores>(entity =>
            {
                entity.HasKey(e => e.prov_Id)
                    .HasName("PK_salo_tbProveedores_prov_Id");

                entity.ToTable("tbProveedores", "salo");

                entity.HasIndex(e => e.prov_NombreEmpresa, "UQ__tbProvee__9302DE55FFA89C6B")
                    .IsUnique();

                entity.Property(e => e.prov_DireccionExacta)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.prov_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.prov_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.prov_FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.prov_NombreContacto)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.prov_NombreEmpresa)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.prov_Telefono)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.HasOne(d => d.muni)
                    .WithMany(p => p.tbProveedores)
                    .HasForeignKey(d => d.muni_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbProveedores_tbMunicipio_muni_id");
            });

            modelBuilder.Entity<tbReservaciones>(entity =>
            {
                entity.HasKey(e => e.rese_Id)
                    .HasName("PK_salo_tbReservaciones_rese_Id");

                entity.ToTable("tbReservaciones", "salo");

                entity.Property(e => e.rese_DiaReservado).HasColumnType("date");

                entity.Property(e => e.rese_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.rese_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.rese_FechaModificacion).HasColumnType("datetime");

                entity.HasOne(d => d.clie)
                    .WithMany(p => p.tbReservaciones)
                    .HasForeignKey(d => d.clie_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbReservaciones_tbClientes_clie_id");

                entity.HasOne(d => d.rese_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbReservacionesrese_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.rese_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbReservaciones_acce_tbUsuarios_rese_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.rese_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbReservacionesrese_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.rese_UsuarioModificacion)
                    .HasConstraintName("FK_salo_tbReservaciones_acce_tbUsuarios_rese_UsuarioModificacion_usur_Id");

                entity.HasOne(d => d.sucu)
                    .WithMany(p => p.tbReservaciones)
                    .HasForeignKey(d => d.sucu_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbReservaciones_tbSucursales_sucu_id");
            });

            modelBuilder.Entity<tbServicios>(entity =>
            {
                entity.HasKey(e => e.serv_Id)
                    .HasName("PK_salo_tbServicio_serv_Id");

                entity.ToTable("tbServicios", "salo");

                entity.Property(e => e.serv_Descripcion).HasMaxLength(500);

                entity.Property(e => e.serv_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.serv_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.serv_FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.serv_Nombre)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.Property(e => e.serv_Precio).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.serv_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbServiciosserv_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.serv_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbServicios_acce_tbUsuarios_serv_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.serv_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbServiciosserv_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.serv_UsuarioModificacion)
                    .HasConstraintName("FK_salo_tbServicios_acce_tbUsuarios_serv_UsuarioModificacion_usur_Id");
            });

            modelBuilder.Entity<tbSucursales>(entity =>
            {
                entity.HasKey(e => e.sucu_Id)
                    .HasName("PK_salo_tbSucursales_sucu_Id");

                entity.ToTable("tbSucursales", "salo");

                entity.Property(e => e.sucu_Descripcion)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.sucu_DireccionExacta)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.sucu_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.sucu_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.sucu_FechaModificacion).HasColumnType("datetime");

                entity.HasOne(d => d.muni)
                    .WithMany(p => p.tbSucursales)
                    .HasForeignKey(d => d.muni_Id)
                    .HasConstraintName("FK_salo_tbSucursales_gnrl_tbMunicipios_muni_Id");

                entity.HasOne(d => d.sucu_UsuarioCreacionNavigation)
                    .WithMany(p => p.tbSucursalessucu_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.sucu_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_salo_tbSucursales_acce_tbUsuarios_sucu_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.sucu_UsuarioModificacionNavigation)
                    .WithMany(p => p.tbSucursalessucu_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.sucu_UsuarioModificacion)
                    .HasConstraintName("FK_salo_tbSucursales_acce_tbUsuarios_sucu_UsuarioModificacion_usur_Id");
            });

            modelBuilder.Entity<tbUsuarios>(entity =>
            {
                entity.HasKey(e => e.usur_Id)
                    .HasName("PK_acce_tbUsuarios_usur_Id");

                entity.ToTable("tbUsuarios", "acce");

                entity.HasIndex(e => e.empl_Id, "UQ__tbUsuari__4772AE304DFEC6E9")
                    .IsUnique();

                entity.HasIndex(e => e.usur_Usuario, "UQ__tbUsuari__FD066E387742CF85")
                    .IsUnique();

                entity.Property(e => e.usur_Contrasenia).IsRequired();

                entity.Property(e => e.usur_Estado)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.usur_FechaCreacion)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.usur_FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.usur_Usuario)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.empl)
                    .WithOne(p => p.tbUsuarios)
                    .HasForeignKey<tbUsuarios>(d => d.empl_Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_acce_tbUsuarios_salo_tbEmpleados_empl_Id");

                entity.HasOne(d => d.usur_UsuarioCreacionNavigation)
                    .WithMany(p => p.Inverseusur_UsuarioCreacionNavigation)
                    .HasForeignKey(d => d.usur_UsuarioCreacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_acce_tbUsuarios_acce_tbUsuarios_usur_UsuarioCreacion_usur_Id");

                entity.HasOne(d => d.usur_UsuarioModificacionNavigation)
                    .WithMany(p => p.Inverseusur_UsuarioModificacionNavigation)
                    .HasForeignKey(d => d.usur_UsuarioModificacion)
                    .HasConstraintName("FK_acce_tbUsuarios_acce_tbUsuarios_usur_UsuarioModificacion_usur_Id");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}