
CREATE TABLE DEAN
(
	MADA INT NOT NULL,
	TENDA NVARCHAR(15),
	DDIEM_DA NVARCHAR(15) NOT NULL,
	PHONG INT NOT NULL,
	PRIMARY KEY (MADA)
)

CREATE TABLE PHONGBAN
(
	TENPHG NVARCHAR(15),
	MAPHG INT NOT NULL,

	TRPHG NVARCHAR(9),
	NG_NHANCHUC DATE,
	PRIMARY KEY (MAPHG)
)

CREATE TABLE DIADIEM_PHG
(
	MAPHG INT NOT NULL,
	DIADIEM NVARCHAR(15),
	PRIMARY KEY (MAPHG, DIADIEM)
)

CREATE TABLE NHANVIEN
(
	HONV NVARCHAR(15),
	TENLOT NVARCHAR(15),
	TENNV NVARCHAR(15),
	MANV NVARCHAR(9) NOT NULL,
	NGSINH DATE,
	DCHI NVARCHAR(30),
	PHAI NVARCHAR(3),
	LUONG FLOAT,
	MA_NQL NVARCHAR(9),
	PHG INT NOT NULL,
	PRIMARY KEY (MANV)
)

CREATE TABLE THANNHAN
(
	MA_NVIEN NVARCHAR(9) NOT NULL,

	TENTN NVARCHAR(15),
	PHAI NVARCHAR(3),
	NGSINH DATE,
	QUANHE NVARCHAR(15),
	PRIMARY KEY (MA_NVIEN, TENTN)
)

CREATE TABLE CONGVIEC
(
	MADA INT NOT NULL,
	STT INT NOT NULL,
	TEN_CONG_VIEC NVARCHAR(50),
	PRIMARY KEY (MADA, STT)
)

CREATE TABLE PHANCONG
(
	MA_NVIEN NVARCHAR(9) NOT NULL,
	MADA INT NOT NULL,
	STT INT NOT NULL,
	THOIGIAN FLOAT,
	PRIMARY KEY (MA_NVIEN, MADA, STT)
)

-- Cài đặt ràng buộc khóa ngoại cho các bảng
ALTER TABLE DEAN
ADD CONSTRAINT FK_DEAN_PHONG FOREIGN KEY (PHONG) REFERENCES PHONGBAN (MAPHG)

ALTER TABLE PHONGBAN
ADD CONSTRAINT FK_PHONGBAN_NHANVIEN FOREIGN KEY (TRPHG) REFERENCES NHANVIEN (MANV)

ALTER TABLE DIADIEM_PHG
ADD CONSTRAINT FK_DIADIEM_PHG_PHONGBAN FOREIGN KEY (MAPHG) REFERENCES PHONGBAN (MAPHG)

ALTER TABLE CONGVIEC
ADD CONSTRAINT FK_CONGVIEC_DEAN FOREIGN KEY (MADA) REFERENCES DEAN (MADA)

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_PHONGBAN FOREIGN KEY (PHG) REFERENCES PHONGBAN (MAPHG)

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_NHANVIEN FOREIGN KEY (MA_NQL) REFERENCES NHANVIEN (MANV)

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_DEAN FOREIGN KEY (MADA) REFERENCES DEAN (MADA)

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_NHANVIEN FOREIGN KEY (MA_NVIEN) REFERENCES NHANVIEN (MANV)

ALTER TABLE THANNHAN
ADD CONSTRAINT FK_THANNHAN_NHANVIEN FOREIGN KEY (MA_NVIEN) REFERENCES NHANVIEN (MANV)

