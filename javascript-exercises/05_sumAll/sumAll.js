const sumAll = function(min, max) {
    let result = 0;

    if (typeof(min) != 'number' || typeof(max) != 'number' || min < 0 || max < 0) return 'ERROR';

    if (min > max) [min, max] = [max, min];

    for (;min <= max;min++) {
        result += min;
    }

    return result;
};

// Do not edit below this line
module.exports = sumAll;
