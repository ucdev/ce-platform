<cfscript>
/**
* Rounds a number to a specific number of decimal places by using Java's math library.
*
* @param numberToRound      The number to round. (Required)
* @param numberOfPlaces      The number of decimal places. (Required)
* @param mode      The rounding mode. Defaults to even. (Optional)
* @return Returns a number.
* @author Peter J. Farrell (pjf@maestropublishing.com)
* @version 1, March 3, 2006
*/
function decimalRound(numberToRound, numberOfPlaces) {
    // Thanks to the blog of Christian Cantrell for this one
    var bd = CreateObject("java", "java.math.BigDecimal");
    var mode = "even";
    var result = "";
    
    if (ArrayLen(arguments) GTE 3) {
        mode = arguments[3];
    }

    bd.init(arguments.numberToRound);
    if (mode IS "up") {
        bd = bd.setScale(arguments.numberOfPlaces, bd.ROUND_HALF_UP);
    } else if (mode IS "down") {
        bd = bd.setScale(arguments.numberOfPlaces, bd.ROUND_HALF_DOWN);
    } else {
        bd = bd.setScale(arguments.numberOfPlaces, bd.ROUND_HALF_EVEN);
    }
    result = bd.toString();
    
    if(result EQ 0) result = 0;

    return result;
}
</cfscript>