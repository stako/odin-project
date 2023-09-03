const fibonacci = function(member) {
    if (member < 0) return 'OOPS';
    member = +member;

    let fib = [1, 1];

    for (let i = 2; i <= member; i++) {
        fib[i] = fib[i-1] + fib[i-2];
    }

    return fib[member-1];
};

// Do not edit below this line
module.exports = fibonacci;
