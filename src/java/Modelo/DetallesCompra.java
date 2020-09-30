package Modelo;

public class DetallesCompra {

    private int id;
    private String fkcompra;
    private String fkproducto;
    private String cantidad;
    private String precio;

    public DetallesCompra(int id, String fkcompra, String fkproducto, String cantidad, String precio) {
        this.id = id;
        this.fkcompra = fkcompra;
        this.fkproducto = fkproducto;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public DetallesCompra() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFkcompra() {
        return fkcompra;
    }

    public void setFkcompra(String fkcompra) {
        this.fkcompra = fkcompra;
    }

    public String getFkproducto() {
        return fkproducto;
    }

    public void setFkproducto(String fkproducto) {
        this.fkproducto = fkproducto;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }
}
