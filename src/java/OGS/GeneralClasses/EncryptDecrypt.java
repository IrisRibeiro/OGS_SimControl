package OGS.GeneralClasses;


import javax.crypto.*;
import java.security.*;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        Security.addProvider(new com.sun.crypto.provider.SunJCE());
         
       KeyGenerator keyGenerator =
       KeyGenerator.getInstance("DESede");
       keyGenerator.init(168);
       SecretKey secretKey = keyGenerator.generateKey();
       cipher = Cipher.getInstance("DESede");
       
       String clearText = Password;
       byte[] clearTextBytes = clearText.getBytes("UTF8");
       
       cipher.init(Cipher.ENCRYPT_MODE, secretKey);
       byte[] cipherBytes = cipher.doFinal(clearTextBytes);
       String cipherText = new String(cipherBytes, "UTF8");
         
         return cipherText;
     }
     
      public static String decrypt( byte[] Password)throws Exception{
      
      Security.addProvider(new com.sun.crypto.provider.SunJCE());
         
       KeyGenerator keyGenerator =
       KeyGenerator.getInstance("DESede");
       keyGenerator.init(168);
       SecretKey secretKey = keyGenerator.generateKey();
       cipher = Cipher.getInstance("DESede");
       
       cipher.init(Cipher.DECRYPT_MODE, secretKey);
       byte[] decryptedBytes = cipher.doFinal(Password);
       String decryptedText = new String(decryptedBytes, "UTF8");
       
       return decryptedText;
      }

}
