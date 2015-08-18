package sharekore;

import android.content.Intent;
import com.ktxsoftware.kore.KoreActivity;

public class ShareKore {
    
	public static void share(String subject, String body, String url, boolean attachScreenshot) {
		Intent sendIntent = new Intent(android.content.Intent.ACTION_SEND);
		sendIntent.setType("text/plain");
        if (subject != null && subject != "") sendIntent.putExtra(android.content.Intent.EXTRA_SUBJECT, subject);
        if (body != null && body != "") sendIntent.putExtra(android.content.Intent.EXTRA_TEXT, body);
        KoreActivity.getInstance().startActivity(sendIntent);
	}

	/*public void shareit()
    {
        View view =  findViewById(R.id.layout);//your layout id
        view.getRootView();
        String state = Environment.getExternalStorageState();
        if (Environment.MEDIA_MOUNTED.equals(state)) 
        {
            File picDir  = new File(Environment.getExternalStorageDirectory()+ "/myPic");
            if (!picDir.exists())
            {
                picDir.mkdir();
            }
            view.setDrawingCacheEnabled(true);
            view.buildDrawingCache(true);
            Bitmap bitmap = view.getDrawingCache();
//          Date date = new Date();
            String fileName = "mylove" + ".jpg";
            File picFile = new File(picDir + "/" + fileName);
            try 
            {
                picFile.createNewFile();
                FileOutputStream picOut = new FileOutputStream(picFile);
                bitmap = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), (int)(bitmap.getHeight()/1.2));
                boolean saved = bitmap.compress(CompressFormat.JPEG, 100, picOut);
                if (saved) 
                {
                    Toast.makeText(getApplicationContext(), "Image saved to your device Pictures "+ "directory!", Toast.LENGTH_SHORT).show();
                } else 
                {
                    //Error
                }
                picOut.close();
            } 
            catch (Exception e) 
            {
                e.printStackTrace();
            }
            view.destroyDrawingCache();
        } else {
            //Error

        }

        Intent sharingIntent = new Intent(android.content.Intent.ACTION_SEND);
        sharingIntent.setType("image/jpeg");
        sharingIntent.putExtra(Intent.EXTRA_STREAM, Uri.parse(picFile.getAbsolutePath()));
        startActivity(Intent.createChooser(sharingIntent, "Share via"));
    }*/
}
