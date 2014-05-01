$(document).ready(function () {
  
  //populate the mapping array on the roman numerals object
  romanNumerals.defineMapping();

  romanNumerals.$output = $('#output');

  $('#form').on('submit', function (e) {
    //prevent the default form submit action
    e.preventDefault();

    //TESTING MESSAGE
    helper.log('form submitted');

    var number = parseInt($('#numeral').val());

    //check if the number is within the supported range of this program
    if (number > 0 && number < 5000) {

      //convert the number to a roman numeral
      var numeral = romanNumerals.convertNumber(number);

      //display the numeral on the page
      romanNumerals.$output.text(numeral);
    } else {

      //clear any previous output
      romanNumerals.$output.text('');

      //inform the user that their input is invalid
      alert('The number must be between 0 and 4999 dipshit!');
    }

  });

});

//------------------------------------------------------
// ROMAN NUMERALS CONVERTER
//------------------------------------------------------
var romanNumerals = {
  
  //to store the paragraph where to output the roman numeral to
  $output: null,

  //to store the roman numeral character mapping
  mapping: [],

  //to store the remainder while using the convertNumber function
  remainder: null,

  //to store the output roman numeral string
  output: null,

  defineMapping: function () {
    this.mapping.push({ value: 1000, romanChar: 'M'});
    this.mapping.push({ value: 900, romanChar: 'CM'});
    this.mapping.push({ value: 500, romanChar: 'D'});
    this.mapping.push({ value: 400, romanChar: 'CD'});
    this.mapping.push({ value: 100, romanChar: 'C'});
    this.mapping.push({ value: 90, romanChar: 'XC'});
    this.mapping.push({ value: 50, romanChar: 'L'});
    this.mapping.push({ value: 40, romanChar: 'XL'});
    this.mapping.push({ value: 10, romanChar: 'X'});
    this.mapping.push({ value: 9, romanChar: 'IX'});
    this.mapping.push({ value: 5, romanChar: 'V'});
    this.mapping.push({ value: 4, romanChar: 'IV'});
    this.mapping.push({ value: 1, romanChar: 'I'});
  },

  //resets any persisted values in this object so a new roman numeral can be produced
  reset: function () {
    this.remainder = null;
    this.output = '';
  },

  //used to convert the number into a roman numeral string, ignoring multiples of 4 of the same numeral
  convertNumber: function (number) {

    //TESTING MESSAGE
    helper.log('converting number: ' + number);

    //purge any existing values
    this.reset();

    //set the remainder = the number, parsing as integer
    this.remainder = parseInt(number);

    //generate initial roman numeral string
    _.each(this.mapping, this.generateString, this);

    //TESTING MESSAGE
    helper.log("output: ",this.output);

    return this.output;
  },

  //used in .each to loop through each value in the mapping array and reduce the number
  generateString: function(map) { 

    var self = this;

    //TESTING MESSAGE
    helper.log(map.value, map.romanChar); 

    //used to keep looping
    loop = true;

    //keep looping until the value exceeds the remainder
    while (loop) {
      if (self.remainder >= map.value) {

        //TESTING MESSAGE
        helper.log("current remainder: ",self.remainder);
        helper.log("character: ",map.romanChar);

        //append the character to the output
        self.output = self.output + map.romanChar;
        //reduce the remainder by this value
        self.remainder -= map.value;

        //TESTING MESSAGE
        helper.log("remainder: ",self.remainder);
        helper.log("-----------------");

      } else {
        //stop looping
        loop = false;
      }
    }
  },
};

//------------------------------------------------------
// HELPER FUNCTIONS (GENERIC PURPOSE)
//------------------------------------------------------
var helper = {
  //setup logging of messages
  logging: true,

  //log a message to console IF logging true (must pass an array!)
  log: function(text) {
    if (this.logging === true) {
      console.log(text);  
    }
  }
};
