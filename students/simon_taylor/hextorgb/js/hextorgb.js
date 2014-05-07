// console.log("Hello World");

var converter = {
    mapping: {
      'a': 10,
      'b': 11,
      'c': 12,
      'd': 13,
      'e': 14,
      'f': 15
    },

    reverseMap: function () {
      var revMap = {};
      _.each(this.mapping, function (value, key) {
        revMap[value] = key;
      });
      this.revMapping = revMap;
    },

    //--------------------
    // RGB TO HEXADECIMAL
    //--------------------

    //expects input of a RGB code e.g. (255,100,32)
    RGBToHexCode: function (red, green, blue) {
      redH = this.numToHex(red);
      greenH = this.numToHex(green);
      blueH = this.numToHex(blue);

      return ['#',redH,greenH,blueH].join('');
    },

    numToHex: function (num) {
      var num1 = Math.floor(num / 16);
      var num2 = num % 16;
      return this.mapD(num1) + this.mapD(num2);
    },

    //expects input of number between 0-15 and returns the hexadecimal version e.g. 11 = b
    mapD: function (digit) {
      if (this.revMapping[digit]) {
        return this.revMapping[digit];
      } else {
        return String(digit);
      }
    },

    //--------------------
    // HEXADECIMAL TO RGB
    //--------------------

    //expects input of a hex code e.g. 0f1b38 (should not include the #)
    hexCodeToRGB: function (input) {
      //convert input to lower case
      var hex = input.toLowerCase();
      //split string into each component and convert
      var red = this.hexToNum(hex.substr(0,2));
      var green = this.hexToNum(hex.substr(2,2));
      var blue = this.hexToNum(hex.substr(4,2));

      return ['rgb(',red,',',green,',',blue,')'].join('');
    },

    hexToNum: function (code) {
      //split the code into its two digits
      var digits = code.split('');
      //return first digit x 16 + second digit
      return this.mapH(digits[1]) * 16 + this.mapH(digits[0]);
    },

    mapH: function (hex) {
      if (this.mapping[hex]) {
        //look up this hex value in the mapping hash
        return this.mapping[hex];
      } else {
        //it does not exist in the mapping hash so just convert to an int
        return parseInt(hex);
      }
    }
};

converter.reverseMap();

// converter.hexToRGB('ff');