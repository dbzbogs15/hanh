package model;

public class File {
String name, url;

public File(String name, String url) {
	super();
	this.name = name;
	this.url = url;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getUrl() {
	return url;
}

public void setUrl(String url) {
	this.url = url;
}

@Override
public String toString() {
	return "File [name=" + name + ", url=" + url + "]";
}

}
