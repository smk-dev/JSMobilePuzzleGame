
var slide_size = 80;
var slides_in_row = 4;
var slides_in_col = 4;
var slides_count = 16;
var pos = new Array();
var empty_index;

function initGame() {
	
	// init positions
	for (var i = 0; i < slides_count; i++) {
		pos[i] = i;
	}
	newGame();
}

function newGame() {
	
	// shuffle
	for (var i = slides_count - 1; i >= 0; i--) {
		var j = parseInt(Math.random() * i);
		var temp = pos[i];
		pos[i] = pos[j];
		pos[j] = temp;
	}
	
	// move
	for (var i = 0; i < slides_count; i++) {
		var id = pos[i];
		animate(id, x(i), y(i));
		if (id == 15) {
			empty_index = i;
		}
	}
	
	// hide
	$("#s" + (slides_count - 1)).addClass("white");
}

function solve() {
	for (var i = 0; i < slides_count; i++) {
		pos[i] = i;
		animate(i, x(i), y(i));
	}
	empty_index = slides_count - 1;
	
	// show
	$("#s" + (slides_count - 1)).removeClass("white");
}

function isFinish() {
	for (var i = 0; i < slides_count; i++) {
		if (i != pos[i]) {
			return "0";
		}
	}
	
	// show
	$("#s" + (slides_count - 1)).removeClass("white");
	
	return "1";
}

function swipeLeft() {
	// valid
	if ((empty_index % slides_in_row) < (slides_in_row - 1)) {
		swipe(1);
	}
}

function swipeRight() {
	// valid
	if ((empty_index % slides_in_row) > 0) {
		swipe(-1);
	}
}

function swipeUp() {
	// valid
	var row = Math.floor(empty_index / slides_in_row);
	if (row < slides_in_col - 1) {
		swipe(4);
	}
}

function swipeDown() {
	var row = Math.floor(empty_index / slides_in_row);
	if (row > 0) {
		swipe(-4);
	}
}

function swipe(where) {
	// move
	var next_index = empty_index + where;
	move(empty_index, next_index);
	
	// update
	var temp = pos[empty_index];
	pos[empty_index] = pos[next_index];
	pos[next_index] = temp;
	empty_index = next_index;
}

function move(from, to) {
	// animate
	animate(pos[from], x(to),   y(to)  );
	animate(pos[to],   x(from), y(from));
}

function x(id) {
	return (id % slides_in_col) * slide_size;
}

function y(id) {
	return Math.floor(id / slides_in_row) * slide_size;
}

function animate(id, x, y) {
	$("#s" + id).animate({ top: y, left: x }, 150);
}
