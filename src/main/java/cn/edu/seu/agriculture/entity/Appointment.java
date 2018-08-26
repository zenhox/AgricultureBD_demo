package cn.edu.seu.agriculture.entity;

import java.util.Date;

public class Appointment extends AppointmentKey {
    private Date appointTime;

    public Appointment(Long bookId, Long studentId, Date appointTime) {
        super(bookId, studentId);
        this.appointTime = appointTime;
    }

    public Appointment() {
        super();
    }

    public Date getAppointTime() {
        return appointTime;
    }

    public void setAppointTime(Date appointTime) {
        this.appointTime = appointTime;
    }
}