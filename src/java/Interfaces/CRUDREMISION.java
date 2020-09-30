package Interfaces;

import Modelo.Remision;
import java.util.List;

public interface CRUDREMISION {

    public List listar();

    public Remision list(int id);

    public boolean add(Remision remision);

    public boolean edit(Remision remision);

    public boolean delete(int id);

}
