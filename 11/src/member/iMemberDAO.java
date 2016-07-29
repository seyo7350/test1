package member;

public interface iMemberDAO {
	
	//회원가입
	boolean addMember(memberDTO mdto);
	
	//로그인
	memberDTO login(memberDTO mdto);


}
