const palindromes = function (str) {
    str = str.toLowerCase();
    
    // remove punctuation and spaces
    let regex = /[!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~ ]/g;
    str = str.replace(regex, "");

    let newStr = '';

    // reverse str
    for (let i = 1; i <= str.length; i++) {
        newStr += str[str.length-i];
    }

    return newStr == str;
};

// Do not edit below this line
module.exports = palindromes;
