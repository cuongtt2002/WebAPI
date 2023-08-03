create  DATABASE ShopThoiTrang 
go 
use ShopThoiTrang 
go 
Create table Slide  
(
	MaSlide int identity(1,1) primary key ,
	Anh nvarchar(max)
)
Create table GioiThieu 
(
	MaGioiThieu  int identity(1,1) primary key ,
	TieuDe nvarchar(50),
	NoiDung Nvarchar(max) not null,
	Anh nvarchar(Max) 
)
Create Table ThuongHieu
(
	MaThuongHieu int identity(1,1) primary key ,
	TenThuongHieu Nvarchar(50),
	GioiThieu nvarchar(Max) not null 
)
go
Create Table LienHe
(
	MaLienHe int identity(1,1) primary key ,
	ThongTinLienHe nvarchar(250) not null ,
	Email nvarchar(30) ,
	SoDienThoai nvarchar(15),
	CoSoLienHe nvarchar(max),
)
go
Create Table NhaCungCap
(
	MaNhaCungCap int identity(1,1) primary key ,
	TenNhaCungCap Nvarchar(25) not null,
	DiaChi nvarchar(25),
	SoDienThoai nvarchar(15),
	Email nvarchar(30)
)
go
create table Menu
(
	MaMenu int identity(1,1) primary key ,
	MaMenuCha int not null,
	TenMenu nvarchar(30),
	STT int ,
	TrangThai bit,
	link nvarchar(20)
)
go
Create Table LoaiSanPham 
(
	MaLoaiSanPham int identity(1,1) primary key ,
	TenLoaiSanPham Nvarchar(35) not null,
)
go
Create table SanPham
(
	MaSanPham int identity(1,1) primary key,
	TenSP nvarchar(MAX) ,
	MoTa nvarchar(max),
	NgayTao datetime ,
	Size nvarchar(10) not null,
	MaLoaiSanPham int foreign key (MaLoaiSanPham) references LoaiSanPham(MaLoaiSanPham) on delete cascade on update cascade,
	MaThuongHieu int foreign key (MaThuongHieu) references ThuongHieu(MaThuongHieu) on delete cascade on update cascade,
	AnhDaiDien nvarchar(max),
	
)
go
Create table Gia 
(
	MaGia int identity(1,1) primary key,
	MaSanPham int foreign key  references SanPham(MaSanPham) on delete cascade on update cascade,
	NgayBD datetime,
	NgayKT datetime ,
	DonGia int 

)
go
create table ChiTietAnhSanPham
(
	MaAnhChiTiet int identity(1,1) primary key ,
	MaSanPham int foreign key  references SanPham(MaSanPham) on delete cascade on update cascade,
	Anh nvarchar(Max) not null 
)
go 
CREATE table ThongSoSanPham
(
	MaThongSo int identity(1,1) primary key,
	TenThongSo nvarchar(50),
	MoTaThongTin nvarchar(max) ,
	MaSanPham int foreign key  references SanPham(MaSanPham) on delete cascade on update cascade
)
go
Create table Kho 
(
	MaKho int identity(1,1) primary key ,
	TenKho nvarchar(30),
	DiaChi nvarchar(35)
)
create table ChiTietKho
(
	MaChiTietKho int identity(1,1) primary key ,
    MaKho int foreign key  references Kho(MaKho) on delete cascade on update cascade,
	MaSanPham int foreign key  references SanPham(MaSanPham) on delete cascade on update cascade,
	SoLuong int 
)
create table GiamGia
(
    MaGiamGia int identity(1,1) primary key ,
	MaSanPham int foreign key  references SanPham(MaSanPham) on delete cascade on update cascade,
	PhamTramGiamGia int ,
	ThoiGianBatDau datetime,
	ThoiGianKetThuc datetime ,
	TrangThai bit
)
Create Table NguoiDung
(
	MaNguoiDung int identity(1,1) primary key ,
	TaiKhoan nvarchar(35),
	MatKhau nvarchar(50) not null ,
	Email nvarchar(50) not null ,
	HoTen nvarchar( 50) not null ,
	NgaySinh datetime ,
	DiaChi nvarchar(50) ,
	SoDienThoai nvarchar(15),
	GioiTinh nvarchar(10),
	AnhDaiDien nvarchar(Max),
	TrangThai  bit ,
	VaiTro nvarchar(30)
)
go

Create Table KhachHang 
(
	MaKhachHang int identity(1,1) primary key ,
	TenKhachHang Nvarchar(50),
	DiaChi nvarchar(50) ,
	SoDienThoai nvarchar(15),
	Email nvarchar(30)
)
go
Create table DanhGia 
(
	MaDanhGia int identity(1,1) primary key ,
	SoSao int,
	ThoiGianDanhGia datetime ,
	NoiDungDanhGia nvarchar(max),
	MaSanPham int foreign key  references SanPham(MaSanPham) on delete cascade on update cascade,
	MaKhachHang int Foreign key references KhachHang (MaKhachHang) on delete cascade on update cascade
)
CREATE table TinTuc 
(
	MaTinTuc int identity (1,1) primary key ,
	TieuDe nvarchar(max) not null ,
	NgayDang datetime ,
	NoiDung nvarchar(max) not null ,
	AnhTinTuc nvarchar(max) ,
	MaNguoiDung int Foreign key references NguoiDung(MaNguoiDung) on delete cascade on update cascade,
)
	
CREATE Table HoaDonNhap
(
	MaHDN  int identity(1,1) primary key,
	NgayNhap datetime ,
	MaNhaCungCap int foreign key  references NhaCungCap(MaNhaCungCap) on delete cascade on update cascade,
	MaNguoiDung int Foreign key references NguoiDung (MaNguoiDung) on delete cascade on update cascade

)
go
CREATE Table ChiTietHoaDonNhap
(
	MaChiTiet int identity(1,1) primary key ,
	MaHDN   int Foreign key references HoaDonNhap(MaHDN) on delete cascade on update cascade,
	MaSanPham int Foreign key references SanPham(MaSanPham) on delete cascade on update cascade,
	SoLuong int ,
	GiaTien int 

)
go
CREATE Table DonHang
(
	MaDonHang  int identity(1,1) primary key,
	NgayDat datetime ,
	TrangThai bit ,
	MaKhachHang int Foreign key references KhachHang (MaKhachHang) on delete cascade on update cascade

)
go
Create table ChiTietDonHang 
(
    MaChiTiet int identity(1,1) primary key ,
	MaDonHang int Foreign key references DonHang (MaDonHang) on delete cascade on update cascade,
	MaSanPham int Foreign key references SanPham(MaSanPham) on delete cascade on update cascade,
	SoLuong int ,
	GiaTien int 
)
go

insert into Slide values(N'ao-thun-nam-ngan-tay.jpg')
insert into Slide values(N'so-mi-nam-han-quoc.jpg')
insert into Slide values(N'quan-short-jeans-nam.jpg')
insert into Slide values(N'quan-tay-phoi-day-det.png')
insert into Slide values(N'quan-tay-nazafu.png')

