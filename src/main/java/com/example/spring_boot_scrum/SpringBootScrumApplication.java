package com.example.spring_boot_scrum;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SpringBootScrumApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootScrumApplication.class, args);
    }

    @GetMapping("/")
    public String home(@RequestParam(value = "myName", defaultValue = "World") String name) {
        return String.format("Home page <a href='/hello'>click</a>");
    }

    @GetMapping("/hello")
    public String sayHello(@RequestParam(value = "myName", defaultValue = "World") String name) {
        return String.format("Hello %s!", name);
    }
}
