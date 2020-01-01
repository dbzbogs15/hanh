package model;

public class Value {
String name; int value;

public Value(String name, int value) {
	super();
	this.name = name;
	this.value = value;
}
public Value() {
	// TODO Auto-generated constructor stub
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public int getValue() {
	return value;
}

public void setValue(int value) {
	this.value = value;
}
@Override
public String toString() {
	return "Value [name=" + name + ", value=" + value + "]";
}


}
