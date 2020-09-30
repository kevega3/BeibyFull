package Modelo;

public class Persona {

    private int id;
    private String nombres;
    private String  apellidos;
    private String id_tipodocumento;
    private String numerodocumento;
    private String correo;
    private String clave;
    private String telefono;
    private String direccion;
    private String id_estado;
    private String id_rol;

    public Persona() {
    }

    public Persona(int id, String nombres, String apellidos, String id_tipodocumento, String numerodocumento, String correo, String clave, String telefono, String direccion, String id_estado, String id_rol) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.id_tipodocumento = id_tipodocumento;
        this.numerodocumento = numerodocumento;
        this.correo = correo;
        this.clave = clave;
        this.telefono = telefono;
        this.direccion = direccion;
        this.id_estado = id_estado;
        this.id_rol = id_rol;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getId_tipodocumento() {
        return id_tipodocumento;
    }

    public void setId_tipodocumento(String id_tipodocumento) {
        this.id_tipodocumento = id_tipodocumento;
    }

    public String getNumerodocumento() {
        return numerodocumento;
    }

    public void setNumerodocumento(String numerodocumento) {
        this.numerodocumento = numerodocumento;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getId_estado() {
        return id_estado;
    }

    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    public String getId_rol() {
        return id_rol;
    }

    public void setId_rol(String id_rol) {
        this.id_rol = id_rol;
    } 
}
