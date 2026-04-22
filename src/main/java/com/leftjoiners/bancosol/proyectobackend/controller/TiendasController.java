package com.leftjoiners.bancosol.proyectobackend.controller;

import com.leftjoiners.bancosol.proyectobackend.dao.TiendaRepository;
import com.leftjoiners.bancosol.proyectobackend.entity.Tienda;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class TiendasController {

    @Autowired
    protected TiendaRepository tiendaRepository;
    @GetMapping("/tiendas")
    public String doTiendas(Model model) {
        List<Tienda> tiendas = tiendaRepository.findAll();

        model.addAttribute("tiendas", tiendas);
        return "tiendas";
    }

}
