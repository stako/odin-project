let gridSize = 16; // how many columns (and rows) in the grid

const reset = document.querySelector('#reset');
reset.addEventListener('click', resetSquares);

const inputs = document.querySelectorAll('input');
inputs.forEach((input) => input.addEventListener('click', function() {
    gridSize = +input.id;
    setGridSize(gridSize);
}));

const container = document.querySelector('#container');
setGridSize(gridSize);

// returns an array of squares (div elements) for the sketch grid
function createSquares(numSquares) {
    let squares = [];

    for (let i = 1; i <= numSquares; i++) {
        const square = document.createElement('div');
        square.classList.add('blank-square');
        square.style['flex-basis'] = `${1/gridSize*100}%`;
        square.addEventListener('mouseover', onMouseover);
        squares.push(square);
    }

    return squares;
}

function onMouseover() {
    this.classList.replace('blank-square', 'filled-square');
}

function resetSquares() {
    const filledSquares = document.querySelectorAll('.filled-square');

    filledSquares.forEach((square) => square.classList.replace('filled-square', 'blank-square'));
}

function setGridSize(size) {
    container.replaceChildren(...createSquares(size**2));
}