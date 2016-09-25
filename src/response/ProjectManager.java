package response;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;

public class ProjectManager {
	private String openApiUrl;
	
	public ProjectManager(String url){
		openApiUrl = url;
	}
	
	public String generateState() {
	    SecureRandom random = new SecureRandom();
	    BigInteger st = new BigInteger(130, random);
	    return st.toString(32);  
	}
	
	StringBuilder builder = new StringBuilder();
	
	public String manager() {
		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet request = new HttpGet(openApiUrl);
			HttpResponse response = client.execute(request);
			HttpEntity entity = response.getEntity();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}