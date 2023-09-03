const repeatString = function(string, num) {
    let result = '';

    for (i = 0; i < num; i++) {
        result += string;
    }

    if (num < 0) result = 'ERROR';

    return result;
};

// Do not edit below this line
module.exports = repeatString;
