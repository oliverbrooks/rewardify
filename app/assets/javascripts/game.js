var maxPoints = -1;
var increment = -1;
var currentPoints = -1;
var timeLimit = -1;
var stop = false;
var clickCount = 0;

function setMaxPoints( points ) {
  maxPoints = points;
  increment = points/10;
}

function setTimeLimit( seconds ) {
  timeLimit = seconds;
  startClock();
}

function updateClock() {
  if ( !stop ) {
    if ( timeLimit > 0 ) {
      timeLimit--;
      renderClock(); 
    }
    else {
      alert("Sorry.. Too late")
      stop = true;
      // submitForm()
    }
  }
}

function renderClock() {
  $("#time_left").html( timeLimit + "s" ); 
}

function startClock() {
  self.setInterval( function(){ updateClock() }, 1000 );
}

function setPoints( points ) {
  currentPoints = points;
  updatePointsBar();
}

function getPoints() {
  return currentPoints;
}
  
function updatePointsBar() {
  var percent = ( (getPoints()/maxPoints) * 100 ) + "%";
  $("#points_balance").height( percent );
}

function win() {
  // alert("You've won!");
  stop = true;
  submitForm()
}

function submitForm () {
  $('form#finish').submit();
}

function moveWorm() {
  $("#worm").attr("class","worm_hidden");
  var newPoints = getPoints() + increment;
  if ( newPoints < maxPoints ) { 
   setPoints(newPoints);
   nextWorm();
  } 
  else {

    win();
  }
}

//bit crap but no time
function nextWorm() {
  clickCount++;
  var worm = $("#worm-character");

  if ( clickCount == 2 ) {
    worm.css( "top", "25px");
    worm.css( "left", "250px" );
  }
  else if ( clickCount == 3 ) {
    worm.css( "top", "170px");
    worm.css( "left", "120px" );
    clickCount = 0
  }
  else if ( clickCount == 1 ) {
    worm.css( "top", "275px");
    worm.css( "left", "220px" );
  }
  worm.attr("class","worm");
}
