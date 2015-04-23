/* TODO:
   - bounce the ball off of the paddle
   - let the ball go past the paddle, and reset the ball pos.
   - keep score
   - make bricks to hit with the ball
*/

var WIDTH = 800;
var HEIGHT = 600;
size(WIDTH, HEIGHT);
background("white");

var x = 10;
var y = 10;

var ballSize = 20;

var speedX = 5;
var speedY = 5;

var paddleSpeed = 0;
var paddleX = WIDTH / 2;
var paddleY = HEIGHT - 75;
var paddleWidth = 100;
var paddleHeight = 10;

// draw the ball
ellipse(x, y, ballSize, ballSize);

// draw the paddle
rect (paddleX, paddleY, paddleWidth, paddleHeight);

void draw() {
    // clear the screen
    background("white");

    // increase/decrease x and y by the speed value
    x += speedX;
    y += speedY;

    // if it hits the edge, reverse direction
    if (y > HEIGHT || y < 0) {
        speedY = -speedY;
    }

    if (x > WIDTH || x < 0) {
        speedX = -speedX;
    }

    // draw the ball
    ellipse(x, y, ballSize, ballSize);

    movePaddle();
};

void keyPressed() {
    if (keyCode == LEFT) {
        paddleSpeed = -5;
    }

    if (keyCode == RIGHT) {
        paddleSpeed = 5;
    }
}

void keyReleased() {
    paddleSpeed = 0;
}

void movePaddle() {
    // draw the paddle
    paddleX += paddleSpeed;
    if (paddleX < 0) {
        paddleX = 0;
    }

    if (paddleX > (WIDTH - paddleWidth)) {
        paddleX = WIDTH - paddleWidth;
    }
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
}
