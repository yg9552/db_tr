use busan;

-- 공통코드
select
	a.cg_seq
	,a.seq
    ,a.name
    ,(select name from CodeGroup aa where aa.seq = a.cg_seq) as codegroupNM
from Code a
;

-- 공통코드2
select
	a.name,
    b.cg_seq,
    b.name,
    b.seq
from CodeGroup a
left join Code b on b.cg_seq = a.seq
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
	a.product_name
    ,a.price
    ,a.bestNy
from product a
where 1=1
and a.bestNy = 1
;
SELECT
			a.seq
		    ,a.product_name
		    ,(select name from Code aa WHERE 1=1 AND a.brand_code = aa.seq) as brandMFC
		    ,a.price
		    ,a.discount_percent
		    ,a.reserve
		    ,a.origin_seq
		    ,a.deliverycost
		    ,a.deliveryinfo
		    ,a.option_code
		    ,a.newNy
		    ,a.bestNy
		FROM product a
        ;


-- 상품정보
select
	a.seq
	,a.product_name
	,a.price
    ,a.reserve
    ,a.deliveryinfo
    ,a.deliverycost
    ,a.origin_seq
    ,a.newNy
    ,a.bestNy
    ,(select nation from origin aa WHERE 1=1 AND a.origin_seq = aa.seq) as nation
    ,b.name
    ,b.seq
from product a
left join Code b on b.seq = a.brand_code
-- left join CodeGroup c on c.seq = b.cg_seq
where 1=1;
-- and product_name like "%더블%"


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
and b.seq = 1
;

-- 상품 Q&A 2
select
	a.AnswerNY
    ,a.Question
    ,a.Regtime
    ,b.id
    ,(select product_name from product c where c.seq = a.prod_seq) as product_nm
from `product_Q&A` a
join member b on b.seq = a.member_seq
where 1=1
and b.seq = 1
;


-- 상품 주문
select
	b.product_name
    ,a.quantity
    ,b.option_code
    ,b.price
    ,b.discount_percent
    ,b.deliverycost
    -- ,c.nm
    -- ,d.tel
    -- ,e.addr
    -- ,e.addr_detail
    -- ,e.zip
from purchase a
join product b on b.seq = a.product_seq
-- join member c on c.seq = a.member_seq
where 1=1
and b.seq = 1
;
-- join member_tel d on d.member_seq = c.seq
-- join member_addr e on e.member_seq = c.seq 

select
	b.nm
    ,c.addr
    ,c.addr_detail
    ,c.zip
    ,d.div_tel
    ,d.tel
    ,a.paytype
    ,e.card
from purchase a
join member b on b.seq = a.member_seq
join member_addr c on c.seq = a.member_seq
join member_tel d on d.member_seq = b.seq
join reged_card e on e.member_seq = b.seq
where 1=1
and a.seq = 1
and e.div_reged_card = 2
;

-- 마이페이지
select
	a.nm
	,a.reserve
from member a
where 1=1
and a.seq = 3
;

-- 개인정보수정
select
	a.nm
    ,a.dob
    ,a.gender_code
    ,b.div_tel
    ,b.tel
	,a.email
    ,a.email_code
    ,c.div_addr
    ,c.addr
    ,c.addr_detail
    ,c.zip
from member a
left join member_tel b on b.member_seq = a.seq
left join member_addr c on c.member_seq = a.seq
order by
	a.nm desc
-- where 1=1
-- and nm like "%강%"
;

-- 주문 내역
select
	b.nm
	,c.product_name
	,c.option_code
    ,a.quantity
    ,a.paytype
    ,c.deliverycost
    ,c.price
from purchase a
left join member b on b.seq = a.member_seq
left join product c on c.seq = a.prod_seq
-- where 1=1
-- and b.seq = 2
order by
	c.product_name desc
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
left join memberAddr b on b.member_seq = a.seq
-- join member_addr b on b.member_seq = a.seq
-- where nm = "송강호"
;

-- 전화번호 목록
select
	a.seq
    ,a.nm
    ,a.id
    ,b.div_tel
    ,b.tel
    ,c.div_addr
    ,c.addr
from member a
left join member_tel b on b.member_seq = a.seq
left join member_addr c on b.member_seq = a.seq
-- join member_tel b on b.member_seq = a.seq
-- left join cc c on c.seq = b.tel_company_code
WHERE 1=1
and tel_defaultNy = 1
and addr_defaultNy = 1
;

-- 카드 목록
select
	b.seq,
    b.nm,
    b.id,
    a.div_memberCard,
    a.card
from memberCard a
left join member b on a.member_seq = b.seq
-- inner join member b on a.member_seq = b.seq

order by
	b.nm
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

-- union
select
	a.seq
    ,a.nm
    ,a.id
    ,b.div_tel
    ,b.tel
from member a
left join member_tel b on b.member_seq = a.seq
-- union all
union
select
	a.seq
    ,a.nm
    ,a.id
    ,b.div_addr
    ,b.addr
from member a
left join member_addr b on b.member_seq = a.seq

;