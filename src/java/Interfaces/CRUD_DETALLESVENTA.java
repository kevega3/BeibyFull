package Interfaces;

import Modelo.DetallesVenta;
import java.util.List;

public interface CRUD_DETALLESVENTA {

    public List listar();

    public DetallesVenta list(int id);
}
