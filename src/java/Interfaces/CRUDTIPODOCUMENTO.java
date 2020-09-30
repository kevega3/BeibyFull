package Interfaces;

import Modelo.TipoDocumento;
import java.util.List;

public interface CRUDTIPODOCUMENTO {

    public List listar();

    public TipoDocumento list(int id);

    public boolean add(TipoDocumento tipodoc);

    public boolean edit(TipoDocumento tipodoc);

    public boolean delete(int id);
}
