package com.library.domain;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int userId;
    @Column
    private String password;
    @Column
    private String email;
    @Column
    private String phone;
    @Column
    private String birth;
    @Column
    private String name;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
