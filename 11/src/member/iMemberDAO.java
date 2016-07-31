package member;

import java.util.List;

public interface iMemberDAO {
	
	//회원가입
	boolean addMember(memberDTO mdto);

	//로그인
	memberDTO login(memberDTO mdto);
	
    //아이디 중복체크
	int confirmId(String id);
	
    //이메일 중복체크
	int confirmEmail(String email);
	
	//정보 수정
	boolean updateMember(String password, String birthday, String postcode, String address, String addressDetail, String email, String phone, int seq);

	//삭제
	boolean deleteMember(int seq);
	
	//회원정보 리스트
	List<memberDTO> getMemberList();
	
	//회원정보 불러오기
	memberDTO getMember(int seq);

}
