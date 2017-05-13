package rms.model;

public class ServerListEstate {
	
    private String estatecode;
    private String svrip;
    private String status;
    private String description;
    private String username;
    private String password;
    private String folderldg;

    public String getFolderldg() {
        return folderldg;
    }

    public void setFolderldg(String folderldg) {
        this.folderldg = folderldg;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEstatecode() {
        return estatecode;
    }

    public void setEstatecode(String estatecode) {
        this.estatecode = estatecode;
    }

    public String getSvrip() {
        return svrip;
    }

    public void setSvrip(String svrip) {
        this.svrip = svrip;
    }
    
}