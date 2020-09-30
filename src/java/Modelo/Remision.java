package Modelo;

public class Remision {

    private int idremision;  // esto va en detalle remision y  remision
    private int idproducto;  // esto va en detalle remision y  remision
    private double cantidad; //esto va en detalle remision y  remision
    private String fecha; // esto va en remision 
    private String id_sede; // esto va en remision

    public Remision() {

    }

    public Remision(int idremision, int idproducto, double cantidad, String fecha, String id_sede) {
        this.idremision = idremision;
        this.idproducto = idproducto;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.id_sede = id_sede;
    }

    public int getIdremision() {
        return idremision;
    }

    public void setIdremision(int idremision) {
        this.idremision = idremision;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getId_sede() {
        return id_sede;
    }

    public void setId_sede(String id_sede) {
        this.id_sede = id_sede;
    }
}
