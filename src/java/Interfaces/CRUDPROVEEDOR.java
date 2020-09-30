package Interfaces;

import Modelo.Proveedor;
import java.util.List;

public interface CRUDPROVEEDOR {

    public List listar();

    public Proveedor list(int id);

    public boolean add(Proveedor proveedor);

    public boolean edit(Proveedor proveedor);

    public boolean delete(int id);
}
