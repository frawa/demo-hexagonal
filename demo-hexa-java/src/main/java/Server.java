import static spark.Spark.*;

public class Server {

    public static void main(String[] args) {
        double[][] steps = {{0, 0}, {20, 0.1}, {50, 0.5}};
        Discount.DiscountRate discountRate = new DiscountSteps(steps);

        Discount discount = new Discount(discountRate);

        get("/discount/:amount", (req, res) -> {
            double amount = Double.parseDouble(req.params("amount"));
            double result = discount.get(amount);
            return Double.toString(result);
        });
    }
}
