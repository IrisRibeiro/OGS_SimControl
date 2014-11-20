
package OGS.GeneralClasses;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Iris
 */

import OGS.beans.Person;
import OGS.tables.PersonManager;
import java.io.File;
import java.util.logging.ConsoleHandler;
import java.util.logging.FileHandler;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Login {
    
    private static final Logger LOGGER = Logger.getLogger(Login.class.getName());
    
    
    public static Person VerifyLogin(String Password, String UserName)throws Exception{
        LOGGER.info("Logger Name: " + LOGGER.getName());
        EncryptDecrypt _encryptdecrypt = new EncryptDecrypt();
        PersonManager _personmanager = new PersonManager();
        String keyFilePath = "C:\\Users\\Eric\\Dropbox\\SBUClass\\CSE308"
                + "\\OGS_SimControl.git\\src\\java\\OGS\\GeneralClasses\\keyFile";
        Person _person = new Person();
        LOGGER.info("Create encrypt and person class");
        File keyFile = new File(keyFilePath);
        
        LOGGER.warning("is going to class personmanager to access the database");
        _person =  _personmanager.getRowfromUserName(UserName);
        
        LOGGER.config("object person is equal to "+_person);
        if( _person == null){
            
            return null;
        }
        
        String DbPassword = _person.getPassword();
        String newencrypted = _encryptdecrypt.encrypt(Password, keyFile);
        if (newencrypted.equals(DbPassword)){
            return _person;
        }        
        return null;
       
    }
    
    
    
}
