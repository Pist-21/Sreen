﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ScreenTaker
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ScreenTakerDBEntities : DbContext
    {
        public ScreenTakerDBEntities()
            : base("name=ScreenTakerDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
<<<<<<< HEAD
        public virtual DbSet<folder> folder { get; set; }
        public virtual DbSet<groupShare> groupShare { get; set; }
        public virtual DbSet<image> image { get; set; }
        public virtual DbSet<person> person { get; set; }
        public virtual DbSet<personGroup> personGroup { get; set; }
        public virtual DbSet<tag> tag { get; set; }
        public virtual DbSet<userShare> userShare { get; set; }
=======
        public virtual DbSet<Folder> Folder { get; set; }
        public virtual DbSet<GroupMember> GroupMember { get; set; }
        public virtual DbSet<GroupShare> GroupShare { get; set; }
        public virtual DbSet<Image> Image { get; set; }
        public virtual DbSet<Person> Person { get; set; }
        public virtual DbSet<PersonGroup> PersonGroup { get; set; }
        public virtual DbSet<Tag> Tag { get; set; }
        public virtual DbSet<UserShare> UserShare { get; set; }
        public virtual DbSet<database_firewall_rules> database_firewall_rules { get; set; }
>>>>>>> hotfix
    }
}
