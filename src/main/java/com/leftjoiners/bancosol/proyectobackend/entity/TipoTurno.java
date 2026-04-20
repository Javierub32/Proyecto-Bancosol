package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tipo_turno")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TipoTurno {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;

    @OneToMany(mappedBy = "tipoTurno")
    private List<AsignacionTurno> asignacionesTurno = new ArrayList<>();
}