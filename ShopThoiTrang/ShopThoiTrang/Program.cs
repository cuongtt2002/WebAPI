using BLL;
using DAL.Helper;
using DAL;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddTransient<IDatabaseHelper, DatabaseHelper>();

builder.Services.AddTransient<ISanPhamDAL, SanPhamDAL>();
builder.Services.AddTransient<ISanPhamBus, SanPhamBus>();

builder.Services.AddTransient<IMenuDAL, MenuDAL>();
builder.Services.AddTransient<IMenuBus, MenuBus>();

builder.Services.AddTransient<ISlideDAL, SlideDAL>();
builder.Services.AddTransient<ISlideBus, SlideBus>();

builder.Services.AddTransient<ILienHeDAL, LienHeDAL>();
builder.Services.AddTransient<ILienHeBus, LienHeBus>();


builder.Services.AddTransient<INguoiDungDAL, NguoiDungDAL>();
builder.Services.AddTransient<INguoiDungBus, NguoiDungBus>();


builder.Services.AddTransient<IGioiThieuDAL,GioiThieuDAL>();
builder.Services.AddTransient<IGioiThieuBus,GioiThieuBus>();

builder.Services.AddTransient<IThuongHieuDAL,ThuongHieuDAL>();
builder.Services.AddTransient<IThuongHieuBus,ThuongHieuBus>();

builder.Services.AddTransient<ILoaiSanPhamDAL, LoaiSanPhamDAL>();
builder.Services.AddTransient<ILoaiSanPhamBus, LoaiSanPhamBus>();

builder.Services.AddTransient<IDonHangDAL, DonHangDAL>();
builder.Services.AddTransient<IDonHangBus, DonHangBus>();

builder.Services.AddTransient<IDanhGiaDAL, DanhGiaDAL>();
builder.Services.AddTransient<IDanhGiaBus, DanhGiaBus>();

builder.Services.AddTransient<ITinTucDAL, TinTucDAL>();
builder.Services.AddTransient<ITinTucBus, TinTucBus>();

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseRouting();
app.UseCors(x => x
    .AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader());
app.UseAuthentication();
app.UseAuthorization();
app.UseAuthorization();

app.MapControllers();

app.Run();
