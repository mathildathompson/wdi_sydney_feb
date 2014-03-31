
//print favs exercise
var printFavs = function(favs_array) {
  console.log("I like things that start with B.");
  for (var i = 0; i < favs_array.length; i++) {
  console.log(favs_array[i] + " starts with B.");
  } 
}

var favouriteThings = ["Beer", "Bananas", "Bocce", "Bears", "Bolivia"];
printFavs(favouriteThings);



//this for that exercise
var _this = ["Skynet","Digital Music Distribution","FitBit","Realtime Data","ManPacks","Landing Page","Conversion Funnel","Social Network","Airbnb","SnapChat","Bang With Friends","HTML5 App","Google Analytics","Mapreduce Query","Node.js Server","KickStarter","Match.com","Adultfriendfinder","Pinterest","Amber Alert System","Groupon","Appstore","Digital Magazine","Distributed Social Network","Quadcopter","Daring Fireball","Content Distribution Network","Analytics Platform","OpenTable","LinkedIn","Brick and Mortar Solution","Aggregator","Social Game","jQuery Plugin","Game-based Incentive","Foursquare","YouTube","WeedMaps","Texts From Last Night","Ponzi Scheme","1-800-Flowers","Cash4Gold","Online Marketplace","Viral Marketer","Wearable Computer","Google Glass App","Facebook Marketplace","Zivity","Playboy","Cloud Storage Provider","Kindle Fire App","Pandora","Green Tech Program","Eco-Friendly Marketplace","Netflix","Amazon","Zappos","Reddit","Enron","Wordpress","iPhone App","Android App","Meme Generator","Crowdsourcing App","Mac App","SEO Optimizer","Apartment Guide","Social CRM","Database Abstraction Layer","Microblogging Service","Product Curation Service","API","New Social Platform","Tumblr","Deal Finder","CPA Ad Network","Collaborative Filter","Shopping Site","Digg 2.0","Recommendation Engine","News Recommender","Neural Network","Tesseract OCR engine","Unreadable CAPTCHA","Mobile Ecosystem","Flickr","Salesforce.com","Twitter Filter","Wikipedia","Yelp"];
var _that = ["Facebook Platform","Erlang Enthusiasts","Collegiate Jewish Women","Ex-Girlfriends","Binders Full of Women","Mitt Romney's Hair","Laundromats","Celebrity Gossip","Endangered Species","Pandas","Middle Schoolers","Alpha Phi Girls","Funeral Homes","Chinese Take-out","Ex-Convicts","Fast Casual Restaurants","Marketers","Qualifying Leads","Funeral Homes","Farmers","Cougars","Pilots","Gynecologists","Cracked iPhone Apps","Stolen Goods","Adult Dancers","People Who Hate Groupon","Hunters","High-End Pornography","Sysadmins","Bath Salts","Nootropics","California","Gay Marriages","Government Corruption","Political Attack Ads","Whiskey Lovers","Parking Tickets","Highway Accidents","Traveling","Airlines","Presentation Tools","Your Boss","Ponzi Schemes","Your Finances","Restroom Attendants","Your Aquarium","Your Cat's Litter Box","Pets","Alcoholics","Camp Counselors","Nature Blogs","World of Warcraft","Models","Family Guy Enthusiasts","The Army","Cheap Vodka","Tech Incubators","Star Trek Conventions","Presentation Tools","Small Businesses","Beer","Nightclub Lines","Semi-Active Volcanoes","Attractive People","Ugly People","Sanctimonial Artifacts","Traveling Abroad","Your Mom","Billionaires","Happy Hours","Ugg Boots","The Homeless","Blacking Out","Red Wine","Christian Families","Social Outcasts","Surgeons","Sorority Chicks","Pounding Jagger Bombs","Medicinal Marijuana","Textbooks","Coffee Shops","Baristas"];

var randomThis = function(_this_a) {
  zip = _this_a[Math.floor(Math.random() * _this_a.length)];
  return zip
}

var randomThat = function(_that_a) {
  zip = _that_a[Math.floor(Math.random() * _that_a.length)];
  return zip
}

console.log("Your business should be " + randomThis(_this) + " for " + randomThat(_that));

//calculator exercise
var operator = prompt("Which opperator do you want");
var num_one = prompt("What is the first number is yer calculation?");
var num_two = prompt("Hows about number two?");

var calculator = function(firstnum, secondnum) {
    if (operator === "+") {
        console.log(parseInt(firstnum) + parseInt(secondnum));
    } else if (operator === "-") {
        console.log(parseInt(firstnum) - parseInt(secondnum));
    } else if (operator === "*") {
        console.log(parseInt(firstnum) * parseInt(secondnum));
    } else if (operator === "/") {
        console.log(parseInt(firstnum) / parseInt(secondnum));
    } else {
        console.log("Sorry, something went wrong.");
    }
};

calculator(num_one, num_two)

 