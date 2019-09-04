package com.cicd.cicdbackend.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
public class HelloWorld {

    @GetMapping("/hi")
    public ResponseEntity<String> sayHi(@RequestParam(value = "name", required = false) final String name) throws UnknownHostException {
        String response = " Hi " + (!StringUtils.isBlank(name) ? name : "you") + "!";
        response += " -> we are in the server " + InetAddress.getLocalHost().getHostName();

        return ResponseEntity.ok(response);
    }
}
