let equation = '0';

const display = document.querySelector('.display');
const buttons = document.querySelectorAll('.buttons div div');
buttons.forEach((btn) => btn.addEventListener('click', parseButton));

function parseButton() {
    let btnType = this.className;
    btnType = btnType.replace('button-', '');

    switch(btnType) {
        case 'eq':
            // parse equation
            break;
        case 'ac':
            // set equation to '0'
            break;
        case 'del':
            // delete 1 char from equation string
            break;
        default:
            if (equation == '0')
                equation = this.textContent;
            else
                equation += this.textContent;
    }

    display.textContent = equation;
}