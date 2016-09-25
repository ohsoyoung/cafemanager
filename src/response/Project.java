package response;

public class Project {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		String url_1 = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=G5Q5we63Sm5pDrdtEjMI&redirect_uri=http%3A%2F%2F210.121.131.58%3A8080%2Fcafe%2FCafe.jsp&state=";
		ProjectManager pm = new ProjectManager(url_1);
		url_1 += pm.generateState();
		
		String url_2 = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=G5Q5we63Sm5pDrdtEjMI&client_secret=wfosA2zV7v&code=EIc5bFrl4RibFls1&state=";
		ProjectManager pm2 = new ProjectManager(url_2);
		url_2 += pm2.generateState();
		
		System.out.println(url_1);
	}

}
