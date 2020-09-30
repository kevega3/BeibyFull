package Interfaces;

import Modelo.TipoProducto;
import java.util.List;

public interface CRUDTIPOPRODUCTO {

    public List listar();

    public TipoProducto list(int id);

    public boolean add(TipoProducto tipoproduc);

    public boolean edit(TipoProducto tipoproduc);

    public boolean delete(int id);

}
