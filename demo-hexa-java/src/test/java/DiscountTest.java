import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;


public class DiscountTest {
    private Discount discount;

    static class ConstantDiscountRate implements Discount.DiscountRate {
        final double rate;

        ConstantDiscountRate(double rate) {
            this.rate = rate;
        }

        public double get(double amount) {
            return rate;
        }
    }

    @Before
    public void initDiscount() {
        discount = new Discount(new ConstantDiscountRate(0.1));
    }

    @Test
    public void discount() {
        assertEquals(1d, discount.get(10d),1e-2);
    }
}
