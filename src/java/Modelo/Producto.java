package Modelo;

public class Producto {

    private int idprod;
    private String nserie;
    private String nombre;
    private double valor;
    private double cantiadad;
    private String fkproducto;
    private String fkmarca;
    private String fkestado;

    public Producto() {
    }

    public Producto(int idprod, String nserie, String nombre, double valor, double cantiadad, String fkproducto, String fkmarca, String fkestado) {
        this.idprod = idprod;
        this.nserie = nserie;
        this.nombre = nombre;
        this.valor = valor;
        this.cantiadad = cantiadad;
        this.fkproducto = fkproducto;
        this.fkmarca = fkmarca;
        this.fkestado = fkestado;
    }

    public int getIdprod() {
        return idprod;
    }

    public void setIdprod(int idprod) {
        this.idprod = idprod;
    }

    public String getNserie() {
        return nserie;
    }

    public void setNserie(String nserie) {
        this.nserie = nserie;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public double getCantiadad() {
        return cantiadad;
    }

    public void setCantiadad(double cantiadad) {
        this.cantiadad = cantiadad;
    }

    public String getFkproducto() {
        return fkproducto;
    }

    public void setFkproducto(String fkproducto) {
        this.fkproducto = fkproducto;
    }

    public String getFkmarca() {
        return fkmarca;
    }

    public void setFkmarca(String fkmarca) {
        this.fkmarca = fkmarca;
    }

    public String getFkestado() {
        return fkestado;
    }

    public void setFkestado(String fkestado) {
        this.fkestado = fkestado;
    }
}
