package Interfaces;

import Modelo.Producto;
import java.util.List;

public interface CRUDPRODUCTO {

    public List listar();

    public Producto list(int id);

    public boolean add(Producto producto);

    public boolean edit(Producto producto);

    public boolean delete(int id);

}
