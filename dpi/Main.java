package dpi;

public class Main {
    public static void main (String[] args){
        Car fuelcar = new Car(new PetrolEngine());
        Car dieselCar = new Car(new DieselEngine());
        Car hybridCar = new Car(new HybridEngine());

        //Jalankan mobil
        fuelcar.start();
        dieselCar.start();
        hybridCar.start();
    }

}
