package Modelo;

public class DetallesNovedad {

    private int id;
    private String cantidad;
    private String fknovedad;
    private String fkproducto;

    public DetallesNovedad() {
    }

    public DetallesNovedad(int id, String cantidad, String fknovedad, String fkproducto) {
        this.id = id;
        this.cantidad = cantidad;
        this.fknovedad = fknovedad;
        this.fkproducto = fkproducto;
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

    public String getFknovedad() {
        return fknovedad;
    }

    public void setFknovedad(String fknovedad) {
        this.fknovedad = fknovedad;
    }

    public String getFkproducto() {
        return fkproducto;
    }

    public void setFkproducto(String fkproducto) {
        this.fkproducto = fkproducto;
    }
}
