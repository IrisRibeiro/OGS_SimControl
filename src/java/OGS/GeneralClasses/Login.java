
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

import OGS.GeneralClasses.EncryptDecrypt;
import OGS.beans.Person;
import OGS.tables.PersonManager;

public class Login {
    
    public static Boolean VerifyLogin(String Password, String UserName)throws Exception{
        EncryptDecrypt _encryptdecrypt = new EncryptDecrypt();
        PersonManager _personmanager = new PersonManager();
        Person _person = new Person();
        
        _person =  _personmanager.getRowfromUserName(UserName);
        String newencrypted = _encryptdecrypt.encrypt(Password);
        String DbPassword = _person.getPassword();
        if (newencrypted.equals(DbPassword)){
        
        
        }
        
        return false;
       
    }
    
    
    
}
