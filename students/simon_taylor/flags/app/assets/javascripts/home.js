$(document).ready(function() {

  //element to append our countries to
  countriesApp.$content = $("#content");

  //fetch country html from page
  var country_template = $('#country').html();
  //generate handlebars template
  countriesApp.template = Handlebars.compile( country_template );

  //add countries to the page to start with
  countriesApp.getCountries(20);

  $(window).scroll(function () {
    var $window = $(window);
    //if the user scrolls to the bottom of the window
    if($window.height() + $window.scrollTop() >= $(document).height()) {
      //fetch the next 10 countries
      countriesApp.getCountries(10);
    }
  });

});

var countriesApp = {
  //to store the id of the last country record we've retrieved
  lastID: 0,

  //to store the handlebar template to generate the country flag divs
  template: undefined,

  //to store the content div for the page
  $content: undefined,

  //to track if an ajax request is already in progress
  inProgress: false,

  getCountries: function (limit) {
    //to maintain reference to countriesApp object
    var self = this;
    //check to see if an ajax request is already in progress
    if (self.inProgress === false) {
      //set in progress to true
      self.inProgress = true;
      //for debugging
      helper.log('fetching countries with id > ' + self.lastID)
      //perform ajax request to fetch the next 10 countries
      $.ajax({
        url: '/countries',
        type: 'GET', 
        dataType: 'json',
        data: {
          fromID: self.lastID, 
          limit: limit
        }
      }).done(function (data) {
        // console.log(data);
        self.addToPage(data);
        //set in progress to false
        self.inProgress = false;
        //if no data was retrieved, disable the event handler
        if (data.length === 0) { $(window).unbind('scroll'); }
      });
    } else {
      helper.log("ajax request is already in progress")
    }
  },

  addToPage: function(countries) {
    //to maintain reference to countriesApp object
    var self = this;
    //loop through the country data
    _.each(countries, function (country) {
      //use the template to append the country to the page
      self.$content.append( self.template(country) );
      //if the country has a greater ID than the current lastID, update it
      if (country.id > self.lastID) { self.lastID = country.id; }
    });
  }
};


//------------------------------------------------------
// HELPER FUNCTIONS (GENERIC PURPOSE)
//------------------------------------------------------
var helper = {
  //setup logging of messages
  logging: false,

  //log a message to console IF logging true (must pass an array!)
  log: function(text) {
    if (this.logging === true) {
      console.log(text);  
    }
  },
};

