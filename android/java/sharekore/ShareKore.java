package sharekore;

import android.content.Intent;
import com.ktxsoftware.kore.KoreActivity;

public class ShareKore {
    
	public static void share(String subject, String body, String url, boolean attachScreenshot) {
		System.out.println(subject);
		Intent sendIntent = new Intent(android.content.Intent.ACTION_SEND);
		sendIntent.setType("text/plain");
        if(subject!=null && subject!="")	sendIntent.putExtra(android.content.Intent.EXTRA_SUBJECT, subject);
        if(body!=null && body!="")	sendIntent.putExtra(android.content.Intent.EXTRA_TEXT, body);
        //if(html!=null && html!="")	sendIntent.putExtra(android.content.Intent.EXTRA_HTML_TEXT, html);
		//if(email!=null && email!="") sendIntent.putExtra(android.content.Intent.EXTRA_EMAIL, email);
        KoreActivity.getInstance().startActivity(sendIntent);
	}

}