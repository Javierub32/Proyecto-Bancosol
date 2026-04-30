package com.leftjoiners.bancosol.proyectobackend.controller;

import com.leftjoiners.bancosol.proyectobackend.dao.AsignacionColaboradoresRepository;
import com.leftjoiners.bancosol.proyectobackend.dao.TiendaCampanyaRepository;
import com.leftjoiners.bancosol.proyectobackend.dao.TipoTurnoRepository;
import com.leftjoiners.bancosol.proyectobackend.entity.AsignacionTurno;
import com.leftjoiners.bancosol.proyectobackend.entity.TiendaCampanya;
import com.leftjoiners.bancosol.proyectobackend.entity.VistaAsignacionColaboradores;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AsignacionColaboradoresController {
    @Autowired
    protected TiendaCampanyaRepository tiendaCampanyaRepository;

    @Autowired
    protected AsignacionColaboradoresRepository asignacionColaboradoresRepository;

    @Autowired
    protected TipoTurnoRepository tipoTurnoRepository;



    @GetMapping("/")
    public String doInit(Model model) {
        List<VistaAsignacionColaboradores> asignacionColaboradores = asignacionColaboradoresRepository.findAll();

        model.addAttribute("asignacionColaboradores", asignacionColaboradores);
        return "voluntarios";
    }

    @PostMapping("/buscarTurno")
    public String buscarTurno(@RequestParam(value = "id", required = false) Integer id,
                              @RequestParam(value = "turno", required = false) Integer turno,
                              @RequestParam(value = "lineales", required = false) Integer lineales,
                              @RequestParam(value = "linealActual", required = false) Integer linealActual,
                              Model model) {
        TiendaCampanya tiendaCampanya = tiendaCampanyaRepository.findById(id).orElse(null);

        model.addAttribute("id", id);
        model.addAttribute("turno", turno);
        model.addAttribute("lineales", lineales);
        model.addAttribute("linealActual", linealActual);
        model.addAttribute("tienda", tiendaCampanya);
        return "info_turno";
    }

    @GetMapping("/crearTurno")
    public String crearTurno(@RequestParam(value = "id", required = false) Integer id,
                              @RequestParam(value = "turno", required = false) Integer turno,
                              @RequestParam(value = "lineal", required = false) Integer lineal,
                              Model model) {
        TiendaCampanya tienda = null;
        AsignacionTurno asignacionTurno = null;

        // Buscamos la tienda si nos pasan un ID
        if (id != null) {
            tienda = tiendaCampanyaRepository.findById(id).orElse(null);
        }

        if (tienda != null && tienda.getTurnos() != null) {
            asignacionTurno = tienda.getTurnos().stream()
                    .filter(t -> t.getTipoTurno() != null
                            && t.getTipoTurno().getId().equals(turno)
                            && (lineal == null || lineal.equals(t.getLineal())))
                    .findFirst()
                    .orElse(null);
        }

        if (asignacionTurno == null) {
            asignacionTurno = new AsignacionTurno();
            asignacionTurno.setTiendaCampanya(tienda);
            asignacionTurno.setLineal(lineal);
            asignacionTurno.setTipoTurno(this.tipoTurnoRepository.findById(turno).orElse(null));
        }

        model.addAttribute("asignacionTurno", asignacionTurno);
        return "formulario_turno";
    }
}
