package com.cicd.cicdbackend.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorld {

    @GetMapping("/hi")
    public ResponseEntity<String> sayHi(@RequestParam(value = "name", required = false) final String name) {
        return ResponseEntity.ok(" Hi " + (!StringUtils.isBlank(name) ? name : "you") + "!");
    }
}
