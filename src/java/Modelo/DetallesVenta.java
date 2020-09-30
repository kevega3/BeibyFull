package Modelo;

public class DetallesVenta {

    private int id;
    private String fkventa;
    private String fkproducto;
    private double cantidad;
    private double precio;

    public DetallesVenta() {

    }

    public DetallesVenta(int id, String fkventa, String fkproducto, double cantidad, double precio) {
        this.id = id;
        this.fkventa = fkventa;
        this.fkproducto = fkproducto;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFkventa() {
        return fkventa;
    }

    public void setFkventa(String fkventa) {
        this.fkventa = fkventa;
    }

    public String getFkproducto() {
        return fkproducto;
    }

    public void setFkproducto(String fkproducto) {
        this.fkproducto = fkproducto;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
}
