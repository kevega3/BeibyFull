package Interfaces;

import Modelo.Marca;
import java.util.List;

public interface CRUDMARCA {

    public List listarmarca();

    public Marca list(int id);

    public boolean add(Marca marca);

    public boolean edit(Marca marca);

    public boolean delete(int id);

}
