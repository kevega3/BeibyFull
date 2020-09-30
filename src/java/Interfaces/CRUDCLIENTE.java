package Interfaces;

import Modelo.Cliente;
import java.util.List;

public interface CRUDCLIENTE {

    public List listar();

    public Cliente list(int id);

    public boolean add(Cliente empleado);

    public boolean edit(Cliente empleado);

    public boolean delete(int id);

}
