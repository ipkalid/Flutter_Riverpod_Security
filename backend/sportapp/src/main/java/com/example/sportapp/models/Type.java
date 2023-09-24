package com.example.sportapp.models;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
public class Type implements Serializable {

    String name;
    String icon;
    List<Course> courseList;


}
