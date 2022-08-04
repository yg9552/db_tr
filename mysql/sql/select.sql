use busan;

select * from member;

select
	a.seq
    ,a.nm
	,b.addr
    ,b.addr_detail

from member a

-- left join member_addr b on b.member_seq = a.seq
-- inner join member_addr b on b.member_seq = a.seq
join member_addr b on b.member_seq = a.seq
;

select
	a.seq
    ,a.nm
    ,b.div_tel
    ,b.tel
from member a   
	-- left join member_tel b on b.member_seq = a.seq
    -- inner join member_tel b on b.member_seq = a.seq
    join member_tel b on b.member_seq = a.seq
    ;