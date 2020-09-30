package Interfaces;

import Modelo.DetallesCompra;
import java.util.List;

public interface CRUD_DETALLESCOMPRA {

    public List listar();

    public DetallesCompra list(int id);
}
