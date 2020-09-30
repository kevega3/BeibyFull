package Modelo;

public class TipoProducto {

    private int id;
    private String tipoproducto;

    public TipoProducto(int id, String tipoproducto) {
        this.id = id;
        this.tipoproducto = tipoproducto;
    }

    public TipoProducto() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipoproducto() {
        return tipoproducto;
    }

    public void setTipoproducto(String tipoproducto) {
        this.tipoproducto = tipoproducto;
    }
}
