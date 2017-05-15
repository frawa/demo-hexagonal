import org.junit.Test;

import static org.junit.Assert.*;

public class DiscountStepsTest {

    @Test
    public void steps() {
        double[][] steps = {{0,0}, {20, 0.1}, {50,0.5}};
        Discount.DiscountRate stepRate = new DiscountSteps(steps);
        assertEquals(0,stepRate.get(0),1e-2);
        assertEquals(0.1,stepRate.get(10),1e-2);
        assertEquals(0.5,stepRate.get(100),1e-2);
        assertEquals(0.1,stepRate.get(20),1e-2);
        assertEquals(0.5,stepRate.get(50),1e-2);
        assertEquals(0.0,stepRate.get(-1),1e-2);
    }
}