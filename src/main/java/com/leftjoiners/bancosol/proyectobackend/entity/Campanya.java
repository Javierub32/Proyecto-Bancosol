package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "campanya")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Campanya {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_tipo")
    private TipoCampanya tipoCampanya;

    @Column(nullable = false)
    private String nombre;

    @Column(name = "fecha_inicio")
    private LocalDate fechaInicio;

    @Column(name = "fecha_fin")
    private LocalDate fechaFin;

    private Integer duracion;

    // --- NUEVA RELACIÓN MUCHOS A MUCHOS ---
    @ManyToMany
    @JoinTable(
            name = "campanya_cadena", // Nuevo nombre más estándar para tablas de unión
            joinColumns = @JoinColumn(name = "id_campanya"),
            inverseJoinColumns = @JoinColumn(name = "id_cadena")
    )
    private List<Cadena> cadenasParticipantes = new ArrayList<>();

    @OneToMany(mappedBy = "campanya")
    private List<TiendaCampanya> tiendasCampanya = new ArrayList<>();
}