BEGIN /** NHANVIEN **/
	ALTER TABLE NHANVIEN
	NOCHECK CONSTRAINT ALL
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI,LUONG, MA_NQL, PHG)
	VALUES (N'Đinh', N'Bá', N'Tiến', '009', '02/11/1960', N'119, Cống Quỳnh, TP.HCM', N'Nam', 30000, '005', 5)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Nguyễn', N'Thanh', N'Tùng', '005', '08/20/1962', N'222, Nguyễn Văn Cừ, TP.HCM', N'Nam', 40000, '006', 5)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Bùi', N'Ngọc', N'Hằng', '007', '03/11/1954', N'332, Nguyễn Thái Học, TP.HCM', N'Nam', 25000, '001', 4)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
    VALUES (N'Lê', N'Quỳnh', N'Như', '001', '02/01/1967', N'291, Hồ Văn Huê, TP.HCM', N'Nữ', 43000, '006', 4)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Nguyễn', N'Mạnh', N'Hùng', '004', '03/04/1967', N'95, Bà Rịa - Vũng Tàu', N'Nam', 38000, '005', 5)

	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Trần', N'Thanh', N'Tâm', '003', '05/04/1957', N'34, Mai Thị Lự, TP.HCM', N'Nam', 25000, '005', 5)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Trần', N'Hồng', N'Quang', '008', '09/01/1967', N'45, Lê Hồng Phong, TP.HCM', N'Nam', 25000, '001', 4)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, PHG)
	VALUES (N'Phạm', N'Văn', N'Vinh', '006', '01/01/1965', N'45, Trưng Vương', N'Nữ', 55000, 1)

	ALTER TABLE NHANVIEN
	CHECK CONSTRAINT ALL
END

BEGIN /** PHONGBAN **/
	ALTER TABLE PHONGBAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	VALUES (N'Nghiên cứu', 5, '005', '05/22/1978')
	INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	VALUES (N'Điều hành', 4, '008', '01/01/1985')
	INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	VALUES (N'Quản lý', 1, '006', '06/19/1971')
	ALTER TABLE PHONGBAN
	CHECK CONSTRAINT ALL
END

BEGIN /** DEAN **/
	ALTER TABLE DEAN
	NOCHECK CONSTRAINT ALL

	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Sản phẩm X', 1, N'Vũng Tàu', 5)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Sản phẩm Y', 2, N'Nha Trang', 5)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Sản phẩm Z', 3, N'TP.HCM', 5)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Tin học hóa', 10, N'Hà Nội', 4)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Cáp quang', 20, N'TP.HCM', 1)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Đào tạo', 30, N'Hà Nội', 4)
	ALTER TABLE DEAN
	CHECK CONSTRAINT ALL
END

BEGIN /** THANNHAN **/
	ALTER TABLE THANNHAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('005', N'Trinh', N'Nữ', '04/05/1976', N'Con gái')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('005', N'Khang', N'Nam', '10/25/1973', N'Con trai')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('005', N'Phương', N'Nữ', '05/03/1948', N'Vợ chồng')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('001', N'Minh', N'Nam', '02/29/1932', N'Vợ chồng')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('009', N'Tiến', N'Nam', '01/01/1978', N'Con trai')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)

	VALUES ('009', N'Châu', N'Nữ', '12/30/1978', N'Con gái')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES ('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')
	ALTER TABLE THANNHAN
	CHECK CONSTRAINT ALL
END

BEGIN /** DIADIEM_PHG **/
	ALTER TABLE DIADIEM_PHG
	NOCHECK CONSTRAINT ALL
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (1, N'TP.HCM')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (4, N'Hà Nội')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'Vũng Tàu')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'Nha Trang')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'TP.HCM')
	ALTER TABLE DIADIEM_PHG
	CHECK CONSTRAINT ALL
END

BEGIN /** PHANCONG **/
	ALTER TABLE PHANCONG
	NOCHECK CONSTRAINT ALL
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('009', 1, 1, 32)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)

	VALUES ('009', 2, 2, 8)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('004', 3, 1, 40)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('003', 1, 2, 20.0)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('003', 2, 1, 20.0)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('008', 10, 1, 35)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('008', 30, 2, 5)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('001', 30, 1, 20)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('001', 20, 1, 15)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('006', 20, 1, 30)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 3, 1, 10)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 10, 2, 10)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 20, 1, 10)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 1, 1, 10)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 2, 2, 10)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 30, 1, 10)

	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('007', 30, 2, 30)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('007', 10, 2, 10)
	ALTER TABLE PHANCONG
	CHECK CONSTRAINT ALL
