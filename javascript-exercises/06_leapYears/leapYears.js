const leapYears = function(year) {
    let result = false;

    if (year % 4 == 0) result = true;
    if (year % 100 == 0 && year % 400 != 0) result = false;

    return result;
};

// Do not edit below this line
module.exports = leapYears;
