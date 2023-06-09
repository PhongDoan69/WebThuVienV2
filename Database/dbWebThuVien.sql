USE [dbWebThuVien]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 4/25/2023 11:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [int] NOT NULL,
	[MaSach] [varchar](8) NOT NULL,
	[SoLuong] [smallint] NULL,
	[DonGiaBan] [real] NULL,
	[GiamGia] [real] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 4/25/2023 11:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[MaNV] [varchar](8) NULL,
	[NgayLapHD] [datetime] NOT NULL,
	[NgayGiao] [datetime] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/25/2023 11:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](20) NULL,
	[Ten] [nvarchar](20) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](11) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSach]    Script Date: 4/25/2023 11:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSach](
	[MaLoaiSach] [varchar](8) NOT NULL,
	[TenLoaiSach] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LoaiSach] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 4/25/2023 11:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](8) NOT NULL,
	[Ho] [nvarchar](20) NOT NULL,
	[Ten] [nvarchar](20) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[NgaySinh] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[CMND] [varchar](12) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 4/25/2023 11:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [varchar](8) NOT NULL,
	[TenSach] [nvarchar](100) NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[GiaTien] [float] NULL,
	[NhaXuatBan] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[MaLoaiSach] [varchar](8) NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [DiaChi], [SoDienThoai], [Email]) VALUES (1, N'Phạm', N'Hữu Đức', N'Quảng Nam', N'0000000000', N'duke123@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [DiaChi], [SoDienThoai], [Email]) VALUES (2, N'Trần', N'Công Duy', N'Gia Lai', N'0111111111', N'duy12@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [DiaChi], [SoDienThoai], [Email]) VALUES (3, N'Đặng', N'Văn Trường An', N'Đắk Nông', N'0222222222', N'ankhongpeo@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [DiaChi], [SoDienThoai], [Email]) VALUES (4, N'Nguyễn', N'Thị Hồng', N'Đà Nẵng', N'0333333333', N'honghong@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [DiaChi], [SoDienThoai], [Email]) VALUES (5, N'Trần', N'Trọng Nhân', N'Quảng Ngãi', NULL, N'nhannhan12@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [DiaChi], [SoDienThoai], [Email]) VALUES (6, N'Nguyễn ', N'Minh', N'Bình Thuận', N'0345345564', NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[LoaiSach] ([MaLoaiSach], [TenLoaiSach]) VALUES (N'KH', N'Khoa học')
INSERT [dbo].[LoaiSach] ([MaLoaiSach], [TenLoaiSach]) VALUES (N'KTH', N'Kinh tế học')
INSERT [dbo].[LoaiSach] ([MaLoaiSach], [TenLoaiSach]) VALUES (N'TL', N'Tâm lý')
INSERT [dbo].[LoaiSach] ([MaLoaiSach], [TenLoaiSach]) VALUES (N'TT', N'Tiểu thuyết')
INSERT [dbo].[LoaiSach] ([MaLoaiSach], [TenLoaiSach]) VALUES (N'VH', N'Văn học')
GO
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [DiaChi], [NgaySinh], [SoDienThoai], [CMND]) VALUES (N'NV01', N'Đoàn', N'Trung Phong', N'Quận Tân Phú', N'04/10/2002', NULL, N'11111111')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [DiaChi], [NgaySinh], [SoDienThoai], [CMND]) VALUES (N'NV02', N'Phạm', N'Hữu Đức', N'Quận Gò Vấp', N'10/12/2002', NULL, N'22222222')
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [DiaChi], [NgaySinh], [SoDienThoai], [CMND]) VALUES (N'NV03', N'Đặng ', N'Văn Trường An', N'Quận Tân Bình', N'08/09/002', NULL, N'33333333')
GO
INSERT [dbo].[Sach] ([MaSach], [TenSach], [DonViTinh], [GiaTien], [NhaXuatBan], [MoTa], [HinhAnh], [MaLoaiSach]) VALUES (N'KH01', N'Sự Sống, Vũ Trụ Và Vạn Vật', N'quyển', 130000, N'Phụ Nữ', N'Bầu trời đêm trên hành tinh Krikkit là cảnh tượng kém thú vị nhất: đen ngòm không một ánh trăng sao. Đó là lý do người Krikkit sốc nặng khi thấy một con tàu vũ trụ bốc cháy ngùn ngụt lao về phía mình. Thì ra ngoài chốn điền viên mục đồng họ vốn quen thuộc từ thời cổ đại, còn tồn tại muốn vận thế giới khác ngoài khoảng không bao là đen kịt gọi là Vũ Trụ !!! Những cư dân hiền hòa yêu ca hát ấy làm gì để vượt qua cú choáng váng này? Họ quyết tiêu diệt toàn bộ sự sống, Vũ Trụ và vạn vật ngoài hành tinh.

Song, đứng chắn lù lù giữa họ và sự tận diệt của Vũ Trụ vẫn còn năm nhân vật đã thân quen với chúng ta qua hai cuốn đầu của series Bí kíp quá giang vào Ngân Hà. Họ, bằng sức mạnh của sự ngớ ngẩn, điên rồ, nhảm nhít, trầm cảm, nhát cáy (ừ thì cũng còn le lói chút trí tuệ từ người này sang người kia), liệu có cứu được thế giới, hay đúng hơn là, Vũ Trụ?', N'sach1.jpg', N'KH')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [DonViTinh], [GiaTien], [NhaXuatBan], [MoTa], [HinhAnh], [MaLoaiSach]) VALUES (N'KH02', N'Trái Đất và Vũ Trụ', N'quyển', 90000, N'NXB Thanh Niên', N' Các bạn hãy khám phá Trái Đất - nơi có những đại dương mênh mông, những lục địa đang chuyển động, sự tồn tại của các sinh vật sống và vũ trụ - khoảng không gian vô cùng tận ẩn chứa bao điều bí mật ở trong cuốn sách tuyệt vời này nhé! Những hình ảnh, bản đồ, sơ đồ được minh họa sống động, trực quan chắc chắn sẽ thu hút trí tưởng tượng phong phú của các bạn. Không chỉ vậy, cuốn sách còn là tài liệu ôn tập hữu ích với:
- Nhiều thí nghiệm, trò chơi và hoạt động được thiết kế để giúp cho việc tiếp cận kiến thức trở nên dễ dàng hơn.
- Một bảng thuật ngữ khoa học đi kèm định nghĩa đầy đủ và dễ hiểu, cùng một bảng chú dẫn toàn diện.
- Hàng trăm website đã qua lựa chọn và kiểm duyệt.
- Rất nhiều tranh ảnh có thể tải về miễn phí để sử dụng trong quá trình học tập.
Đây chính là cuốn sách bách khoa tra cứu thuận tiện và dễ dàng ghi nhớ dành cho những bộ óc mê khám phá!', N'sach2.jpg', N'KH')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [DonViTinh], [GiaTien], [NhaXuatBan], [MoTa], [HinhAnh], [MaLoaiSach]) VALUES (N'KTH01', N'Kinh Tế Học Hài Hước', N'quyển', 120000, N'NXB Lao Động', N'Kinh Tế Học Hài Hước dẫn chứng rất nhiều câu chuyện và tình huống diễn ra thường ngày và nhận định cách mà chúng ta giải quyết chúng vô lý ra sao. Bằng cách dùng kinh tế học để phân tích tất cả những vấn đề xã hội, con người, đời sống thường nhật, cuốn sách sẽ thay đối thế giới quan và cách bạn nhìn nhận thế giới này. Rằng tại sao các quyết định của chúng ta thường phi lý, tại sao những mánh khóe tưởng chừng khôn ngoan hóa ra lại sai bét và chúng ta bị dụ dỗ như thế nào?', N'sach3.jpg', N'KTH')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [DonViTinh], [GiaTien], [NhaXuatBan], [MoTa], [HinhAnh], [MaLoaiSach]) VALUES (N'KTH02', N'Trí Tuệ Xúc Cảm', N'quyển', 169000, N'NXB Công Thương', N'Trí tuệ xúc cảm ứng dụng trong công việc là cuốn sách quản trị kinh doanh không thể bỏ qua cho bất cứ nhà lãnh đạo nào. Cuốn sách chỉ cho ta biết các vấn đề như: tự kiểm soát cảm xúc, tự kiểm soát hành động, khả năng tự nhận thức bản thân, sự đổi mới, khả năng thích nghi, hy vọng, kiên trì, khả năng lắng nghe, cảm thông, đồng cảm, khích lệ, nâng đỡ người khác, tạo sự ảnh hưởng và liên kết các mối quan hệ …', N'sach4.jpg', N'KTH')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [DonViTinh], [GiaTien], [NhaXuatBan], [MoTa], [HinhAnh], [MaLoaiSach]) VALUES (N'TL01', N'Nghệ thuật giải mã hành vi', N'quyển', 120000, N'NXB Thanh Niên', N'Cuốn sách Tâm lý học – Nghệ thuật giải mã hành vi của tác giả Trần Lộ sẽ cung cấp cho chúng ta những lý luận uy tín và kỳ diệu của tâm lý học để có thể đọc suy nghĩ của người khác, cũng như phá tan phòng tuyến tâm lý con người. Trên thực tế, một số lượng lớn hành vi và cử chỉ của con người được thực hiện một cách vô thức. Do sự vô thức đó tiệm cận với nơi sâu kín nhất trong tâm trí, nên những hành động bản năng này sẽ thể hiện nội tâm con người một cách rõ ràng nhất. Vì vậy, thông qua hành vi, tính cách, ngôn ngữ cơ thể, sở thích… thậm chí là lời nói dối của đối phương để có thể khai thác “Ma pháp”- suy nghĩ thực sự trong lòng người khác.', N'sach5.jpg', N'TL')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [DonViTinh], [GiaTien], [NhaXuatBan], [MoTa], [HinhAnh], [MaLoaiSach]) VALUES (N'TL02', N'Tư Duy Nhanh Và Chậm', N'quyển', 190000, N'NXB Thế Giới', N'Chúng ta thường tự cho rằng con người là sinh vật có lý trí mạnh mẽ, khi quyết định hay đánh giá vấn đề luôn kĩ lưỡng và lý tính. Nhưng sự thật là, dù bạn có cẩn trọng tới mức nào, thì trong cuộc sống hàng ngày hay trong vấn đề liên quan đến kinh tế, bạn vẫn có những quyết định dựa trên cảm tính chủ quan của mình. “Tư duy nhanh và chậm”, cuốn sách nổi tiếng tổng hợp tất cả nghiên cứu được tiến hành qua nhiều thập kỷ của nhà tâm lý học từng đạt giải Nobel Kinh tế Daniel Kahneman sẽ cho bạn thấy những sư hợp lý và phi lý trong tư duy của chính bạn. Cuốn sách được đánh giá là “kiệt tác” trong việc thay đổi hành vi của con người, Tư duy nhanh và chậm đã dành được vô số giải thưởng danh giá, lọt vào Top 11 cuốn sách kinh doanh hấp dẫn nhất năm 2011. Alpha Books đã mua bản quyền và sẽ xuất bản cuốn sách trong Quý 1 năm nay. Tư duy nhanh và chậm dù là cuốn sách có tính hàn lâm cao nhưng vô cùng bổ ích với tất cả mọi người và đặc biệt rất dễ hiểu và vui nhộn.', N'sach6.jpg', N'TL')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [DonViTinh], [GiaTien], [NhaXuatBan], [MoTa], [HinhAnh], [MaLoaiSach]) VALUES (N'TT01', N'Cây Cam Ngọt Của Tôi', N'quyển', 110000, N'NXB Hội Nhà Văn', N'Hãy làm quen với Zezé, cậu bé tinh nghịch siêu hạng đồng thời cũng đáng yêu bậc nhất, với ước mơ lớn lên trở thành nhà thơ cổ thắt nơ bướm. Chẳng phải ai cũng công nhận khoản “đáng yêu” kia đâu nhé. Bởi vì, ở cái xóm ngoại ô nghèo ấy, nỗi khắc khổ bủa vây đã che mờ mắt người ta trước trái tim thiện lương cùng trí tưởng tượng tuyệt vời của cậu bé con năm tuổi.

Có hề gì đâu bao nhiêu là hắt hủi, đánh mắng, vì Zezé đã có một người bạn đặc biệt để trút nỗi lòng: cây cam ngọt nơi vườn sau. Và cả một người bạn nữa, bằng xương bằng thịt, một ngày kia xuất hiện, cho cậu bé nhạy cảm khôn sớm biết thế nào là trìu mến, thế nào là nỗi đau, và mãi mãi thay đổi cuộc đời cậu.
Mở đầu bằng những thanh âm trong sáng và kết thúc lắng lại trong những nốt trầm hoài niệm, Cây cam ngọt của tôi khiến ta nhận ra vẻ đẹp thực sự của cuộc sống đến từ những điều giản dị như bông hoa trắng của cái cây sau nhà, và rằng cuộc đời thật khốn khổ nếu thiếu đi lòng yêu thương và niềm trắc ẩn. Cuốn sách kinh điển này bởi thế không ngừng khiến trái tim người đọc khắp thế giới thổn thức, kể từ khi ra mắt lần đầu năm 1968 tại Brazil.', N'sach7.jpg', N'TT')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [DonViTinh], [GiaTien], [NhaXuatBan], [MoTa], [HinhAnh], [MaLoaiSach]) VALUES (N'TT02', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ', N'quyển', 60000, N'NXB Trẻ', N'Trong Cho tôi xin một vé đi tuổi thơ, nhà văn Nguyễn Nhật Ánh mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.', N'sach8.jpg', N'TT')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [DonViTinh], [GiaTien], [NhaXuatBan], [MoTa], [HinhAnh], [MaLoaiSach]) VALUES (N'VH01', N'Vợ Nhặt', N'quyển', 45000, N'NXB Văn Học', N'Tác phẩm "Vợ Nhặt" của tác giả Kim Lân (1921-2007). Ông là một trong những cây bút viết truyện ngắn xuất sắc nhất của văn học Việt Nam hiện đại. Với “Vợ Nhặt”, tác giả viết về cái đói, khi đói người ta thường khổ cực và chỉ muốn chết. Nhưng không, khi đói người ta không nghĩ đến con đường chết mà chỉ nghĩ đến con đường sống. Dù ở trong tình huống bi thảm đến đâu, dù kề cận cái chết vẫn khát khao được sống, được hạnh phúc, vẫn hướng về ánh sáng, vẫn tin vào sự sống và hy vọng ở tương lai, vẫn muốn sống, sống cho ra người... Chúng ta có thể thấy được điều này ở các nhân vật trong tập truyện ngắn này.', N'sach9.jpg', N'VH')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [DonViTinh], [GiaTien], [NhaXuatBan], [MoTa], [HinhAnh], [MaLoaiSach]) VALUES (N'VH02', N'Giông Tố', N'quyển', 55000, N'NXB Văn Học', N'Cuốn sách này mang tính chất của một công trình văn bản học. Người ta biết rằng, văn bản học như một ngành của ngữ văn học, vốn thiên về thực hành; nó gắn với thực tiễn xuất bản, gắn với việc công bố các tác phẩm viết bằng chữ; vì vậy hầu hết các nhà chuyên môn về biên tập sách, ở mức nhất định, đều can dự đến công tác văn bản. Tuy vậy, cho đến nay, cả trong giới làm biên tập sách lẫn giới nghiên cứu văn học ở ta hầu như chỉ có rất ít chuyên gia về văn bản.', N'sach10.jpg', N'VH')
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_MaSach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_MaSach]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HD] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_CTHD_HD]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_MaLoaiSach] FOREIGN KEY([MaLoaiSach])
REFERENCES [dbo].[LoaiSach] ([MaLoaiSach])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_MaLoaiSach]
GO
