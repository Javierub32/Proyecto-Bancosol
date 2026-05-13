package com.leftjoiners.bancosol.proyectobackend.controller;

import com.leftjoiners.bancosol.proyectobackend.dao.*;
import com.leftjoiners.bancosol.proyectobackend.dto.AsignacionTurno;
import com.leftjoiners.bancosol.proyectobackend.entity.ColaboradorEntity;
import com.leftjoiners.bancosol.proyectobackend.entity.TiendaCampanyaEntity;
import com.leftjoiners.bancosol.proyectobackend.entity.TurnoEntity;
import com.leftjoiners.bancosol.proyectobackend.service.AsignacionTurnoService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalTime;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/turnos")
public class AsignacionTurnoController {
    @Autowired
    protected TiendaCampanyaRepository tiendaCampanyaRepository;

    private final AsignacionTurnoService asignacionTurnoService;

    @Autowired
    protected TipoTurnoRepository tipoTurnoRepository;

    @Autowired
    protected ColaboradoresRespository colaboradoresRespository;

    @Autowired
    protected TurnoRepository turnoRepository;

    @GetMapping("")
    public String doInit(Model model) {
        List<AsignacionTurno> asignacionColaboradores = asignacionTurnoService.listarAsignacionColaboradores();

        model.addAttribute("asignacionColaboradores", asignacionColaboradores);
        model.addAttribute("currentSection", "turnos");
        return "turnos/asignacion_turno";
    }

    @PostMapping("/buscarTurno")
    public String buscarTurno(@RequestParam(value = "id", required = false) Integer id,
                              @RequestParam(value = "turno", required = false) Integer turno,
                              @RequestParam(value = "lineales", required = false) Integer lineales,
                              @RequestParam(value = "linealActual", required = false) Integer linealActual,
                              Model model) {
        TiendaCampanyaEntity tiendaCampanya = tiendaCampanyaRepository.findById(id).orElse(null);
        TurnoEntity asignacionTurno = this.turnoRepository.buscarTurnoEspecifico(id, turno, linealActual).orElse(null);

        model.addAttribute("id", id);
        model.addAttribute("turno", turno);
        model.addAttribute("lineales", lineales);
        model.addAttribute("linealActual", linealActual);
        model.addAttribute("tienda", tiendaCampanya);
        model.addAttribute("asignacionTurno", asignacionTurno);

        return "turnos/info_turno";
    }

    @GetMapping("/crearTurno")
    public String crearTurno(@RequestParam(value = "id", required = false) Integer id,
                              @RequestParam(value = "turno", required = false) Integer turno,
                              @RequestParam(value = "lineal", required = false) Integer lineal,
                              Model model) {
        TiendaCampanyaEntity tienda = tiendaCampanyaRepository.findById(id).orElse(null);;
        TurnoEntity asignacionTurno = this.turnoRepository.buscarTurnoEspecifico(id, turno, lineal).orElse(null);
        ColaboradorEntity colaborador = null;

        if (asignacionTurno != null) colaborador = asignacionTurno.getColaborador();

        if (asignacionTurno == null) {
            asignacionTurno = new TurnoEntity();
            asignacionTurno.setTiendaCampanya(tienda);
            asignacionTurno.setLineal(lineal);
            asignacionTurno.setTipoTurno(this.tipoTurnoRepository.findById(turno).orElse(null));
        }

        model.addAttribute("colaboradores", this.colaboradoresRespository.findAll());
        model.addAttribute("colaborador", colaborador);
        model.addAttribute("asignacionTurno", asignacionTurno);
        model.addAttribute("currentSection", "turnos");
        return "turnos/formulario_turno";
    }

    @PostMapping("/guardarTurno")
    public String guardarTurno(@RequestParam(value = "id", required = false) Integer id,
                               @RequestParam("tiendaCampanyaId") Integer tiendaCampanyaId,
                               @RequestParam("tipoTurnoId") Integer tipoTurnoId,
                               @RequestParam("lineal") Integer lineal,
                               @RequestParam("idColaborador") Integer idColaborador,
                               @RequestParam("horaInicio") LocalTime horaInicio,
                               @RequestParam("horaFin") LocalTime horaFin,
                               @RequestParam("numVoluntarios") Integer numVoluntarios,
                               @RequestParam("observaciones") String observaciones) {
        TurnoEntity turno = new TurnoEntity();
        turno.setId(id);
        turno.setTiendaCampanya(tiendaCampanyaRepository.findById(tiendaCampanyaId).orElse(null));
        turno.setLineal(lineal);
        turno.setTipoTurno(this.tipoTurnoRepository.findById(tipoTurnoId).orElse(null));
        turno.setColaborador(this.colaboradoresRespository.findById(idColaborador).orElse(null));
        turno.setHoraInicio(horaInicio);
        turno.setHoraFin(horaFin);
        turno.setNumVoluntarios(numVoluntarios);
        turno.setObservaciones(observaciones);
        this.turnoRepository.save(turno);

        return "redirect:/turnos";
    }

    @PostMapping("/buscarColaborador")
    public String buscarColaborador(@RequestParam("id") Integer id, Model model) {
        ColaboradorEntity colaborador = this.colaboradoresRespository.findById(id).get();

        model.addAttribute("colaborador", colaborador);

        return "colaboradores/info_colaboradores";
    }
}
