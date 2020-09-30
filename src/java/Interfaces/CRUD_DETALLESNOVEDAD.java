package Interfaces;

import Modelo.DetallesNovedad;
import java.util.List;

public interface CRUD_DETALLESNOVEDAD {

    public List listar();

    public DetallesNovedad list(int id);
}