END

BEGIN /** CONGVIEC **/
	ALTER TABLE CONGVIEC
	NOCHECK CONSTRAINT ALL
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (1, 1, N'Thiết kế sản phẩm X')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (1, 2, N'Thử nghiệm sản phẩm X')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (2, 1, N'Sản xuất sản phẩm Y')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (2, 2, N'Quảng cáo sản phẩm Y')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (3, 1, N'Khuyến mãi sản phẩm Z')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (10, 1, N'Tin học hóa phòng nhân sự')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (10, 2, N'Tin học hóa phòng kinh doanh')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
VALUES (20, 1, N'Lắp đặt cáp quang')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (30, 1, N'Đào tạo nhân viên Marketing')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)

	VALUES (30, 2, N'Đào tạo chuyên viên thiết kế')
	ALTER TABLE CONGVIEC
	CHECK CONSTRAINT ALL
END
GO


/*--BT.1. Cho biết thông tin chi tiết của các nhân viên --*/
SELECT *
FROM  NHANVIEN
SELECT *
FROM PHONGBAN

SELECT *
FROM DEAN

SELECT *
FROM THANNHAN

SELECT *
FROM DIADIEM_PHG

SELECT *
FROM PHANCONG

SELECT *
FROM CONGVIEC

/*--BT.2. Cho biết họ và tên các nhân viên ở phòng số 5. */
SELECT HONV, TENNV
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND PHONGBAN.MAPHG = 5


--BT.3. Cho biết tên phòng mà nhân viên trực thuộc.  */
SELECT DISTINCT TENPHG
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.PHG = PHONGBAN.MAPHG 


SELECT *
FROM PHONGBAN
SELECT *
FROM NHANVIEN
--BT.4. Cho biết tên của trưởng phòng phòng nghiên cứu. */
SELECT (NHANVIEN.HONV+ ' '+ NHANVIEN.TENLOT+' ' + NHANVIEN.TENNV) AS TENTG
FROM NHANVIEN
WHERE MANV  IN (
             SELECT TRPHG
			 FROM PHONGBAN
			 WHERE  TENPHG =N'Nghiên cứu' 
			 )

--BT.5. Cho biết mức lương trung bình của từng phòng ban */

SELECT PHONGBAN.MAPHG, PHONGBAN.TENPHG, AVG(LUONG) AS LTB
FROM PHONGBAN
JOIN NHANVIEN ON PHONGBAN.MAPHG = NHANVIEN.PHG
GROUP BY PHONGBAN.MAPHG, TENPHG

--BT.6. Cho biết tên các phòng có mức lương trung bình cao nhất */
  -- CÁCH 1 ----
	SELECT PB.TENPHG, AVG(NV.LUONG) AS Luong_TB
    FROM NHANVIEN NV
    JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG
    GROUP BY PB.TENPHG
	HAVING AVG(NV.LUONG)>= ALL(SELECT AVG(NV.LUONG) AS Luong_TB
							FROM NHANVIEN NV
							JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG
							GROUP BY PB.TENPHG)

   -- CÁCH 2 ---
 

 GO 
   with AVG_LUONGTAM AS (
   SELECT AVG(NV.LUONG) 
   FROM NHANVIEN NV
   JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG
  GROUP BY PB.TENPHG
)





--BT.7. Cho biết tên các nhân viên không tham gia đề án nào */

SELECT (NHANVIEN.HONV +' ' + NHANVIEN.TENLOT+' ' + NHANVIEN.TENNV) AS TENTG
FROM NHANVIEN
WHERE MANV NOT IN (
                    SELECT PHANCONG.MA_NVIEN
					FROM PHANCONG
					)
--BT.8. Cho biết tên các nhân viên tham gia tất cả các đề án*/

/* cách 1 */
SELECT NV.HONV +SPACE(1)+NV.TENLOT +SPACE(1)+ NV.TENNV AS HOTEN
FROM NHANVIEN NV
JOIN PHANCONG PC ON NV.MANV = PC.MA_NVIEN
GROUP BY NV.HONV, NV.TENLOT, NV.TENNV
HAVING COUNT(DISTINCT PC.MADA)  = (SELECT COUNT(DISTINCT MADA) FROM DEAN);			

