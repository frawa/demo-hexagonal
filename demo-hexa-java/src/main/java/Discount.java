class Discount {

    private final DiscountRate discountRate;

    interface DiscountRate {
        double get(double amount);
    }

    Discount(DiscountRate discountRate) {
        this.discountRate = discountRate;
    }

    double get(double amount) {
        return amount * this.discountRate.get(amount);
    }
}
