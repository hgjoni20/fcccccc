const { __esModule } = require("@babel/generator");

function isPrime (num) {
    let divisors = 0;
    for (let i=1; i<=num; i++) {
        if (num % i == 0 ) {
            divisors++
        }
        
    }
    if (divisors <= 2 && !(num < 2) ) {
        return true;
    }
    else {
        return false;
    }
}
module.exports = {
    isPrime
}