/* cách 2 */
with SL_DA AS (
   SELECT NHANVIEN.TENNV, COUNT(PHANCONG.MADA) AS SLDA
   FROM NHANVIEN, PHANCONG
   WHERE NHANVIEN.MANV = PHANCONG.MA_NVIEN
   GROUP BY NHANVIEN.TENNV
)

SELECT TENNV,  SLDA
FROM  SL_DA 
WHERE  SLDA = (SELECT MAX( SLDA) FROM  SL_DA )




--BT.9. Cho biết tên các nhân viên tham gia trên 2 đề án ở TP.HCM. 


SELECT *
FROM DEAN
SELECT *
FROM PHANCONG

SELECT TENNV
FROM NHANVIEN
JOIN PHANCONG ON NHANVIEN.MANV = PHANCONG.MA_NVIEN
JOIN DEAN ON DEAN.MADA = PHANCONG.MADA 
WHERE  DEAN.DDIEM_DA = N'%TP.HCM'
GROUP BY TENNV
HAVING COUNT(PHANCONG.MADA) >= 2


--BT.10. Cho biết tên nhân viên và mức lương của nhân viên phòng Nghiên cứu */

SELECT TENNV , LUONG
FROM PHONGBAN, NHANVIEN
WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND TENPHG=N'Nghiên cứu ' 

--BT.11. Cho biết tên nhân viên có mức lương cao nhất ở phòng nghiên cứu. */
/* CÁCH 1 */
SELECT (NHANVIEN.HONV + NHANVIEN.TENLOT + NHANVIEN.TENNV) AS HOTENNV, LUONG
	FROM NHANVIEN, PHONGBAN
	WHERE PHONGBAN.MAPHG=NHANVIEN.PHG AND TENPHG=N'Nghiên cứu' AND LUONG>= ALL(
							SELECT LUONG
									FROM PHONGBAN, NHANVIEN
									WHERE PHONGBAN.MAPHG=NHANVIEN.PHG AND TENPHG=N'Nghiên cứu'
									)
/* CÁCH 2 */

  SELECT (NHANVIEN.HONV + NHANVIEN.TENLOT + NHANVIEN.TENNV) AS HOTENNV, LUONG
	FROM NHANVIEN
	JOIN PHONGBAN ON PHONGBAN.MAPHG=NHANVIEN.PHG 
	WHERE TENPHG=N'Nghiên cứu' AND NHANVIEN.LUONG =(
							        SELECT MAX(LUONG)
									FROM PHONGBAN, NHANVIEN
									WHERE PHONGBAN.MAPHG=NHANVIEN.PHG AND TENPHG=N'Nghiên cứu'
									)

--BT.12. Tìm tất cả nhân viên làm việc ở phòng Điều hành (GIỐNG CÂU 2).
	SELECT HONV, TENLOT, TENNV, (HONV+' '+TENLOT+' '+TENNV) AS HOTEN
	FROM NHANVIEN,PHONGBAN
	WHERE PHONGBAN.MAPHG=NHANVIEN.PHG AND TENPHG=N'Điều hành'

--BT.13. Tìm các nhân viên có mức lương trên 30000.
	SELECT *
	FROM NHANVIEN
	WHERE LUONG>30000

--BT.14. Tìm các nhân viên có mức lương trên 25000 ở phòng 4 hoặc các nhân viên có mức lương trên 30,000 ở phòng 5.
	SELECT *
	FROM NHANVIEN,PHONGBAN
	WHERE (PHONGBAN.MAPHG=NHANVIEN.PHG AND ((LUONG>25000 AND NHANVIEN.PHG=4) OR (LUONG>30000 AND NHANVIEN.PHG=5)))

