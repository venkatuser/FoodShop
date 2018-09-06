package sms;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.net.URL; 


 public class SMSApi {
	 public static void main(String[] args) {
			SMSApi ob=new SMSApi();
			ob.sendSMS("9626844250", "haiiii");
		}
	 
	 
   public boolean sendSMS(String number,String msg) {
        // TODO code application logic here
        boolean b=false;
    	try {
            URL url = new URL("https://smsapi.engineeringtgr.com/send/?Mobile=9626844250&Password=venkat123&Message="+msg+"&To="+number+"&Key=v.n.y9LgnDw0y4ftjeSQKEW");
            URLConnection urlcon = url.openConnection();
            InputStream stream = urlcon.getInputStream();
            int i;
            String response="";
            while ((i = stream.read()) != -1) {
                response+=(char)i;
            }
            if(response.contains("true")){
                System.out.println("Successfully send SMS");
                //your code when message send success
                b=true;
            }else{
                System.out.println(response);
                //your code when message not send
                b=false;
            }
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        return b;
    }
   
}
                           