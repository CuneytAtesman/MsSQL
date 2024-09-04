

-- KARGO HESAPLAMA NORTWIND KARGO TABLOSU YARATTIK

create function fn_kargo_hesapla
(
@DESI float
)
returns float
begin
declare @FIYAT float
select top 1@FIYAT=degeri from tbl_kargo where tbl_kargo.desiID <= @DESI order by tbl_kargo.desiID desc
return @FIYAT
end

--TEST

select * from tbl_kargo
select dbo.fn_kargo_hesapla(13) --Tabloya göre 13.2 gelir.

-- 29 gunden devam et