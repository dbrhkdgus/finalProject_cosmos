--insert into faq values('1','폰트는 어떻게 다운로드하나요?','shop에서 맘에 드는 폰트를 클릭하시면 장바구니에 모아 담아 구매하거나 바로 구매하기 버튼을 통해                 구매하실 수 있어요! 포인트를 이용한 구매 확인이 완료되면 이메일로 폰트를 보내드립니다!!');
--insert into faq values('2','쿠폰 등록은 어떻게 하나요?','마이페이지에 들어가신 후 쿠폰 등록하기 버튼을 통해 쿠폰번호를 입력하시면 쿠폰을 등록할 수 있습니다.');
--insert into faq values('3','Monospace 글꼴은 어떤 폰트인가요?','Monospace 글꼴은 각 문자의 폭이 일정한 글꼴로 헷갈릴 여지가 있는 글자를 없애도록 설계된 폰트입니다. 따라서 프로그래밍을 하시는 분들의 사용을 적극 추천드립니다!');
--insert into faq values('4','폰트 라이선스에 대해 알고 싶어요!','해당 폰트 페이지 하단에 있는 저작권 정보를 통해 확인해 주시고,좀 더 자세한 내용이 궁금하시다면 각 폰트의 저작권은 제작사에 있기 때문에 해당 회사에 문의하시길 부탁드립니다.');
--insert into faq values('5','커뮤니티에 대해 자세히 알고 싶어요!','자신의 작업물을 자유롭게 나누는 공간입니다! 맘에드는 게시글이 있다면 좋아요와 댓글을 달아보세요 :)');
----commit;
--
---- DELETE font WHERE font_no = 'font-20211027-0041';
--rollback;
--select * from community;
--delete  member_orders where member_no = 'ele-20211030-0181';
--select * from attachment;
--select * from view_member_cart;
select * from view_member_orders;
--select * from font_category;
--select * from member_orders;
select * from member;
commit;
--update member set member_point = 999999999 where member_no ='ele-20211026-0004';
--select * from view_member_cart where member_no = 'ele-20211026-0001' order by cart_reg_date;

