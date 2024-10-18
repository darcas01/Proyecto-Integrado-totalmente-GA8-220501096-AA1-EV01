package com.darwuich.compensapp.models;

import com.darwuich.compensapp.models.*;

public class HistorialCita {
    private int idCita;
    private String fecha;
    private String hora;
    private String ubicacion;
    private String especialista;
    private String especialidad;

    // Constructor por defecto (sin parámetros)
    public HistorialCita() {
    }

    // Constructor con parámetros
    public HistorialCita(int idCita, String fecha, String hora, String ubicacion, String especialista, String especialidad) {
        this.idCita = idCita;
        this.fecha = fecha;
        this.hora = hora;
        this.ubicacion = ubicacion;
        this.especialista = especialista;
        this.especialidad = especialidad;
    }

    // Getters y Setters
    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getEspecialista() {
        return especialista;
    }

    public void setEspecialista(String especialista) {
        this.especialista = especialista;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
}