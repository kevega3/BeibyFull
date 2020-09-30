package Interfaces;

import Modelo.Persona;
import java.util.List;

public interface CRUDPERSONA {

    public List listar();

    public Persona list(int id);

    public boolean add(Persona persona);

    public boolean edit(Persona persona);

    public boolean delete(int id);

}
