package com.example.sportapp.models;

import lombok.*;


@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class AuthBody {
    String email;
    String password;
}