const removeFromArray = function(array, ...args) {
    let filteredArray = [];

    for (val of array) {
        let filtered = false;

        for (i of args) {
            if (val === i) filtered = true;
        }

        if (!filtered) filteredArray.push(val);
    }

    return filteredArray;
};

// Do not edit below this line
module.exports = removeFromArray;
