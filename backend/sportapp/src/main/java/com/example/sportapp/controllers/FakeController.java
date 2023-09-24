package com.example.sportapp.controllers;


import com.example.sportapp.models.*;
import com.example.sportapp.models.Course;
import com.example.sportapp.models.Type;
import lombok.Data;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
public class FakeController {

    @GetMapping("/data")
    Map<String, Object> getTypes() {

        HashMap<String, Object> data = new HashMap<String, Object>();

        List<Course> courseList = new ArrayList<>();

        Type t1 = new Type("Cycling", "", courseList);

        courseList.add(new Course("Course1", "Lorem ipsum dolor sit amet"));
        Type t2 = new Type("Running", "", courseList);

        courseList.add(new Course("Course2", "Lorem ipsum dolor sit amet"));


        Type t3 = new Type("Swimming", "", courseList);
        courseList.add(new Course("Course3", "Lorem ipsum dolor sit amet"));

        Type t4 = new Type("Crossfits", "", courseList);


        List<Type> types = new ArrayList<>();

        types.add(t1);
        types.add(t2);
        types.add(t3);
        types.add(t4);

        data.put("types", types);


        return data;

    }

    @PostMapping(
            value = "/login", consumes = "application/json", produces = "application/json")
    Map<String, String> login(@RequestBody AuthBody authBody) {
        HashMap<String, String> data = new HashMap<String, String>();
        System.out.println(authBody);
        if (authBody.getEmail().equals("email@mail.com") && authBody.getPassword().equals("1234")) {
            UUID uuid = UUID.randomUUID();
            data.put("token", uuid.toString());
            data.put("name", "Khalid");
            return data;
        }
        data.put("error", "Error username or password");
        return data;

    }


}
