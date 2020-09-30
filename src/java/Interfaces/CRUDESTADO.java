package Interfaces;

import Modelo.Estado;
import java.util.List;

public interface CRUDESTADO {

    public List listar();

    public Estado list(int id);

}
