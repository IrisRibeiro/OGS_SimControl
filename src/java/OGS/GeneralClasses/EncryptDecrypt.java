package OGS.GeneralClasses;


import javax.crypto.KeyGenerator; 
import javax.crypto.SecretKey; 
import javax.crypto.Cipher; 
import sun.misc.BASE64Encoder;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * This method wasn't all created by me here is the link to the webpage where I found it:
 * http://cs.saddleback.edu/rwatkins/CS4B/Crypto/EncryptDecrypt.html
 * @author Iris
 */
public class EncryptDecrypt {
     private static SecretKey key = null;
     private static Cipher cipher = null;
     
     public static String encrypt( String Password)throws Exception{
         
         String plainData = Password,cipherText,decryptedText;
         KeyGenerator keyGen = KeyGenerator.getInstance("AES");
         keyGen.init(128); 
         SecretKey secretKey = keyGen.generateKey();
         
         
         Cipher aesCipher = Cipher.getInstance("AES"); 
         aesCipher.init(Cipher.ENCRYPT_MODE,secretKey); 
         byte[] byteDataToEncrypt = plainData.getBytes(); 
         byte[] byteCipherText = aesCipher.doFinal(byteDataToEncrypt); 
         cipherText = new BASE64Encoder().encode(byteCipherText);
         String ecryptPassword = cipherText;
         
         return ecryptPassword;
         
     }
     
      public static String decrypt( String Password)throws Exception{
      
     
      KeyGenerator keyGen = KeyGenerator.getInstance("AES"); 
      keyGen.init(128); 
      SecretKey secretKey = keyGen.generateKey(); 
      Cipher aesCipher = Cipher.getInstance("AES"); 
      byte[] byteDataToEncrypt = Password.getBytes(); 
      byte[] byteCipherText = aesCipher.doFinal(byteDataToEncrypt); 
      aesCipher.init(Cipher.DECRYPT_MODE,secretKey,aesCipher.getParameters()); 
      byte[] byteDecryptedText = aesCipher.doFinal(byteCipherText); 
      String decryptedText = new String(byteDecryptedText);

      return decryptedText;
      }

}
