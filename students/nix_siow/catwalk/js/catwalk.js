/*
The Cat Walk

*Add a script tag linking to an external Javascript file with your code.
*Create a variable to store a reference to the img.
*Change the style of the img to have a "left" of "0px", so that it starts at the left hand of the screens.
*Create a function called catWalk() that moves the cat 10 pixels to the right of where it started, by changing the "left" style property.
*Call that function every 50 milliseconds. Your cat should now be moving across the screen from left to right. Hurrah!

Bonus #1: When the cat reaches the right-hand of the screen, restart them at the left hand side ("0px"). So they should keep walking from left to right across the screen, forever and ever.

Bonus #2: When the cat reaches the right-hand of the screen, make them move backwards instead. They should keep walking back and forth forever and ever.

Bonus #3: When the cat reaches the middle of the screen, replace the img with an image of a cat dancing, keep it dancing for 10 seconds, and then replace the img with the original image and have it continue the walk.
*/
var superman = document.getElementById("superman");
var img = document.getElementsByTagName('img')[0];

img.style.position = 'absolute';
img.style.left = '0px';

var timer2;
var timer;

// Make the cat walk to Left
function catWalkLeft() {
  
  var oldLeft = parseInt(img.style.left);
  var newLeft = oldLeft - 10;
  img.style.left = newLeft + 'px';
   
  if (newLeft == -300) {
    clearInterval(timer2);
    superman.setAttribute("class", ""); // off superman gif
    img.src = 'http://www.anniemation.com/clip_art/images/cat-walk.gif'
    timer = setInterval(catWalkRight, 50);
  };
};


// Make the cat walk to Right
function catWalkRight() {
  
  var oldLeft = parseInt(img.style.left);
  var newLeft = oldLeft + 10;
  img.style.left = newLeft + 'px';
 
  if (newLeft > window.innerWidth) {
    clearInterval(timer);
    superman.setAttribute("class", "superman"); // on superman gif
    img.src = 'https://gs1.wac.edgecastcdn.net/8019B6/data.tumblr.com/tumblr_mdyg0euCq21riw8svo1_250.gif'
    timer2 = setInterval(catWalkLeft, 50);
  };
};

timer = window.setInterval(catWalkRight, 50);


