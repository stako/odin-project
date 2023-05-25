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

let operatorPos = -1;
let hasDecimal = false;

function parseButton() {
    let btnType = this.className;
    btnType = btnType.replace('button-', '');

    switch(btnType) {
        case 'eq':
            parseEquation();
            break;
        case 'ac':
            equation = '0';
            operatorPos = -1;
            hasDecimal = false;
            break;
        case 'del':
            if (equation[equation.length - 1] == '.')
                hasDecimal = false;

            equation = equation.slice(0, -1);

            if (equation.length == 0)
                equation = '0';
                
            if (equation.length < operatorPos + 1) {
                operatorPos = -1;
                if (equation.search('[.]') != -1)
                    hasDecimal = true;
            }
            break;
        case 'add':
        case 'sub':
        case 'mul':
        case 'div':
            if(operatorPos > -1)
                break;

            operatorPos = equation.length;
            hasDecimal = false;
            equation += this.textContent;
            break;
        case 'dec':
            if (hasDecimal)
                break;

            hasDecimal = true;
            equation += this.textContent;
            break;
        default:
            equation += this.textContent;
    }

    sanitizeEquation()

    display.textContent = equation;
}

function sanitizeEquation() {
    // remove preceding 0 (1st operand)
    if (equation.length > 1 && equation[0] == '0' && !isNaN(equation[1]))
        equation = equation.slice(1);

    let index = equation.search(/[÷×−+]/);
    if (index != -1) {
        // remove preceding 0 (2nd operand)
        if (equation.length > index+2 && equation[index+1] == '0' && !isNaN(equation[index+2]))
            equation = equation.slice(0, index+1) + equation.slice(index+2);

        // add preceding 0 before decimal (2nd operand)
        if (equation[index+1] == '.')
            equation = equation.slice(0, index+1) + '0' + equation.slice(index+1);
    }
}

function parseEquation() {
    let numA = '', numB = '', operator;

    for (let i in equation) {
        let char = equation[i];

        if (char != '.' && isNaN(char)) {
            operator = char;
        } else if (!operator)
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