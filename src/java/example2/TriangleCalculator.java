package example2;

/**
 *
 * @author Drew
 */
public class TriangleCalculator {

    public static String findEmptySide(String strA, String strB, String strC) {
        String emptyParam = "";
        // need to determine which parameters are not null
        if (strA.isEmpty()) {
            emptyParam = "a";
        }

        if (strB.isEmpty()) {
            emptyParam = "b";
        }

        if (strC.isEmpty()) {
            emptyParam = "c";
        }
        return emptyParam;
    }

    public static double calculateEmptySideLength(String strEmptySideName,
            String strA, String strB, String strC) {
        
        double a = 0.0;
        double b = 0.0;
        double c = 0.0;
        double sideLength = 0.0;

        char charEmptySideName = strEmptySideName.charAt(0);

        switch (charEmptySideName) {
            // solve for a
            // a = sq rt ( c^2 - b^2 )
            case 'a':
                b = Double.valueOf(strB);
                c = Double.valueOf(strC);
                sideLength = Math.sqrt(Math.pow(c, 2) - Math.pow(b, 2));
                break;
            // solve for b
            // b = sq rt ( c^2 - a^2 )
            case 'b':
                a = Double.valueOf(strA);
                c = Double.valueOf(strC);
                sideLength = Math.sqrt(Math.pow(c, 2) - Math.pow(a, 2));
                break;
            // solve for c
            // c = sq rt ( a^2 + b^2 )
            case 'c':
                a = Double.valueOf(strA);
                b = Double.valueOf(strB);
                sideLength = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2));
                break;
        }
        return sideLength;
    }
}
