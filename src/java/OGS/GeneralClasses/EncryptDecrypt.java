package OGS.GeneralClasses;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.util.Base64;
import java.util.Scanner;
import java.util.logging.FileHandler;
import java.util.logging.SimpleFormatter;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import sun.misc.BASE64Encoder;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * This method wasn't all created by me here is the link to the webpage where I
 * found it: http://cs.saddleback.edu/rwatkins/CS4B/Crypto/EncryptDecrypt.html
 * http://www.rgagnon.com/javadetails/java-0400.html
 *
 * @author Iris
 */
public class EncryptDecrypt {

    private static final Logger LOGGER = Logger.getLogger(Login.class.getName());
    private static SecretKey key = null;
    private static Cipher cipher = null;

    public static String encrypt(String Password, File keyFile)
            throws Exception {
        File f = new File("c:/SimControl/Logging/");
        if(!f.exists()){
            f.mkdirs();
            
        }
        FileHandler fh;
        fh = new FileHandler(f.getPath() + "\\Encrypt_Log.log");
        LOGGER.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();  
        fh.setFormatter(formatter);
        
        LOGGER.info("Logger Name: " + LOGGER.getName());
        String plainData = Password, cipherText, decryptedText;
        LOGGER.info("Encrypt Password");
        if (!keyFile.exists()) {
            LOGGER.warning("Create File, does not exist");
            KeyGenerator keyGen = KeyGenerator.getInstance("AES");
            keyGen.init(128);
            SecretKey secretKey = keyGen.generateKey();
            try (FileWriter fw = new FileWriter(keyFile)) {
                fw.write(byteArrayToHexString(secretKey.getEncoded()));
                fw.flush();
            }
        }
        SecretKeySpec secret = new SecretKeySpec(readKeyFile(keyFile), "AES");
        Cipher aesCipher = Cipher.getInstance("AES");
        aesCipher.init(Cipher.ENCRYPT_MODE, secret, aesCipher.getParameters());
        byte[] byteDataToEncrypt = plainData.getBytes();
        byte[] byteCipherText = aesCipher.doFinal(byteDataToEncrypt);
        cipherText = new BASE64Encoder().encode(byteCipherText);
        //byte[] testByte = Base64.getEncoder().encode(byteCipherText);
        //String test = javax.xml.bind.DatatypeConverter.printBase64Binary(testByte);
        String encryptPassword = cipherText;

        return encryptPassword;

    }

    public static String decrypt(String Password, File keyFile)
            throws Exception {

        SecretKeySpec secret = new SecretKeySpec(readKeyFile(keyFile), "AES");
        Cipher aesCipher = Cipher.getInstance("AES");
        aesCipher.init(Cipher.DECRYPT_MODE, secret, aesCipher.getParameters());
        byte[] byteDataToDecrypt = Password.getBytes();
        byte[] decodedText = Base64.getDecoder().decode(byteDataToDecrypt);
        byte[] byteDecryptedText = aesCipher.doFinal(decodedText);
        String decryptedText = new String(byteDecryptedText);

        return decryptedText;
    }

    private static String byteArrayToHexString(byte[] b) {
        StringBuffer sb = new StringBuffer(b.length * 2);
        for (int i = 0; i < b.length; i++) {
            int v = b[i] & 0xff;
            if (v < 16) {
                sb.append('0');
            }
            sb.append(Integer.toHexString(v));
        }
        return sb.toString().toUpperCase();
    }

    private static byte[] readKeyFile(File keyFile)
            throws FileNotFoundException {
        String keyValue;
        try (Scanner scanner = new Scanner(keyFile).useDelimiter("\\Z")) {
            keyValue = scanner.next();
        }
        return hexStringToByteArray(keyValue);
    }

    private static byte[] hexStringToByteArray(String s) {
        byte[] b = new byte[s.length() / 2];
        for (int i = 0; i < b.length; i++) {
            int index = i * 2;
            int v = Integer.parseInt(s.substring(index, index + 2), 16);
            b[i] = (byte) v;
        }
        return b;
    }
}
