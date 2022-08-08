use busan;

-- 공통코드
select
	a.cg_seq,
	a.seq,
    a.name,
    b.name
from cc a
left join codegroup b on b.seq = a.cg_seq
;

-- 공통코드2
select
	a.name,
    b.cg_seq,
    b.name,
    b.seq
from codegroup a
left join cc b on b.cg_seq = a.seq
;

-- 로그인
select
	nm
    ,id 
from member
where 1=1
and id = "yg9552" 
and password = "a123456"
;

-- 메인.베스트상품
select
	a.product_name,
    a.price,
    b.seq
from product a
join best_products b on b.product_seq = a.seq
;

-- 상품정보
select
	a.product_name,
	a.price,
    a.reserve,
    a.deliveryinfo,
    a.delivertcost,
    a.origin_seq,
    b.nation
from product a
join origin b on b.seq = a.origin_seq
where 1=1
and product_name like "%더블%"
;

-- 상품 상세정보
select
	a.seq,
    a.origin_seq
    ,a.brand_seq
    ,a.newNY
    ,b.nation
    ,c.brand_name
    ,d.seq
    ,d.name
from product a
join origin b on b.seq = a.origin_seq
join brand c on c.seq = a.brand_seq
join cc d on d.seq = a.manufacturer_code
where 1=1
and a.seq = 5
;

-- 상품 리뷰
select
	a.title
	,a.contents
	,a.regtime
    ,b.id
    ,c.product_name
from product_review a
join member b on b.seq = a.member_seq
join product c on c.seq = a.prod_seq
where 1=1
-- and product_name like "%더블%"
and c.seq = 5
-- and c.seq = 1
;

-- 상품 Q&A
select
	a.AnswerNY
    ,a.Question
    ,a.Regtime
    ,b.id
    ,c.product_name
from `product_Q&A` a
join member b on b.seq = a.member_seq
join product c on c.seq = a.prod_seq
where 1=1
and c.seq = 5
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
-- join member_addr b on b.member_seq = a.seq
where nm = "송강호"
;

-- 전화번호 목록
select
	a.seq
    ,a.nm
    ,a.id
    ,b.div_tel
    ,b.tel
    ,c.name
from member a
left join member_tel b on b.member_seq = a.seq
-- join member_tel b on b.member_seq = a.seq
-- left join cc c on c.seq = b.tel_company_code
join cc c on c.seq = b.tel_company_code
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
-- inner join reged_card b on b.member_seq = a.seq
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
-- inner join product b on b.origin_seq = a.seq
;

-- 