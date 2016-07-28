package member;

public class memberDAO {
	
	private boolean isS = true;
	
	public boolean addMember(memberDTO mdto){
		String sql = "ss";
		return true;
	}
	
	
	
	
	
	//로그 메소드1
		public void log(String msg) {
			// TODO Auto-generated method stub
			if(isS){
				System.out.println(getClass()+":" + msg);
			}
		}

		//로그 메소드2
		public void log(String msg, Exception e) {
			// TODO Auto-generated method stub
			if(isS){
				System.out.println(e + " : "+getClass()+" : " + msg);
			}
		}

}
