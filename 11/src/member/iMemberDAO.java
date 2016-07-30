package member;

public interface iMemberDAO {
	
	//회원가입
	boolean addMember(memberDTO mdto);

	//로그인
	memberDTO login(memberDTO mdto);
	
    //아이디 중복체크
	int confirmId(String id);
	
    //이메일 중복체크
	int confirmEmail(String email);
}
