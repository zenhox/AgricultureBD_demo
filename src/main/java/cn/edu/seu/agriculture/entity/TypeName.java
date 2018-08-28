package cn.edu.seu.agriculture.entity;

public class TypeName {
    private String type;

    private String name;

    public TypeName(String type, String name) {
        this.type = type;
        this.name = name;
    }

    public TypeName() {
        super();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}