const gridSize = 16; // how many columns (and rows) in the grid


const container = document.querySelector('#container');
const totalSquares = gridSize**2;

for (let i = 1; i <= totalSquares; i++) {
    const square = document.createElement('div');
    square.classList.add('blank-square');
    square.style['flex-basis'] = `${1/gridSize*100}%`;
    square.addEventListener('mouseover', onMouseover);
    container.appendChild(square);
}

function onMouseover() {
    this.classList.replace('blank-square', 'filled-square');
}