/*
  Practical C1 :- Write a program to implement MogoDB database connectivity with Java
*/

import com.mongodb.client.MongoCollection; 
import com.mongodb.client.MongoDatabase; 
import org.bson.Document;  
import com.mongodb.MongoClient; 
import com.mongodb.MongoCredential;  

public class conmongo 
{ 
   
   public static void main( String args[] ) {  
      
      // Creating a Mongo client 
      MongoClient mongo = new MongoClient( "localhost" , 27017); 

      // Creating Credentials 
      
      
      // Accessing the database 
      MongoDatabase database = mongo.getDatabase("mydb"); 

      // Retrieving a collection
      MongoCollection<Document> collection = database.getCollection("sampleCollection"); 
      System.out.println("Collection sampleCollection selected successfully");

      Document document = new Document("title", "MongoDB") 
      .append("id", 1)
      .append("description", "database") 
      .append("likes", 100) 
      .append("url", "http://iamakash.in/mongodb/") 
      .append("by", "akash gudadhe");  
      collection.insertOne(document); 
      System.out.println("Document inserted successfully");     
   } 
}