--BT.15. Cho biết họ tên đầy đủ của các nhân viên ở TP.HCM và tên bắt đầu bằng chữ T..
	SELECT HONV, TENLOT, TENNV, (HONV+' '+TENLOT+' '+TENNV) AS HOTEN, DCHI
	FROM NHANVIEN
	WHERE DCHI LIKE N'%TP.HCM' AND TENNV LIKE N'T%'


--BT.16. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N' hoặc có năm sinh trước 1962.
	SELECT HONV, TENLOT, TENNV, (HONV+' '+TENLOT+' '+TENNV) AS HOTEN,YEAR(NGSINH) AS NAMSINH
	FROM NHANVIEN
	WHERE HONV LIKE N'N%' OR YEAR(NGSINH) < 1962

--BT.17. Cho biết họ tên đầy đủ, năm sinh và địa điểm dự án của các nhân viên có năm sinh trong khoảng 1960 đến 1965 và tham gia dự án ở Hà Nội.
	SELECT  (HONV+' '+TENLOT+' '+TENNV) AS HOTEN,YEAR(NGSINH) AS NAMSINH
	FROM NHANVIEN, DEAN
	WHERE  (YEAR(NGSINH) BETWEEN 1960 AND 1965) AND DEAN.DDIEM_DA =N'%Hà Nội' 



	SELECT HONV, TENLOT, TENNV, (HONV+' '+TENLOT+' '+TENNV) AS HOTEN, YEAR(NGSINH) AS NAMSINH, DDIEM_DA
	FROM NHANVIEN, DEAN
	WHERE DDIEM_DA=N'Hà Nội' AND (YEAR(NGSINH) BETWEEN 1960 AND 1965)


--BT.18. Cho biết tên những thân nhân là nữ và mối quan hệ với nhân viên có mã nhân viên 009.
	SELECT *
	FROM NHANVIEN, THANNHAN
	WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN AND THANNHAN.PHAI= N'Nữ' AND MANV='009'

--BT.19. Cho biết các nhân viên có tuổi dưới 65.
SELECT *
FROM NHANVIEN 
WHERE DATEDIFF(YEAR, NGSINH, GETDATE()) < 65

-- BT20. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng */
SELECT PHONGBAN.TENPHG , DIADIEM_PHG.DIADIEM
FROM PHONGBAN, DIADIEM_PHG
WHERE PHONGBAN.MAPHG = DIADIEM_PHG.MAPHG


-- BT21. Tìm tên những người trưởng phòng của từng phòng ban */
SELECT TENPHG, (NHANVIEN.HONV+' '+ NHANVIEN.TENLOT+' ' + NHANVIEN.TENNV) AS TENTP
FROM PHONGBAN, NHANVIEN
WHERE PHONGBAN.MAPHG = NHANVIEN.PHG

-- BT22. Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Nghiên cứu" */
SELECT (NHANVIEN.HONV+' '+ NHANVIEN.TENLOT+' ' + NHANVIEN.TENNV) AS TENTP,  NHANVIEN.DCHI
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.PHG = PHONGBAN.MAPHG AND PHONGBAN.TENPHG =N'Nghiên cứu' 
-- BT23. Với mỗi đề án ở Hà Nội, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.

SELECT *
FROM DEAN
SELECT *
FROM NHANVIEN
SELECT *
FROM PHONGBAN

SELECT DISTINCT  TENDA, TENPHG, (NHANVIEN.HONV+' '+ NHANVIEN.TENLOT+' ' + NHANVIEN.TENNV) AS TENTP, NG_NHANCHUC
FROM PHANCONG
JOIN NHANVIEN ON NHANVIEN.MANV =  PHANCONG.MA_NVIEN
JOIN PHONGBAN ON PHONGBAN.TRPHG = NHANVIEN.MANV
JOIN DEAN ON DEAN.PHONG = PHONGBAN.MAPHG
WHERE DEAN.DDIEM_DA = N'Hà Nội' 

-- BT24. Tìm tên những nữ nhân viên và tên người thân của họ */
SELECT (NHANVIEN.HONV+' '+ NHANVIEN.TENLOT+' ' + NHANVIEN.TENNV) AS TENTP, THANNHAN.TENTN
FROM NHANVIEN, THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MA_NVIEN AND NHANVIEN.PHAI = N'Nữ' 

