package com.springboot.pojo;

public class Course {
    private String cno;

    private String cname;

    private Integer credit;

    private Integer semester;

    public Course() {
    }

    public Course(String cno, String cname, Integer credit) {
        this.cno = cno;
        this.cname = cname;
        this.credit = credit;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno == null ? null : cno.trim();
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public Integer getSemester() {
        return semester;
    }

    public void setSemester(Integer semester) {
        this.semester = semester;
    }

    public static class CourseFactory{
        public static Course getCourse(String param01, String param02, Integer param03){
            return new Course(param01, param02, param03);
        }
    }
}