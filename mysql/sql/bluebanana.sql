use busan;
-- 공통코드
select
	a.seq,
    a.name,
	a.cg_seq,
    b.name
from cc a
left join codegroup b on b.seq = a.cg_seq
;
select
	a.name,
    a.seq,
    b.name,
    b.seq
from codegroup a
left join cc b on b.cg_seq = a.seq
;

-- 로그인
select * from member where id = "yg9552" and password = "a123456"
;

-- 주소목록
select
	a.seq,
    a.nm,
    a.id,
	b.div_addr,
    b.addr,
    b.addr_detail,
    b.zip
from member a
left join member_addr b on b.member_seq = a.seq
;
-- 전화번호 목록
select
	a.seq,
    a.nm,
    a.id,
	b.div_tel,
    b.tel,
    b.tel_company_code
from member a
left join member_tel b on b.member_seq = a.seq
-- join member_tel b on b.member_seq = a.seq
;

-- 카드 목록
select
	a.seq,
    a.nm,
    a.id,
    b.div_reged_card,
    b.card
from member a
left join reged_card b on b.member_seq = a.seq
;

-- 주문 목록
select
	a.prod_seq,
    a.member_seq,
    b.nm,
    b.id,
    c.product_name,
    c.option_code
from purchase a
left join member b on b.seq = a.member_seq
left join product c on c.seq = a.prod_seq
;

-- 브랜드 목록
select
    a.product_name,
    b.brand_name
from product a
left join brand b on b.seq = a.brand_seq
;

-- 리뷰목록
select
	a.prod_seq,
    a.member_seq,
    a.title,
    a.Regtime,
    b.nm,
    c.product_name
from product_review a
left join member b on b.seq = a.member_seq
left join product c on c.seq = a.prod_seq
;

-- 장바구니 목록
select
	a.seq,
	b.nm,
    c.product_name
from cart a
left join member b on b.seq = a.member_seq
left join product c on c.seq = a.prod_seq
;

-- 원산지 목록
select
    a.nation,
    b.product_name
from origin a
left join product b on b.origin_seq = a.seq
;

-- 