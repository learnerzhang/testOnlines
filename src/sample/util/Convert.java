package sample.util;
public class Convert {
	 public static String convert( String str )
	 {
	   try
	   {
	     byte[] bytesStr=str.getBytes( "ISO-8859-1" ) ;
	     return new String( bytesStr, "utf-8" ) ;
	   }
	   catch( Exception ex)
	   {
	         return str ;
	   }
	 }

	public Convert() {
		super();
		// TODO �Զ����ɹ��캯�����
	}

}
