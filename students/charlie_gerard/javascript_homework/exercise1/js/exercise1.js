//-----------------------------------------------------

//CALCULATOR

//-----------------------------------------------------
/*
 var operator = prompt("Please enter an operator"),
 	 operandA = prompt("Please enter your first operand"),
 	 operandB = prompt("Please enter your second operand");

if (operator == "/"){
  var result = (parseInt(operandA) / parseInt(operandB));
  console.log(result);
 }
 else if (operator == "+"){
   var result = (parseInt(operandA) + parseInt(operandB));
   console.log(result);
 }
 else if (operator == "-"){
   var result = (parseInt(operandA) - parseInt(operandB));
   console.log(result);
 }
 else if (operator == "*"){
   var result = (parseInt(operandA) * parseInt(operandB));
   console.log(result);
 }
 else if (operator == "%"){
   var result = (parseInt(operandA) % parseInt(operandB));
  console.log(result);
 }
 else if (operator == "√"){
   var result = Math.sqrt(parseFloat(operandA));
   console.log(result);
 }; */

//-----------------------------------------------------

//FAVORITE THINGS

//-----------------------------------------------------

 var favThings = ["Programming", "LEGO", "Tech Innovations", "Music", "Interior Design", "Coffee"];

 numFavThings = favThings.length;
 x = 0;

 //Printing out "My #1 favorite thing is.....".
 /* while (x < numFavThings){
   	x += 1;
   	console.log("My #" + x + " favorite thing is " + favThings[x-1]);
  }; */

// Printing out "My 1st favorite thing is...."
 while (x < numFavThings){
   x += 1;
   if (x == 1){
 	  console.log("My "+ (x) + "st favorite thing is " + favThings[x-1]);
   }
   else if (x == 2){
 	  console.log("My "+ (x) + "nd favorite thing is " + favThings[x-1]);
   }
   else if (x == 3){
 	  console.log("My "+ (x) + "rd favorite thing is " + favThings[x-1]);
   }
   else if (x > 3){
 	  console.log("My "+ (x) + "th favorite thing is " + favThings[x-1]);
   };
 };


//-----------------------------------------------------

//THIS FOR THAT APP

//-----------------------------------------------------

var _this = ["Skynet","Digital Music Distribution","FitBit","Realtime Data","ManPacks","Landing Page","Conversion Funnel","Social Network","Airbnb","SnapChat","Bang With Friends","HTML5 App","Google Analytics","Mapreduce Query","Node.js Server","KickStarter","Match.com","Adultfriendfinder","Pinterest","Amber Alert System","Groupon","Appstore","Digital Magazine","Distributed Social Network","Quadcopter","Daring Fireball","Content Distribution Network","Analytics Platform","OpenTable","LinkedIn","Brick and Mortar Solution","Aggregator","Social Game","jQuery Plugin","Game-based Incentive","Foursquare","YouTube","WeedMaps","Texts From Last Night","Ponzi Scheme","1-800-Flowers","Cash4Gold","Online Marketplace","Viral Marketer","Wearable Computer","Google Glass App","Facebook Marketplace","Zivity","Playboy","Cloud Storage Provider","Kindle Fire App","Pandora","Green Tech Program","Eco-Friendly Marketplace","Netflix","Amazon","Zappos","Reddit","Enron","Wordpress","iPhone App","Android App","Meme Generator","Crowdsourcing App","Mac App","SEO Optimizer","Apartment Guide","Social CRM","Database Abstraction Layer","Microblogging Service","Product Curation Service","API","New Social Platform","Tumblr","Deal Finder","CPA Ad Network","Collaborative Filter","Shopping Site","Digg 2.0","Recommendation Engine","News Recommender","Neural Network","Tesseract OCR engine","Unreadable CAPTCHA","Mobile Ecosystem","Flickr","Salesforce.com","Twitter Filter","Wikipedia","Yelp"];
var _that = ["Facebook Platform","Erlang Enthusiasts","Collegiate Jewish Women","Ex-Girlfriends","Binders Full of Women","Mitt Romney's Hair","Laundromats","Celebrity Gossip","Endangered Species","Pandas","Middle Schoolers","Alpha Phi Girls","Funeral Homes","Chinese Take-out","Ex-Convicts","Fast Casual Restaurants","Marketers","Qualifying Leads","Funeral Homes","Farmers","Cougars","Pilots","Gynecologists","Cracked iPhone Apps","Stolen Goods","Adult Dancers","People Who Hate Groupon","Hunters","High-End Pornography","Sysadmins","Bath Salts","Nootropics","California","Gay Marriages","Government Corruption","Political Attack Ads","Whiskey Lovers","Parking Tickets","Highway Accidents","Traveling","Airlines","Presentation Tools","Your Boss","Ponzi Schemes","Your Finances","Restroom Attendants","Your Aquarium","Your Cat's Litter Box","Pets","Alcoholics","Camp Counselors","Nature Blogs","World of Warcraft","Models","Family Guy Enthusiasts","The Army","Cheap Vodka","Tech Incubators","Star Trek Conventions","Presentation Tools","Small Businesses","Beer","Nightclub Lines","Semi-Active Volcanoes","Attractive People","Ugly People","Sanctimonial Artifacts","Traveling Abroad","Your Mom","Billionaires","Happy Hours","Ugg Boots","The Homeless","Blacking Out","Red Wine","Christian Families","Social Outcasts","Surgeons","Sorority Chicks","Pounding Jagger Bombs","Medicinal Marijuana","Textbooks","Coffee Shops","Baristas"];

function randomThis(){
  var random1 = (_this[Math.floor(Math.random()*_this.length)]);
  return(random1);
};

function randomThat(){
  var random2 = (_that[Math.floor(Math.random()*_that.length)]);
  return(random2);
};

function sentence(){
  console.log("So... your startup is basically like a " + randomThis() + " for " + randomThat() + "?");
};

sentence();







