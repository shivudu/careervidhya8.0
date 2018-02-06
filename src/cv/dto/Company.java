package cv.dto;

public class Company {

   private Integer company_id;
	private String name;
	private String location;
	private String URL;
	//private Company_Contact contact;
	
	public Integer getCompany_id() {
		return company_id;
	}
	public void setCompany_id(Integer company_id) {
		this.company_id = company_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	
	
	public Company()
	{
		super();
	}
	@Override
	public String toString() {
		return "Company [company_id=" + company_id + ", name=" + name + ", location=" + location + ", URL=" + URL + "]";
	}
}
