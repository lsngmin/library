package com.library.domain;


import lombok.Getter;

import javax.persistence.*;

@Entity
@Table
@Getter
public class User {
    @Column
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;

    @Column(nullable = false)
    private String password;
    private String email;
    private String phone;
    private String birth;
    private String name;



}
