package com.alexprom.uppg_reports;

public class OtgAccount {
    private double massValue;
    private double volumeValue;
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public double getMassValue() {
        return massValue;
    }

    public void setMassValue(double massValue) {
        this.massValue = massValue;
    }

    public double getVolumeValue() {
        return volumeValue;
    }

    public void setVolumeValue(double volumeValue) {
        this.volumeValue = volumeValue;
    }

    public double getUppgMassValue() {
        return uppgMassValue;
    }

    public void setUppgMassValue(double uppgMassValue) {
        this.uppgMassValue = uppgMassValue;
    }

    public double getUppgVolumeValue() {
        return uppgVolumeValue;
    }

    public void setUppgVolumeValue(double uppgVolumeValue) {
        this.uppgVolumeValue = uppgVolumeValue;
    }

    public double getTspMassValue() {
        return tspMassValue;
    }

    public void setTspMassValue(double tspMassValue) {
        this.tspMassValue = tspMassValue;
    }

    public double getTspVolumeValue() {
        return tspVolumeValue;
    }

    public void setTspVolumeValue(double tspVolumeValue) {
        this.tspVolumeValue = tspVolumeValue;
    }
    private double uppgMassValue;
    private double uppgVolumeValue;
    private double tspMassValue;
    private double tspVolumeValue;
    
    public OtgAccount(){
        massValue = 0;
        volumeValue = 0;
    }
}
