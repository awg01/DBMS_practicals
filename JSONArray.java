/*
  Practical B6 :- Create simple objects and array objects using JSON
*/

import org.json.simple.JSONArray;

public class JSONArray
{
   public static void main(String args[])
   {
       JSONArray arr = new JSONArray();
       arr.add(1);
       arr.add("Name");
       arr.add("College");

       System.out.println(arr);
   }
}