-- BT25. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp củan nhân viên đó */
                             
SELECT *
FROM  NHANVIEN

SELECT 
    (NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV) AS TENNV, 
    (NQL.HONV + ' ' + NQL.TENLOT + ' ' + NQL.TENNV) AS TEN_NQL
FROM NHANVIEN NV
LEFT JOIN NHANVIEN NQL ON NV.MA_NQL = NQL.MANV


-- BT26. Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó */
SELECT *
FROM  NHANVIEN

SELECT *
FROM  PHONGBAN

SELECT 
    (NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV) AS TENNV
FROM NHANVIEN NV
JOIN PHONGBAN ON PHONGBAN.MAPHG = NV.PHG
LEFT JOIN NHANVIEN NQL ON NV.MA_NQL = NQL.MANV



 
-- BT27. Tên những nhân viên phòng số 5 có tham gia vào đề án "Sản phẩm X" và nhân viên này do "Nguyễn Thanh Tùng" quản lý trực tiếp.
-- BT28. Cho biết tên các đề án mà nhân viên Đinh Bá Tiến đã tham gia.

-- BT29. Cho biết số lượng đề án của công ty.
-- BT30. Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì.
-- BT31. Cho biết lương trung bình của các nữ nhân viên.
-- BT32. Cho biết số thân nhân của nhân viên 'Nguyễn Thanh Tùng'.
-- BT33. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc [một tuần] của tất cả các nhân
viên tham dự đề án đó.
-- BT34. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó.
-- BT35. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên
đó.
-- BT36. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó
đã tham gia.
-- BT37. Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản lý trực tiếp.
-- BT38. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên
làm việc cho phòng ban đó.
-- BT39. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số
lượng nhân viên của phòng ban đó.
-- BT40. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ
trì.
-- BT41. Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng
đề án mà phòng ban đó chủ trì.

-- BT42. Với mỗi phòng ban có mức lương trung bình lớn hơn 40,000, cho biết tên phòng ban
và số lượng đề án mà phòng ban đó chủ trì.
-- BT43. Cho biết số đề án diễn ra tại từng địa điểm.
-- BT44. Với mỗi đề án, cho biết tên đề án và số lượng công việc của đề án này.
-- BT45. Với mỗi công việc trong đề án có mã đề án là 30, cho biết số lượng nhân viên được
phân công.
-- BT46. Với mỗi công việc trong đề án có mã đề án là 'Đào Tạo', cho biết số lượng nhân viên
được phân công.
BEGIN /* 2.3 TRUY VẤN LỒNG + GOM NHÓM */
-- BT47. Cho biết danh sách các đề án (MADA) có: nhân công với họ (HONV) là 'Đinh' hoặc
có người trưởng phòng chủ trì đề án với họ (HONV) là 'Đinh'.
-- BT48. Danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân.
-- BT49. Danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân nhân
nào.
-- BT50. Danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một
thân nhân.
-- BT51. Tìm họ (HONV) của những trưởng phòng chưa có gia đình.
-- BT52. Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương
trung bình của phòng "Nghiên cứu".
-- BT53. Cho biết tên phòng ban và họ tên trưởng phòng của phòn ban có đông nhân viên nhất.
-- BT54. Cho biết danh sách các mã đề án mà nhân viên có mã là 009 chưa làm.
-- BT55. Cho biết danh sách các công việc (tên công việc) trong đề án "Sản phẩm X" mà nhân
viên có mã là 009 chưa làm.
-- BT56. Tìm họ tên và địa chỉ của những nhân viên làm việc cho một đề án ở 'TP HCM' nhưng
phòng ban mà họ trực thuộc lại không tọa lạc ở thành phố 'TP HCM'.
-- BT57. Tổng quát câu 46, tìm họ tên và địa chỉ của các nhân viên làm việc cho một đề án ở
một thành phố nhưng phòng ban mà họ trực thuộc lại không toạ lạc ở thành phố đó.