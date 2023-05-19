let equation = '0';

const display = document.querySelector('.display');
const buttons = document.querySelectorAll('.buttons div div');
buttons.forEach((btn) => btn.addEventListener('click', parseButton));

const operations = {
    add: (a,b) => a+b,
    sub: (a,b) => a-b,
    mul: (a,b) => a*b,
    div: (a,b) => a/b,
}

function parseButton() {
    let btnType = this.className;
    btnType = btnType.replace('button-', '');

    switch(btnType) {
        case 'eq':
            parseEquation();
            break;
        case 'ac':
            equation = '0';
            break;
        case 'del':
            equation = equation.slice(0, -1);
            if (equation.length == 0)
                equation = '0';
            break;
        default:
            equation += this.textContent;
    }

    display.textContent = equation;
}

function parseEquation() {
    let numA = '', numB = '', operator = '', foundOperator = false;

    for (let i in equation) {
        let char = equation[i];

        if (char != '.' && isNaN(char)) {
            operator = char;
            foundOperator = true;
        } else if (!foundOperator)
            numA += char;
        else
            numB += char;
    }

    switch(operator) {
        case '÷':
            operator = 'div';
            break;
        case '×':
            operator = 'mul';
            break;
        case '−':
            operator = 'sub';
            break;
        case '+':
            operator = 'add';
            break;
    }

    numA = Number(numA);
    numB = Number(numB);

    equation = operations[operator](numA, numB).toString();
}