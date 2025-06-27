/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.QuestionDAO;

/**
 *
 * @author duong
 */
public class Answer {
     private int id;
    private String content;
    private boolean isCorrect;

    public Answer(int id, String content, boolean isCorrect) {
        this.id = id;
        this.content = content;
        this.isCorrect = isCorrect;
    }

    public int getId() { return id; }
    public String getContent() { return content; }
    public boolean isCorrect() { return isCorrect; }
}

 
    

