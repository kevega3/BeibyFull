package Modelo;

public class Sede {

    private int id;
    private String nombre_sede;
    private String direccion_sede;
    private String barrio_sede;

    public Sede() {

    }

    public Sede(int id, String nombre_sede, String direccion_sede, String barrio_sede) {
        this.id = id;
        this.nombre_sede = nombre_sede;
        this.direccion_sede = direccion_sede;
        this.barrio_sede = barrio_sede;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre_sede() {
        return nombre_sede;
    }

    public void setNombre_sede(String nombre_sede) {
        this.nombre_sede = nombre_sede;
    }

    public String getDireccion_sede() {
        return direccion_sede;
    }

    public void setDireccion_sede(String direccion_sede) {
        this.direccion_sede = direccion_sede;
    }

    public String getBarrio_sede() {
        return barrio_sede;
    }

    public void setBarrio_sede(String barrio_sede) {
        this.barrio_sede = barrio_sede;
    }
}
