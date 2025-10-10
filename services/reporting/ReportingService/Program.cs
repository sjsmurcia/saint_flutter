using System.Collections.Generic;
using System.IO;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

app.UseHttpsRedirection();

app.MapGet("/health", () => Results.Ok(new HealthResponse("ok", DateTime.UtcNow)));

app.MapPost("/reports/invoice", (InvoiceRequest request) =>
{
    var title = $"Factura #{request.DocumentId}";
    var body = $"Tenant: {request.TenantId}\nGenerado: {DateTime.UtcNow:yyyy-MM-dd HH:mm}\nFormato: {request.Format}";
    var pdf = PdfGenerator.CreateDocument(title, body);
    var fileName = $"invoice_{request.DocumentId}.pdf";
    return Results.File(pdf, "application/pdf", fileName);
}).WithName("CreateInvoiceReport");

app.MapPost("/reports/sales-period", (SalesPeriodRequest request) =>
{
    var title = "Reporte de ventas";
    var body = $"Tenant: {request.TenantId}\nPeriodo: {request.From:yyyy-MM-dd} - {request.To:yyyy-MM-dd}\nFormato: {request.Format}";
    var pdf = PdfGenerator.CreateDocument(title, body);
    var fileName = $"sales_{request.From:yyyyMMdd}_{request.To:yyyyMMdd}.pdf";
    return Results.File(pdf, "application/pdf", fileName);
}).WithName("CreateSalesPeriodReport");

app.Run();

record HealthResponse(string Status, DateTime Timestamp);

record InvoiceRequest(
    string TenantId,
    string DocumentId,
    string Format = "pdf",
    string? Locale = "es-MX"
);

record SalesPeriodRequest(
    string TenantId,
    DateTime From,
    DateTime To,
    string Format = "pdf",
    string? Locale = "es-MX"
);

static class PdfGenerator
{
    public static byte[] CreateDocument(string title, string body)
    {
        var escapedTitle = title.Replace("(", "\\(").Replace(")", "\\)");
        var escapedBody = body.Replace("(", "\\(").Replace(")", "\\)");
        escapedBody = escapedBody.Replace("\n", ") Tj \n72 660 Td (");

        var content = $"BT /F1 24 Tf 72 720 Td ({escapedTitle}) Tj ET\nBT /F1 14 Tf 72 680 Td ({escapedBody}) Tj ET\n";
        var contentBytes = Encoding.ASCII.GetBytes(content);

        var objects = new[]
        {
            "1 0 obj\n<< /Type /Catalog /Pages 2 0 R >>\nendobj\n",
            "2 0 obj\n<< /Type /Pages /Kids [3 0 R] /Count 1 >>\nendobj\n",
            "3 0 obj\n<< /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] /Contents 4 0 R /Resources << /Font << /F1 5 0 R >> >> >>\nendobj\n",
            $"4 0 obj\n<< /Length {contentBytes.Length} >>\nstream\n{content}endstream\nendobj\n",
            "5 0 obj\n<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>\nendobj\n"
        };

        using var ms = new MemoryStream();
        Write(ms, "%PDF-1.4\n");
        var offsets = new List<long>();

        foreach (var obj in objects)
        {
            offsets.Add(ms.Position);
            Write(ms, obj);
        }

        var xrefOffset = ms.Position;
        Write(ms, $"xref\n0 {objects.Length + 1}\n");
        Write(ms, "0000000000 65535 f \n");
        foreach (var offset in offsets)
        {
            Write(ms, offset.ToString("0000000000"));
            Write(ms, " 00000 n \n");
        }

        Write(ms, "trailer\n<< /Size ");
        Write(ms, (objects.Length + 1).ToString());
        Write(ms, " /Root 1 0 R >>\nstartxref\n");
        Write(ms, xrefOffset.ToString());
        Write(ms, "\n%%EOF\n");

        return ms.ToArray();

        static void Write(MemoryStream stream, string value)
        {
            var bytes = Encoding.ASCII.GetBytes(value);
            stream.Write(bytes, 0, bytes.Length);
        }
    }
}
