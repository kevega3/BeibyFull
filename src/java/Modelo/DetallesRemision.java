package Modelo;

public class DetallesRemision {

    private int id;
    private String cantidad;
    private String fkremision;
    private String fkproducto;

    public DetallesRemision(int id, String cantidad, String fkremision, String fkproducto) {
        this.id = id;
        this.cantidad = cantidad;
        this.fkremision = fkremision;
        this.fkproducto = fkproducto;
    }

    public DetallesRemision() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getFkremision() {
        return fkremision;
    }

    public void setFkremision(String fkremision) {
        this.fkremision = fkremision;
    }

    public String getFkproducto() {
        return fkproducto;
    }

    public void setFkproducto(String fkproducto) {
        this.fkproducto = fkproducto;
    }
}
