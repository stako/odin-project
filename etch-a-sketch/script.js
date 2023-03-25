const gridSize = 16; // how many columns (and rows) in the grid


const container = document.querySelector('#container');
const totalSquares = gridSize**2;

for (let i = 1; i <= totalSquares; i++) {
    const square = document.createElement('div');
    square.classList.add('square');
    square.addEventListener('mouseover', onMouseover);
    container.appendChild(square);
}

function onMouseover() {
    this.style['background-color'] = 'black';
}