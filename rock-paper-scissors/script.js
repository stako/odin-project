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

function game() {
    // plays 5 rounds and outputs the results into the console
    let wins = 0;
    let losses = 0;
    let ties = 0;

    for (let i = 0; i < 5; i++) {
        let result = playRound(getPlayerChoice(), getComputerChoice());
        console.log(`Round 1: ${result}`);

        switch(result) {
            case 'win':
                wins++;
                break;
            case 'lose':
                losses++;
                break;
            case 'tie':
                ties++;
        }
    }
    
    console.log(`Wins: ${wins} | Losses: ${losses} | Ties : ${ties}`);
}