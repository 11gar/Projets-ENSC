using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ApiTodo.Migrations
{
    public partial class e5 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Todos_Listes_ListeId",
                table: "Todos");

            migrationBuilder.DropIndex(
                name: "IX_Todos_ListeId",
                table: "Todos");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_Todos_ListeId",
                table: "Todos",
                column: "ListeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Todos_Listes_ListeId",
                table: "Todos",
                column: "ListeId",
                principalTable: "Listes",
                principalColumn: "Id");
        }
    }
}
