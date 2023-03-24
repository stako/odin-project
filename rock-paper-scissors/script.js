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

    return result;
}