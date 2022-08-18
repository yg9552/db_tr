USE busan;


INSERT INTO member (
	nm
    ,id
    ,password
    ,email
    ,gender
    ,dob
    ,age
    )

VALUE (
	"주현영"
    ,"gusdudwn"
    ,"7gfdajkl61a"
    ,"joogus@naver.com"
    ,2
    ,19960114
    ,26
    );
    
    SELECT *FROM member;

SELECT
	nm,id,password,email,gender,dob,age

FROM member
WHERE 1=1
	-- AND seq =2
	AND email = "rkdrl@naver.com"
    
    ;

DROP TABLE member_addr;

INSERT INTO member_addr(
	addr1
    ,addr2
    ,addr3
    ,addr4
    ,member_seq
    )

VALUE (
	"서울시 관악구 삼성동"
    ,"서울시 서초구 서초동"
    ,"서울시 구로구 구로동"
    ,"성남시 분당구 이매동"
    ,3
    )
    ;

SELECT *FROM member_addr;

INSERT INTO member_tel (
	tel1
    ,tel2
    ,tel3
    ,tel4
    ,member_seq
    )
    
    VALUE (
    010-3333-4444
    ,010-5414-0411
    ,031-235-5473
    ,010-1247-9623
    ,3
    );

SELECT *FROM member_tel;

INSERT INTO product(
	brand
    ,prodnm
    ,price
    ,discount
    ,reserve
    ,origin
    ,delivertcost
    ,deliveryinfo
    ,totalstar
    ,option_size
    ,option_color
    )
VALUE (
	"apple"
    ,"아이폰"
    ,500000
    ,1
    ,2000
    ,"미국"
    ,2
    ,2
    ,5
    ,3
    ,1
    );
    
    SELECT *FROM product;

INSERT INTO cart(
	prod_seq
    ,member_seq
    )
    VALUE (
		3
        ,1
        )
        ;
	
    SELECT *FROM cart;
    
INSERT INTO `product_Q&A`(
	title
    ,Question
    ,Regtime
    ,Answer
    ,prod_seq
    ,member_seq
    )
VALUE (
	"정품인가요?"
    ,"질문"
    ,20220320125959
    ,1
    ,3
    ,1
    )
    ;
    
    SELECT *FROM `product_Q&A`;
    
INSERT INTO product_review (
	prod_seq
    ,member_seq
    ,star
    ,title
    ,contents
    ,regtime
    )

VALUE (
	1
    ,1
    ,5
    ,"맘에들어요"
    ,"사이즈도 잘맞고 "
    ,20220728115859
    )
    ;
	
    SELECT *FROM product_review;

INSERT INTO reged_card (
	card1
    ,card2
    ,card3
    ,member_seq
    )
    
    VALUE (
    "1234.5678.9876"
    ,"6543.2198.7654.3210"
    ,"9100.4567.4981.7891"
    ,3
    );
    
    SELECT *FROM reged_card;
    
    
    INSERT INTO purchase(
		member_seq
        ,prod_seq
        ,quantity
        ,member_addr_seq
        ,paytype
        ,reged_card_seq
        )
	
    VALUE (
		3
        ,3
        ,2
        ,1
        ,2
        ,1
        )
        ;
	SELECT *FROM purchase;
    
    CREATE TABLE IF NOT EXISTS `busan`.`member2` (
  `seq` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `id` VARCHAR(45) NULL,
  `pwd` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `gender` TINYINT NULL,
  `dob` DATE NULL,
  `age` INT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
;

-- busan batabase를 사용하겠다
use busan;

-- 전체 컬럼 조회
SELECT *FROM member2;

-- 컬럼 추가
ALTER TABLE member2 ADD COLUMN nickname varchar(45);

ALTER TABLE member2 ADD COLUMN nameEng varchar(45) AFTER name;
alter table member2 add column ascd varchar(45) after dob;
alter table member2 add column gsfd int after ascd;
alter table member2 add column ghfdgfd double after ascd;
alter table member2 add column Regtime datetime after dob;

-- 컬럼 변경
ALTER TABLE member2 MODIFY COLUMN nickname text;

-- 컬럼 이름 변경
ALTER TABLE member2 CHANGE COLUMN nickname nick varchar(45);

-- 컬럼 삭제
alter table member2 drop column nick;
alter table member2 drop column ascd;
alter table member2 drop column ghfdgfd;
alter table member2 drop column gsfd;
alter table member2 drop column nameEng;
alter table member2 drop column Regtime;

-- 컬럼 삭제
delete from member2 where seq = 0;

SELECT *FROM member2;

-- commit / rollback

-- 데이터 수정
UPDATE member2 SET
	name ="dylan"
    ,id ="dtlan2"
where seq = 1;

DROP TABle member2;

-- like를 이용한 검색
SELECT *FROM member
WHERE 1=1
-- AND nm like "영%"
-- AND nm like "%영"
AND nm like "%영%"
;

-- 범위를 이용한 찾기
SELECT *FROM member
WHERE 1=1
-- AND gender = 0
-- and gender > 1 
-- and gender >= 1
and gender between 0 and 2
;

-- null 찾을땐 is를 붙여야함
SELECT *From member
WHere 1=1
And nm is null
;

-- example
select * from reged_card
where 1=1
and card3 like "%7%"
;

select * from member_addr
where 1=1
and addr1 like "%서울%"
;

select *from member_addr
where 1=1 
and addr3 is null
;

