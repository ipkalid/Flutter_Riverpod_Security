package com.example.sportapp.models;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.Duration;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
public class Course {

    String name;
    String description;
    LocalDateTime timeIn;
    LocalDateTime timeOut;

    public Course(String name, String description) {
        this.name = name;
        this.description = description;
        timeIn = LocalDateTime.now();
        timeOut = LocalDateTime.now().plus(Duration.ofMinutes(30));
    }
}
