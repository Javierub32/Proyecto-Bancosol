package com.leftjoiners.bancosol.proyectobackend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {
    @GetMapping("/hello")
    public String doInit(Model model) {
        return "voluntarios";
    }
}
