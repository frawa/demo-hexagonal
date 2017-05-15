import java.util.stream.IntStream;

public class DiscountSteps implements Discount.DiscountRate {

    private final double[][] steps;

    DiscountSteps(double[][] steps) {
        this.steps = steps;
    }

    @Override
    public double get(double amount) {
        return IntStream.range(1, steps.length)
                .filter(i -> steps[i - 1][0] < amount && amount <= steps[i][0])
                .mapToDouble(i -> steps[i][1])
                .findFirst()
                .orElse(amount <= steps[0][0] ? steps[0][1] : steps[steps.length - 1][1]);
    }
}
