/*
  Practical B7 :- Encode and Decode JSON Objects using Java.
*/

import org.json.simple.JSONValue;
import org.json.simple.JSONObject;

public class SimpleJSON
{
  public static void main(String args[])
  {
    /**
     *  Simple JSON Program
     */ 	  

    //1. Create String according to format 	  
    String target = "{\"id\":1,\"name\":\"akash\"}"; 

    //2. Create Object for storing converted JSON values
    Object obj = JSONValue.parse(target); 
 
    //3. Converting Object into JSONObject
    JSONObject j = (JSONObject)obj;

    //4. Getting Values into particular Strings
    Object id = (Object)(j.get("id"));
    String name = (String) j.get("name");

    System.out.println(id+" "+name);
  }
}
