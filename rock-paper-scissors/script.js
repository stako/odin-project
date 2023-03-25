const msgNode = document.querySelector('#msg');
const scoreNode = document.querySelector('#score');
let playerScore = 0;
let compScore = 0;

function getComputerChoice() {
    let num = Math.floor(Math.random() * 3);

    switch(num) {
        default:
            return 'rock';
            break;
        case 1:
            return 'paper';
            break;
        case 2:
            return 'scissors';
    }
}

function getPlayerChoice() {
    let choice = prompt("Enter your choice:");
    choice = choice.toLowerCase();

    if (choice != 'rock' && choice != 'paper' && choice != 'scissors') {
        choice = getPlayerChoice();
    }

    return choice;
}

function playRound(playerChoice, computerChoice) {
    let result;

    switch(playerChoice) {
        case 'rock':
            switch(computerChoice) {
                case 'rock':
                    result = 'tie';
                    break;
                case 'paper':
                    result = 'lose';
                    break;
                case 'scissors':
                    result = 'win';
            }
            break;
        case 'paper':
            switch(computerChoice) {
                case 'rock':
                    result = 'win';
                    break;
                case 'paper':
                    result = 'tie';
                    break;
                case 'scissors':
                    result = 'lose';
            }
            break;
        case 'scissors':
            switch(computerChoice) {
                case 'rock':
                    result = 'lose';
                    break;
                case 'paper':
                    result = 'win';
                    break;
                case 'scissors':
                    result = 'lose';
            }
    }
    
    updateScore(result);
    updateMsg(playerChoice, computerChoice, result);
}

function updateScore(result) {
    switch(result) {
        case 'win':
            playerScore++;
            break;
        case 'lose':
            compScore++;
            break;
    }

    scoreNode.textContent = `Score: ${playerScore} - ${compScore}`
}

function updateMsg(playerChoice, computerChoice, result) {
    let m = "";

    switch(result) {
        case 'tie':
            m = "It's a tie!";
            break;
        case 'win':
            m = `You win! ${playerChoice} beats ${computerChoice}.`;
            break;
        case 'lose':
            m = `You lose! ${playerChoice} loses to ${computerChoice}.`;
    }

    if (playerScore > 4 || compScore > 4) {
        m = 'Match over. Play again?';
        playerScore = 0;
        compScore = 0;
    }

    msgNode.textContent = m;
}


const buttons = document.querySelectorAll('button');

buttons.forEach(function(btn) {
    btn.addEventListener('click', () => playRound(btn.id, getComputerChoice()));
});