package Interfaces;

import Modelo.Novedad;
import java.util.List;

public interface CRUDNOVEDAD {

    public List listarnovedad();

    public Novedad list(int id);

    public boolean guardarnovedad(Novedad novedad);

    public boolean edit(Novedad novedad);

    public boolean delete(int id);

    public boolean guardardetallenovedad(Novedad novedad);

    public String idnovedad();
}
