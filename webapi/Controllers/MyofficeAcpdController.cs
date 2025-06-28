using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Text.Json;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MyofficeAcpdController : ControllerBase
    {
        private readonly IConfiguration _config;

        public MyofficeAcpdController(IConfiguration config)
        {
            _config = config;
        }

        private string ConnectionString => _config.GetConnectionString("DefaultConnection")!;

        [HttpPost("create")]
        public async Task<IActionResult> Create([FromBody] MyofficeAcpdModel input)
        {
            var result = await ExecuteSpWithJson("usp_Myoffice_ACPD_Insert", input);
            return Ok(result);
        }

        [HttpGet("{sid}")]
        public async Task<IActionResult> Get(string sid)
        {
            using var conn = new SqlConnection(ConnectionString);
            await conn.OpenAsync();

            var cmd = new SqlCommand("usp_Myoffice_ACPD_Get", conn)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@SID", sid);

            var dt = new DataTable();
            using var reader = await cmd.ExecuteReaderAsync();
            dt.Load(reader);

            return Ok(dt);
        }

        [HttpPut("update")]
        public async Task<IActionResult> Update([FromBody] MyofficeAcpdModel input)
        {
            var result = await ExecuteSpWithJson("usp_Myoffice_ACPD_Update", input);
            return Ok(result);
        }

        [HttpDelete("{sid}")]
        public async Task<IActionResult> Delete(string sid)
        {
            using var conn = new SqlConnection(ConnectionString);
            await conn.OpenAsync();

            var cmd = new SqlCommand("usp_Myoffice_ACPD_Delete", conn)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@SID", sid);

            await cmd.ExecuteNonQueryAsync();
            return Ok(new { message = "Deleted" });
        }

        private async Task<DataTable> ExecuteSpWithJson(string spName, object data)
        {
            using var conn = new SqlConnection(ConnectionString);
            await conn.OpenAsync();

            var cmd = new SqlCommand(spName, conn)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@JsonData", JsonSerializer.Serialize(data));

            var dt = new DataTable();
            using var reader = await cmd.ExecuteReaderAsync();
            dt.Load(reader);
            return dt;
        }
    }
}
