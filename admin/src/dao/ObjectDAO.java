package dao;
public interface ObjectDAO {
    public void add(Object obj);
    public void edit(Object obj, String str);
    public void del(String str);
    public boolean check(String str);
}
