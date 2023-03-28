let numA = null, numB = null, operator = null, solution = null;

const display = document.querySelector('.display');
const buttons = document.querySelectorAll('.buttons div div');
buttons.forEach((btn) => btn.addEventListener('click', parseButton));

const opButtons = {
    add: true,
    sub: true,
    mul: true,
    div: true,
    eq: true,
};

const numButtons = {
    0: true,
    1: true,
    2: true,
    3: true,
    4: true,
    5: true,
    6: true,
    7: true,
    8: true,
    9: true,
}

const operations = {
    add: (a,b) => a+b,
    sub: (a,b) => a-b,
    mul: (a,b) => a*b,
    div: (a,b) => a/b,
}

function parseButton(event) {
    let btnType = this.className;
    btnType = btnType.replace('button-', '');

    if (opButtons[btnType]) {
        if (numA === null)
            return;

        if (btnType == 'eq' && numB === null)
            return;

        if (btnType != 'eq')
            operator = btnType;

        doMath();
    }

    if (numButtons[btnType]) {
        if (numA === null) {
            numA = Number(btnType);
        } else if (operator === null) {
            numA = Number(numA + btnType); // number+string = concatenation
        } else if (numB === null) {
            numB = Number(btnType);
        } else {
            numB = Number(numB + btnType);
        }
    }

    updateDisplay();
}

function doMath() {
    if (numA !== null && numB !== null && operator !== null) {
        solution = operations[operator](numA, numB);
    }
}

function updateDisplay() {
    if (solution !== null) {
        display.textContent = solution;
    } else if (numB !== null) {
        display.textContent = numB;
    } else if (numA !== null) {
        display.textContent = numA;
    } else {
        display.textContent = 0;
    }
}