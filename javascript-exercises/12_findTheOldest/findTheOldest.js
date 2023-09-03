const findTheOldest = function(people) {
    let currentYear = new Date().getFullYear();

    return people.reduce((eldestPerson, curPerson) => {
        eldestPerson.yearOfDeath = eldestPerson.yearOfDeath ? eldestPerson.yearOfDeath : currentYear
        curPerson.yearOfDeath = curPerson.yearOfDeath ? curPerson.yearOfDeath : currentYear

        const eldestAge = eldestPerson.yearOfDeath - eldestPerson.yearOfBirth;
        const curAge = curPerson.yearOfDeath - curPerson.yearOfBirth;

        return eldestAge > curAge ? eldestPerson : curPerson;
    });
};

// Do not edit below this line
module.exports = findTheOldest;
