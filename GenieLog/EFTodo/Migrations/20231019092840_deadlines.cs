﻿using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EFTodo.Migrations
{
    /// <inheritdoc />
    public partial class deadlines : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "Deadline",
                table: "Todo",
                type: "TEXT",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Deadline",
                table: "Todo");
        }
    }
}
