
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

public class Login {
    
    public static Person VerifyLogin(String Password, String UserName)throws Exception{
        EncryptDecrypt _encryptdecrypt = new EncryptDecrypt();
        PersonManager _personmanager = new PersonManager();
        String keyFilePath = "C:\\Users\\Eric\\Dropbox\\SBUClass\\CSE308"
                + "\\OGS_SimControl.git\\src\\java\\OGS\\GeneralClasses\\keyFile";
        Person _person = new Person();
        
        File keyFile = new File(keyFilePath);
        
        _person =  _personmanager.getRowfromUserName(UserName);
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
