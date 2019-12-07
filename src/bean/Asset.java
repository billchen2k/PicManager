package bean;

public class Asset {
	private int id = -1;
	private String name = "N/A";
	private int type = 0;
	private String url = "N/A";
	private String acqtime = "N/A";
	private String upload_time = "N/A";
	private String uploader_uid = "N/A";
	private String last_modified_date = "N/A";
	private String scale = "N/A";
	private String country = "N/A";
	private String location = "N/A";


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getAcqtime() {
		return acqtime;
	}

	public void setAcqtime(String acqtime) {
		this.acqtime = acqtime;
	}

	public String getUpload_time() {
		return upload_time;
	}

	public void setUpload_time(String upload_time) {
		this.upload_time = upload_time;
	}

	public String getUploader_uid() {
		return uploader_uid;
	}

	public void setUploader_uid(String uploader_uid) {
		this.uploader_uid = uploader_uid;
	}

	public String getLast_modified_date() {
		return last_modified_date;
	}

	public void setLast_modified_date(String last_modified_date) {
		this.last_modified_date = last_modified_date;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}
