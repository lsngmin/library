package com.library.domain;


import lombok.Getter;

import javax.persistence.*;

@Entity @Getter
@Table
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int user_id;

    @Column(nullable = false)
    private String password;
    private String email;
    private String phone;
    private String birth;
    private String name;



}
