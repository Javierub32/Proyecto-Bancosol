package com.leftjoiners.bancosol.proyectobackend.controller.rest;

import com.leftjoiners.bancosol.proyectobackend.dto.AsignacionTurno;
import com.leftjoiners.bancosol.proyectobackend.dto.Turno;
import com.leftjoiners.bancosol.proyectobackend.service.AsignacionTurnoService;
import com.leftjoiners.bancosol.proyectobackend.service.TurnoService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@CrossOrigin("*")
@RequestMapping("/api/asignacionTurnos")
public class AsignacionTurnoRestController {
    private final AsignacionTurnoService asignacionTurnoService;
    private final TurnoService turnoService;

    @GetMapping("/")
    public List<AsignacionTurno> doInit() {
        return this.asignacionTurnoService.listarAsignacionColaboradores();
    }

    @GetMapping("/buscarTurno/{idTienda}/{turno}/{linealActual}")
    public Turno buscarTurno(
            @PathVariable Integer idTienda,
            @PathVariable Integer turno,
            @PathVariable Integer linealActual) {

        return turnoService.buscarTurnoEspecifico(idTienda, turno, linealActual);
    }
}