--MaGioiThieu,TieuDe,NoiDung,Anh
INSERT INTO GioiThieu VALUES(N'Giới thiệu về WebSite Shop Thời Trang', 
N'Shop thời trang với tên website là MarkShop là một shop thời trang  trực tuyến được hình thành vào 17/5/2014. 
Xuất phát từ ý tưởng mang đến cái đẹp hoàn mỹ  – Mua sắm dễ dàng tiện lợi cho người tiêu dùng trên tòan quốc.
Đồng thời, để khách hàng có nhiều lựa chọn cho phong cách thời trang riêng của mình. ',null )
INSERT INTO GioiThieu VALUES(null,N'Những sản phẩm tại shop được chính chủ Shop tìm kiếm
tuyển chọn mẫu mã đa dạng phong phú theo xu hướng thời trang "HOT" nhất trên thị trường. ',null)
INSERT INTO GioiThieu VALUES(null,N'Các sản phẩm nhập trực tiếp từ các nhãn thời trang uy tín 
của Hồng Kông, Thượng Hải, Quãng Châu, Thái Lan... với các tiêu chí "Không qua trung gian - Giá cả hợp lý -Chất lượng đảm bảo'
,'anhgt.png')
INSERT INTO GioiThieu VALUES(N'Tầm nhìn',N'Keng Fashion mong muốn trở thành website cung cấp những sản phẩm thời trang uy tín, chất lượng 
và tốt nhất cho mọi đối tượng trên toàn quốc.',null)

insert into GioiThieu values(N'Sứ mệnh',N'"Chúng tôi sẽ làm bạn hài lòng với dịch vụ tối đa - chi tiêu tối thiểu"',null)

INSERT INTO GioiThieu VALUES(N'Thế mạnh',N'
- Đội ngũ nhân viên nhiệt huyết, năng động, thích nghi và linh hoạt với hoàn cảnh.

- Luôn cập nhật những phong cách mới, hợp xu hướng thời trang.

- Truyền thông trên nhiều kênh quảng cáo chất lượng.
',null)

---Thương hiệu----
insert into ThuongHieu values(N'CHANEL',N'Chanel chắc hẳn là cái tên không còn xa lạ gì dù chàng có là ""tín đồ thời trang hay không .Bởi thương hiệu đến từ Pháp này vô cùng nổi tiếng với nhiều sản phẩm khác nhau từ nước hoa , quần áo ,túi xanh hay một số loại mỹ phẩm 
<br>- Hướng đén phong cách thời trang thời thượng và đẳng cấp do đó các mẫu quần áo của Chanel được làm hoàn toàn từ chất liệu cao cấp cùng công nghệ may tinh xảo nhất .Bởi đó khó có ai có thể cưỡng lại sức hút toát ra từ các sản phẩm thời trang của thương hiệu này 
<br>-Đăc biệt , Chanel thường xuyên tổ chức các show diễn thời trang đỉnh cao thu hút rất nhiều nhà thiết kế trẻ ,tài năng để ra mắt bộ sưu tập mới của họ .Nhờ đó ,thương hiệu này ngày càng được nhiều người biết đén và trở thành số 1 trong làng thời trang thế giới')
insert into ThuongHieu values(N'GUCCI',N'Là một trong những biểu tượng thời trang co cấp của ý và pháp với những sản phẩm thời trang xa xỉ bậc nhất.Trong đó hai dòng sản phẩm thời trang nam và nữ chủ đạo là The House of Gucci với các mẫu thiết kế độc nhất và thời thượng 
<br>-Ngoài ra .Gucci cũng vô cùng nổi tiếng với các dòng túi sách , đồng hồ , kính mắt , phụ kiện thời trang hàng hiệu bậc nhất hiện nay ')
insert into ThuongHieu values(N'LOUIS VUITTON',N'là một trong những cái tên vàng trong làng thời trang của pháp ,LOUIS VUITTON không chỉ đơn giản là một thương hiệu thời trang xa xỉ mà nó còn là tượng đài của thời trang thế giới 
<br>-Được thành lập từ năm 1854 cho đến nay LOUIS VUITTON đã trở nên vô cùng nổi tiếng trên toàn thế giới và là một trong những thương hiệu thời trang cao cấp giá trị nhất .Không chỉ có những sản phẩm thời trang của nữ mà LOUIS VUITTON cũng có cho mình những bộ sưu tập thời trang nam chất nhất , được nhiều ngôi sao đón nhận 
<br>- Đặc biệt điều tạo nên sức hút khó cưỡng của thương hiệu thời trang nổi tiếng này là trang phục đều mang phong cách thời thượng , mới lạ và tinh xảo đến từng chi tiết nhỏ 
<br>- Cũng như nhiều thương hiệu thời trang hàng hiệu , cao cấp khác thì LOUIS VUITTON cũng đang ngày càng mở rộng ra các lĩnh vực khác như túi xách , nước hoa ,.....')
insert into ThuongHieu values(N'DIOR',N'Được thành lập bởi nhà thiết kế tài ba Christian vào năm 1946 và cho đến nay nó đã trở thành thương hiệu thời trang nổi tiếng cao cấp bậc nhất tại pháp và được toàn thế giới công nhận .
<br>- Đối với các dòng sản phẩm thời trang của Dior , khó cí ai cưỡng lại sức hút của nó bởi phong cách Haute Couture đặc trưng đậm tính kiến trúc và sự quyến rũ 
<br>- Nếu Dior Womanswear là một trong những sản phẩm cao cấp dành cho phái nữ đầy quý phái , sang trọng thì Dior Homme là dòng sản phẩm dành cho nam mang thiết kế tối giản ,tinh xảo và vô cùng thanh lịch ')
insert into ThuongHieu values(N'HERMES',N'HERMES cũng được biết đến là một trong những thương hiệu thời trang xa xỉ do người pháp thành lập từ năm 1837 khởi nguồn từ một cửa hàng bán vật dụng dành cho ngựa .Chính điều này đã tạo nên logo hình chiếc xe ngựa kéo quen thuộc của thương hiệu này 
<br>-Ngày nay , hermes đã trở thành đế chế thời trang khổng lồ của thế giới với những mẫu thời trang đẳng cấp và trang trọng nhất .Điểm độc đáo tạo nên sự nổi tiếng của thương hiệu thời trang nổi tiếng này là tất cả các sản phẩm đều được quan tâm đầu tư kỹ lưỡng trong quá trình sản xuất 
<br>-Đăc biệt với nhiều sản phẩm thời trang được làm hoàn toàn thủ công từ một người thợ duy nhất đẻ đảm bảo tính thống nhất và riêng biệt của sản phẩm .Nhờ đó , hermes là một trong những thương hiệu thời trang được nhiều ngôi sao nổi tiếng thế giới lựa chọn và sử dụng nhất tính đến 2021')
insert into ThuongHieu values(N'DOLCE & GABBANA',N'Là một thương hiệu thời trang nổi tiếng về hàng cao cấp của ý được thành lập bởi chính hai nhà thiết kế này vào năm 1985 
<br>-cũng nhờ được thành lập bởi hai nhà thiết kế tài hoa và có tầm ảnh hưởng lớn đến xu hướng thời trang bấy giờ nên thương hiệu này thực sự đem đến những mẫu thiết kế đẳng cấp , tinh tế mà hiếm thương hiệu nào làm được 
<br>-Do đó ,DOLCE & GABBANA được rất nhiều ngôi sao Hollywood tin dùng và ưa chuộng mỗi khi có dịp dự các sự kiện lớn như : Madonna , Monica Bellucci ,...')
insert into ThuongHieu values(N'VERSACE',N'Là một biểu tượng thời trang cao cấp bậc nhất của ý , Thương hiệu đã khiến cả thế giới phải ngưỡng mộ và trầm trồ nhờ đem đến những sản phẩm thời trang chất lượng , xa xỉ nhất theo phong cách độc đáo , sang trọng và vô cùng ấn tượng 
<br>-Đối với ai yêu thích và là tín đồ của thời trang xa xỉ thế giới chắc hẳn đều nhận thấy họa tiết của các trang phục mang thương hiệu Versace của nghệ thuật Hy lạp cổ đại với màu sắc , chất liệu , nét cổ điển và tính nghệ thuật điển hình , hình khố mới lạ ')
insert into ThuongHieu values(N'PRADA',N'Là hãng thời trang danh giá nhất của nước ý đặc trưng với phong cách sang trọng , quý phái và thời thượng nên Prada đang ngày càng phát triển và định hướng trở thành thượng hiệu đỉnh cao của làng thời trang 
<br>-Cũng giống như nhiều thương hiệu thời trang nổi tiếng khác prada chia sản phẩm thành 2 dòng thời trng nam và nữ đẻ đáp ứng nhu cầu của khách hàng trên toàn thế giới .Đặc trưng của dòng sản phẩm này mang tính nghệ thuật cao có sự kết hợp nét cổ điển và hiện đại 
<br>- Do đó ,Prada cũng vẫn luôn tạo ra nét khác biệt mạnh mẽ giữa các thương hiệu thời trang khác ')
insert into ThuongHieu values(N'BURBERRY',N'Được coi là niềm tự hào của thời trang cao cấp Anh Quốc với lịch sử hình thành lâu đời nhất trên thế giới 
<br>- Mặc dù ngày nay thương hiệu này đã cho ra mắt nhiều bộ sưu tập với những thiết kế ấn tượng và thời thượng nhất nhưng một đặc trưng và độc quyền trong phong cách thời trang của thương hiệu này , khiến người ta nhớ mãi là họa tiết sọc caro đơn giản nhưng vô cùng tinh tế trang nhã 
<br>- Và chính họa tiết này cũng là cảm hứng thiết kế cho những sản phẩm thời trang khác như đông hồ , mũ , ... của Burberry cho đến tận ngày nay  ')
insert into ThuongHieu values(N'ARMANI',N'Là một trong những thương hiệu thời trang nổi tiếng của ý có tốc độ phát triển nhanh nhất ,Armani đang ngày càng khẳng định được tiếng tăm của mình trên thị trường thời trang cao cấp của thế giới 
<br>- Với những mẫu thời trang nam nữ hướng đến sự tối giản , tinh tế và có tính ứng dụng cao ,Armani đã chinh phục được nhiều nhà thiết kế nổi tiếng khác và nhiều ngôi sao nổi tiếng trên thế giới 
<br>-Không chỉ nổi tiếng về các sản phẩm thời trang mà đồng hồ , mỹ phẩm , đồ nội thất cũng là một trong những mặt hàng làm nên tên tuổi của thương hiệu này ')
insert into ThuongHieu values(N'RALPH LAUREN',N'Thương hiệu thời trang nổi tiếng Ralph Lauren được thành lập 1967 bởi nhà thiết kế người mỹ 
<br>- Do đó các mẫu thời trang của thương hiệu này mang phong cách vừa sang trọng , vừa phóng khoáng và cổ điển đúng theo gu của người Mỹ 
<br>-Đặc biệt RALPH LAUREN còn được biết đến giống như cha` đẻ của biểu tượng Polo ngày nay nhờ bộ sưu tập thời trang giành cho nữ giới mang phong cách trang phục cổ điển của nam giới vào năm 1969 ')
insert into ThuongHieu values(N'GIVENCHY',N'Là thương hiệu thời trang do chính nhà thiết kế trẻ tài năng người pháp gốc ý cùng tên sáng lập năm 1952
<br>-Tồn tại giữa kinh đô thời trang Paris với nhiều thương hiệu thời trang nổi tiếng và xa xỉ bậc nhất trên thế giớI nhưng GIVENCHY vẫn không hề kém cạnh mà đã tạo dựng cho mình được phong cách thời trang cao cấp khác biệt 
<br>-Các sản phẩm thời trang của GIVENCHY đều hướng tới tôn vinh nét đẹp hiện đại và đầy cá tính , sang trọng nhưng năng động của cả phái nam lẫn phái nữ .Nhờ đó , thương hiệu này đã nhanh chóng gia nhập đế chế thời trang hùng mạnh của thế giới một cách nhanh chóng ')
insert into ThuongHieu values(N'FENDI',N'Là thương hiệu thời trang nổi tiếng của ý do Edoardo và Adele Fendi sáng lập chuyên về các sản phẩm thời trang cao cấp , nước hoa , giày dép và các phụ kiện thời trang khác 
<br>-Trong đó ấn tượng nhất của các mẫu thời trang của thương hiệu này đều được làm từ da và lông thú - hai chất liệu cao cấp và xa xỉ hàng đầu .Bởi thế , mỗi khi các bộ sưu tập của thương hiệu này được tung ra thị trường luôn tạo ra cơn sốt thời trang đối với nhiều ngôi sao hàng đầu trên thế giới 
<br>- Cũng chính chất liệu này đem đến cho các dòng thời trang của FENDI phong cách sang trọng , quý phái mà thanh lịch hiếm có ')
insert into ThuongHieu values(N'Yves Saint Laurent',N'Yves Saint Laurent là một trong những thương hiệu thời trang cao cấp nhất của kinh độ thời trang Paris được nhà thiết kế huyền thoại Yves Saint Laurent và đối tác của ông là Piere Berge sáng lập năm 1962
<br>-Ngay từ những ngày đầu tiên ra mắt thời trang thế giới Yves Saint Laurent đã khiến cả thế giới thời trang phải sửng sốt và ngạc nhiên vì những mẫu thời trang nam nữ được thiết kế vô cùng tỉ mỉ , tinh xảo và nghệ thuật 
<br>-Không chỉ dừng lại thương hiệu thời trang nổi tiếng mà ngày nay Yves Saint Laurent cũng được biến đén là thương hiệu của các dòng mỹ phẩm cao cấp , xa xỉ được nhiều ngôi sao và giới thượng lưu trên thế giới ưa chuộng ')
insert into ThuongHieu values(N'Bottega Veneta',N'Một cái tên đình đám khác của những thương hiệu thời trang nổi tiếng thế giới được ưa chuộng không kém là bottega Veneta - thương hiệu cao cấp của ý 
<br>-Với những kỹ thuật tác chế thủ công lâu đời và tinh xảo giúp cho các mẫu thiết kế của thương hiệu này chứa đựng một phong cách rất riêng biệt , mang đậm đặc trưng nước ý :đơn giản ,tinh tế và thời thượng  ')

---MaLienHe,HoTenLienHe,EmailSoDienThoai,CoSoLienHe
insert into LienHe values(N'123 Nguyễn Văn A,hai bà trưng,hà nội', 'nguyenvana@example.com', '0987654321', N'cơ sở 1')
insert into LienHe values(N'169 Nguyễn Chí Trung Thành Phố Hải Dương', 'chitrung@example.com', '0123456789',N'cơ sở 2')

insert into NhaCungCap values(N'Công ty may mặc',N'114Lê Trọng Tấn','0123456789','trongtan@gmail.com')

--MaMenu,MaMenuCha,TenMenu,STT,TrangThai,link
insert into Menu values(0,N'Trang Chủ',1,1,N'index.html')
insert into Menu values(0,N'Sản Phẩm',2,1,N'sanpham.html')
insert into Menu values(0,N'Thương Hiệu',3,1,N'thuonghieu.html')
insert into Menu values(0,N'Giới Thiệu',4,1,N'gioithieu.html')
insert into Menu values(0,N'Tin Tức',5,1,N'tintuc.html')
insert into Menu values(0,N'Liên Hệ',6,1,N'lienhe.html')

---
insert into LoaiSanPham values(N'Áo thun nam')
insert into LoaiSanPham values(N'Áo thun nữ')
insert into LoaiSanPham values(N'Áo sơ mi nam')
insert into LoaiSanPham values(N'Áo sơ mi nữ')
insert into LoaiSanPham values(N'Đầm nữ')
insert into LoaiSanPham values(N'Chân váy')
insert into LoaiSanPham values(N'Quần short nữ')
insert into LoaiSanPham values(N'Quần jean nữ')
insert into LoaiSanPham values(N'Quần thun nữ')
insert into LoaiSanPham values(N'Quần jogger nữ')
insert into LoaiSanPham values(N'Quần short nam')
insert into LoaiSanPham values(N'Quần kaki nam')
insert into LoaiSanPham values(N'Quần jean nam')
insert into LoaiSanPham values(N'Quần tây nam')
insert into LoaiSanPham values(N'Quần jogger nam')

---MaSanPham,TenSanPham,MoTa ,NgayTao,Size,MaLoaiSanPham,MaThuongHieu,AnhDaiDien
--01---
insert into SanPham values(N'ÁO THUN NAM NGẮN TAY CỔ TRỤ',N'ÁO THUN NAM NGẮN TAY CỔ TRỤ THUN COTTON SỌC NGANG PHỐI 2 MÀU ĐẸP MẮT<br>Chất liệu: Vải 100% thun cotton mềm mịn, thấm hút mồ hôi tốt','2020-12-01','xl',1,1,N'ao-thun-nam-ngan-tay.jpg')
insert into SanPham values(N'ÁO THUN NAM NGẮN TAY CỔ TRỤ',N'ÁO THUN NAM CỔ TRỤ NGẮN TAY VIỀN CỔ IN LOGO MẪU MỚI<br>Chất liệu: Vải 100% thun cotton mềm mịn, thấm hút mồ hôi tốt','2019-01-05','s',1,1,N'ao-thun-nam-co-tru-ngan-tay.jpg')
insert into SanPham values(N'ÁO THUN NAM HÌNH HỔ 3D',N'ÁO THUN NAM HÌNH HỔ 3D: Chất vải thun 3D mịn lạnh, thấm hút mồ hôi nhanh giúp các chàng luôn thoải mái khi vận động, chơi các trò chơi thể thao, thể chất. Bên cạnh đó là thiết kế mạnh mẽ với hình hổ ấn tượng mang đến cho các chàng sự sang trọng, trẻ trung  để các chàng luôn sẵn sàng xuất hiện trước các nàng mà không lo thiếu sự thu hút.<br>Chất liệu: VẢI THUN 3D CO GIÃN CAO CẤP','2021-05-06','M',1,1,N'ao-thun-nam-hinh-ho-3d.jpg')
--03--
insert into SanPham values(N'SƠ MI NAM HÀN QUỐC TRẺ TRUNG',N'SƠ MI NAM HÀN QUỐC TRẺ TRUNG: Chất vải dày dặn cao cấp, đặc biệt với những sọc nhỏ tinh tế cùng dáng áo chuẩn để các chàng tự tin khoe dáng. Bên cạnh đó là chất màu lên tông chuẩn để các chàng lựa chọn phong cách cho mình thật thoải mái. Ngoài ra, với thiết kế tay dài thanh lịch, chiếc áo sẽ là bạn đồng hành cùng các chàng trai trong những ngày lên công tay hay trong những buổi gặp khách hàng.<br>Chất liệu: VẢI KAKI MỀM','2018-05-05','XXL',3,3,N'so-mi-nam-han-quoc.jpg')
insert into SanPham values(N'SƠ MI NAM CARO Ô LỚN',N'SƠ MI NAM CARO Ô LỚN: Chất vải kate dày dặn cao cấp, dáng áo chuẩn để các chàng tự tin khoe dáng. Bên cạnh đó là họa tiết caro ôn lớn đối xứng sang trọng nhưng không kém phần tươi trẻ kết hợp với thiết kế tay dài thanh lịch, chiếc áo sẽ là bạn đồng hành cùng các chàng trai trong những ngày lên công ty hay trong những buổi gặp khách hàng.<br>Chất liệu: VẢI KATE DÀY MỊN','2017-04-09','M',3,3,N'so-mi-nam-caro.jpg')
insert into SanPham values(N'ÁO SƠ MI NAM LOANG MÀU THỜI THƯỢNG',N'ÁO SƠ MI NAM LOANG MÀU THỜI THƯỢNG: Chất vải dày dặn cao cấp, dáng áo chuẩn để các chàng tự tin khoe dáng. Bên cạnh đó là chất màu lên tông chuẩn để các chàng lựa chọn phong cách cho mình thật thoải mái. Ngoài ra, với thiết kế tay dài thanh lịch nhưng không mất đi sự trẻ trung pha chút nổi loạn với việc kết hợp màu loang mới mẻ.<br>Chất liệu: KATE BÓNG CAO CẤP','2015-08-08','L',3,3,N'ao-so-mi-nam-loang-mau.jpg')
--11--
insert into SanPham values(N'QUẦN SHORT JEANS CÓ KHUY ĐỘC ĐÁO',N'QUẦN SHORT JEANS CÓ KHUY ĐỘC ĐÁO: Chất vải jeans cao cấp xuất khẩu vừa dày dặn, nhẹ mịn vừa co giãn vừa phải giúp người mang dế chịu, tự tin. Bên cạnh đó còn là thiết kế trẻ trung, năng động và đầy độc đáo với khuy sản phẩm lạ mắt.<br>Chất liệu: VẢI JEANS CAO CẤP XUẤT KHẨU','2023-01-04','M',11,11,N'quan-short-jeans-co-khuy.jpg')
insert into SanPham values(N'QUẦN ĐÙI NAM SỐ 69 CAO CẤP',N'QUẦN ĐÙI NAM SỐ 69 CAO CẤP: Thiết kế trẻ trung, năng động với thiết kế săn lai ống giúp các trai trông năng động hơn. Bên cạnh đó chất vải jenas dày dặn mang đến sự tự tin cho các chàng trong việc hoạt động vui chơi mà không lo các sự cố khó xửa xảy ra.<br>Chất liệu: VẢI JEANS CAO CẤP XUẤT KHẨU','2023-02-01','S',11,11,N'quan-dui-nam-so-69-cao-cap.jpg')
insert into SanPham values(N'QUẦN SHORT JEANS NAM KẾT HỢP HỌA TIẾT CHIBI',N'QUẦN SHORT JEANS NAM KẾT HỢP HỌA TIẾT CHIBI ĐÁNG YÊU: Chất vải jeans cao cấp nhập khẩu Thái Lan mang đến cho người mặc sự thoải mái và tin tưởng bởi chất vải dày dặn, mịn nhẹ. bên cạnh đó ngoài những nét cắt rách táo bạo là họa tiết chibi mang đến sự trẻ trung, nắng động cho người mang.<br>Chất liệu: VẢI JEANS NHẬP KHẨU THÁI LAN','2013-05-09','M',11,11,N'quan-short-jeans-nam.jpg')
--13--
insert into SanPham values(N'QUẦN JEANS NAM CAO CẤP THIẾT KẾ KẾT HỢP VẢI MẪU',N'QUẦN JEANS NAM CAO CẤP THIẾT KẾ KẾT HỢP VẢI MẪU: Chất vải cao cấp xuất khẩu dày dặn, lên form chuẩn dáng để các chàng thoải mái khoe body. Bên cạnh đó là thiết kế phong cách đường phố mạnh mẽ, phá cách với những nét cắt, xước táo bạo, độc đáo mà chỉ riêng sản phẩm có.<br>Chất liệu: VẢI JEANS NAM CAO CẤP NHẬP KHẨU','2014-07-09','L',13,13,N'quan-jeans-nam-cao-cap.jpg')
insert into SanPham values(N'QUẦN JEANS NAM NHẤN GỐI TRÁI TINH TẾ',N'QUẦN JEANS NAM NHẤN GỐI TRÁI TINH TẾ: Chất vải cao cấp xuất khẩu dày dặn, lên form chuẩn dáng để các chàng thoải mái khoe body. Bên cạnh đó là thiết kế phong cách đường phố mạnh mẽ, phá cách với những nét cắt, xước táo bạo, độc đáo mà chỉ riêng sản phẩm có.<br>Chất liệu: VẢI JEANS NHẬP KHẨU HÀN QUỐC','2012-10-10','XL',13,13,N'quan-jeans-nam-nhan-goi-trai.jpg')
insert into SanPham values(N'QUẦN JEAN NAM PHONG CÁC ĐƯỜNG PHỐ MỚI',N'QUẦN JEAN NAM PHONG CÁC ĐƯỜNG PHỐ MỚI: Thiết kế phá cách, theo xu hướng đường phố đem đến cho các chàng trai sự năng động, pha chút nổi loạn làm các chàng trai trông thật sự nổi bật cũng như tự tin thể hiện phong cách của bản thân trong mọi cuộc vui.<br>Chất liệu: VẢI JEANS CAO CẤP XUẤT KHẨU','2023-01-01','X',13,13,N'quan-jean-nam.jpg')
--12---
insert into SanPham values(N'QUẦN KAKI LƯNG PHỐI DÂY SỌC QK005 MÀU XANH ĐEN',N'Sớ vải dệt xéo nổi lên khá lạ mắt tạo nên một sản phẩm dày dặn, bền bỉ và ít nhăn, chất liệu cao cấp mang đến sự thoáng mát, thấm hút mồ hôi cao.
<br>- Quần co giãn nhẹ  nhờ có thành phần spandex giúp người mặc cảm thấy thoải mái, dễ chịu hơn.
<br>- Sản phẩm được xử lý wash mềm, đốt lông nên đảm bảo hạn chế co rút, xù lông và bền màu.
<br>- Phần phối dây dệt sọc ở lưng quần làm điểm nhấn mới lạ đầy ấn tượng nhưng vẫn giữ được nét thanh lịch, thời thượng cho phái mạnh.<br>Chất liệu: Khaki 98% cotton 2% spandex twill stretch.',N'2005-02-09','L',12,12,N'quan-kaki-nam-lung-phoi-day-soc.png')
insert into SanPham values(N'QUẦN KAKI LƯNG PHỐI DÂY SỌC QK005 MÀU CÀ PHÊ',N'Sớ vải dệt xéo nổi lên khá lạ mắt tạo nên một sản phẩm dày dặn, bền bỉ và ít nhăn, chất liệu cao cấp mang đến sự thoáng mát, thấm hút mồ hôi cao.
<br>- Quần co giãn nhẹ  nhờ có thành phần spandex giúp người mặc cảm thấy thoải mái, dễ chịu hơn.
<br>- Sản phẩm được xử lý wash mềm, đốt lông nên đảm bảo hạn chế co rút, xù lông và bền màu.
<br>- Phần phối dây dệt sọc ở lưng quần làm điểm nhấn mới lạ đầy ấn tượng nhưng vẫn giữ được nét thanh lịch, thời thượng cho phái mạnh.<br>Chất liệu: Khaki 98% cotton 2% spandex twill stretch.',N'2010-06-08','XS',12,12,N'quan-kaki-nam.png')
insert into SanPham values(N'QUẦN KAKI CÓ NẮP TÚI SAU QK003 MÀU XÁM',N'Mềm mại, độ bền cao, hút ẩm và thấm hút mồ hôi tốt. Thiết kế căn bản dễ mix&match nhiều dạng quần áo và phong cách.<br>Chất liệu: 98% cotton, 2% spandex.','2011-10-25','M',12,12,N'quan-nam-kaki-co-nap-tui-sau.png')

--14
insert into SanPham values(N'QUẦN TÂY NAZAFU QT006 MÀU XANH ĐEN',N'Chất vải mềm mại, độ bền cao, hút ẩm và thấm hút mồ hôi tốt. Họa tiết kẻ caro Glen plaid rất "đa dụng", thanh nhã. <br>Chất liệu: 73% polyester, 26% rayon, 1% spandex.','2012-01-02','XL',14,14,N'quan-tay-nazafu.png')
insert into SanPham values(N'QUẦN TÂY CĂN BẢN FORM SLIMFIT QT015',N'Quần slimfit tôn dáng thon gọn trong thiết kế trơn căn bản. Chất liệu thấm hút tốt, độ bền cao tạo cảm giác thoải mái cho người mặc.<br>Chất liệu: 68% polyester,rayon 29%, 3% spandex.','2009-08-11','XS',14,14,N'quan-tay-phoi-day-det.png')
insert into SanPham values(N'QUẦN TÂY XẾP LY FORM SLIMFIT QT007 MÀU XÁM CHUỘT ĐẬM',N'Chống nhăn, co dãn nhẹ. Thiết kế trên chất vải bóng mịn, sở hữu độ bền màu cao tạo phong thái lịch thiệp và tinh tế cho người mặc.<br>Chất liệu: 83% polyester, 15% rayon, 2% spandex.','2015-01-05','M',14,14,N'quan-tay-xep-ly-form.png')

---------------------------------------------------------------------
--15
insert into SanPham values(N'QUẦN JOGGER LƯNG THUN CÀI NÚT J004 MÀU XÁM XANH',N'Mềm mịn, có độ rũ nhẹ. Độ bền màu cao, thấm hút mồ hôi tốt. Co giãn nhẹ, hạn chế nhăn tạo cảm giác thoải mái tối đa trong mọi hoạt động<br>Chất liệu: 83% polyester, 15% rayon, 2% spandex.','2009-01-01','XS',15,15,N'quan-tay-lung-thun-cai-nut.png')
insert into SanPham values(N'QUẦN JOGGER JEAN J13 MÀU XANH ĐEN',N'Đậm chất jeans nhưng là jogger năng động & cá tính. Jogger đơn giản với thiết kế bo lưng & bo lai mới tạo điểm nhấn cho quần luôn thoải mái, trẻ trung, jogger thực sự thuộc về các chàng trai ưu thích sự di chuyển.<br>Chất liệu: 98% cotton, 2% spandex','2002-12-12','XS',15,15,N'quan-jogger-jean-mau-xanh-bien.jpg')
insert into SanPham values(N'QUẦN JOGGER TÚI ĐẮP J001 MÀU ĐEN',N'Co giãn vừa phải, bền màu, ít nhăn. Form dáng thoải mái, năng động với 2 túi đắp bên hông quần tạo phong thái trẻ trung và phóng khoáng.<br>Chất liệu: 65% polyester, 32% rayon, 3% spandex.','2007-12-12','XS',15,15,N'quan-jogger-kaki-bo-lai.png')
--02--
insert into SanPham values(N'ÁO THUN NỮ TRẺ TRUNG MỚI',N'ÁO THUN NỮ TRẺ TRUNG MỚI: Với thiết kế trẻ trung với viền màu nổi bật cùng hình ảnh bắt mắt bên cạnh đó là chất vải cao cấp, lên màu, lên dáng chuẩn như các cô gái muốn giúp các nàng luôn tự tin tỏa sáng và thoải mái khi mang dù cho là cả ngày dài hoạt động.<br>Chất liệu: VẢI DA CÁ CAO CẤP','2012-10-04','XXS',02,02,N'ao-thun-nu-tre-trung-moi.jpg')
insert into SanPham values(N'ÁO THUN NỮ HIỆN ĐẠI CAO CẤP',N'ÁO THUN NỮ HIỆN ĐẠI CAO CẤP: Thiết kế hiện đại với kiểu tay phồng nhún viền tinh tế, bắt mắt bên cạnh đó là chất vải thun dày dặn cao cấp không chỉ lên màu chuẩn mà còn lên dáng chuẩn như các nàng muốn giúp các nàng luôn tự tin tỏa sáng và thoải mái khi mang dù cho là cả ngày dài hoạt động.<br>Chất liệu: VẢI THUN CAO CẤP DÀY DẶN','2016-12-10','XXL',02,02,N'ao-thun-nu-hien-dai-cao-cap.jpg')
insert into SanPham values(N'ÁO THUN NỮ SỌC MÀU NĂNG ĐỘNG',N'ÁO THUN NỮ SỌC MÀU NĂNG ĐỘNG: Thiết kế hiện đại với những sọc màu bắt mắt, sự kết hợp những màu sắc nổi bật đi cùng nhau tạo nên sự khác biệt mang phong cách Hàn Quốc bên cạnh đó là chất vải cao cấp, lên màu, lên dáng chuẩn như ming muốn giúp các nàng luôn tự tin tỏa sáng và thoải mái khi mang dù cho là cả ngày dài hoạt động.<br>Chất liệu: VẢI NHŨ NHẬP KHẨU','2016-12-12','XS',02,02,N'ao-thun-nu-soc-mau-nang-dong.jpg')
--04--
insert into SanPham values(N'SƠ MI NỮ KIỂU CỔ VUÔNG HIỆN ĐẠI',N'SƠ MI NỮ KIỂU CỔ VUÔNG HIỆN ĐẠI: Chất vải voan mềm mịn cùng với chất len gân co giãn mang đến vẻ đẹp dịu dàng nữ tính cùng sự thoải mái, dễ chịu khi hoạt động cả ngày dài. Đặc biệt là thiết kế hiện đại, mang nét gợi cảm giúp người mang nổi bật với nét đẹp hiện đại thời thượng.<br>Chất liệu: VẢI VOAN MỀM KẾT HỢP LEN GÂN MỎNG','2010-05-05','XS',04,04,N'so-mi-nu-kieu-co-vuong-hien-dai.jpg')
insert into SanPham values(N'ÁO SƠ MI NỮ SỌC TAY LỬNG THIẾT KẾ ĐỘC ĐÁO',N'ÁO SƠ MI NỮ SỌC TAY LỬNG THIẾT KẾ ĐỘC ĐÁO: Chất liệu kate mềm mịn cao cấp thướt tha, nhẹ nhàng, dễ chịu. Kiểu dáng áo cổ bẻ, tay lửng thời trang, mang nền vải sọc vân nhỏ đậm chất lịch sự cho bạn gái thêm phần trang nhã, lịch sự và đầy nữ tính. Chiếc áo không chỉ thích hợp cho những ngày đến cơ quan, công sở mà còn là một sự lựa chọn khá hoàn hảo cho những buổi đầu hẹn hò khi muôn xuất hiện với hình ảnh trang nhã.<br>Chất liệu: VẢI KATE MỀM NHẸ CAO CẤP','2010-02-27','XS',04,04,N'ao-so-mi-nu-soc-tay-lung.jpg')
insert into SanPham values(N'ÁO SƠ MI NỮ TRƠN FROM ÁO ĐỘC ĐÁO',N'ÁO SƠ MI NỮ TRƠN FROM ÁO ĐỘC ĐÁO: Với chất vải kate cao cấp mềm mịn và thoáng khí giúp người mang thoải mái khi hoạt động cả ngày dù trong thời tiết nắng nóng. Bên cạnh đó là from áo độc đáo mang tới vẻ đẹp cá tính, hiện đại giúp các nàng trông thật nổi bật trong mọi cuộc vui.<br>Chất liệu: VẢI KATE CAO CẤP','2019-03-07','XL',04,04,N'ao-so-mi-nu-tron-from-ao.jpg')
--05--
insert into SanPham values(N'ĐẦM NỮ CỔ CHỮ U XẺ TÀ SÀNH ĐIỆU',N'ĐẦM NỮ CỔ CHỮ U XẺ TÀ SÀNH ĐIỆU: Với chất vải cao cấp nhập khẩu từ Thái Lan, vải dày dặn, thấm hút mồ hôi tốt. Bên cạnh đó thiết kế sang trọng với cổ chữ U và xẻ tà quyến rũ giúp người mặc trông thật trẻ trung năng động và đầy tự tin. <br>Chất liệu: VẢI KATE CO GIÃN NHẬP KHẨU THÁI LAN','2018-08-12','X',05,05,N'dam-nu-co-chu-u-xe-ta-sanh-dieu.jpg')
insert into SanPham values(N'ĐẦM HOA 2 LỚP XẾP EO MS 48B8245',N'Đầm 2 lớp dáng chữ A, cổ tròn. Xếp nếp ở mặt trước phần eo. Tay lỡ. Cài bằng khóa kéo ẩn sau lưng. Vải họa tiết hoa thu hút. Kiểu dáng chữ A, ôm nhẹ với độ dài trên gối cùng phần tay lỡ giúp che đi hầu hết các khuyết điểm cơ thể. Bên cạnh đó chất liệu thô co giãn nhẹ, bền màu, ít nhăn mang lại cảm giác thoải mái khi mặc. <br>Chất liệu: Thô','2006-11-12','XS',05,05,N'damhoa2lop.jpg')
insert into SanPham values(N'ĐẦM LỤA CHẤM BI 2 LỚP MS 48M4844',N'Đầm lụa chấm bi, cổ chữ V vạt trước đáp chéo được xếp nếp tinh tế, tay ngắn. Dáng ôm. Eo chiết kèm đai cùng màu. Gấu sau xẻ. Cài bằng khóa kéo ẩn sau lưng. Những đường xếp ly ở phần chân váy giúp che được hết những khuyết điểm của cô nàng mảnh khảnh và mang đến sự tinh nghịch, trẻ trung, phá cách mà không kém phần quyến rũ cho phái đẹp. <br>Chất liệu: Lụa','2008-04-01','XS',05,05,N'damluachambi.jpg')
--06
insert into SanPham values(N'Chân Váy Jean Rách',N'Màu sắc: Đen - Trắng. Kiểu dáng: Chất kaki jeans Co giãn, dày dặn, không xù lông và có thể giặt máy. Size : Size: S (dưới 45kg), M(46-50kg), L(51-55kg). Mục đích sử dụng: dạo phố. đi chơi, đi học hoặc đi làm','2011-10-12','XS',06,06,N'chan-vay-jean-rach.jpg')
insert into SanPham values(N'Chân Váy Jean Ngắn',N'Màu sắc: Đen - Trắng. Kiểu dáng: Chất kaki jeans Co giãn, dày dặn, không xù lông và có thể giặt máy. Size : Size: S (dưới 45kg), M(46-50kg), L(51-55kg). Mục đích sử dụng: dạo phố. đi chơi, đi học hoặc đi làm','2001-12-12','XS',06,06,N'chan-vay-jean-om.jpg')
insert into SanPham values(N'Chân Váy Xếp Ly',N'Những chiếc Chân Váy Xếp Ly mềm mại với chiều dài trên gối là lựa chọn dành riêng cho các quý cô yêu thích phong cách lãng mạn. Vì sao ư? vì chúng đơn giản nhưng không hề nhàm chán, kín đáo nhưng lại quyến rũ một cách lạ thường. Sự bắt cặp quá đỗi hoàn hảo này là bởi những đường ly thanh mảnh mềm mại đến tinh tế sẽ khiến cho các quý cô trông thật duyên dáng và chiều dài chỉ đến ngang bắp chân sẽ khiến cho mỗi bước đi trông thật uyển chuyển và gợi cảm. Chiếc váy chính là món đồ có thể kết hợp ăn ý cùng áo len chui đầu, áo phông, sơ mi dáng rộng và một đôi giày/sandals cao gót thanh mảnh.','2016-07-17','XXL',06,06,N'chan-vay-xep-ly.png')
--07
insert into SanPham values(N'SHORT LƯNG THUN VIỀN SỌC',N'Mix- Max phối cùng các kiểu áo thun thời trang, croptop phá cách, áo ba lỗ mát mẻ. Lưng thun dây rút tạo cảm giác thoải mái và tự tin cho người mặc. Short viền sọc là style đầy mới mẻ dành cho tủ đồ ngày hè của bạn gái.','2007-04-03','XS',07,07,N'quan-shorrt-nu-lung-thun-vien-soc.png')
insert into SanPham values(N'Quần Short Jean Nhung',N'Quần Short Jean Rách Nhung cách điệu với thiết kế chuẩn form co giãn, đẹp mắt, dễ thương, kiểu dáng đơn giản. Dáng quần vừa vặn nhiều vóc người. Có thể kết hợp cùng nhiều thiết kế áo kiểu khác nhau.','2016-11-12','S',07,07,N'quan-shorrt-nu-lung-thun-vien-soc.png')
insert into SanPham values(N'Quần Short 2 Túi Lai V',N'Mix- Max phối cùng các kiểu áo thun thời trang, croptop phá cách, áo ba lỗ mát mẻ. Lưng thun dây rút tạo cảm giác thoải mái và tự tin cho người mặc. Short viền sọc là style đầy mới mẻ dành cho tủ đồ ngày hè của bạn gái.','2012-03-03','XS',07,07,N'quan-short-2-tui-lai.png')
--08--
insert into SanPham values(N'QUẦN JEANS NỮ ỐNG SUÔNG CÁCH ĐIỆU CÁ TÍNH',N'QUẦN JEANS NỮ ỐNG SUÔNG CÁCH ĐIỆU CÁ TÍNH: Với những cô nàng đã cực kỳ đam mê với mẫu quần ống suông nhưng thấy nhàm chán với mẫu basic ban đầu thì chắc chắn sản phẩm sẽ làm các nàng hài lòng với sự nhấn nhá, cách điệu với đường cắt dứt khoác, mạnh mẽ lần lượt tại hông và bắp chân. Đặc biệt là ống quần với thiết kế cắt thuần túy tại nên những tua rua tự nhiên mang đến sự năng động cho các nàng.<br>Chất liệu: VẢI JEANS DÀY MỊN','2013-12-12','XS',08,08,N'quan-jeans-nu-ong-suong-cach-dieu-ca-tinh.jpg')
insert into SanPham values(N'QUẦN JEANS NỮ NHẤN CHỮ ĐÙI CÁ TÍNH',N'QUẦN JEANS NỮ NHẤN CHỮ ĐÙI CÁ TÍNH : Chất vải jeans cao cấp, tuyển chọn đảm bảo được form quần và màu lên chuẩn cùng với thiết kế hiện đại kèm theo sự trẻ trung thanh lịch để các cô gái luôn có thể tự tin diện ở mọi nơi mà không lo rằng sẽ không phù hợp và chắc chắn là các cô gái sẽ thật tỏa sáng, nổi bật với phong cách nhẹ nhàng.<br>Chất liệu: VẢI JEANS DÀY DẶN XUẤT KHẨU','2014-12-12','XXS',08,08,N'quan-jeans-nu-nhan-chu-dui-ca-tinh.jpg')
insert into SanPham values(N'QUẦN JEANS NỮ WASH ỐNG ĐỘC ĐÁO',N'QUẦN JEANS NỮ WASH ỐNG ĐỘC ĐÁO: Chất liệu vải jeans dày dặn cao cấp, chắc chắn cho bạn yên tâm khi hoạt động mạnh, có khả năng thấm hút các giọt mồ hôi và co giãn tốt. Kiểu dáng thiết kế ống ôm sang trọng, khoe dáng, luôn luôn được những bạn gái yêu mến trong mọi phong cách thời trang.<br>Chất liệu: VẢI JEANS CHẤT LIỆU CAO CẤP','2015-12-27','XS',08,08,N'quan-jeans-nu-wash-ong-doc-dao.jpg')
--09
insert into SanPham values(N'QUẦN JOGGER DÂY KÉO NỮ XANH BIỂN',N'Phối quần jogger nữ với Áo crop top là item thời trang không thể thiếu trong tủ đồ hè của bạn gái. Chiếc áo cá tính này cũng là “người bạn thân” với quần jogger nữ. Cách phối đồ với quần jogger nữ và áo crop top không chỉ mang đến vẻ đẹp khoẻ khoắn, trẻ trung mà còn giúp các nàng khoe khéo vòng eo “con kiến” của mình.','2019-02-11','XS',09,09,N'quan-jogger-day-keo-nu-xanh-than.jpg')
insert into SanPham values(N'QUẦN JOGGER KAKI NỮ XÁM TRẮNG',N'Phối quần jogger nữ với Áo crop top là item thời trang không thể thiếu trong tủ đồ hè của bạn gái. Chiếc áo cá tính này cũng là “người bạn thân” với quần jogger nữ. Cách phối đồ với quần jogger nữ và áo crop top không chỉ mang đến vẻ đẹp khoẻ khoắn, trẻ trung mà còn giúp các nàng khoe khéo vòng eo “con kiến” của mình.','2014-07-02','XS',09,09,N'quan-jogger-kaki-nu-xam-trang.jpg')
insert into SanPham values(N'QUẦN JOGGER NỮ CÓ KHÓA GỐI KAKI ĐEN',N'Phối quần jogger nữ với Áo crop top là item thời trang không thể thiếu trong tủ đồ hè của bạn gái. Chiếc áo cá tính này cũng là “người bạn thân” với quần jogger nữ. Cách phối đồ với quần jogger nữ và áo crop top không chỉ mang đến vẻ đẹp khoẻ khoắn, trẻ trung mà còn giúp các nàng khoe khéo vòng eo “con kiến” của mình.','2018-02-14','XS',09,09,N'quan-jogger-nu-co-khoa.jpg')


--MaGia,MaSanPham,NgayBD,NgayKT,DonGia
insert into Gia values (1,'2020-05-05','2020-07-07',150000)
insert into Gia values (2,'2019-01-01','2020-01-01',180000)
insert into Gia values (3,'2017-01-02','2018-05-20',190000)
insert into Gia values (4,'2014-05-05','2017-07-07',145000)
insert into Gia values (5,'2012-05-20','2018-07-30',147000)
insert into Gia values (6,'2011-04-20','2018-04-18',160000)
insert into Gia values (7,'2020-01-01','2020-12-12',157000)
insert into Gia values (8,'2014-01-01','2021-01-01',158000)
insert into Gia values (9,'2020-02-02','2020-07-07',185000)
insert into Gia values (10,'2010-02-05','2017-10-30',1250000)
insert into Gia values (11,'2009-01-05','2016-01-31',140000)
insert into Gia values (12,'2008-03-20','2018-08-05',145000)
insert into Gia values (13,'2009-03-20','2017-08-05',175000)
insert into Gia values (14,'2015-03-20','2018-08-05',177000)
insert into Gia values (15,'2016-03-20','2020-08-05',185000)
insert into Gia values (16,'2017-03-20','2023-03-05',199000)
insert into Gia values (17,'2014-03-20','2020-08-05',197000)
insert into Gia values (18,'2013-03-20','2017-08-05',191000)
insert into Gia values (19,'2012-03-20','2015-08-05',115000)
insert into Gia values (20,'2011-03-20','2014-08-05',125000)
insert into Gia values (21,'2020-03-20','2021-08-05',135000)
insert into Gia values (22,'2020-03-20','2021-08-05',185000)
insert into Gia values (23,'2016-03-20','2018-08-05',196000)
insert into Gia values (24,'2018-03-20','2019-08-05',195000)
insert into Gia values (25,'2017-03-20','2018-08-05',195000)
insert into Gia values (26,'2015-03-20','2018-08-05',195000)
insert into Gia values (27,'2014-03-20','2018-08-05',195000)
insert into Gia values (28,'2013-03-20','2019-08-05',195000)
insert into Gia values (29,'2012-03-20','2015-08-05',195000)
insert into Gia values (30,'2011-03-20','2013-08-05',195000)
insert into Gia values (31,'2018-03-20','2019-08-05',195000)
insert into Gia values (32,'2019-03-20','2020-08-05',195000)
insert into Gia values (33,'2020-03-20','2021-08-05',195000)
insert into Gia values (34,'2020-03-20','2020-08-05',195000)
insert into Gia values (35,'2018-03-20','2020-08-05',195000)
insert into Gia values (36,'2017-03-20','2020-08-05',195000)
insert into Gia values (37,'2016-03-20','2018-08-05',195000)
insert into Gia values (38,'2015-03-20','2018-08-05',195000)
insert into Gia values (39,'2015-03-20','2018-08-05',195000)
insert into Gia values (40,'2014-03-20','2016-08-05',195000)
insert into Gia values (41,'2013-03-20','2015-08-05',195000)
insert into Gia values (42,'2011-03-20','2014-08-05',195000)
--MaAnhChiTiet ,MaSanPham,Anh
insert into ChiTietAnhSanPham values(1,'ab.jpg')
insert into ChiTietAnhSanPham values(1,'amj.jpg')
insert into ChiTietAnhSanPham values(1,'abo.jpg')
insert into ChiTietAnhSanPham values(2,'a.jpg')
insert into ChiTietAnhSanPham values(3,'b.jpg')
insert into ChiTietAnhSanPham values(4,'m.jpg')
insert into ChiTietAnhSanPham values(5,'j.jpg')
insert into ChiTietAnhSanPham values(6,'u.jpg')
insert into ChiTietAnhSanPham values(7,'kj.jpg')
insert into ChiTietAnhSanPham values(8,'vy.jpg')
insert into ChiTietAnhSanPham values(9,'vh.jpg')
insert into ChiTietAnhSanPham values(10,'rf.jpg')
insert into ChiTietAnhSanPham values(11,'vj.jpg')
insert into ChiTietAnhSanPham values(12,'ghh.jpg')

--MaThongSo,MoTaThongTin,MaSanPham
insert into ThongSoSanPham values ( N'Kích thước:',N'60x80cm',7)
insert into ThongSoSanPham values ( N'Chất liệu:',N'Polyester',7)

--MaKho,TenKho,DiaChi 
insert into Kho values ('abc',N'Thái bình')
insert into Kho values ('abe',N'Hải dương')
insert into Kho values ('cds',N'Hà nội')
insert into Kho values ('yhf',N'Thái bình')
insert into Kho values ('asc',N'Hưng yên')
insert into Kho values ('abb',N'Gia lai')

--MaChiTietKho,MaKho,MaSanPham,SoLuong
insert into ChiTietKho values(1,1,45)
insert into ChiTietKho values(2,2,40)
insert into ChiTietKho values(3,3,47)
insert into ChiTietKho values(4,4,20)
insert into ChiTietKho values(5,5,19)
insert into ChiTietKho values(6,6,17)
insert into ChiTietKho values(1,7,80)
insert into ChiTietKho values(2,8,70)
insert into ChiTietKho values(3,9,10)
insert into ChiTietKho values(4,10,5)
insert into ChiTietKho values(5,11,45)
insert into ChiTietKho values(6,12,32)
insert into ChiTietKho values(1,13,21)
insert into ChiTietKho values(2,14,27)
insert into ChiTietKho values(3,15,48)
insert into ChiTietKho values(4,16,47)
insert into ChiTietKho values(5,17,58)
insert into ChiTietKho values(6,18,12)
insert into ChiTietKho values(1,19,17)
insert into ChiTietKho values(2,20,5)
insert into ChiTietKho values(2,21,62)
insert into ChiTietKho values(3,22,32)
insert into ChiTietKho values(6,23,33)
insert into ChiTietKho values(4,24,43)
insert into ChiTietKho values(4,25,32)
insert into ChiTietKho values(5,26,32)
insert into ChiTietKho values(6,27,68)
insert into ChiTietKho values(5,28,72)
insert into ChiTietKho values(5,29,77)
insert into ChiTietKho values(3,30,31)
insert into ChiTietKho values(2,31,32)
insert into ChiTietKho values(5,32,39)
insert into ChiTietKho values(6,33,12)
insert into ChiTietKho values(1,34,18)
insert into ChiTietKho values(2,35,32)
insert into ChiTietKho values(4,36,32)
insert into ChiTietKho values(6,37,32)
insert into ChiTietKho values(5,38,32)
insert into ChiTietKho values(4,39,32)
insert into ChiTietKho values(6,40,32)
insert into ChiTietKho values(5,41,32)
insert into ChiTietKho values(5,42,32)

insert into GiamGia values(1,30,'2020-05-07','2023-10-10',1)
insert into GiamGia values(2,50,'2011-11-07','2020-01-30',0)
insert into GiamGia values(3,70,'2014-08-10','2021-11-11',0)
insert into GiamGia values(4,40,'2015-12-12','2023-10-10',1)
insert into GiamGia values(5,80,'2020-05-07','2023-12-10',1)
insert into GiamGia values(6,45,'2020-04-07','2023-10-10',1)
insert into GiamGia values(8,23,'2019-05-07','2021-10-10',1)
insert into GiamGia values(12,26,'2018-08-07','2022-10-10',1)
insert into GiamGia values(19,21,'2009-12-07','2022-10-10',1)
insert into GiamGia values(7,19,'2011-01-07','2017-10-10',1)
insert into GiamGia values(25,18,'2015-04-07','2019-10-10',1)
insert into GiamGia values(30,14,'2014-07-07','2015-10-10',1)
insert into GiamGia values(42,38,'2016-08-07','2020-10-10',1)
insert into GiamGia values(39,27,'2018-08-07','2023-10-10',1)
insert into GiamGia values(34,11,'2018-10-07','2022-10-10',1)
insert into GiamGia values(31,10,'2020-10-07','2021-10-10',1)
--MaNguoiDung,TaiKhoan.MatKhau,Email,HoTen,NgaySinh,DiaChi,SoDienThoai,GioiTinh,AnhDaiDien,TrangThai,VaiTro
insert into NguoiDung values(N'Admin',N'Admin',N'cuong31139@gmail.com',N'Nguyễn cuuong',N'2002-07-14','Thái bình ',
'0818147402','nam','ad.jpg',1,N'Admin')
insert into NguoiDung values(N'cuongtt2002',N'123456',N'cuong210@gmail.com',N'Nguyễn thị mi ',N'1998-07-14','Hưng yên',
'0818147412','nam','kh.jpg',1,N'khách hàng')
--MaKhachHang ,TenKhachHang,GioiTinh,NgaySinh,DiaChi,SoDienThoai
insert into KhachHang values(N'Nguyễn Văn Cường ',N'Thái bình',N'0147258369',N'cuong31139@gmail.com')
insert into KhachHang values(N'Nguyễn Văn minh ',N'Thái bình',N'0147258368',N'cuong31138@gmail.com')
insert into KhachHang values(N'Nguyễn chu Cường ',N'Hưng Yên',N'0147258369',N'cuong31139@gmail.com')

--MaDanhGia,SoSao,ThoiGianDanhGia,,MaSanPham,MaKhachHang
insert into DanhGia values(4,'2020-02-08',N'Sản phẩm chất lượng tương đối ổn ',1,1)
insert into DanhGia values(3,'2022-03-08',N'Sản phẩm ổn ',2,2)
insert into DanhGia values(5,'2019-04-08',N'Sản phẩm chất lượng rất hoàn hảo',12,3)
insert into DanhGia values(2,'2017-05-08',N'Sản phẩm tệ ',10,1)
insert into DanhGia values(2,'2015-06-08',N'Sản phẩm tệ',7,2)
insert into DanhGia values(5,'2014-07-08',N'Sản phẩm chất lượng rất hoàn hảo',7,3)
insert into DanhGia values(4,'2020-08-08',N'Sản phẩm chất lượng tương đối ổn ',6,1)
insert into DanhGia values(3,'2016-09-08',N'Sản phẩm chất lượng ổn ',5,1)
insert into DanhGia values(2,'2017-10-08',N'Sản phẩm tệ ',2,1)
insert into DanhGia values(1,'2022-01-08',N'Sản phẩm quá tệ ',1,1)
--MaTinTuc,TieuDe ,NgayDang,noidung,AnhTinTuc,MaNguoiDung
insert into TinTuc values (N'Tin Tức về áo  sơ mi' ,'2015-09-23',N'Đây là một trong những kiểu áo truyền thống và có tính ứng dụng rất cao. Bạn có thể kết hợp chúng theo phong cách công sở hoặc
<br>-thời trang dạo phố. Thiết kế hình học vót nhọn của cổ áo giúp nó hài hòa với cravat hoặc ngay cả để cổ trơn. Tuyệt vời hơn nữa là
<br>-sơ mi cổ nhọn còn phù hợp với hầu hết tất cả các loại cổ áo veston nam hiện nay.',N'so-mi-nam-caro.jpg',1)
insert into TinTuc values (N'Tin Tức về quần jogger','2020-09-28',N'Chiếc quần jogger thể thao đầu tiên được giới thiệu vào những năm 1920 bởi thương nhân quần áo người pháp Émile Camuset và cũng người
sáng lập Le Coq Sportif (Công ty về quần áo thể thao).  Đầu tiên những chiếc quần jogger là những chiếc quần màu xám được may đơn giản để
cho các vận động viên co duỗi và chạy thoải mái..',N'quan-jogger-kaki-bo-lai.png',1)
insert into TinTuc values(N'chân váy jean rach','2023-05-08',N'Chân váy jean rách là một kiểu váy được làm từ vải jean có các lỗ hoặc rách trên bề mặt. Nó thường có chiều dài ngang đầu gối hoặc ngắn hơn, tạo cảm giác trẻ trung và năng động.
Kiểu váy này thường được kết hợp với áo thun, áo sơ mi hoặc áo khoác bomber để tạo nên một trang phục thời trang và cá tính. Nó phù hợp với nhiều hoàn cảnh khác nhau, từ đi chơi cùng bạn bè đến đi làm, tùy thuộc vào cách bạn kết hợp và phối đồ.
Tuy nhiên, nên lưu ý rằng kiểu váy này có thể gây phản cảm hoặc không phù hợp trong một số hoàn cảnh trang trọng hoặc nghiêm túc, vì vậy hãy chọn thời điểm và mục đích sử dụng phù hợp.',N'chan-vay-jean-rach.jpg',1)
insert into TinTuc values (N'sơ mi nữ cổ vuông hiện đại',N'2017-11-10',N'Áo sơ mi nữ cổ vuông hiện đại là một kiểu áo sơ mi có kiểu dáng cổ áo hơi vuông, không cổ truyền thống. Đây là một kiểu thiết kế mới, mang tính hiện đại và phá cách.
Cổ áo vuông thường được cắt ngắn hơn so với cổ áo truyền thống, giúp tôn lên phần vai và cổ của người mặc. Điểm nhấn của kiểu áo này thường là phần cổ và phần tay áo, được thiết kế đơn giản, nhưng đầy ấn tượng và tinh tế.
Các màu sắc và chất liệu của áo sơ mi nữ cổ vuông hiện đại thường đa dạng, từ những tông màu cơ bản như trắng, đen, xanh navy, đến những màu sắc sáng tạo hơn như hồng, cam, xanh lá cây... Chất liệu thường là cotton hoặc linen, tùy thuộc vào mục đích sử dụng và sở thích của người mặc.
Kiểu áo sơ mi nữ cổ vuông hiện đại rất linh hoạt và dễ dàng kết hợp với các loại quần, váy khác nhau, từ quần jeans, quần tây, chân váy midi hay maxi... Nhờ vậy, bạn có thể sử dụng áo này để tạo nên nhiều trang phục khác nhau cho các hoàn cảnh khác nhau, từ đi làm đến đi chơi.',N'so-mi-nu-kieu-co-vuong-hien-dai.jpg',1)
insert into TinTuc values (N'chân váy xếp ly','2018-07-25',N'Chân váy xếp ly là một kiểu váy có kiểu dáng đơn giản, nhưng vô cùng nữ tính và duyên dáng. Váy được thiết kế với các ly nhỏ xếp chồng lên nhau, tạo nên những đường nếp nhún nhẹ trên bề mặt váy. Kiểu dáng này giúp tạo nên độ xòe và bồng bềnh cho chiếc váy, giúp bạn trông thật nữ tính và duyên dáng.
Chân váy xếp ly thường được làm từ chất liệu như cotton, linen, hoặc chiffon. Màu sắc và hoa văn của váy cũng đa dạng, từ những màu sắc cơ bản như trắng, đen, xanh navy, đến những màu sắc sáng tạo hơn như hồng, cam, xanh lá cây... Có thể kết hợp các loại phụ kiện khác nhau như mũ len, túi xách, giày cao gót để tạo nên phong cách trang trọng và nữ tính.
Kiểu váy xếp ly phù hợp với nhiều hoàn cảnh khác nhau, từ đi làm đến đi chơi hay dự tiệc. Với những kiểu váy xếp ly dài thì bạn có thể kết hợp với áo thun hoặc áo sơ mi, còn với kiểu váy xếp ly ngắn thì có thể kết hợp với áo croptop hoặc áo phông để tạo nên phong cách trẻ trung và năng động hơn.',N'chan-vay-xep-ly.png',1)
insert into TinTuc values (N'Tin tức về áo yody','2021-10-10',N'YODY là một thương hiệu thời trang của Việt Nam, chuyên sản xuất các sản phẩm thời trang cao cấp cho cả nam và nữ. Áo polo YODY là một sản phẩm được ưa chuộng của thương hiệu này, được thiết kế với kiểu dáng đơn giản, nhưng sang trọng và lịch lãm.
Áo polo YODY được làm từ chất liệu cotton cao cấp, đảm bảo mang lại cảm giác thoải mái cho người mặc. Thiết kế của áo polo YODY có phần khác biệt so với các loại áo polo truyền thống bởi viền cổ áo được thiết kế theo kiểu cổ đức (cổ cao) giúp tôn lên vẻ lịch lãm và đẳng cấp cho người mặc. Hơn nữa, áo polo YODY còn có nhiều màu sắc đa dạng, giúp người mặc dễ dàng lựa chọn phong cách phù hợp với mình.
Tổng thể, áo polo YODY là một sản phẩm thời trang cao cấp, mang lại sự sang trọng và lịch lãm cho người mặc. Nếu bạn quan tâm đến sản phẩm này, bạn có thể tìm kiếm trên các trang thương mại điện tử hoặc cửa hàng thời trang ở gần bạn.',N'ao-yody.jpg',1)
--MaHDN,NgayNhap,MaNhaCungCap,MaNguoiDung 
insert into HoaDonNhap values('2020-01-01',1,1)
insert into HoaDonNhap values('2019-01-01',1,1)
--MaChiTiet,MaHDN,MaSanPham,SoLuong,GiaTien
insert into ChiTietHoaDonNhap values(1,1,5,80000)
insert into ChiTietHoaDonNhap values(1,1,10,80000)
insert into ChiTietHoaDonNhap values(2,1,40,80000)
--MaDonHang ,NgayDat,TrangThai,MaKhachHang
insert into DonHang values('2019-04-19',1,1)
insert into DonHang values('2018-07-14',1,2)
insert into DonHang values('2023-01-02',1,3)
insert into DonHang values('2018-04-14',1,1)
insert into DonHang values('2018-08-08',1,1)

-- MaChiTiet,MaDonHang,	MaSanPham SoLuong ,GiaTien

insert into ChiTietDonHang values (1,8,2,250000)
insert into ChiTietDonHang values (1,10,9,1550000)
insert into ChiTietDonHang values (2,2,10,1550000)
-------------------------------------------lấy tất cả thông tin liên hệ --------------------------------------
CREATE PROCEDURE sp_LienHe_get_all
AS
    BEGIN
        SELECT *                       
        FROM LienHe
    END;
GO

---------------------------------------Lấy liên hệ theo mã ---------------------------------------------------
Create PROCEDURE sp_get_lienhe_theo_ma(@MaLienHe int)
AS
    BEGIN
        SELECT * 
		FROM LienHe lh
		WHERE lh.MaLienHe = @MaLienHe
    END;
go 
--------------------------------------Thêm Liên hệ --------------------------------------------------
create PROCEDURE sp_LienHe_create
(
@ThongTinLienHe nvarchar(50),
@Email nvarchar(25),
@SoDienThoai nvarchar(15),
@CoSoLienHe nvarchar(max)
)
AS
    BEGIN
      INSERT INTO LienHe
                (  
			     ThongTinLienHe,
				 Email,
				 SoDienThoai,
				 CoSoLienHe
                )
                VALUES
                (
				@ThongTinLienHe,
				@Email,
				@SoDienThoai,
				@CoSoLienHe
                );
        SELECT '';
    END;
GO
----------------------------------------------Sửa LienHe ----------------------------------------
create PROCEDURE sp_LienHe_Update
(
@MaLienHe int ,
@ThongTinLienHe nvarchar(50),
@Email nvarchar(25),
@SoDienThoai nvarchar(15),
@CoSoLienHe nvarchar(max)
)
AS
    BEGIN
     
	 Update  LienHe
	  set  
	  ThongTinLienHe = IIf(@ThongTinLienHe is Null,ThongTinLienHe, @ThongTinLienHe),
	  Email = IIf(@Email is Null,Email, @Email),
	  SoDienThoai = IIf(@SoDienThoai is Null,SoDienThoai, @SoDienThoai),
	  CoSoLienHe = IIf(@CoSoLienHe  is Null,CoSoLienHe, @CoSoLienHe )
	  Where MaLienHe = @MaLienHe     
	  SELECT '';
    END;
GO
------------------------------------------Xóa Liên hệ  -----------------------------------------------
CREATE PROCEDURE sp_LienHe_delete
(
@MaLienHe  int
)
AS
    BEGIN
		DELETE from LienHe
			where MaLienHe = @MaLienHe
			SELECT '';
    END;
GO


------------------------------Tìm kiếm liên hệ (admin)-------------------------------------
create PROCEDURE sp_LienHe_search_admin(@page_index int, @page_size int, @MaLienHe int ,@ThongTinLienHe nvarchar(50) ,@Email nvarchar(35))
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(ORDER BY lh.ThongTinLienHe DESC)) AS RowNumber, 
                               lh.MaLienHe,lh.ThongTinLienHe,lh.Email,lh.SoDienThoai,lh.CoSoLienHe
                        INTO #Results1
                        FROM LienHe lh
					    WHERE   (@MaLienHe is null or lh.MaLienHe = @MaLienHe) AND
								(@ThongTinLienHe = ''  OR (lh.ThongTinLienHe LIKE '%' + @ThongTinLienHe + '%')) AND
								(@Email = ''  OR (lh.Email LIKE '%' + @Email + '%')) 
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                     SELECT(ROW_NUMBER() OVER(ORDER BY lh.ThongTinLienHe DESC)) AS RowNumber, 
                               lh.MaLienHe,lh.ThongTinLienHe,lh.Email,lh.SoDienThoai,lh.CoSoLienHe
                        INTO #Results2
                        FROM LienHe lh
					    WHERE   (@MaLienHe is null or lh.MaLienHe = @MaLienHe) AND
								(@ThongTinLienHe = ''  OR (lh.ThongTinLienHe LIKE '%' + @ThongTinLienHe + '%')) AND
								(@Email = ''  OR (lh.Email LIKE '%' + @Email + '%'))
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
    END;
GO

-------------------------------Thêm nhà cung cấp ------------------------------------------------------------------
create PROCEDURE sp_NhaCungCap_create
(
 @TenNhaCungCap  Nvarchar(50),
 @DiaChi nvarchar(50),
 @SoDienThoai nvarchar(15),
 @Email nvarchar(25)
)
AS
    BEGIN
      INSERT INTO NhaCungCap
                (  
			     TenNhaCungCap,
				 DiaChi,
				 SoDienThoai,
				 Email
                )
                VALUES
                (
				@TenNhaCungCap,
				@DiaChi,
				@SoDienThoai,
				@Email
                );
        SELECT '';
    END;
GO
----------------------------Sửa nhà cung cấp --------------------------------------------
create PROCEDURE sp_NhaCungCap_Update
(
 @MaNhaCungCap int ,
@TenNhaCungCap  Nvarchar(50),
 @DiaChi nvarchar(50),
 @SoDienThoai nvarchar(15),
 @Email nvarchar(25)
)
AS
    BEGIN
     
	 Update  NhaCungCap
	  set 
	  TenNhaCungCap = IIf(@TenNhaCungCap  is Null,TenNhaCungCap , @TenNhaCungCap),
	  DiaChi = IIf(@DiaChi is Null,DiaChi, @DiaChi),
	  SoDienThoai = IIf(@SoDienThoai is Null,SoDienThoai, @SoDienThoai),
	  Email = IIf(@Email is Null,Email, @Email)
	  Where MaNhaCungCap = @MaNhaCungCap
      
	  SELECT '';
    END;
GO

-------------------------------Xóa nhà cung cấp ----------------------------------------------------
CREATE PROCEDURE sp_NhaCungCap_delete
(
@MaNhaCungCap  int
)
AS
    BEGIN
		DELETE from NhaCungCap
			where MaNhaCungCap = @MaNhaCungCap
			SELECT '';
    END;
GO

----------------------- lấy nhà cung cấp theo mã ----------------------------------------------------------
Create PROCEDURE sp_get_NhaCungCap_theo_ma(@MaNhaCungCap int)
AS
    BEGIN
        SELECT * 
		FROM NhaCungCap ncc
		WHERE ncc.MaNhaCungCap = @MaNhaCungCap
    END;
go
----------------------lấy nhà cung cấp có phân trang(admin) -------------------------------------------------------
create PROCEDURE sp_NhaCungCap_get_NhaCungCap_admin(@page_index int, @page_size int)
AS
	BEGIN
		DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY ncc.MaNhaCungCap DESC)) AS RowNumber, 
                               ncc.MaNhaCungCap,ncc.TenNhaCungCap,ncc.DiaChi,ncc.SoDienThoai,ncc.Email
                        INTO #Results1
                        FROM NhaCungCap ncc
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(ORDER BY ncc.MaNhaCungCap DESC)) AS RowNumber, 
                               ncc.MaNhaCungCap,ncc.TenNhaCungCap,ncc.DiaChi,ncc.SoDienThoai,ncc.Email
                        INTO #Results2
                        FROM NhaCungCap ncc
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
	END
Go
------------------------------------------lấy tất cả thông tin giới thiệu --------------------------------------
CREATE PROCEDURE sp_GioiThieu_get_all
AS
    BEGIN
        SELECT *                       
        FROM GioiThieu
    END;
GO

-----------------------------Thêm giới thiệu -----------------------------------------------
create PROCEDURE sp_GioiThieu_create
(
 @TieuDe  Nvarchar(50),
 @NoiDung nvarchar(max),
 @Anh nvarchar(max)
)
AS
    BEGIN
      INSERT INTO GioiThieu
                (  
			     TieuDe,
				 NoiDung,
				 Anh
                )
                VALUES
                (
				@TieuDe,
				@NoiDung,
				@Anh
                );
        SELECT '';
    END;
GO
--------------------------------Sửa giới thiệu --------------------------------------------------------
create PROCEDURE sp_GioiThieu_Update
(
 @MaGioiThieu int ,
 @TieuDe  Nvarchar(50),
 @NoiDung nvarchar(max),
 @Anh nvarchar(max)
)
AS
    BEGIN
     
	 Update  GioiThieu
	  set 
	  TieuDe = IIf(@TieuDe is Null,Anh, @TieuDe),
	  NoiDung = IIf(@NoiDung is Null,NoiDung, @NoiDung),
	  Anh = IIf(@Anh is Null,Anh, @Anh)
	  Where MaGioiThieu = @MaGioiThieu
      
	  SELECT '';
    END;
GO

------------------------------------------Xóa Giới Thiệu  -----------------------------------------------
CREATE PROCEDURE sp_GioiThieu_delete
(
@MaGioiThieu  int
)
AS
    BEGIN
		DELETE from GioiThieu
			where MaGioiThieu = @MaGioiThieu
			SELECT '';
    END;
GO

Create PROCEDURE sp_get_gioithieu_theo_ma(@MaGioiThieu int)
AS
    BEGIN
        SELECT * 
		FROM GioiThieu gt
		WHERE gt.MaGioiThieu = @MaGioiThieu
    END;
go
------------------------------ lấy tất cả giới thiệu admin--------------------------------------
create PROCEDURE sp_GioiThieu_get_GioiThieu_admin(@page_index int, @page_size int)
AS
	BEGIN
		DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY gt.MaGioiThieu DESC)) AS RowNumber, 
                               gt.MaGioiThieu,gt.TieuDe,gt.NoiDung,gt.Anh
                        INTO #Results1
                        FROM GioiThieu gt
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(ORDER BY gt.MaGioiThieu DESC)) AS RowNumber, 
                               gt.MaGioiThieu,gt.TieuDe,gt.NoiDung,gt.Anh
                        INTO #Results2
                        FROM GioiThieu gt
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
	END
Go

----------------------------------- lấy tất cả slide ---------------------------------------------------
CREATE PROCEDURE sp_Slide_get_all
AS
    BEGIN
        SELECT *                       
        FROM Slide
    END;
GO
-----------------------------------Lấy Slide theo mã ----------------------------------------------------------------
Create PROCEDURE sp_get_Slide_theo_ma(@MaSlide int)
AS
    BEGIN
        SELECT * 
		FROM Slide sl
		WHERE sl.MaSlide = @MaSlide
    END;
go 
------------------------------------ Lấy tất cả Slide Admin ------------------------------------------------------------
create PROCEDURE sp_Slide_get_Slide_admin(@page_index int, @page_size int)
AS
	BEGIN
		DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY sl.MaSlide ASC)) AS RowNumber, 
                               sl.MaSlide,sl.Anh
                        INTO #Results1
                        FROM Slide sl
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(ORDER BY sl.MaSlide ASC)) AS RowNumber, 
                               sl.MaSlide,sl.Anh
                        INTO #Results2
                        FROM Slide sl
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
	END
Go

--------------------------------------Thêm Slide --------------------------------------------------
create PROCEDURE sp_Slide_create
(
 @Anh  Nvarchar(max)
)
AS
    BEGIN
      INSERT INTO Slide
                (  
			     Anh
                )
                VALUES
                (
				@Anh
                );
        SELECT '';
    END;
GO
----------------------------------------------Sửa Slide ----------------------------------------
create PROCEDURE sp_Slide_Update
(
@MaSlide int, 
 @Anh nvarchar(max)
)
AS
    BEGIN
     
	 Update  Slide
	  set  
	  Anh = IIf(@Anh is Null,Anh, @Anh)
	  Where MaSlide = @MaSlide
      
	  SELECT '';
    END;
GO
------------------------------------------Xóa Slide -----------------------------------------------
CREATE PROCEDURE sp_Slide_delete
(
@MaSlide  int
)
AS
    BEGIN
		DELETE from Slide
			where MaSlide = @MaSlide
			SELECT '';
    END;
GO




CREATE PROCEDURE sp_Thuong_Hieu_get_all
AS
    BEGIN
        SELECT *                       
        FROM ThuongHieu
    END;
GO
------------------------------Tìm kiếm Thương hiệu (admin)-------------------------------------
create PROCEDURE sp_ThuongHieu_search_admin(@page_index int, @page_size int, @MaThuongHieu int ,@TenThuongHieu nvarchar(50))
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                      SELECT(ROW_NUMBER() OVER(ORDER BY TH.MaThuongHieu DESC)) AS RowNumber, 
                              TH.MaThuongHieu,TH.TenThuongHieu,TH.GioiThieu
                        INTO #Results1
                        FROM ThuongHieu TH
					    WHERE   (@MaThuongHieu is null or TH.MaThuongHieu = @MaThuongHieu) AND
								(@TenThuongHieu = ''  OR (TH.TenThuongHieu LIKE '%' + @TenThuongHieu + '%')) 
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                     SELECT(ROW_NUMBER() OVER(ORDER BY TH.MaThuongHieu DESC)) AS RowNumber, 
                              TH.MaThuongHieu,TH.TenThuongHieu,TH.GioiThieu
                        INTO #Results2
                        FROM ThuongHieu TH
					    WHERE   (@MaThuongHieu is null or TH.MaThuongHieu = @MaThuongHieu) AND
								(@TenThuongHieu = ''  OR (TH.TenThuongHieu LIKE '%' + @TenThuongHieu + '%')) 
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
    END;
GO

--------------------------------------Thêm Thương hiệu --------------------------------------------------
create PROCEDURE sp_Thuong_Hieu_create
(
 @TenThuongHieu  Nvarchar(50), 
 @GioiThieu        nvarchar(max)
)
AS
    BEGIN
      INSERT INTO ThuongHieu
                (  
			    TenThuongHieu,
				GioiThieu
                )
                VALUES
                (
				@TenThuongHieu,
				@GioiThieu
                );
        SELECT '';
    END;
GO
----------------------------------------------Sửa thương hiệu ----------------------------------------
create PROCEDURE sp_ThuongHieu_Update
(
@MaThuongHieu int, 
 @TenThuongHieu  NVARCHAR(50), 
 @GioiThieu  nvarchar(max)
)
AS
    BEGIN
     
	 Update  ThuongHieu
	  set  
	  TenThuongHieu = @TenThuongHieu,
	  GioiThieu = IIf(@GioiThieu is Null, GioiThieu, @GioiThieu)
	  Where MaThuongHieu = @MaThuongHieu
      
	  SELECT '';
    END;
GO
------------------------------------------Xóa thương hiệu -----------------------------------------------
CREATE PROCEDURE sp_ThuongHieu_delete
(
@MaThuongHieu  int
)
AS
    BEGIN
		DELETE from ThuongHieu
			where MaThuongHieu = @MaThuongHieu
			SELECT '';
    END;
GO

----------------------------------- lấy thương hiệu theo mã -----------------------------------------------
Create PROCEDURE sp_lay_thuong_hieu_theo_ma(@MaThuongHieu int)
AS
    BEGIN
        SELECT * 
		FROM ThuongHieu T
		WHERE T.MaThuongHieu = @MaThuongHieu
    END;
go 
-------------------------------------------- lấy sản phẩm theo mã -----------------------------------------
create PROCEDURE sp_lay__san_pham_theo_ma(@MaSanPham int)
AS
    BEGIN
        SELECT s.MaSanPham,s.TenSP ,s.Size,S.AnhDaiDien,s.MoTa,CT.SoLuong,l.TenLoaiSanPham,t.TenThuongHieu,g.DonGia
		,IIF(gg.PhamTramGiamGia IS NULL, 0, gg.PhamTramGiamGia)AS PhanTram,
		IIF(gg.PhamTramGiamGia IS NULL, g.DonGia, g.DonGia * (100 - gg.PhamTramGiamGia) / 100) AS GiaMoiKhiGiam,
		     (
				select CT.Anh
				from ChiTietAnhSanPham CT
				where CT.MaSanPham = s.MaSanPham
				for json path 
			)AS listjson_chitietanh,
			(
				select TSo.TenThongSo,TSo.MoTaThongTin
				from ThongSoSanPham TSo	 
				where TSo.MaSanPham =s.MaSanPham
				for json path 
			)AS listjson_thongso
		FROM SanPham s inner join LoaiSanPham l on
		s.MaLoaiSanPham = l.MaLoaiSanPham inner join ThuongHieu t on
		t.MaThuongHieu = s.MaThuongHieu 
		inner join Gia G on G.MaSanPham =s.MaSanPham
		inner join  ChiTietKho CT on CT.MaSanPham = s.MaSanPham
		left join GiamGia GG on GG.MaSanPham = s.MaSanPham
		WHERE s.MaSanPham = @MaSanPham
    END;
go 

------------------------------lay san pham theo ma Admin ------------------------------------------------------------
create PROCEDURE sp_lay__san_pham_theo_ma_Admin(@MaSanPham int)
AS
    BEGIN
        SELECT s.MaSanPham,s.TenSP ,s.Size,S.AnhDaiDien,s.MoTa,CT.SoLuong,l.TenLoaiSanPham,t.TenThuongHieu,g.DonGia
		,IIF(gg.PhamTramGiamGia IS NULL, 0, gg.PhamTramGiamGia)AS PhanTram,
		IIF(gg.PhamTramGiamGia IS NULL, g.DonGia, g.DonGia * (100 - gg.PhamTramGiamGia) / 100) AS GiaMoiKhiGiam,
		     (
				select CT.Anh
				from ChiTietAnhSanPham CT
				where CT.MaSanPham = s.MaSanPham
				for json path 
			)AS listjson_chitietanh,
			(
				select TSo.TenThongSo,TSo.MoTaThongTin,TSo.MaSanPham
				from ThongSoSanPham TSo	 
				where TSo.MaSanPham =s.MaSanPham
				for json path 
			)AS listjson_thongso
		FROM SanPham s inner join LoaiSanPham l on
		s.MaLoaiSanPham = l.MaLoaiSanPham inner join ThuongHieu t on
		t.MaThuongHieu = s.MaThuongHieu 
		left join Gia G on G.MaSanPham =s.MaSanPham
		left join  ChiTietKho CT on CT.MaSanPham = s.MaSanPham
		left join GiamGia GG on GG.MaSanPham = s.MaSanPham
		WHERE s.MaSanPham = @MaSanPham
    END;
go 
exec sp_lay__san_pham_theo_ma_Admin 50
---------------------------------------- lấy sản phẩm mới------------------------------------------
create PROCEDURE sp_lay_san_pham_moi
@SoLuong int
AS
BEGIN
     Select Top(@SoLuong) sp.MaSanPham,sp.TenSP,sp.AnhDaiDien,sp.MoTa,CT.SoLuong,g.DonGia
	,IIF(gg.PhamTramGiamGia IS NULL, 0, gg.PhamTramGiamGia)AS PhanTram,
		IIF(gg.PhamTramGiamGia IS NULL, g.DonGia, g.DonGia * (100 - gg.PhamTramGiamGia) / 100) AS GiaMoiKhiGiam,
	 l.TenLoaiSanPham,T.TenThuongHieu,
		   (
				select CT.Anh
				from ChiTietAnhSanPham CT
				where CT.MaSanPham = sp.MaSanPham
				for json path 
			)AS listjson_chitietanh,
			(
				select TSo.TenThongSo,TSo.MoTaThongTin
				from ThongSoSanPham TSo	 
				where TSo.MaSanPham =sp.MaSanPham
				for json path 
			)AS listjson_thongso
	 from SanPham sp 
	 inner join LoaiSanPham l on l.MaLoaiSanPham = sp.MaLoaiSanPham 
	 inner join ThuongHieu T on T.MaThuongHieu = sp.MaThuongHieu 
	 inner join ChiTietKho CT on CT.MaSanPham = sp.MaSanPham
	 inner join Gia g on g.MaSanPham = sp.MaSanPham
	 left join GiamGia gg on gg.MaSanPham = sp.MaSanPham
    ORDER BY sp.NgayTao DESC;
END



-----------------------------------------------Lấy sản phẩm bán chạy ---------------------------------------
create PROCEDURE sp_lay_san_pham_ban_chay 
    @SoLuongBan INT
AS
BEGIN
   select top ( @SoLuongBan) s.MaSanPham,s.TenSP,s.Size,s.AnhDaiDien,s.MoTa,G.DonGia
   ,IIF(gg.PhamTramGiamGia IS NULL, 0, gg.PhamTramGiamGia)AS PhanTram,
   IIF(gg.PhamTramGiamGia IS NULL, g.DonGia, g.DonGia * (100 - gg.PhamTramGiamGia) / 100) AS GiaMoiKhiGiam,
   sum(CT.SoLuong) AS TongSoLuong ,
           (
				select CT.Anh
				from ChiTietAnhSanPham CT
				where CT.MaSanPham = s.MaSanPham
				for json path 
			)AS listjson_chitietanh,
			(
				select TSo.TenThongSo,TSo.MoTaThongTin
				from ThongSoSanPham TSo	 
				where TSo.MaSanPham =s.MaSanPham
				for json path 
			)AS listjson_thongso
   from SanPham s inner join Gia G
   on G.MaSanPham = s.MaSanPham left join GiamGia GG on 
   GG.MaSanPham =s.MaSanPham inner join ChiTietDonHang CT on 
   CT.MaSanPham = s.MaSanPham 
   group by s.MaSanPham,s.TenSP,s.Size,s.AnhDaiDien,s.MoTa,G.DonGia,GG.PhamTramGiamGia
   order by TongSoLuong  DESC
END
exec sp_lay_san_pham_ban_chay 1
--------------------------------------Lấy sản phẩm giảm giá --------------------------------------------
create procedure sp_lay_san_pham_giam_gia
		@SoluongGG int 
AS 
Begin
	select Top(@SoluongGG) s.MaSanPham,s.TenSP,S.Size,s.AnhDaiDien,G.DonGia
	,IIF(gg.PhamTramGiamGia IS NULL, 0, gg.PhamTramGiamGia)AS PhanTram,
		IIF(gg.PhamTramGiamGia IS NULL, g.DonGia, g.DonGia * (100 - gg.PhamTramGiamGia) / 100) AS GiaMoiKhiGiam,
		   (
				select CT.Anh
				from ChiTietAnhSanPham CT
				where CT.MaSanPham = s.MaSanPham
				for json path 
			)AS listjson_chitietanh,
			(
				select TSo.TenThongSo,TSo.MoTaThongTin
				from ThongSoSanPham TSo	 
				where TSo.MaSanPham =s.MaSanPham
				for json path 
			)AS listjson_thongso
	from SanPham s
	inner join Gia G on G.MaSanPham = s.MaSanPham 
	inner join GiamGia GG on GG.MaSanPham = s.MaSanPham
	where  getdate() between gg.ThoiGianBatDau and gg.ThoiGianKetThuc
	order by GG.PhamTramGiamGia DESC
end

--------------------------------------------Tìm kiếm sản phẩm--------------------------------------------------
create PROCEDURE sp_sanpham_search(@page_index int, @page_size int, @MaSanPham int, @TenSP nvarchar(max), @TenThuongHieu nvarchar(50), 
									@TenLoaiSanPham nvarchar(50), @MinGia int, @MaxGia int, @MaLoaiSanPham int, @MaThuongHieu int)
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(ORDER BY s.NgayTao DESC)) AS RowNumber, 
                               s.MaSanPham, s.TenSP, g.DonGia, s.AnhDaiDien, t.TenThuongHieu, l.TenLoaiSanPham,
							 IIF(gg.PhamTramGiamGia IS NULL, 0, gg.PhamTramGiamGia)AS PhanTram,
                            IIF(gg.PhamTramGiamGia IS NULL, g.DonGia, g.DonGia * (100 - gg.PhamTramGiamGia) / 100) AS GiaMoiKhiGiam
                        INTO #Results1
                        FROM SanPham AS s inner join Gia g
						on s.MaSanPham = g.MaSanPham inner join ThuongHieu t
						on s.MaThuongHieu = t.MaThuongHieu inner join LoaiSanPham l
						on s.MaLoaiSanPham = l.MaLoaiSanPham left join GiamGia GG
						on s.MaSanPham = GG.MaSanPham
					    WHERE   (@MaSanPham is null or s.MaSanPham = @MaSanPham) AND
								(@MaLoaiSanPham is null or s.MaLoaiSanPham = @MaLoaiSanPham) AND
								(@MaThuongHieu is null or s.MaThuongHieu = @MaThuongHieu) AND
								(@TenSP = ''  OR (s.TenSP LIKE '%' + @TenSP + '%')) AND
								(@TenThuongHieu = ''  OR (t.TenThuongHieu LIKE '%' + @TenThuongHieu + '%')) AND 
								(@TenLoaiSanPham = ''  OR (l.TenLoaiSanPham LIKE '%' + @TenLoaiSanPham + '%')) AND
							  (@MinGia IS NULL AND @MaxGia IS NULL)
							  OR
							  (
								(@MinGia IS NOT NULL AND @MaxGia IS NULL)
								AND
							    @MinGia >= ((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) - 20000)
								AND
								@MinGia <= ((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) + 20000)
							  )
							  OR
							  (
								(@MinGia IS NULL AND @MaxGia IS NOT NULL)
								AND
								((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) - 20000) <= @MaxGia
								AND
								@MaxGia <= ((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) + 20000)
							  ) 
							  OR
							  (
								(@MinGia IS NOT NULL AND @MaxGia IS NOT NULL)
								AND
								((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) - 20000) <= @MaxGia
								AND
								@MinGia <= ((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) + 20000)
							  )
							 
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                    SELECT(ROW_NUMBER() OVER(ORDER BY s.NgayTao DESC)) AS RowNumber, 
                               s.MaSanPham, s.TenSP, g.DonGia, s.AnhDaiDien, t.TenThuongHieu, l.TenLoaiSanPham,
							   IIF(gg.PhamTramGiamGia IS NULL, 0, gg.PhamTramGiamGia)AS PhanTram,
   IIF(gg.PhamTramGiamGia IS NULL, g.DonGia, g.DonGia * (100 - gg.PhamTramGiamGia) / 100) AS GiaMoiKhiGiam
                        INTO #Results2
                        FROM SanPham AS s inner join Gia g
						on s.MaSanPham = g.MaSanPham inner join ThuongHieu t
						on s.MaThuongHieu = t.MaThuongHieu inner join LoaiSanPham l
						on s.MaLoaiSanPham = l.MaLoaiSanPham left join GiamGia gg
						on s.MaSanPham = gg.MaSanPham
					    WHERE   (@MaSanPham is null or s.MaSanPham = @MaSanPham) AND
								(@MaLoaiSanPham is null or s.MaLoaiSanPham = @MaLoaiSanPham) AND
								(@MaThuongHieu is null or s.MaThuongHieu = @MaThuongHieu) AND
								(@TenSP = ''  OR (s.TenSP LIKE '%' + @TenSP + '%')) AND
								(@TenThuongHieu = ''  OR (t.TenThuongHieu LIKE '%' + @TenThuongHieu + '%')) AND 
								(@TenLoaiSanPham = ''  OR (l.TenLoaiSanPham LIKE '%' + @TenLoaiSanPham + '%')) AND
								  (@MinGia IS NULL AND @MaxGia IS NULL)
							  OR
							  (
								(@MinGia IS NOT NULL AND @MaxGia IS NULL)
								AND
							    @MinGia >= ((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) - 20000)
								AND
								@MinGia <= ((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) + 20000)
							  )
							  OR
							  (
								(@MinGia IS NULL AND @MaxGia IS NOT NULL)
								AND
								((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) - 20000) <= @MaxGia
								AND
								@MaxGia <= ((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) + 20000)
							  ) 
							  OR
							  (
								(@MinGia IS NOT NULL AND @MaxGia IS NOT NULL)
								AND
								((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) - 20000) <= @MaxGia
								AND
								@MinGia <= ((g.DonGia * (100 - gg.PhamTramGiamGia) / 100) + 20000)
							  )
							  
                        SELECT @RecordCount = COUNT(*)
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
    END;
GO
-------------------------------------------Tim kiem san pham admin -----------------------------------------------------------
create PROCEDURE sp_sanpham_search_admin(@page_index int, @page_size int, @TenSP nvarchar(max))
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(ORDER BY s.NgayTao DESC)) AS RowNumber, 
                               s.MaSanPham, s.TenSP, g.DonGia, s.AnhDaiDien, t.MaThuongHieu, l.MaLoaiSanPham,
							   s.NgayTao,s.MoTa,s.Size,
							 IIF(gg.PhamTramGiamGia IS NULL, 0, gg.PhamTramGiamGia)AS PhanTram,
                            IIF(gg.PhamTramGiamGia IS NULL, g.DonGia, g.DonGia * (100 - gg.PhamTramGiamGia) / 100) AS GiaMoiKhiGiam
                        INTO #Results1
                        FROM SanPham AS s left join Gia g
						on s.MaSanPham = g.MaSanPham inner join ThuongHieu t
						on s.MaThuongHieu = t.MaThuongHieu inner join LoaiSanPham l
						on s.MaLoaiSanPham = l.MaLoaiSanPham left join GiamGia GG
						on s.MaSanPham = GG.MaSanPham
					    WHERE  
								(@TenSP = ''  OR (s.TenSP LIKE '%' + @TenSP + '%'))
							 
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                    SELECT(ROW_NUMBER() OVER(ORDER BY s.NgayTao DESC)) AS RowNumber, 
                               s.MaSanPham, s.TenSP, g.DonGia, s.AnhDaiDien, t.MaThuongHieu, l.MaLoaiSanPham,
							   s.NgayTao,s.MoTa,s.Size,
							 IIF(gg.PhamTramGiamGia IS NULL, 0, gg.PhamTramGiamGia)AS PhanTram,
                            IIF(gg.PhamTramGiamGia IS NULL, g.DonGia, g.DonGia * (100 - gg.PhamTramGiamGia) / 100) AS GiaMoiKhiGiam
                        INTO #Results2
                        FROM SanPham AS s left join Gia g
						on s.MaSanPham = g.MaSanPham inner join ThuongHieu t
						on s.MaThuongHieu = t.MaThuongHieu inner join LoaiSanPham l
						on s.MaLoaiSanPham = l.MaLoaiSanPham left join GiamGia gg
						on s.MaSanPham = gg.MaSanPham
					     WHERE  
								(@TenSP = ''  OR (s.TenSP LIKE '%' + @TenSP + '%'))
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
    END;
GO

----------------------------------------------------Thêm sản phẩm ----------------------------------------------------------
create PROCEDURE sp_sanpham_Create(@TenSP nvarchar(50),@MoTa nvarchar(max), @Size nvarchar(10),
								@MaLoaiSanPham int , @MaThuongHieu int,@AnhDaiDien nvarchar(max),@listThongso nvarchar(max))
AS
	BEGIN
		INSERT INTO SanPham(TenSP,MoTa,NgayTao,Size,MaLoaiSanPham,MaThuongHieu,AnhDaiDien)
		VALUES (@TenSP,@MoTa, GETDATE(), @Size, @MaLoaiSanPham,@MaThuongHieu,@AnhDaiDien);
		IF(@listThongso IS NOT NULL)
		BEGIN
			INSERT INTO ThongSoSanPham(TenThongSo,MoTaThongTin,MaSanPham)
			SELECT 
			    JSON_VALUE(p.value, '$.tenThongSo') ,
				JSON_VALUE(p.value, '$.moTaThongTin') ,
				IDENT_CURRENT('SanPham')
			FROM OPENJSON(@listThongso) AS p;
		END;
	END;
GO

-----------------------------------------Sửa sản phẩm --------------------------------------------------------------
CREATE PROCEDURE sp_sanpham_UPDATE(@MaSanPham int,@TenSP nvarchar(50),@MoTa nvarchar(max), @Size nvarchar(10),
								@MaLoaiSanPham int , @MaThuongHieu int,@AnhDaiDien nvarchar(max)
								,@listThongso nvarchar(max))
AS
	BEGIN
		UPDATE SanPham
		SET 
			TenSP = IIf(@TenSP is Null,TenSP, @TenSP),
			MoTa = IIf(@MoTa is Null,MoTa, @MoTa),
			Size = IIf(@Size is Null,Size, @Size),
			MaLoaiSanPham = IIf(@MaLoaiSanPham is Null,MaLoaiSanPham,@MaLoaiSanPham),
			MaThuongHieu = IIf(@MaThuongHieu is Null,MaThuongHieu,@MaThuongHieu),
			AnhDaiDien = IIf(@AnhDaiDien is Null,AnhDaiDien,@AnhDaiDien)
		WHERE MaSanPham = @MaSanPham;
		IF(@listThongso IS NOT NULL)
		BEGIN
			DELETE FROM ThongSoSanPham WHERE MaSanPham=@MaSanPham;

			INSERT INTO ThongSoSanPham(TenThongSo,MoTaThongTin,MaSanPham)
			SELECT 		
			    JSON_VALUE(p.value, '$.tenThongSo'),
				JSON_VALUE(p.value, '$.moTaThongTin'),
				@MaSanPham
			FROM OPENJSON(@listThongso) AS p;
		END;
	END;
GO
--------------------------------------Xóa sản phẩm --------------------------------------------------------------------
CREATE PROCEDURE sp_sanpham_DELETE(@MaSanPham int)
AS
	BEGIN
	Delete from ChiTietAnhSanPham where MaSanPham = @MaSanPham
		DELETE FROM ThongSoSanPham WHERE MaSanPham = @MaSanPham
			DELETE FROM SanPham WHERE MaSanPham = @MaSanPham
	END
Go

----------------------------------------Lấy một đơn hàng --------------------------------------
create PROCEDURE sp_lay_don_hang_theo_ma(@MaDonHang int)
AS
    BEGIN
      SELECT d.MaDonHang, d.NgayDat,
       (
            SELECT k.TenKhachHang, k.DiaChi, k.SoDienThoai
            FROM khachHang k
            WHERE k.MaKhachHang = d.MaKhachHang
            FOR JSON PATH 
       ) AS objectjson_khachhang,
       (
            SELECT c.MaChiTiet,c.MaDonHang,c.MaSanPham,c.SoLuong, c.GiaTien, s.TenSP, s.MoTa
            FROM ChiTietDonHang c INNER JOIN SanPham s ON s.MaSanPham = c.MaSanPham	 
            WHERE c.MaDonHang = d.MaDonHang
            FOR JSON PATH 
       ) AS listjson_chitietdonhang
		FROM DonHang d 
		INNER JOIN ChiTietDonHang CT ON CT.MaDonHang = d.MaDonHang
		inner join SanPham s on s.MaSanPham =ct.MaSanPham
		WHERE d.MaDonHang = @MaDonHang
    END;
go 
------------------------------------------------thêm đơn hàng --------------------------------------
create PROCEDURE sp_donhang_Them
(@khach      NVARCHAR(MAX),  
 @listchitiet NVARCHAR(MAX)
)
AS
    BEGIN
	 IF(@khach IS NOT NULL)
	 Begin
	   INSERT INTO KhachHang
                (TenKhachHang, 
                 DiaChi, 
                 SoDienThoai,
				 Email
                )
		 SELECT JSON_VALUE(@khach, '$.tenKhachHang'),
				JSON_VALUE(@khach, '$.diaChi'), 
				JSON_VALUE(@khach, '$.soDienThoai') ,
				JSON_VALUE(@khach, '$.email') 
	 end;
	 IF(@listchitiet IS NOT NULL)
	 Begin
	    -- Thêm bảng đơn hàng
		INSERT INTO DonHang
        (MaKhachHang, 
            NgayDat, 
            TrangThai               
        )
        VALUES
        (IDENT_CURRENT('KhachHang'), 
            GETDATE(), 
            1
        );
		-- Thêm bảng chi tiết đơn hàng
        INSERT INTO ChiTietDonHang
                (   MaDonHang, 
                    MaSanPham, 
                    SoLuong, 
                    GiaTien                       
                )
        SELECT 
			IDENT_CURRENT('DonHang'),		
			JSON_VALUE(p.value, '$.maSanPham'), 
			JSON_VALUE(p.value, '$.soLuong'), 
			JSON_VALUE(p.value, '$.giaTien')    
        FROM OPENJSON(@listchitiet) AS p;
	end;
    SELECT '';
   END;



---------------------------------------------lấy tất cả loại sản phẩm------------------------------------ 
CREATE PROCEDURE sp_Loai_SanPham_get_all
AS
    BEGIN
        SELECT *                       
        FROM LoaiSanPham
    END;
GO
------------------------------------------Lấy loại sản phẩm theo mã ---------------------------------------

Create PROCEDURE sp_get_loaisp_theo_ma(@MaLoaiSanPham int)
AS
    BEGIN
        SELECT * 
		FROM LoaiSanPham  l
		WHERE l.MaLoaiSanPham = @MaLoaiSanPham
    END;
go 

-------------------------------------lấy tất cả loại sản phẩm admin ---------------------------------------
create PROCEDURE sp_loaisp_get_loaisp_admin(@page_index int, @page_size int)
AS
	BEGIN
		DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY  L.MaLoaiSanPham DESC)) AS RowNumber, 
                              L.MaLoaiSanPham,L.TenLoaiSanPham
                        INTO #Results1
                        FROM LoaiSanPham L
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(ORDER BY  L.MaLoaiSanPham DESC)) AS RowNumber, 
                               L.MaLoaiSanPham,L.TenLoaiSanPham
                        INTO #Results2
                        FROM LoaiSanPham L
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
	END
Go
----------------------------------------------Thêm loại sản phẩm --------------------------------------------
create PROCEDURE sp_loaisp_create 
(
 @TenLoaiSanPham nvarchar(50)
)
AS
    BEGIN
      INSERT INTO LoaiSanPham
                (  
			    TenLoaiSanPham
                )
                VALUES
                (
				@TenLoaiSanPham
                );
        SELECT '';
    END;
GO
-----------------------------------------Cập nhật loại sản phẩm ---------------------------------------------------------
CREATE PROCEDURE sp_loaisp_update
(
@MaLoaiSanPham int, 
@TenLoaiSanPham nvarchar(50)
)
AS
    BEGIN
     
	 Update  LoaiSanPham
	  set  
	  TenLoaiSanPham = IIf(@TenLoaiSanPham is Null,TenLoaiSanPham, @TenLoaiSanPham)
	  Where MaLoaiSanPham = @MaLoaiSanPham      
	  SELECT '';
    END;
GO
---------------------------------------xóa loại sản phẩm ------------------------------------------------------------
CREATE PROCEDURE sp_loaisp_delete
(
@MaLoaiSanPham  int
)
AS
    BEGIN
		DELETE from LoaiSanPham
			where MaLoaiSanPham = @MaLoaiSanPham
			SELECT '';
    END;
GO

---------------------------------------------- lấy tất cả menu -------------------------------------------
create PROCEDURE sp_Menu_get_all
AS
    BEGIN
        SELECT *                       
        FROM Menu
		order by STT ASC
    END
	
GO

------------------------------ laays taats car menu admin--------------------------------------
create PROCEDURE sp_Menu_get_Menu_admin(@page_index int, @page_size int)
AS
	BEGIN
		DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY M.TenMenu DESC)) AS RowNumber, 
                               M.MaMenu,M.MaMenuCha,M.TenMenu,M.STT,M.TrangThai,M.link
                        INTO #Results1
                        FROM Menu M
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(ORDER BY M.TenMenu DESC)) AS RowNumber, 
                                M.MaMenu,M.MaMenuCha,M.TenMenu,M.STT,M.TrangThai,M.link
                        INTO #Results2
                        FROM Menu M
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
	END
Go
------------------------------------------Thêm menu ---------------------------------------
create PROCEDURE sp_menu_create 
(
 @MaMenuCha  int, 
 @TenMenu     nvarchar(50), 
 @STT int ,
 @TrangThai      bit,
 @Link nvarchar(20)
)
AS
    BEGIN
      INSERT INTO Menu
                (  
			    MaMenuCha,
				TenMenu,
				STT,
				TrangThai,
				link
                )
                VALUES
                (
				@MaMenuCha,
				@TenMenu,
				@STT,
				@TrangThai,
				@Link
                );
        SELECT '';
    END;
GO
------------------------------------------------Cập nhật menu --------------------------------
CREATE PROCEDURE sp_menu_update
(
@MaMenu   int, 
@MaMenuCha int,
@TenMenu  NVARCHAR(250), 
 @STT         int, 
 @TrangThai     bit,
 @Link nvarchar(20)
)
AS
    BEGIN
     
	 Update  Menu
	  set  
	  MaMenuCha = IIf(@MaMenuCha is Null,MaMenuCha, @MaMenuCha),
	  TenMenu = IIf(@TenMenu is Null, TenMenu, @TenMenu),
	  STT = IIf(@STT is Null, STT, @STT),
	  TrangThai = IIf(@TrangThai is Null, TrangThai, @TrangThai),
	  Link = IIf(@Link is Null,Link, @Link)

	  Where MaMenu = @MaMenu
      
	  SELECT '';
    END;
GO
-----------------------------------------------Xóa Menu -----------------------------------
CREATE PROCEDURE sp_menu_delete
(
@MaMenu  int
)
AS
    BEGIN
		DELETE from Menu 
			where MaMenu = @MaMenu
			SELECT '';
    END;
GO


---------------------------- ------------------lấy tin tức theo mã -----------------------------------
create PROCEDURE sp_lay_tin_tuc_theo_ma(@MaTinTuc int)
AS
    BEGIN
      SELECT t.MaTinTuc,t.TieuDe, t.NgayDang,t.NoiDung,t.AnhTinTuc,nd.HoTen
		FROM TinTuc T inner join NguoiDung nd on
		nd.MaNguoiDung=t.MaNguoiDung
		WHERE t.MaTinTuc = @MaTinTuc 
    END;
go 

------------------------Lấy tin tức theo mã (admin)-----------------------------------------------
create PROCEDURE sp_lay_tin_tuc_theo_ma_admin(@MaTinTuc int)
AS
    BEGIN
      SELECT t.MaTinTuc,t.TieuDe, t.NgayDang,t.NoiDung,t.AnhTinTuc,nd.HoTen
		FROM TinTuc T inner join NguoiDung nd on
		nd.MaNguoiDung=t.MaNguoiDung
		WHERE t.MaTinTuc = @MaTinTuc 
    END;
go 

-----------------------------lấy  danh sách tin tức admin -----------------------------------------
CREATE PROCEDURE sp_tintuc_Get_tintuc_admin(@page_index int, @page_size int, @TieuDe nvarchar(max))
AS
	BEGIN
		DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY t.MaTinTuc ASC)) AS RowNumber, 
							t.MaTinTuc,t.TieuDe, NgayDang,t.NoiDung, t.AnhTinTuc, t.MaNguoiDung, n.HoTen
                        INTO #Results1
                        FROM TinTuc t inner join NguoiDung n
						on t.MaNguoiDung = n.MaNguoiDung
						WHERE (@TieuDe = ''  OR (TieuDe LIKE '%' + @TieuDe + '%'))
                        SELECT @RecordCount = COUNT(*)
						FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY t.MaTinTuc ASC)) AS RowNumber, 
							t.MaTinTuc,t.TieuDe, NgayDang,t.NoiDung, t.AnhTinTuc, t.MaNguoiDung, n.HoTen
                        INTO #Results2
                        FROM TinTuc t inner join NguoiDung n
						on t.MaNguoiDung = n.MaNguoiDung
						WHERE (@TieuDe = ''  OR (TieuDe LIKE '%' + @TieuDe + '%'))
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
	END
Go

create PROCEDURE sp_tintuc_get_all_tin_tuc
AS
    BEGIN
        SELECT *                       
        FROM TinTuc
		order by MaTinTuc ASC
    END
	
GO

-----------------------Thêm tin tức---------------------------------------------------------
CREATE PROCEDURE sp_tintuc_Create(@TieuDe nvarchar(max), @NgayDang datetime, @NoiDung nvarchar(max),
								@AnhTinTuc nvarchar(max), @MaNguoiDung int)
AS
    BEGIN
      INSERT INTO TinTuc
                (  
			    TieuDe,
				NgayDang,
				NoiDung,
				AnhTinTuc,
				MaNguoiDung
                )
                VALUES
                (
				@TieuDe,
				@NgayDang,
				@NoiDung,
				@AnhTinTuc,
				@MaNguoiDung
                );
        SELECT '';
    END;
GO

----------------------Sửa tin tức	---------------------------------------------------
CREATE PROCEDURE sp_tintuc_UPDATE(@MaTinTuc int ,@TieuDe nvarchar(max),@NoiDung nvarchar(max),
								@AnhTinTuc nvarchar(max), @MaNguoiDung int)
AS
	BEGIN
		UPDATE TinTuc
		SET 
			TieuDe = IIf(@TieuDe is Null, TieuDe, @TieuDe),
			NoiDung = IIf(@NoiDung is Null,NoiDung, @NoiDung),
			AnhTinTuc = IIf(@AnhTinTuc is Null,AnhTinTuc, @AnhTinTuc),
			MaNguoiDung = IIf(@MaNguoiDung is Null, MaNguoiDung, @MaNguoiDung)
		WHERE MaTinTuc = @MaTinTuc
		   
	  SELECT '';
    END;
GO

------------------------------Xóa Tin Tức -------------------------------------------------------------------
CREATE PROCEDURE sp_tintuc_DELETE(@MaTinTuc int)
AS
	BEGIN
		DELETE FROM TinTuc WHERE MaTinTuc= @MaTinTuc
	END
Go
------------------------------Lấy tất cả sản phẩm đc đánh giá cao --------------
create procedure sp_lay_san_pham_danh_gia_cao
		@Soluong int 
AS 
Begin
	select Top(@Soluong) s.MaSanPham,s.TenSP,S.Size,G.DonGia,sum(DG.SoSao) AS TongSoSao
	,IIF(gg.PhamTramGiamGia IS NULL, 0, gg.PhamTramGiamGia)AS PhanTram,
		IIF(gg.PhamTramGiamGia IS NULL, g.DonGia, g.DonGia * (100 - gg.PhamTramGiamGia) / 100) AS GiaMoiKhiGiam,
		   (
				select CT.Anh
				from ChiTietAnhSanPham CT
				where CT.MaSanPham = s.MaSanPham
				for json path 
			)AS listjson_chitietanh,
			(
				select TSo.MoTaThongTin
				from ThongSoSanPham TSo	 
				where TSo.MaSanPham =s.MaSanPham
				for json path 
			)AS listjson_thongso,
			(
			 select DG.SoSao,DG.NoiDungDanhGia from DanhGia DG
			 where DG.MaSanPham = s.MaSanPham
			 for json path 
			)AS listjson_danhgia
	from SanPham s
	inner join Gia G on G.MaSanPham = s.MaSanPham 
	inner join GiamGia GG on GG.MaSanPham = s.MaSanPham
	inner join DanhGia DG on DG.MaSanPham = s.MaSanPham
	 group by s.MaSanPham,s.TenSP,s.Size, s.MoTa,G.DonGia,GG.PhamTramGiamGia
	order by TongSoSao DESC
end

---------------------------Người dùng lấy theo mã  ---------------------------------------------
Create PROCEDURE sp_get_NguoiDung_theo_ma(@MaNguoiDung int)
AS
    BEGIN
        SELECT * 
		FROM NguoiDung  nd
		WHERE nd.MaNguoiDung = @MaNguoiDung
    END;
go 

----------------------Thêm người dùng -----------------------------------------------------
create PROCEDURE sp_NguoiDung_create
(
 @TaiKhoan  Nvarchar(55), @MatKhau nvarchar(20),@Email  nvarchar(25) ,@HoTen nvarchar(50),@NgaySinh datetime
 ,@DiaChi nvarchar(35),@SoDienThoai nvarchar(15),@GioiTinh  nvarchar(10),@AnhDaiDien nvarchar(max) 
 ,@TrangThai bit ,@VaiTro nvarchar(25)
)
AS
    BEGIN
      INSERT INTO NguoiDung
                (  
			    TaiKhoan,MatKhau,Email,HoTen ,NgaySinh ,DiaChi,SoDienThoai , GioiTinh ,AnhDaiDien,
				TrangThai ,VaiTro
                )
                VALUES
                (
				 @TaiKhoan, @MatKhau,@Email ,@HoTen,@NgaySinh 
				,@DiaChi ,@SoDienThoai,@GioiTinh,@AnhDaiDien 
				,@TrangThai  ,@VaiTro 
                );
        SELECT '';
    END;
GO

------------------------------Sửa người dùng ------------------------------------------------------------
create PROCEDURE sp_NguoiDung_Update
(
 @MaNguoiDung int,@TaiKhoan  Nvarchar(55), @MatKhau nvarchar(20),@Email  nvarchar(25) ,@HoTen nvarchar(50),@NgaySinh datetime
 ,@DiaChi nvarchar(35),@SoDienThoai nvarchar(15),@GioiTinh  nvarchar(10),@AnhDaiDien nvarchar(max) 
 ,@TrangThai bit ,@VaiTro nvarchar(25)
)
AS
    BEGIN
     
	 Update  NguoiDung
	  set 
	  TaiKhoan = IIf(@TaiKhoan  is Null, TaiKhoan , @TaiKhoan),
	  MatKhau = IIf(@MatKhau is Null,MatKhau, @MatKhau),
	  Email = IIf(@Email is Null,Email, @Email),
	  HoTen = IIf(@HoTen  is Null,HoTen , @HoTen ),
	  NgaySinh = IIf(@NgaySinh is Null,NgaySinh, @NgaySinh),
	  DiaChi = IIf(@DiaChi is Null,DiaChi, @DiaChi),
	  SoDienThoai = IIf(@SoDienThoai is Null,SoDienThoai, @SoDienThoai),
	  GioiTinh = IIf(@GioiTinh is Null,GioiTinh, @GioiTinh),
	  AnhDaiDien = IIf(@AnhDaiDien is Null,AnhDaiDien, @AnhDaiDien),
	  TrangThai = IIf(@TrangThai is Null,TrangThai, @TrangThai),
	  VaiTro = IIf(@VaiTro is Null,VaiTro, @VaiTro)
	  Where MaNguoiDung = @MaNguoiDung
      
	  SELECT '';
    END;
GO
-------------------------------Xóa người dùng -------------------------------------------------------------------
CREATE PROCEDURE sp_NguoiDung_DELETE(@MaNguoiDung int)
AS
	BEGIN
	DELETE FROM NguoiDung WHERE MaNguoiDung = @MaNguoiDung
	END
Go

----------------------------------Tìm kiếm người dùng -------------------------------------------------------------------
create PROCEDURE sp_NguoiDung_search(@page_index int, @page_size int, @MaNguoiDung int ,@TaiKhoan nvarchar(50) ,@HoTen nvarchar(50),
                                          @GioiTinh nvarchar(10),@DiaChi nvarchar(40),  @VaiTro nvarchar(35))
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                       	SELECT(ROW_NUMBER() OVER(ORDER BY nd.MaNguoiDung DESC)) AS RowNumber, 
                               nd.MaNguoiDung ,nd.TaiKhoan,nd.MatKhau,nd.Email,nd.HoTen,nd.NgaySinh,nd.DiaChi,
							   nd.SoDienThoai,nd.GioiTinh,nd.AnhDaiDien,nd.TrangThai,nd.VaiTro
                        INTO #Results1
                        FROM NguoiDung nd 
					    WHERE   (@MaNguoiDung is null or nd.MaNguoiDung = @MaNguoiDung) AND
								(@TaiKhoan = ''  OR (nd.TaiKhoan LIKE '%' + @TaiKhoan + '%')) AND
								(@HoTen = ''  OR (nd.HoTen LIKE '%' + @HoTen + '%')) AND 
								(@GioiTinh = ''  OR (nd.GioiTinh LIKE '%' + @GioiTinh + '%')) and
								(@DiaChi = ''  OR (nd.DiaChi LIKE '%' + @DiaChi + '%')) AND 
								(@VaiTro = ''  OR (nd.VaiTro LIKE '%' + @VaiTro + '%')) 
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                      	SELECT(ROW_NUMBER() OVER(ORDER BY nd.MaNguoiDung DESC)) AS RowNumber, 
                                nd.MaNguoiDung ,nd.TaiKhoan,nd.MatKhau,nd.Email,nd.HoTen,nd.NgaySinh,nd.DiaChi,
							   nd.SoDienThoai,nd.GioiTinh,nd.AnhDaiDien,nd.TrangThai,nd.VaiTro
                        INTO #Results2
                        FROM NguoiDung nd 
					    WHERE   (@MaNguoiDung is null or nd.MaNguoiDung = @MaNguoiDung) AND
								(@TaiKhoan = ''  OR (nd.TaiKhoan LIKE '%' + @TaiKhoan + '%')) AND
								(@HoTen = ''  OR (nd.HoTen LIKE '%' + @HoTen + '%')) AND 
								(@GioiTinh = ''  OR (nd.GioiTinh LIKE '%' + @GioiTinh + '%')) and
								(@DiaChi = ''  OR (nd.DiaChi LIKE '%' + @DiaChi + '%')) AND 
								(@VaiTro = ''  OR (nd.VaiTro LIKE '%' + @VaiTro + '%')) 
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
    END;
GO

-----------------------------Lấy giảm giá theo mã --------------------------------------
CREATE PROCEDURE sp_GiamGia_Get_theo_ma(@MaGiamGia int)
AS
	BEGIN
		SELECT gg.MaGiamGia ,gg.MaSanPham,gg.PhamTramGiamGia,gg.ThoiGianBatDau,gg.ThoiGianKetThuc,gg.TrangThai		
		FROM GiamGia gg
		WHERE gg.MaGiamGia = @MaGiamGia
	END
Go
-------------------------Thêm giảm giá -------------------------------------------------------------
create PROCEDURE sp_GiamGia_create
(
 @MaSanPham int ,
 @PhanTramGiamGia int ,
 @ThoiGianBatDau datetime ,
 @ThoiGianKetThuc datetime,
 @TrangThai bit 
)
AS
    BEGIN
      INSERT INTO GiamGia
                (  
			     MaSanPham, PhamTramGiamGia,ThoiGianBatDau,ThoiGianKetThuc,TrangThai
                )
                VALUES
                (
				@MaSanPham,@PhanTramGiamGia,@ThoiGianBatDau,@ThoiGianKetThuc,@TrangThai
                );
        SELECT '';
    END;
GO
----------------------------Sửa giảm giá ----------------------------------------------------------
create PROCEDURE sp_GiamGia_Update
(
	@MaGiamGia int, 
	@MaSanPham int ,
	@PhanTramGiamGia int ,
	@ThoiGianBatDau datetime ,
	@ThoiGianKetThuc datetime,
	@TrangThai bit 
)
AS
    BEGIN
     
	 Update  GiamGia
	  set  
	  MaSanPham = IIf(@MaSanPham is Null,MaSanPham, @MaSanPham)
	  Where MaGiamGia = @MaGiamGia
      
	  SELECT '';
    END;
GO
-------------------------------Xóa giảm giá -----------------------------------------------------------
CREATE PROCEDURE sp_GiamGia_delete
(
@MaGiamGia int
)
AS
    BEGIN
		DELETE from GiamGia
			where MaGiamGia = @MaGiamGia
			SELECT '';
    END;
GO
--------------------------Lấy giảm giá và phân trang ---------------------------------------------------------

create PROCEDURE sp_giamgia_get_giamgia_admin(@page_index int, @page_size int)
AS
	BEGIN
		DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY  gg.MaGiamGia DESC)) AS RowNumber, 
                               gg.MaGiamGia,gg.MaSanPham,gg.PhamTramGiamGia,gg.ThoiGianBatDau,gg.ThoiGianKetThuc,gg.TrangThai
                        INTO #Results1
                        FROM GiamGia gg
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(ORDER BY  gg.MaGiamGia DESC)) AS RowNumber, 
                               gg.MaGiamGia,gg.MaSanPham,gg.PhamTramGiamGia,gg.ThoiGianBatDau,gg.ThoiGianKetThuc,gg.TrangThai
                        INTO #Results2
                        FROM GiamGia gg
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
	END
Go

------------------------------giảm giá lấy theo mã -------------------------------------------
create PROCEDURE sp_lay_giamgia_theo_ma(@MaGiamGia int)
AS
    BEGIN
      SELECT * ,sp.TenSP
		FROM GiamGia gg inner join SanPham sp on gg.MaSanPham = sp.MaSanPham
		WHERE gg.MaGiamGia = @MaGiamGia 
    END;
go
----------------------------------------------------------------Thêm kho -------------------------------------
CREATE PROCEDURE sp_Kho_Create(@TenKho nvarchar(max),@DiaChi nvarchar(50),@listjson_kho NVARCHAR(MAX))
AS
	BEGIN
		INSERT INTO Kho(TenKho,DiaChi)
		VALUES (@TenKho , @DiaChi);
    
		IF(@listjson_kho IS NOT NULL)
		BEGIN
			INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
			SELECT 
				IDENT_CURRENT('Kho'),	
				JSON_VALUE(p.value, '$.maSanPham') ,
				JSON_VALUE(p.value, '$.soLuong')
			FROM OPENJSON(@listjson_kho) AS p;
		END;
	END;
go


------------------------------------------------Cập nhật kho -----------------------------------------------------------
CREATE PROCEDURE sp_Kho_UPDATE(@MaKho int ,@TenKho nvarchar(max), 
								@DiaChi nvarchar(max),@listjson_kho NVARCHAR(MAX))
AS
	BEGIN
		UPDATE Kho
		SET 
			TenKho = IIf(@TenKho is Null,TenKho, @TenKho),
			DiaChi = IIf(@DiaChi is Null,DiaChi, @DiaChi)
		WHERE MaKho = @MaKho;
    
		IF(@listjson_kho IS NOT NULL)
		BEGIN
			DELETE FROM ChiTietKho WHERE MaKho = @MaKho;

			INSERT INTO ChiTietKho(MaKho,MaSanPham,SoLuong)
			SELECT 
				@MaKho,	
				JSON_VALUE(p.value, '$.maSanPham'),
				JSON_VALUE(p.value, '$.soLuong')
			FROM OPENJSON(@listjson_kho) AS p;
		END;
	END;
GO

-----------------------------------------xóa --------------------------------------------------------

CREATE PROCEDURE sp_Kho_DELETE(@MaKho int)
AS
	BEGIN
	DELETE FROM ChiTietKho WHERE MaKho = @MaKho
		DELETE FROM Kho WHERE MaKho= @MaKho
	END
Go
------------------------------Lấy tất cả kho và phân trang -------------------------------------------------------------
create PROCEDURE sp_kho_get_Kho_admin(@page_index int, @page_size int)
AS
	BEGIN
		DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY k.MaKho DESC)) AS RowNumber, 
                               k.MaKho,k.TenKho,k.DiaChi,
							   (SELECT ctk.MaChiTietKho,ctk.MaKho,ctk.MaSanPham,ctk.SoLuong
								FROM ChiTietKho ctk 
								WHERE ctk.MaKho = k.MaKho
								FOR JSON PATH
							) AS listjson_kho
                        INTO #Results1
                        FROM Kho k
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(ORDER BY k.MaKho DESC)) AS RowNumber, 
                               k.MaKho,k.TenKho,k.DiaChi,
							   (SELECT ctk.MaChiTietKho,ctk.MaKho,ctk.MaSanPham,ctk.SoLuong
								FROM ChiTietKho ctk 
								WHERE ctk.MaKho = k.MaKho
								FOR JSON PATH
							) AS listjson_kho
                        INTO #Results2
                        FROM Kho k
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
	END
Go
--------------------------------------------------------lấy kho theo mã ----------------------------------------------
create PROCEDURE sp_lay_kho_theo_ma(@MaKho int)
AS
    BEGIN
      SELECT
	   k.MaKho,k.TenKho,k.DiaChi,
       (
            SELECT ct.MaChiTietKho,ct.MaKho,ct.SoLuong,sp.TenSP,ct.MaSanPham
            FROM ChiTietKho CT inner join SanPham sp 
			on sp.MaSanPham = ct.MaSanPham
            WHERE CT.MaKho = k.MaKho 
            FOR JSON PATH 
       ) AS listjson_kho
		FROM Kho k 
		WHERE k.MaKho = @MaKho 
    END;
go 
---------------------Đăng nhập ----------------------------------------------
CREATE PROCEDURE sp_nguoidung_dangnhap(@TaiKhoan nvarchar(100), @MatKhau nvarchar(100))
AS
	BEGIN
		SELECT * FROM NguoiDung WHERE TaiKhoan = @TaiKhoan AND MatKhau = @MatKhau
	END
Go


-----------------------------------------lấy tất cả đơn hàng Admin -----------------------------------------------
create PROCEDURE sp_donhang_get_all_donhang(@page_index int, @page_size int)
AS
	BEGIN
		DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY dh.MaDonHang ASC)) AS RowNumber, 
							dh.MaDonHang,dh.MaKhachHang,kh.TenKhachHang,dh.NgayDat,dh.TrangThai,
							(SELECT c.MaChiTiet,c.MaDonHang,c.MaSanPham,sp.TenSP,c.SoLuong,c.GiaTien
								FROM ChiTietDonHang c inner join SanPham sp 
								on sp.MaSanPham = c.MaSanPham
								WHERE dh.MaDonHang = c.MaDonHang 
								FOR JSON PATH
							) AS listjson_CTDonHang 
                        INTO #Results1
                        FROM DonHang dh  inner join KhachHang kh 
						on dh.MaKhachHang = kh.MaKhachHang
                        SELECT @RecordCount = COUNT(*)
						FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY dh.MaDonHang ASC)) AS RowNumber, 
							dh.MaDonHang,dh.MaKhachHang,kh.TenKhachHang,dh.NgayDat,dh.TrangThai,
							(SELECT c.MaChiTiet,c.MaDonHang,c.MaSanPham,sp.TenSP,c.SoLuong,c.GiaTien
								FROM ChiTietDonHang c inner join SanPham sp 
								on sp.MaSanPham = c.MaSanPham
								WHERE dh.MaDonHang = c.MaDonHang 
								FOR JSON PATH
							) AS listjson_CTDonHang 
                        INTO #Results2
                        FROM DonHang dh  inner join KhachHang kh 
						on dh.MaKhachHang = kh.MaKhachHang
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
	END
Go
------------------------Lấy theo mã ---------------------------------------------------
create PROCEDURE sp_lay_HDN_theo_ma(@MaHDN int)
AS
    BEGIN
      SELECT
	   hdn.MaHDN,hdn.NgayNhap,hdn.MaNguoiDung,hdn.MaNhaCungCap,nd.HoTen,
							   (SELECT *
								FROM ChiTietHoaDonNhap ct
								WHERE ct.MaHDN = hdn.MaHDN
								FOR JSON PATH
							) AS listjson_HDN
                        FROM HoaDonNhap hdn left join NguoiDung nd 
						on nd.MaNguoiDung = hdn.MaNguoiDung
		WHERE hdn.MaHDN = @MaHDN
    END;
go 
exec sp_lay_HDN_theo_ma 2
----------------------------------Thêm hóa đơn nhập ------------------------------------------------------------

CREATE PROCEDURE sp_HoaDonNhap_Create(@NgayNhap datetime,@MaNhaCungCap int , @MaNguoiDung int ,@listCTHDN nvarchar(max))
AS
	BEGIN
		INSERT INTO HoaDonNhap(NgayNhap,MaNhaCungCap,MaNguoiDung)
		VALUES ( GETDATE(),@MaNhaCungCap,@MaNguoiDung);
		IF(@listCTHDN IS NOT NULL)
		BEGIN
			INSERT INTO ChiTietHoaDonNhap(MaHDN,MaSanPham,SoLuong,GiaTien)
			SELECT 
				IDENT_CURRENT('HoaDonNhap'),
				JSON_VALUE(p.value, '$.maSanPham'),
				JSON_VALUE(p.value, '$.soLuong'),
				JSON_VALUE(p.value, '$.giaTien')
			FROM OPENJSON(@listCTHDN) AS p;
		END;
	END;
GO
------------------------------Xóa Hóa Đơn Nhập -----------------------------------------------------------------
CREATE PROCEDURE sp_HoaDonNhap_DELETE(@MaHDN int)
AS
	BEGIN
	DELETE FROM ChiTietHoaDonNhap WHERE MaHDN = @MaHDN
		DELETE FROM HoaDonNhap WHERE MaHDN= @MaHDN
	END
Go
-----------------------------Get Hóa Đơn Nhập ---------------------------------------------------------
create PROCEDURE sp_HDN_get_HDN_admin(@page_index int, @page_size int)
AS
	BEGIN
		DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
						SELECT(ROW_NUMBER() OVER(ORDER BY  hdn.MaHDN DESC)) AS RowNumber, 
                               hdn.MaHDN,hdn.NgayNhap,hdn.MaNguoiDung,hdn.MaNhaCungCap,nd.HoTen,
							   (SELECT *
								FROM ChiTietHoaDonNhap ct
								WHERE ct.MaHDN = hdn.MaHDN
								FOR JSON PATH
							) AS listjson_HDN
                        INTO #Results1
                        FROM HoaDonNhap hdn inner join NguoiDung nd 
						on nd.MaNguoiDung = hdn.MaNguoiDung
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1 OR @page_index = -1;

                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                       SELECT(ROW_NUMBER() OVER(ORDER BY  hdn.MaHDN DESC)) AS RowNumber, 
                               hdn.MaHDN,hdn.NgayNhap,hdn.MaNguoiDung,hdn.MaNhaCungCap,nd.HoTen,
							   (SELECT *
								FROM ChiTietHoaDonNhap ct
								WHERE ct.MaHDN = hdn.MaHDN
								FOR JSON PATH
							) AS listjson_HDN
                        INTO #Results2
                        FROM HoaDonNhap hdn inner join NguoiDung nd 
						on nd.MaNguoiDung = hdn.MaNguoiDung
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;   
						
                        DROP TABLE #Results2; 
        END;
	END
Go