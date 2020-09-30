package Interfaces;

import Modelo.Sede;
import java.util.List;

public interface CRUDSEDE {

    public List listar();

    public Sede list(int id);

    public boolean add(Sede sede);

    public boolean edit(Sede sede);

    public boolean delete(int id);

}
