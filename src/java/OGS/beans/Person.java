package OGS.beans;

/**
 *
 * @author eloo
 */
/**
 * This is the bean for person table
 *
 * @author Yi
 */
public class Person {

    private String name;
    private String userName;
    private String password;
    private String emailAddress;
    private String type;
    private int accessLevel;
    private int ID;

    /**
     *
     * @return person's ID
     */
    public int getID() {
        return ID;
    }

    /**
     * sets person's ID into variable ID
     *
     * @param ID
     */
    public void setID(int ID) {
        this.ID = ID;
    }

    /**
     *
     * @return person's name
     */
    public String getName() {
        return name;
    }

    /**
     * sets person's name into variable name
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @return person's user name
     */
    public String getUserName() {
        return userName;
    }

    /**
     * sets person's user name into variable userName
     *
     * @param userName
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     *
     * @return person's password
     */
    public String getPassword() {
        return password;
    }

    /**
     * sets person's password into variable password
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     *
     * @return person's email address
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * sets person's email address into variable emailAddress
     *
     * @param emailAddress
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    /**
     *
     * @return person's access level
     */
    public int getAccessLevel() {
        return accessLevel;
    }

    /**
     * sets person's access level into variable accessLevel
     *
     * @param accessLevel
     */
    public void setAccessLevel(int accessLevel) {
        this.accessLevel = accessLevel;
    }
    
    public String getType(){
        return type;
    }
    
    public void setType(String type){
        this.type = type;
    }
}
