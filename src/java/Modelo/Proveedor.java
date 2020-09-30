package Modelo;

public class Proveedor {
    private int id;
    private String numerodocumento;
    private String nombre;
    private String direccion;
    private String numerocontacto;  
    private String fktipodoc;

    public Proveedor() {
    }

    public Proveedor(int id, String numerodocumento, String nombre, String direccion, String numerocontacto, String fktipodoc) {
        this.id = id;
        this.numerodocumento = numerodocumento;
        this.nombre = nombre;
        this.direccion = direccion;
        this.numerocontacto = numerocontacto;
        this.fktipodoc = fktipodoc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumerodocumento() {
        return numerodocumento;
    }

    public void setNumerodocumento(String numerodocumento) {
        this.numerodocumento = numerodocumento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNumerocontacto() {
        return numerocontacto;
    }

    public void setNumerocontacto(String numerocontacto) {
        this.numerocontacto = numerocontacto;
    }

    public String getFktipodoc() {
        return fktipodoc;
    }

    public void setFktipodoc(String fktipodoc) {
        this.fktipodoc = fktipodoc;
    }
}
