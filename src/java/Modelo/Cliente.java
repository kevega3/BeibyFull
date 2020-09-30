package Modelo;

public class Cliente {

    private int id;
    private String numerodocumento;
    private String nombres;
    private String apellidos;
    private String Correo;
    private String Numero;
    private String Direccion;

    public Cliente() {
    }

    public Cliente(int id, String numerodocumento, String nombres, String apellidos, String Correo, String Numero, String Direccion) {
        this.id = id;
        this.numerodocumento = numerodocumento;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.Correo = Correo;
        this.Numero = Numero;
        this.Direccion = Direccion;
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

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getNumero() {
        return Numero;
    }

    public void setNumero(String Numero) {
        this.Numero = Numero;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }
}
