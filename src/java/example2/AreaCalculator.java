
package example2;

/**
 *
 * @author Drew
 */
public class AreaCalculator {
    public static double calculateCircleArea(double radius){
        return 3.14159265359*Math.pow(radius,2);
    }
    public static double calculateRectangleArea(double length,double width){
        return length*width;
    }
}
