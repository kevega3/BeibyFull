package Modelo;

public class Novedad {

    private int idnovedad;  // esto va en detalle novedad y  novedad
    private int idproducto;  // esto va en detalle novedad
    private String descripcion; // esto va en novedad 
    private double cantidad; // esto va en detalle novedad
    private String fecha; // esto va en novedad 
    private String destino;  // esto va en novedad

    public Novedad() {
    }

    public Novedad(int idnovedad, int idproducto, String descripcion, double cantidad, String fecha, String destino) {
        this.idnovedad = idnovedad;
        this.idproducto = idproducto;
        this.descripcion = descripcion;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.destino = destino;
    }

    public int getIdnovedad() {
        return idnovedad;
    }

    public void setIdnovedad(int idnovedad) {
        this.idnovedad = idnovedad;
    }

    public int getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }
}
